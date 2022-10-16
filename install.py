from pathlib import Path
from os import path
import shutil


base_dir = path.dirname(path.realpath(__file__))

base_vim_dir =".vim"
base_vim_rc = ".vimrc"

src_vim_dir = path.join(base_dir, base_vim_dir)
src_vim_rc  = path.join(base_dir, base_vim_rc)

install_prefix = Path.home()

install_vim_dir = path.join(install_prefix, base_vim_dir)
install_vim_rc  = path.join(install_prefix, base_vim_rc)

print("-- Installing myvimconfig...")
print(f"  -- Installing {src_vim_rc} to {install_vim_rc}")
shutil.copyfile(src_vim_rc, install_vim_rc)
print(f"  -- Installing {src_vim_dir} to {install_vim_dir}")
shutil.copytree(src_vim_dir, install_vim_dir)
print(f"-- Done")

