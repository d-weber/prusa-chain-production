# Prusa i3 MK3 Chain Production add-on
![assembly iso render](img/assembly-iso-render.png "[assembly iso render")
Add chain production capability to your Prusa i3

# How it works
- The arduino controls the steppers & fans
- The printer is controlled via octopi
- A [script](octoprint-plugin/main.py) on the octopi monitors the octoprint status and controls the arduino via usb-serial to start cooling and trigger the ejection

# Demo video
[![YT](https://img.youtube.com/vi/xZeJeUdq0wY/0.jpg)](https://www.youtube.com/watch?v=xZeJeUdq0wY)

# Assembly Bill of materials
Most of the parts can be ordered on Aliexpress at a small cost, for a total of approx $100

Description | Count | Link
------------ | ------------- | -------------
Nema 17 stepper | 2 | [AliExpress](https://fr.aliexpress.com/item/32572890101.html?spm=a2g0o.productlist.0.0.564c27b3pHR0G2&algo_pvid=abd5054d-e8d8-4ced-8ff2-9446c7aa35a8&algo_expid=abd5054d-e8d8-4ced-8ff2-9446c7aa35a8-3&btsid=0b0a050115944744286904328e9042&ws_ab_test=searchweb0_0,searchweb201602_,searchweb201603_)
350mm 2040 V-SLOT Aluminium profile | 2 | [AliExpress](https://fr.aliexpress.com/item/32920516912.html?spm=a2g0o.productlist.0.0.31a037cc8dbPGY&algo_pvid=9b46cb6c-e7bb-4b1c-9eaa-0ad6e82b1f00&algo_expid=9b46cb6c-e7bb-4b1c-9eaa-0ad6e82b1f00-0&btsid=0b0a050115944742227557785e9042&ws_ab_test=searchweb0_0,searchweb201602_,searchweb201603_)
300mm 2020 V-SLOT Aluminium profile | 1 | [AliExpress](https://fr.aliexpress.com/item/32998701000.html?spm=a2g0o.productlist.0.0.fc8950e06k5nl7&algo_pvid=6a9e8ca4-d213-479d-98c0-849f8f18575f&algo_expid=6a9e8ca4-d213-479d-98c0-849f8f18575f-5&btsid=0b0a050115944742630778856e9042&ws_ab_test=searchweb0_0,searchweb201602_,searchweb201603_)
Mini V-SLOT gantry | 2 | [AliExpress](https://fr.aliexpress.com/item/32984815098.html?spm=a2g0o.productlist.0.0.4c6e64e2MzCvUb&algo_pvid=5d87a2aa-0380-4a2a-86d2-979a4ea56efd&algo_expid=5d87a2aa-0380-4a2a-86d2-979a4ea56efd-3&btsid=0b0a0ae215944787701661018edb08&ws_ab_test=searchweb0_0,searchweb201602_,searchweb201603_)
Angle bracket for 2020 | 2 | [AliExpress](https://fr.aliexpress.com/item/4001050647146.html?spm=a2g0o.productlist.0.0.fc8950e06k5nl7&algo_pvid=6a9e8ca4-d213-479d-98c0-849f8f18575f&algo_expid=6a9e8ca4-d213-479d-98c0-849f8f18575f-11&btsid=0b0a050115944742630778856e9042&ws_ab_test=searchweb0_0,searchweb201602_,searchweb201603_)
20T 6MM GT2 Idler pulley | 2 | [AliExpress](https://fr.aliexpress.com/item/32822906447.html?spm=a2g0o.productlist.0.0.284a2834HqTySR&algo_pvid=f88906f7-5095-4826-b755-d351980b6bfd&algo_expid=f88906f7-5095-4826-b755-d351980b6bfd-1&btsid=0b0a050115944745423665576e9042&ws_ab_test=searchweb0_0,searchweb201602_,searchweb201603_)
20T 6MM GT2 Motor pulley | 2 | [AliExpress](https://fr.aliexpress.com/item/4000640547601.html?spm=a2g0o.productlist.0.0.284a2834HqTySR&algo_pvid=f88906f7-5095-4826-b755-d351980b6bfd&algo_expid=f88906f7-5095-4826-b755-d351980b6bfd-0&btsid=0b0a050115944745423665576e9042&ws_ab_test=searchweb0_0,searchweb201602_,searchweb201603_)
1M 6MM GT2 Belt | 2 | [AliExpress](https://fr.aliexpress.com/item/32853559638.html?spm=a2g0o.productlist.0.0.2c4a62c2EzoYBR&algo_pvid=9ca62668-b87c-4d73-b8c6-e6ab5b253c3b&algo_expid=9ca62668-b87c-4d73-b8c6-e6ab5b253c3b-1&btsid=0b0a050115944746279536894e9042&ws_ab_test=searchweb0_0,searchweb201602_,searchweb201603_)
120MM 12V FAN | 2 | [AliExpress](https://fr.aliexpress.com/item/33000978834.html?spm=a2g0o.productlist.0.0.b8fc338c62ssrr&algo_pvid=a35331b9-fa4b-49f0-97c6-582a7d75b8d1&algo_expid=a35331b9-fa4b-49f0-97c6-582a7d75b8d1-8&btsid=0b0a050115944750692027643e9042&ws_ab_test=searchweb0_0,searchweb201602_,searchweb201603_)
TMC2130 SPI StepStick | 2 | [AliExpress](https://fr.aliexpress.com/item/32970150483.html?spm=a2g0o.productlist.0.0.72ea1eb7ryF9Z0&algo_pvid=f6794725-60ea-4f19-8894-552e24a461bd&algo_expid=f6794725-60ea-4f19-8894-552e24a461bd-1&btsid=0b0a050115944751235671454e9042&ws_ab_test=searchweb0_0,searchweb201602_,searchweb201603_)
Arduino pro micro clone | 2 | [AliExpress](https://fr.aliexpress.com/item/32902569443.html?spm=a2g0o.productlist.0.0.54762563pNu99P&algo_pvid=0173235d-81de-44fa-8d78-6d86316b9cff&algo_expid=0173235d-81de-44fa-8d78-6d86316b9cff-0&btsid=0b0a050115944751023318586e9042&ws_ab_test=searchweb0_0,searchweb201602_,searchweb201603_)
M4x10 HEX Screw | 50 | [AliExpress](https://fr.aliexpress.com/item/10000150053486.html?spm=a2g0o.productlist.0.0.5ccf318eCvy3d4&algo_pvid=d198149e-e626-4c57-85f7-a98fd79f0d91&algo_expid=d198149e-e626-4c57-85f7-a98fd79f0d91-0&btsid=0b0a050115944747937261478e9042&ws_ab_test=searchweb0_0,searchweb201602_,searchweb201603_)
M5x30 HEX Screw | 2 | [AliExpress](https://fr.aliexpress.com/item/10000150053486.html?spm=a2g0o.productlist.0.0.5ccf318eCvy3d4&algo_pvid=d198149e-e626-4c57-85f7-a98fd79f0d91&algo_expid=d198149e-e626-4c57-85f7-a98fd79f0d91-0&btsid=0b0a050115944747937261478e9042&ws_ab_test=searchweb0_0,searchweb201602_,searchweb201603_)
M5x50 HEX Screw | 2 | [AliExpress](https://fr.aliexpress.com/item/10000150053486.html?spm=a2g0o.productlist.0.0.5ccf318eCvy3d4&algo_pvid=d198149e-e626-4c57-85f7-a98fd79f0d91&algo_expid=d198149e-e626-4c57-85f7-a98fd79f0d91-0&btsid=0b0a050115944747937261478e9042&ws_ab_test=searchweb0_0,searchweb201602_,searchweb201603_)
M4x30 HEX Screw | 4 | [AliExpress](https://fr.aliexpress.com/item/10000150053486.html?spm=a2g0o.productlist.0.0.5ccf318eCvy3d4&algo_pvid=d198149e-e626-4c57-85f7-a98fd79f0d91&algo_expid=d198149e-e626-4c57-85f7-a98fd79f0d91-0&btsid=0b0a050115944747937261478e9042&ws_ab_test=searchweb0_0,searchweb201602_,searchweb201603_)
M4 NyLock Nut | 4 | [AliExpress](https://fr.aliexpress.com/item/32988995881.html?spm=a2g0o.productlist.0.0.48232c4bPHXJNh&algo_pvid=73bb6ea1-7038-4d8f-aa89-69344eaf84de&algo_expid=73bb6ea1-7038-4d8f-aa89-69344eaf84de-0&btsid=0b0a050115944749183954103e9042&ws_ab_test=searchweb0_0,searchweb201602_,searchweb201603_)
M4 2020 Nut | 50 | [AliExpress](https://fr.aliexpress.com/item/33043957747.html?spm=a2g0o.productlist.0.0.5dcc1b4fbfBnxe&algo_pvid=b122bcb7-951b-4d63-a89d-b83275a0bcb4&algo_expid=b122bcb7-951b-4d63-a89d-b83275a0bcb4-3&btsid=0b0a050115944748888203415e9042&ws_ab_test=searchweb0_0,searchweb201602_,searchweb201603_)
M4 3030 Nut | 4 | [AliExpress](https://fr.aliexpress.com/item/33043957747.html?spm=a2g0o.productlist.0.0.5dcc1b4fbfBnxe&algo_pvid=b122bcb7-951b-4d63-a89d-b83275a0bcb4&algo_expid=b122bcb7-951b-4d63-a89d-b83275a0bcb4-3&btsid=0b0a050115944748888203415e9042&ws_ab_test=searchweb0_0,searchweb201602_,searchweb201603_)


# Ejector PCB
![assembly iso render](img/pcb-render.png "[assembly iso render")
Can be ordered through jlcpcb or any similar service


# Electronics Bill of materials
Description | Count | Link
------------ | ------------- | -------------
TMC2130 SPI StepStick | 2 | [AliExpress](https://fr.aliexpress.com/item/32970150483.html?spm=a2g0o.productlist.0.0.72ea1eb7ryF9Z0&algo_pvid=f6794725-60ea-4f19-8894-552e24a461bd&algo_expid=f6794725-60ea-4f19-8894-552e24a461bd-1&btsid=0b0a050115944751235671454e9042&ws_ab_test=searchweb0_0,searchweb201602_,searchweb201603_)
Arduino pro micro clone | 2 | [AliExpress](https://fr.aliexpress.com/item/32902569443.html?spm=a2g0o.productlist.0.0.54762563pNu99P&algo_pvid=0173235d-81de-44fa-8d78-6d86316b9cff&algo_expid=0173235d-81de-44fa-8d78-6d86316b9cff-0&btsid=0b0a050115944751023318586e9042&ws_ab_test=searchweb0_0,searchweb201602_,searchweb201603_)
