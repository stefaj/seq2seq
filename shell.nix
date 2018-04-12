with import <nixpkgs> {};
with pkgs.python36Packages;

buildPythonPackage{
    name = "seq2seq";
    buildInputs = [ 
                    ocl-icd
                    cudatoolkit
                    cudnn
                    python36Full
                    python36Packages.matplotlib
                    python36Packages.requests
                    python36Packages.websocket_client
                    python36Packages.tensorflowWithCuda
                    python36Packages.setuptools
                    python36Packages.pandas
                    python36Packages.numpy
                    python36Packages.tqdm
                    python36Packages.psutil
                   ]; 
  shellHook = ''
  # set SOURCE_DATE_EPOCH so that we can use python wheels
  SOURCE_DATE_EPOCH=$(date +%s)
  CPATH=$CPATH:~/.local/include
  LIBRARY_PATH=$LIBRARY_PATH:~/.local/lib
  LD_LIBRARY_PATH=$LD_LIBRARY_PATH:~/.local/lib
  '';

}

