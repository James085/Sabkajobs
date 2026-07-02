import os
import re

folder = r'c:\Users\user\Downloads\stitch_precise_ui_replication (1)\stitch_precise_ui_replication\prototype_app\lib\screens'
for file in os.listdir(folder):
    if file.endswith('.dart'):
        path = os.path.join(folder, file)
        with open(path, 'r', encoding='utf-8') as f:
            content = f.read()
        
        # Replace empty functions safely
        content = re.sub(r'\(\)\s*\{\s*\}', r"() { ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Coming soon!'))); }", content)
        
        with open(path, 'w', encoding='utf-8') as f:
            f.write(content)
print('Replaced empty buttons.')
