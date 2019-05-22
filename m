Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 233BB26DA0
	for <lists+linux-usb@lfdr.de>; Wed, 22 May 2019 21:43:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732820AbfEVTnT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 May 2019 15:43:19 -0400
Received: from mail-eopbgr720118.outbound.protection.outlook.com ([40.107.72.118]:27424
        "EHLO NAM05-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730791AbfEVTnS (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 22 May 2019 15:43:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=keysight.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OAOcjuZCBoI9+FQTny/DyiF+rDELAuuWHjTdgd4W/fQ=;
 b=4CKNcbYSs0KNiBoYMmJJx5LXT+R5h+kGeewl9wBx9dGmdLVcL0h6ocXvSXMYq/4glleORxLfKFRFw571RnMYrWrnQyJufUwr4bfTKl9SdqPsAwIjBzYFjDOgxbxlrN8HCp30q/k6RQ0/RxHKqQTFmB0c+tpyWDofjcqpbrfdVao=
Received: from CY4PR17MB1160.namprd17.prod.outlook.com (10.173.183.14) by
 CY4SPR00MB227.namprd17.prod.outlook.com (10.169.187.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.16; Wed, 22 May 2019 19:43:15 +0000
Received: from CY4PR17MB1160.namprd17.prod.outlook.com
 ([fe80::518b:43ae:7efb:8f3f]) by CY4PR17MB1160.namprd17.prod.outlook.com
 ([fe80::518b:43ae:7efb:8f3f%8]) with mapi id 15.20.1900.020; Wed, 22 May 2019
 19:43:15 +0000
From:   Andy Purcell <andy_purcell@keysight.com>
To:     "felipe.balbi@linux.intel.com" <felipe.balbi@linux.intel.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: boundary devices nitrogen8m board, usb mass storage not working 
Thread-Topic: boundary devices nitrogen8m board, usb mass storage not working 
Thread-Index: AdUQ0kj+Eq+rHoqVRdWbbiNVLhwd8Q==
Date:   Wed, 22 May 2019 19:43:15 +0000
Message-ID: <CY4PR17MB1160EA7C3ACA401E3D8D86C89F000@CY4PR17MB1160.namprd17.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=andy_purcell@keysight.com; 
x-originating-ip: [192.25.7.194]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 448d209f-49d7-4b05-2d03-08d6deedbb5c
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(49563074)(7193020);SRVR:CY4SPR00MB227;
x-ms-traffictypediagnostic: CY4SPR00MB227:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <CY4SPR00MB227B0B54BA9BD0C147B49B29F000@CY4SPR00MB227.namprd17.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-forefront-prvs: 0045236D47
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(376002)(396003)(136003)(346002)(39860400002)(199004)(189003)(5640700003)(7736002)(14454004)(66476007)(66556008)(476003)(66576008)(73956011)(305945005)(9686003)(33656002)(2351001)(26005)(478600001)(186003)(74316002)(52536014)(6916009)(6306002)(5660300002)(966005)(64756008)(8936002)(55016002)(486006)(8676002)(19627235002)(81156014)(81166006)(66446008)(256004)(14444005)(66946007)(71200400001)(71190400001)(5024004)(6436002)(76116006)(86362001)(68736007)(2906002)(6116002)(3846002)(53936002)(4326008)(4743002)(99936001)(316002)(2501003)(25786009)(6506007)(7696005)(99286004)(66066001)(102836004);DIR:OUT;SFP:1102;SCL:1;SRVR:CY4SPR00MB227;H:CY4PR17MB1160.namprd17.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: keysight.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: wNUS8zYg9yo94CaZltDT7t4a8/3NJD/AfbPIm6IEKBRouFQBWV6mqnG050CaCa0Eck0pB45DadwrNGw/YKCXk6NhHlFb361Mv5gFmWBNV+LeDpiCrY0Ff0/5khteywSWw9/mzZ+VRDvmQfBWFQpk/bd2CGK8ixuuZHOHyV1bgKnuzF66iAlH3CoQ2jMK4iL7oIMQSxielZIMuZagAfT4YYlV3LAT0+cJNOky3C8tk/DlZ3DvSbg+4h913ls2hjVnAG7zp4A0VNeUQC9LTPYQEvlv1mwjIJod2aB3vDsLTmnrNjhXCIzo54HxTgLD9Japa9n2DrNtZhhkma/TGPSeIaaqVDMrqt6Vi/ca9lSfqcD2jNzdF8VgJI1+x2NIftnYBF1GelYZNsoSYdi3+uxNbAvhDF18qDsZZ5qFyiAh8sU=
Content-Type: multipart/mixed;
        boundary="_003_CY4PR17MB1160EA7C3ACA401E3D8D86C89F000CY4PR17MB1160namp_"
MIME-Version: 1.0
X-OriginatorOrg: keysight.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 448d209f-49d7-4b05-2d03-08d6deedbb5c
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2019 19:43:15.0378
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 63545f27-3232-4d74-a44d-cdd457063402
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4SPR00MB227
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--_003_CY4PR17MB1160EA7C3ACA401E3D8D86C89F000CY4PR17MB1160namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello Felipe,

I have a boundary devices nitrogen8m board and am trying to use the usb-dev=
ice port as a mass storage device.=20
I see no activity on my usb analyzer when I run the script below.=20
So I followed the instructions here: https://www.kernel.org/doc/html/v4.18/=
driver-api/usb/dwc3.html.=20
Attached are the compressed regdump and trace files.=20

I know the electrical is OK because I can stop at uboot, use command =3D "u=
ms 0 mmc 0" and nitrogen8m shows up as mass storage device.=20
After I let Linux boot up, I cannot use the usb-device port as a mass stora=
ge device.

I have been stuck for several days now. No help from Boundary Devices.
My only theory is that uboot may be touching usb-device registers and this =
prevents linux usb-device from working. Just a theory.=20


###
### Nitrogen8m board  Uboot version:    =20
###=20
U-Boot 2018.07-35271-ge6bfe39 (Aug 10 2018 - 12:37:43 +0000)
real-aarch64-linux-android-gcc (GCC) 4.9.x 20150123 (prerelease)
GNU ld (binutils-2.25-f3d35cf6) 2.25.51.20141117

###
### Nitrogen8m board Linux kernel:=20
###
uname -a
Linux nitrogen8m 4.14.98-2.0.0-ga+yocto+g0e18008a04cf
###
### Nitrogen8m board Modules.builtin include=20
###
kernel/fs/configfs/configfs.ko
kernel/drivers/usb/common/usb-common.ko
kernel/drivers/usb/core/usbcore.ko
kernel/drivers/usb/dwc2/dwc2.ko
kernel/drivers/usb/dwc3/dwc3.ko
kernel/drivers/usb/dwc3/dwc3-pci.ko
kernel/drivers/usb/dwc3/dwc3-of-simple.ko
kernel/drivers/usb/gadget/libcomposite.ko
kernel/drivers/usb/gadget/function/usb_f_acm.ko
kernel/drivers/usb/gadget/function/usb_f_ss_lb.ko
kernel/drivers/usb/gadget/function/u_serial.ko
kernel/drivers/usb/gadget/function/usb_f_serial.ko
kernel/drivers/usb/gadget/function/usb_f_obex.ko
kernel/drivers/usb/gadget/function/u_ether.ko
kernel/drivers/usb/gadget/function/usb_f_ncm.ko
kernel/drivers/usb/gadget/function/usb_f_ecm.ko
kernel/drivers/usb/gadget/function/usb_f_eem.ko
kernel/drivers/usb/gadget/function/usb_f_ecm_subset.ko
kernel/drivers/usb/gadget/function/usb_f_rndis.ko
kernel/drivers/usb/gadget/function/usb_f_mass_storage.ko
kernel/drivers/usb/gadget/function/usb_f_fs.ko
kernel/drivers/usb/gadget/udc/udc-core.ko
kernel/fs/configfs/configfs.ko

###
### Nitrogen8m board device tree excerpt
###
        usb@38100000 {
                compatible =3D "fsl, imx8mq-dwc3";
                #address-cells =3D <0x2>;
                #size-cells =3D <0x2>;
                ranges;
                clocks =3D <0x4 0xdc>;
                clock-names =3D "usb1_ctrl_root_clk";
                assigned-clocks =3D <0x4 0x6e 0x4 0x98>;
                assigned-clock-parents =3D <0x4 0x56 0x4 0x48>;
                assigned-clock-rates =3D <0x1dcd6500 0x5f5e100>;
                status =3D "okay";
                pinctrl-names =3D "default";
                pinctrl-0 =3D <0x37>;

                dwc3 {
                        compatible =3D "snps,dwc3";
                        reg =3D <0x0 0x38100000 0x0 0x10000>;
                        interrupts =3D <0x0 0x28 0x4>;
                        phys =3D <0x38 0x0 0x38 0x1>;
                        phy-names =3D "usb2-phy", "usb3-phy";
                        power-domains =3D <0x39>;
                        snps,power-down-scale =3D <0x2>;
                        usb3-resume-missing-cas;
                        usb3-lpm-capable;
                        snps,has-lpm-erratum;
                        snps,lpm-nyet-threshold =3D <0xf>;
                        status =3D "okay";
                        dr_mode =3D "otg";
                        vbus-supply =3D <0x3a>;
                };
        };



----- mass storage script below ------=20
#!/bin/bash

dd if=3D/dev/zero of=3D/dev/shm/file  bs=3D1024 count=3D200

cd /sys/kernel/config/usb_gadget/
mkdir -p usbms
cd usbms
echo 0x1d6b > idVendor # Linux Foundation
echo 0x0104 > idProduct # Multifunction Composite Gadget
echo 0x0100 > bcdDevice # v1.0.0
echo 0x0200 > bcdUSB # USB2
mkdir -p strings/0x409
echo "fedcba9876543211" > strings/0x409/serialnumber
echo "AndyPurcell" > strings/0x409/manufacturer
echo "ap.mstore" > strings/0x409/product
mkdir -p configs/c.1/strings/0x409
echo "Config1:mass storage" > configs/c.1/strings/0x409/configuration
echo 20 > configs/c.1/MaxPower

# Add functions here
FILE=3D/dev/shm/file
mkdir -p functions/mass_storage.usb0
echo 1 > functions/mass_storage.usb0/stall
echo 0 > functions/mass_storage.usb0/lun.0/cdrom
echo 0 > functions/mass_storage.usb0/lun.0/ro
echo 0 > functions/mass_storage.usb0/lun.0/nofua
echo $FILE > functions/mass_storage.usb0/lun.0/file
ln -s functions/mass_storage.usb0 configs/c.1/


# see gadget configurations below
# End functions
ls /sys/class/udc > UDC


Andy Purcell
Keysight Technologies
900 South Taft
Loveland, Colorado 80537
970-679-5976


--_003_CY4PR17MB1160EA7C3ACA401E3D8D86C89F000CY4PR17MB1160namp_
Content-Type: application/x-gzip; name="regdump.txt.gz"
Content-Description: regdump.txt.gz
Content-Disposition: attachment; filename="regdump.txt.gz"; size=1641;
	creation-date="Wed, 22 May 2019 19:13:49 GMT";
	modification-date="Wed, 22 May 2019 19:09:49 GMT"
Content-Transfer-Encoding: base64

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

--_003_CY4PR17MB1160EA7C3ACA401E3D8D86C89F000CY4PR17MB1160namp_
Content-Type: application/x-gzip; name="trace.txt.gz"
Content-Description: trace.txt.gz
Content-Disposition: attachment; filename="trace.txt.gz"; size=5774;
	creation-date="Wed, 22 May 2019 19:13:49 GMT";
	modification-date="Wed, 22 May 2019 19:09:49 GMT"
Content-Transfer-Encoding: base64

H4sICFWe5VwAA3RyYWNlLnR4dADNnd9vHEd2hd/9VzTgh00eKPWP6q5uYtfAQnEQI1nHiLxPC0MY
zjQlYimSOzOMkIX/+DQlekRyrL2n9vMBSEMQRXv8kXPq1q0+uvfW19V+u1rP29Pq6vrmq6+/+rr6
hx9vTu4+/vBNdbH92+7k+vw8eMHLT69YXnA1z5uT7bxbv5s3//hFP9+/annRu9V2s5Be7q7P98vv
wevuX7i87mY7z+9v9ieb+Wb/LnrV3cvuPjbz5er/Hv3HP/7x9X+e/PDdvy2fvvrhz19//I9//vgv
vvvTt69//OOffqiqf//z969+/O6/v39K+bn6+fDZ5xfe//H+s68ev+Ryd9KO01BVf6nr9qdq8+JF
c/flsXkx1V3q69Nq82HdvdnOq83labXabLbV+fJR332sh7M613X1v6vL27lavjAu/6QywHAP+LC9
2M+/CeHF8vGAMDT3hNXl5fV6+UH+djvv9qfVfFNf3y6/L1/4yBuX/3s+G/O0fFJdzldv9++q+mVd
/X33XfWHRd664Ofq264Of67Vw5/r40cZIUXSNPUaAWJpKCFbV9cCmIpWV1NOSG30I7QHQFrerzal
svcodeGP8JRQqELqQ8LyvhCdUxYICRFioUcWbn0jEB5FQ6qnMkIXLaXxabgVAn4R+u1q83bev5lv
3qzfbz7vhMsfqt+93q+2++r7+UP16vrq/OLt7Xa1v7i++l31l6buup+qm9V29X53eA9/5ZOTk2+q
3X61v92dVq9v1+t5tzu/vSz7TsONAa75Pl4vMG4Pace1MQyte2MY4q3naGNoygj2jWEY3RvDoGw9
TzaGtoiQw6VEAeFRggJ6NyDcMCBgDA/CFBAeJCjArcE4uAGjGzCZAZM7kid3JE9ukSezBl1tjuSu
NmvQ1eZI7mq3Bo1bg8YcaF3j1qAxB1rXuEVu3Rq05pTZte5Ibt2rqHWL3LkjOba5KMCtQWc+tnTJ
rUEqdSaKAW4Nkns3Te5A6927ae8OtN4tcuwaUYA7kgd3JA9lkdwsvwoBksc476tvrzY31xdX++rH
7epqdz5vq/+Zd9e32/X80Wpsh6dWY2OxGrsh1JS5aF2O/yaIOYFdDkWlgPhvCOibFP9d09gQq7HL
gtXYEKuxy4IR2BCrsRvjpTQ2aH8Y4/0BAuIkAAFxpmeAKd6jISDO9BDgFllwoSAgzvQQEB/nECAJ
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
P+rZbcdlof4/JboEuKDZAQA=

--_003_CY4PR17MB1160EA7C3ACA401E3D8D86C89F000CY4PR17MB1160namp_--
