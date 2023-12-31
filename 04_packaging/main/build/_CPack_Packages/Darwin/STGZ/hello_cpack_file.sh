#!/bin/sh

# Display usage
cpack_usage()
{
  cat <<EOF
Usage: $0 [options]
Options: [defaults in brackets after descriptions]
  --help            print this message
  --version         print cmake installer version
  --prefix=dir      directory in which to install
  --include-subdir  include the hello_cpack_file subdirectory
  --exclude-subdir  exclude the hello_cpack_file subdirectory
  --skip-license    accept license
EOF
  exit 1
}

cpack_echo_exit()
{
  echo $1
  exit 1
}

# Display version
cpack_version()
{
  echo "hello_cpack Installer Version: 0.1, Copyright (c) Humanity"
}

# Helper function to fix windows paths.
cpack_fix_slashes ()
{
  echo "$1" | sed 's/\\/\//g'
}

interactive=TRUE
cpack_skip_license=FALSE
cpack_include_subdir=""
for a in "$@"; do
  if echo $a | grep "^--prefix=" > /dev/null 2> /dev/null; then
    cpack_prefix_dir=`echo $a | sed "s/^--prefix=//"`
    cpack_prefix_dir=`cpack_fix_slashes "${cpack_prefix_dir}"`
  fi
  if echo $a | grep "^--help" > /dev/null 2> /dev/null; then
    cpack_usage
  fi
  if echo $a | grep "^--version" > /dev/null 2> /dev/null; then
    cpack_version
    exit 2
  fi
  if echo $a | grep "^--include-subdir" > /dev/null 2> /dev/null; then
    cpack_include_subdir=TRUE
  fi
  if echo $a | grep "^--exclude-subdir" > /dev/null 2> /dev/null; then
    cpack_include_subdir=FALSE
  fi
  if echo $a | grep "^--skip-license" > /dev/null 2> /dev/null; then
    cpack_skip_license=TRUE
  fi
done

if [ "x${cpack_include_subdir}x" != "xx" -o "x${cpack_skip_license}x" = "xTRUEx" ]
then
  interactive=FALSE
fi

cpack_version
echo "This is a self-extracting archive."
toplevel="`pwd`"
if [ "x${cpack_prefix_dir}x" != "xx" ]
then
  toplevel="${cpack_prefix_dir}"
fi

echo "The archive will be extracted to: ${toplevel}"

if [ "x${interactive}x" = "xTRUEx" ]
then
  echo ""
  echo "If you want to stop extracting, please press <ctrl-C>."

  if [ "x${cpack_skip_license}x" != "xTRUEx" ]
  then
    more << '____cpack__here_doc____'
LICENSE
=======

This is an installer created using CPack (https://cmake.org). No license provided.


____cpack__here_doc____
    echo
    while true
      do
        echo "Do you accept the license? [yn]: "
        read line leftover
        case ${line} in
          y* | Y*)
            cpack_license_accepted=TRUE
            break;;
          n* | N* | q* | Q* | e* | E*)
            echo "License not accepted. Exiting ..."
            exit 1;;
        esac
      done
  fi

  if [ "x${cpack_include_subdir}x" = "xx" ]
  then
    echo "By default the hello_cpack will be installed in:"
    echo "  \"${toplevel}/hello_cpack_file\""
    echo "Do you want to include the subdirectory hello_cpack_file?"
    echo "Saying no will install in: \"${toplevel}\" [Yn]: "
    read line leftover
    cpack_include_subdir=TRUE
    case ${line} in
      n* | N*)
        cpack_include_subdir=FALSE
    esac
  fi
fi

if [ "x${cpack_include_subdir}x" = "xTRUEx" ]
then
  toplevel="${toplevel}/hello_cpack_file"
  mkdir -p "${toplevel}"
fi
echo
echo "Using target directory: ${toplevel}"
echo "Extracting, please wait..."
echo ""

# take the archive portion of this file and pipe it to tar
# the NUMERIC parameter in this command should be one more
# than the number of lines in this header file
# there are tails which don't understand the "-n" argument, e.g. on SunOS
# OTOH there are tails which complain when not using the "-n" argument (e.g. GNU)
# so at first try to tail some file to see if tail fails if used with "-n"
# if so, don't use "-n"
use_new_tail_syntax="-n"
tail $use_new_tail_syntax +1 "$0" > /dev/null 2> /dev/null || use_new_tail_syntax=""

extractor="pax -r"
command -v pax > /dev/null 2> /dev/null || extractor="tar xf -"

tail $use_new_tail_syntax +155 "$0" | gunzip | (cd "${toplevel}" && ${extractor}) || cpack_echo_exit "Problem unpacking the hello_cpack_file"

echo "Unpacking finished successfully"

exit 0
#-----------------------------------------------------------
#      Start of TAR.GZ file
#-----------------------------------------------------------;
� ��>e �l����l�nR��dU�Ppr���3M)�a�s�����
M��=ߩ��n�F���_,$�DJU��UjS)j�G�Q�H��&BU�JMu��j�T�":�3w^/g-���og��7�3�v�J3秣�YYTU�F"����ة�T���@8�F�L��EB��+�.�r�ҋ�)Se=g�3f�I�jf��R�����4���[ڈ���P&�E���z&A&G�p�ܝ�ܛL�S^�,�.�B�f#?�����/����l��x�ʡB��&�R���^�:��/���D�Y�q�x�����}%_w���<�W<��4<�W6�����
����pP"�W�K�^���ţ���əB^$�}�&q&��}Z{V>x�����L{���6�lR>�* �V)-2�R˜t��_e���Sς�B���S��d�GKK���#�}á;�O�[�(?nԜ4̂E-}��/-�)�K���r�x&7F3�T�I����I�~;|��~��M��&���k\�O
����w��R��d���a���~W��<{������~�W�*"��&RY<��̢C�u��I��y�D��V&CL���_`c�/�!�MJ�� Y��N�p��MD��F&��R�;���ʎ�띲W���_����^<�����,g�S��'~n�]�u�N"������q?|�;�����|�����`g~֦�h�S�u���31���Y���.����OL�,s��W���M�?��HwH���Qv+�~�e���Y�v����                                  ��p���o��Y����*;��>>����~ƴx�b�t�o�R��$�\H�R���_h����GG�zb>^-��gN��<<?���#�_|}Fc6�m�i��&k�|nm;;�̹�ٹ��c��׺�VB�ZT_,6=�]Nk��g����'jL}�����V��seu]�;9��g˟�~��i���dejd'/i�gϳjbG.īoV/ǫW�����/��m^wt�fٮ/�t��Y|\"���w����T�Y9�b������^�9�+�b��~B�jO��Kco~��}|�>��>�k���?�����5��O�x��{��/y6���;)��A��֟�x����e~|�,���WHc���1�Ɨ�Q�뤟����k���k��z፤��^c>b��=vơť:*�ze�i�L[e�N�m2�O��ez�L7�t���B                                       p["��&�Ν����8��>�?[ȳ����/��6��L�a��!�י<�%���W��2���������Ry�d���щ):�[�>6�e2vށ��4Г�z��U.�4���&T̌iN��L�DG���3nZ��v̾*.B�JƠ��U4��~c0�2��^�VQ�X�~CӴP�li�]����R���/[�2�Ba#��wdDk�`2�ƽ.��Qg��e�ŉLN�L�A�I����5t�H���IZ0��|N�f�)zLe�GɃ|<���H�9vF'�Ԝ4��eҴ������39>Y*�Ŕ�3U�s���y*��n1>��U���
��S���R?/�_J}N��K]�#􏙾�'����f�{:�o����2{j��s�	�7�xL�޺>��_t�q��v�;=���\z¥g\��]�i�����{l��5��<^7�{f���!&_\Ǝ��\����͋[���Í��ѻom_�X�GUՠ6���D�&��٬���6l�����+LҤJ5-���%�ظ.���3cfn�UΡ[�.-bN]�[r I��Lٟ��SðY%���qֻ�,mt=yz�>6��`QK͚!�v��lft��`��D;��S5�8)�p$�D�5��DQ�w��S.Yz�5e���t�L?�[��Y*u?�V�F�y�uK��r0��(���_"A&G�x��3�{��ay�K�����g!�����B����cf�����Wn�q��k)W��+]�r�������Q"+�0��>��;``j������x�sK6�=�@��U��5�������?��;����5�����X<�$|oO����^��C|Sy�I���sIm$��A���*��Ⴒ�oM::������A����Ȕ�S��,�Edr�|?��F��,�ϸ���������X�tZ���{)�����VW~�X`vk��	�tH��,	I�7&��z�/��+�W�	�?P�{���r7t�z��K�<��/o{�/�t��ǿR��"�"��y��zݷ�9S�o��)���C�˥b�|�]]��� n��'��n��T�2'�}���6Y������~                                    �{��x�������vç�����!q�|�4_'#B��5�1�O�V{#�ұ�:|�2q��5�j��K���4���STw��_�<ߏ���_i�k   ���?bf �  