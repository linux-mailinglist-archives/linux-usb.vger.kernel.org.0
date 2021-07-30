Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 577D53DB514
	for <lists+linux-usb@lfdr.de>; Fri, 30 Jul 2021 10:35:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230336AbhG3Ifo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 30 Jul 2021 04:35:44 -0400
Received: from smtp-out-10.univ-rouen.fr ([193.52.155.253]:54360 "EHLO
        mailhoc.univ-rouen.fr" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S230285AbhG3Ifn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 30 Jul 2021 04:35:43 -0400
Received: from [192.168.1.25] (i16-les01-ix2-62-35-41-231.sfr.lns.abo.bbox.fr [62.35.41.231])
        (using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhoc.univ-rouen.fr (Postfix) with ESMTPSA id C23C022CE;
        Fri, 30 Jul 2021 10:35:36 +0200 (CEST)
Reply-To: sebastien.rey-coyrehourcq@univ-rouen.fr
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, hch@lst.de, stern@rowland.harvard.edu
References: <20aaa89b-be31-6d30-2e27-47770bba328f@univ-rouen.fr>
 <YQOJ2oW86EyV443A@kroah.com>
From:   =?UTF-8?Q?S=c3=a9bastien_Rey-Coyrehourcq?= 
        <sebastien.rey-coyrehourcq@univ-rouen.fr>
Subject: Re: usb-storage & xhci_hcd & swiotlb buffer problem filling systemd
 with error during operation with SSD on USB3
Message-ID: <1306c225-59c4-bac4-1c77-d19f9dc47f9f@univ-rouen.fr>
Date:   Fri, 30 Jul 2021 10:35:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YQOJ2oW86EyV443A@kroah.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="1kxxMaSypB4qzy99wI4XpnGY5s5EB8npf"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--1kxxMaSypB4qzy99wI4XpnGY5s5EB8npf
Content-Type: multipart/mixed; boundary="6Q8eqzRWsU6EvN5XwjmDB9ngPIybxtxcH";
 protected-headers="v1"
From: =?UTF-8?Q?S=c3=a9bastien_Rey-Coyrehourcq?=
 <sebastien.rey-coyrehourcq@univ-rouen.fr>
Reply-To: sebastien.rey-coyrehourcq@univ-rouen.fr
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, hch@lst.de, stern@rowland.harvard.edu
Message-ID: <1306c225-59c4-bac4-1c77-d19f9dc47f9f@univ-rouen.fr>
Subject: Re: usb-storage & xhci_hcd & swiotlb buffer problem filling systemd
 with error during operation with SSD on USB3
References: <20aaa89b-be31-6d30-2e27-47770bba328f@univ-rouen.fr>
 <YQOJ2oW86EyV443A@kroah.com>
In-Reply-To: <YQOJ2oW86EyV443A@kroah.com>

--6Q8eqzRWsU6EvN5XwjmDB9ngPIybxtxcH
Content-Type: multipart/mixed;
 boundary="------------B580C79BFE477971B907CCD3"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------B580C79BFE477971B907CCD3
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable


Le 30/07/2021 =C3=A0 07:10, Greg KH a =C3=A9crit=C2=A0:
> On Thu, Jul 29, 2021 at 05:32:57PM +0200, S=C3=A9bastien Rey-Coyrehourc=
q wrote:
>>  =C2=A0Hi,
>>
>> This is my first bug report on kernel, first crossposted here (https:/=
/www.reddit.com/r/NixOS/comments/omctp3/rpi4_nixos_native_2105_and_ssd_by=
_usb3/)
>> and here on nixos github (https://github.com/NixOS/nixpkgs/issues/1304=
99) :
>>
>> [1.] One line summary of the problem:
>>
>> Using an usb sata adaptater from Startech (USB312SAT3CB 3.1 firmware
>> upgraded) on my RPI4B 8gb with the kernel 5.13.4, during any dd=3D/ op=
eration
>> on SSD on USB 3 port, my systemd logs finish full of errors of type :
>>
>> juil. 29 14:38:52 Nostromo-sd kernel: xhci_hcd 0000:01:00.0: swiotlb b=
uffer
>> is full (sz: 512 bytes), total 32768 (slots), used 32768 (slots)
>>
>> and
>>
>> juil. 29 09:25:07 Nostromo-sd kernel: ------------[ cut here ]--------=
----
>> juil. 29 09:25:07 Nostromo-sd kernel: WARNING: CPU: 1 PID: 180 at
>> drivers/mmc/host/sdhci.c:1142 sdhci_prepare_data.isra.0+0x298/0x700
> Your problem is in the sdhci code, not the usb controller.
>
> But even with this, does the operation succeed properly?

Nop, operation failed, my systemd journal is full of these errors, 4gb=20
at the end,
and finally the dd command and system freeze at less than 15% of the dd=20
operation.

> The rpi hardware is HORRID when it comes to the USB controller, so thos=
e
> xhci messages might just be normal given the lack of irq handling that
> the platform was known to have in the past (note, might be better now,
> no idea, sorry.)
>
> But again, is the operation failing?  Is your sd card working properly?=

> Does the problem go away with a new/better sd card?

The sd is fresh new but, i could will try with another if the problem is =

linked to sd.
My final objective was to use boot on SSD feature and not a slow SD for=20
my NIxos system support on RPI, so i suppose i could put this problem=20
aside, and prepare my SSD with another computer..

Thanks,

> thanks,
>
> greg k-h

--------------B580C79BFE477971B907CCD3
Content-Type: application/pgp-keys;
 name="OpenPGP_0xD262AFCCE42732D3.asc"
Content-Transfer-Encoding: quoted-printable
Content-Description: OpenPGP public key
Content-Disposition: attachment;
 filename="OpenPGP_0xD262AFCCE42732D3.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsFNBF9OOToBEACtaga7KjETcSryEdI4VN8JsHP3Pr/sgHbZCF1zLIDve3pu24II/CSpg2O9Q=
Uok
a/3iL8XYSJNfXEXuP5p+Bwlu4y6OO9+b1XtIrUIpw1CLMnithPX5cM5qOsocJeN2cz4FbvJLV=
Yoq
B5aLBQur0LCt38TWZbP8Kzb290HFMTe/Bul9yEaa64CANxjjI/CJZUyO7hEnGpf6Bdr6h6mKw=
7qr
PvieuAt1jrBiQffiwiVG6amPjhvf8SUW+udi/zWVXppl1pMHCmlpzj/WsuEgSaaIsi0sMSmF+=
Zcl
p2XKO2ndbsXTY/w6o8BWcyCor2+XBRB202I/kIOeClw12eB87ynma6tWEHHc+oyW6/1HjnJxx=
tvG
o4WofMWi+KrFwNQhM5Mdc+5fepqaMbBaD8Zw+QYa54u/T1c6PcvvTG2YGvDgYyv1BLbNNpSHt=
ghY
ItOA2BGQNpbNLOhTWazYLD9m8l49C5fgxrXssbB3Sixx9GgasuzzZF9iXhg3b7EXYRDsu7ILJ=
36T
PxsvjkDILsTVTEbh9GO/UEah0R7Mj5Q7HcuNDvcAi3Cye0a3zrCvNQOkLMz+ge2URuHNMtKNt=
+vm
fS3MtBy7t2zUGi84me/U3y2rsg2DUOiRQ/MY3W3JfHmQxmCTocP5nNfOm3rj+0loEfl4vfClT=
rIb
T7U8bWmG1yk0+QARAQABzTxSZXktQ295cmVob3VyY3EgU8OpYmFzdGllbiA8cy5yZXkuY295c=
mVo
b3VyY3FAbWFpbGZlbmNlLmNvbT7CwYwEEwEKADYWIQTkpKHVa6xHfZl3LbPSYq/M5Ccy0wUCX=
045
OgIbAQQLCQgHBBUKCQgFFgIDAQACHgECF4AACgkQ0mKvzOQnMtO4JQ/9FufodioEWuhezDudk=
SoE
TfdO/SFNLHAM0t8Ym+xGZW7bdiKgZdI+rFDKnUeYlbRVrgnxLkADjTdjCqqU4z+GD2IaysLtb=
uqY
JpeEgNRBYB0jXDuJurz19OTWa8Vl4U72fkLb64BnEbHGfIax8DCRdw2F1IbGox0hZ88kn6JIA=
sAb
p9RyEGNKu8XmldR6aMYDa3Mjl55TVsnXvth1dL1PTG8KRxyo7JdMjjkgfuu9BAuLPsn0lAttt=
vJw
IwM1/4poQvRDKRCeg+1/ICZKn1tghjfQ7uDfv0p4HjMd38OWxVpG+YJIG+Zh4SXWuJGkj334J=
RVQ
/9Tuc8DEaJYth62+LC+IB1ELmH36rTVNKQObIwsVCih6btNTtLssnfTtf56BjNAtNdyCekRiD=
Urd
slJjBCb6QvEkB2Do5PjOlfqD9h7RpP+H7CGFXeXUP+NEGrxp9oWi78HVopZxRklCPco4qrhyw=
32p
+2pDMUouS+tkEyMr2t4ODw0EpACy4lrwA6tiqme3uwGr8KaRL+3OtHmo6nf41ZrWZeJXtas54=
Rwh
FtSGpnImFN6QtzgOMVc9d4lphmoVYzi1bBwFAq/NdpeUpslQD1XYevN4Sd6H6OTSUbRtfWMAb=
j1u
VRpwor7t8NKspmWxLnc2n1vQCFhx7JIVD4kwYyBsx5rm9nrhi4uZ4G3NSlJleS1Db3lyZWhvd=
XJj
cSBTw6liYXN0aWVuIDxzZWJhc3RpZW4ucmV5LWNveXJlaG91cmNxQHVudGhpbmtpbmdkZXB0a=
HMu
ZnI+wsGMBBMBCgA2FiEE5KSh1WusR32Zdy2z0mKvzOQnMtMFAl9OO6kCGwEECwkIBwQVCgkIB=
RYC
AwEAAh4BAheAAAoJENJir8zkJzLTX10P/RTvVK9itmqpChRciKxR1cNDfTr4xtakTVKwDkJ37=
4Df
nM6vORTRBXets7upwp+4XCDlcAoC7WeXoK8qGpCQw9uKflYAu/PbXMj6JqSAS+ikSyqOasg/D=
Cc+
Cv9syo3Dk/byHqZOQBSN2QXDirkOiMQrOPaLO/JP8oKBvvSyBhBrCKX/1QD3dwV2CUXKumBhh=
voL
RVoJ7U7fLDJ+MPwj+bVpZcyzL0+HOX89k76k+IKRHwO9sJ2Rfi9dk0P0oIlnSCjcOYVFWH3TF=
OHb
ecL6NSsxcla/Wkl++cHBL+RamZeqXPcRuzwBrVRq9K+CVMcK/cjJn6JCIdaEPz7s2NqROHCmA=
oIN
KZjvYFxIyAl2oWXCIBWtBkwzoY3sD80YgPXTLFGKP59x3J2f1KPLAJPaDULiPgXph8D43eYiM=
0hD
GLDLmvNBXWrPw12PBZv2B86q1+6a8aFvbi/Fvr2XHpw/y8pe7ElDTseaqqLtAM4ReoBz85f8r=
Ni0
1kiTvHg34Ds8Ju0yRNOE3yXNWa1v9XV+iiyfnPC7BYfPsfMiRjYmKggY8Q7z0Ub3JlGCeFZ48=
r9x
0Kuwd6Axw1jFESbLaE2+rl4CD0BSBUrEgEsDsCdSzBfMSd8xfqlTz90qbC8UAZVbxEv/0//R5=
U9T
6/PnKqmCL+b2pSt04Shy2Lag7d0hnkpBzURSZXktQ295cmVob3VyY3EgU8OpYmFzdGllbiA8c=
2Vi
YXN0aWVuLnJleS1jb3lyZWhvdXJjcUB1bml2LXJvdWVuLmZyPsLBjAQTAQoANhYhBOSkodVrr=
Ed9
mXcts9Jir8zkJzLTBQJfTjv1AhsBBAsJCAcEFQoJCAUWAgMBAAIeAQIXgAAKCRDSYq/M5Ccy0=
1JG
D/475wj1CQwu7Qo+sFZ79nA3h5fDCdLFJNHQJrzdvCktggXsOiwZkhzTr9wXyxCnjrytxrZfx=
bwm
7+ifduBuCDFVuj6mpcAYdLJtp82dnfNb7Q2k+Uzb1Ubw8GrV/IdHPLrk7YhwB9rjWSJGJhFom=
6Pl
Xl02wCDfmbsJqtcZIjD4vFKDkORw87pBhUV9aTip+4vpiUtfJ91dOqnZlFMosLPy+9fker/Gk=
mjg
SMnlIcvFwmeNw/8SeJnU+4JrIey+GHbzSMEf+XxaTWFnny/AUGsoeMdeX7tXLy/hWHL8ETPQq=
I1b
jE9SCG6+4ibGrTsnCHycBZJQtWaiqLnrpZUVC/kuNJncos4HCxZPUAYRq+TS3VzLctmwPlWq9=
ztV
NXqhYDGj42/KwG3gEHfrej+GYup9T0A4RW9lVf2es21UaJDg0s/EmMFdF1yb60/05mMEMnGUN=
+yW
xdY5QAfuibO6A9A9NcDhsVjeAJ9ylBz8S1AntAeIKj6eC1ZGaHkYQeMaSfO5kJQmz1qPTRcbG=
t0u
PAZ4khIrgKPDD/7WSAvfwxWIoeWnR/b5LBTYQCwegiJI4ZIfn2Ez9KiGGl5ubMMbemKYjSIof=
WxB
HBHJpD9MDlPT0JyK63HgaSUkypm+R5c13C+eXU2cltL7G29QC9ZQ1TGhp5xXC0XZ1rRlvBGuo=
pLP
1c7BTQRfTjr0ARAAvcxHoNrZMPpLrdT42q8E6mlKjegD2Dylw+6iOZBVKulG8YDvDyB+KdknZ=
Aq/
KwhNzlWZd6QjoiDSbHhJwLTIm/nX1T4LqLWiwVSHH079xi9qyCcIy8owDG4oXMhnkZXb9Zj59=
iPa
8NqUkKE8tT9vdR7oKg1eQpKQx7YsPUt01hNqZMXo8JHPyEPBXnhMZJMHm6e4CRrzMmyvOfMD6=
YYw
LESQJfgW++kNUEsVPQL+VHt1lnSTa4B5z97q4zArR0Kg3cNBY8S//6FzUZ3fikPfQ8cYnWOLg=
5zR
0Sb9SnCqTLcE5bXUlLZL6U3KvovDe+kaiv/xItuKCPxSOLN/in+cH/esz8crNDbXEYQ7HErvu=
wlA
8Ves/U7yGRfR67V3ZDqSsGgEjK2Bxvk7+zI3OSQ0EpCxXJ2uy4nUMj4lka/k2o3FLhMNGDCHB=
ebm
3zl5OdTmExhuIqQsU6EmbfKuK1ZKsubfC2f8QnOVPxd9Dk30UyWSbsrSWIbgyHhMoUIE88F4W=
XiY
mRp+mHRNRjgM4kunjsoRfjK7tCOnjknNYUO5Luevsl1x29VUXVgBMBGuYTMZIRFGDPlvb1v81=
oG3
fFkqALTSVrDLXNcj6BcOX/HRf7SaW6GDdy4p60y36py82KLw9NerB6Cu2PyIDRT7reflHIgy8=
UTe
Pg34skmPpnjXhmEAEQEAAcLDsgQYAQoAJhYhBOSkodVrrEd9mXcts9Jir8zkJzLTBQJfTjr0A=
hsC
BQkJZgGAAkAJENJir8zkJzLTwXQgBBkBCgAdFiEEQdBRWS1ZqcB6tN8l3FXLa3BDQW4FAl9OO=
vQA
CgkQ3FXLa3BDQW7riQ//QiIpm+D5R/GIblgW7AatFbgO9Pylx7Nay2Yyoc4MToA7/CXCdP7WH=
lqm
SONY1RUE6YVrZAogULbimyBOySdz4AQpamOEr4bM+vqkQxiIphC6YaC3y/ndUlLA5mXV1ORlD=
Vek
xNFl3c5wnZOysRMk5jWvQD6YwZkyh0cbKrvm9o9Zwex7Br5cAS7XFrTqnGQwStmPBj0Ha9iYQ=
0F8
EAVXN7OzNo5996U/EIpnfJlzm/WTQ5Omuhs90vQ1ByQ7fJq4k0CRi69LOFGXgtYqSbMcV/uub=
Ijt
zYzLGTofIZYF7TcCi7SgOJuZgGPMK0GDyDJdszI5RSUGxzSpUUuv/slPhiPTG5jRpNxmTUn0n=
A9W
pNY5/byASzsRovM1MCpPUoY5Zf0ZT3Kum7mylfhCJfC0bTwWkfi06WUgCWzdrQlm8+vzIHLfY=
IB/
tJxEXchbvanqE8dyG6B/aSI3klZp0IDjnJPSA2onMCaU2zv4zH0fcfLHMz7qTlP2WwyshpOEw=
S0U
5EJnrnW65Uioa22Ao/4/1jD6EBOndFOCFJiuvzShWNm1E5LcS1+7Cn/ooWiomIL6ivJYwKZJ0=
PP3
ZCmyAYNAnXH8i6dprPblRdXjVmUAgrTxcYhOCpAONSBHp/3X+AEnI0eVxgVdVm4v42eBGQCrl=
3tr
atyyao7rwFHDtC1Tnv2mzg/9F0amwp5NGZPxBX0ZCGGr16xF1/kjG7NEAmOIaOE0LtwQL87Vd=
s0n
Gl8cvJRNEr9lDYevsYFpirOT/JHsjepMvp5OqESrQ9H4b2TI0FIfECaol1godhPbe7fsbCcnx=
u3f
vRJnBbrQebEPfyixNRj53fNsU6FVnwx8dvXERkPcmCErEDpJq8WEC4/F1+GYsiDE8X5DxlJzJ=
ov8
UIDr4/NT4GIQYXnBoBRgA+nLLh5XoO/FQe0Sada0OWqlKYvRgBJwA146qrwF9qbJPtBkFOheJ=
RUS
lai1/IQEbm8X5H6RLYOK4U8ocMXy0UZCtboeXtvs4w7Bv7Yv0cqoaggBIKXiQyynNgtbz0q6g=
Ozn
W2X6lgBdLa4a90Sx4zAtzh1Y/yHNf3QFI/V7mK6GRTueXR2XxWruhq54rwSQSKcnSJhP9hnFJ=
2iB
aVkdfuYFXmJUU2ReYYZrk4Z/fGfqrRSjiezcemY9xe/mwB/SacBEfk/6RhOJXsKq1F0QLNuMW=
8jg
bOoRFIaQvGNsqUlZDO2XFxVszoGljE0sUmMGL3MzTIdIZi6m9JYy08s6DBrpOmmJZGm42EHGV=
JgA
tqk88Bn+cCJzuL/PpmyPZ0YM/ITQFeqj2m/V+J3WaysnhqqaluOFkCfalDCuZqt8ZTf75iQFm=
1NO
qnpY+Vkg1svykWxprJdVDgjOwU0EX047LwEQAM8Wpk7WgwzG/m1JU3gX4a1D5/NT6B+RMzlHA=
aXD
jc2Bmhpc7vdyfyW0S2t/rmIavpgnPl7Rl6jbAXa53FVKNgEJh6sMAcrriog0a67MjvECgUuQV=
QKZ
sRqCaEiCPPRfF5XsxZHYSfa6jYK0Xa5vTQny8K/6mm+pO6etLWadAqSzRguW8KFaJQwzWPis9=
NsL
S3w+fJIlFA+H723crlkBdotUjB1il9dpUyjApmi98ss7c676eyqd0QJpmTxtj72w06yozOfK4=
4HO
bu+DqjZ4Vay7J7hHDr7SzlML27AldecSfAHoYueiAYDUys21P7Ntk3TYNK1lHDVYxPnQaYR7Z=
Wm1
FIlggkpPPS795WgLHjIkHOE9m+X8YWbTOeKrudLff/70gTqVOQJJhE8EzGhTw81zJhQLjerzN=
OBl
CAIBZWIt1FKZRX3h9agbfazx+Z/+L7NTD3eyR1Xk5xMtWAHsxLDmZdOz/H91e/TQhF0PPKyFD=
vse
0G114ADFtwzhviht38QBqj9N2Kbi1wsvZQpNKIDYHl5toazflnMF8U9pqYVnCxqRs44LCgAyU=
Hvk
4hznUvyCw53LWZYxPFgo5/S+BvRML6tNLJWjet02Kj5MqgYGO9LwUWNVatfvJcKd3DDN09HSa=
4rJ
Azlv8ZJFcYRv8G1utoHb851Qq71nHa3h7SaZABEBAAHCwXwEGAEKACYWIQTkpKHVa6xHfZl3L=
bPS
Yq/M5Ccy0wUCX047LwIbDAUJCWYBgAAKCRDSYq/M5Ccy0zhSD/0e2gp+Ttr7H+WCCxlw/tyUs=
WF/
MneGr7Z4P6aqy8d3XqlyeTryQ4vs+M88wdNZQzGkZZNScLZduSANIn2FUE/t02UhJKLmTpW5y=
/EQ
T5GTbCuK1uLACgRupm1XFskZUqnSbwE1XwMy4UY1fKVtofnokCSfFGWIQeZzX8EceqzycydGs=
eRc
RoaRpZn+486qN7WbmZM45q4LlDBq+sz0y6ALn9QmcLT5LW3Gu1YdmVrhH/GVyxQggupmzdf+/=
IFg
VnJAJdq5FfawjYCjrU126hKpXEw8GA9ScqmP59ntQ9zOQyD0kkdTyEe52AstmW5xLiVG54Mbi=
z0U
BUBsKaIR43hEcgTTEaB1jxsshHopxgRtJlPZ9WsHdQrOeghOSxT4OIZzjQ1+E9DnvHCpZYlDz=
uwK
nPmsIXk+Edpmrs9Ip45Ok4y4r6Wg5i6wf9Cy3O80FsZqxtm5pnKcNmzofK3T9ykacvOiCq2uY=
eNF
pbB3L+WUZsyHoueIqcUKrvffZ8o7La1NIqnPb/4TYeGNt5NqNOA4uIfjjKMbPKJC+2haKcMOX=
ch3
tc0GGMRZUgIXgyB58A1VOdzJeGxsILdi2eEGUWL6ziUhSwqwc5tUU5vmJOKjk6st2VbIz8+aw=
Ek4
x1VduTU5xgohNYiHIpBJRyFeTaJEQxP+GvQR6tWHz4pV5rVpDc7BTQRfTjtMARAA2eYwyheHo=
jTC
qwKbZZxQbVR9FHecD8ltQ5T4dNP1LQP049r4o+SC3iLPGpaqX+8bXUhVDG4is1NCNsqUw+Egs=
4wR
saD67J1u0GDg5RKB98kLtQGbmuabLAAUG8gTJ6jEJQ9Ekx4D+/mRXnvH0eIK3iyc/TQXU7/f7=
FyC
drVhsmG+Q5Z27BVWTpw1+iTP350oeSTYt2n0s69L3rvMeTcjDsq24Uzz756SWxHECo9yqIJl5=
LB/
sKzmOHG8YXoYA8RW3Sey9dew0A9b8qpAsWLy+htzvRRvNb5v0TjpS3pC33F9s0UrH3ncBRd6K=
Lqz
yqg5JpZhUxUndT6ZV61yodXm50U+est/xwtpaziyT8jwABY/WCqRjdQDxYjROSqSxoHyyylpO=
Y2T
v0gZXyJHPe/dqh5Mj8qGu9apJQVkRbPof1TNiyLGmLOjTRox9zxrFi/WLidMuPhiPT/n+cAao=
5EH
lUHQOyevgVPZtvvIeWwzNsE/hYTVtKpj99RIvLdZEOMYagkGs4yJoMOFbepOfmC/gC6VSO9Jg=
imt
WmCgh5kvFku2aGygksqbZpN7hqQkYOuK95boX3k79Mbr9cUUPrA1oIQGDvS/Hnth40wmZ5ZGW=
vo8
+T3as13lMZDK/axAvqAuIUGFjcS92xwPrvCHi9hVWRiIXNX9xL6nTU00aCA5jREAEQEAAcLBf=
AQY
AQoAJhYhBOSkodVrrEd9mXcts9Jir8zkJzLTBQJfTjtMAhsgBQkJZgGAAAoJENJir8zkJzLTm=
74P
/Ajl9V8OxOkxekKp9B0MpTTaCuUEhSJ+4ChZAVdeBkwxlI1si7OPhsg4ST0CzvGqvELm7c9NU=
2Ic
uH6FMBPfPOWWnxYPLv1iILeBP4zHwY4IWwzm+inbqRS71hV6jVSj5SvgnYKAnjPyZnwvArZnG=
mDZ
rYVp9+rQPgZtFVWkj2fcZs4/0vr9bsSigPZ7la/HMlgdlxaAFPeT1mtp1cHrNcbE9ITJrNHIY=
N6a
NhW2McaIM2YdZZbKgLJb3PdtW/x+lf06OZ9YrmHt2CM74+kkkeVXutjauKc9DRNdyDbDLOPNc=
UMr
9mMLtrlCQu/0jp7lr7o+tU4GvTHXO2wpB0qFm6bwnlJzl/s6jo7jTaIGNXYrCBC9dqPD3DkAC=
KBp
hbxtmguf7BeDiBfEsX1AsZl0zPeisXCOXZxZLwFviXBn/xAFX17InURCfUJeJof9mTrslBrkq=
6Ko
vuFgdEPedzzVVtxTGsQQZ5bT6ZrKPGdhPedsv9ECl5Ru7DT/OpwadUpXqCBaZAjezCmAYT+bp=
Hze
/Dcz7zXXGrBDj8K1SZrA5gohEDgBAvRpFR7KbeztXb/h33hsrxRcEDMx9+Z07X/zGWuqyY8v2=
G7Z
pGZD8L6kh7M/zZHJzIQ8YV/nOuiRF/MUN+PrtRRlko+3gtWOa66z33pAW8oGuZFXdsQTBcNru=
j2C
=3Dg0Xx
-----END PGP PUBLIC KEY BLOCK-----

--------------B580C79BFE477971B907CCD3--

--6Q8eqzRWsU6EvN5XwjmDB9ngPIybxtxcH--

--1kxxMaSypB4qzy99wI4XpnGY5s5EB8npf
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEQdBRWS1ZqcB6tN8l3FXLa3BDQW4FAmEDucYACgkQ3FXLa3BD
QW55AA//Ypz7kfSde5nvQeP40fooK99TYY8dSDCKhtCpuq8Ku9NJca/ytIm0rKYZ
jT71oqB3Ividx5jHJB4qeAWc/UYFJrN1yAsfwhqWBeQjrSEDHJAzkO15jmBRQSQC
+Giwzo2yHCY2LnWSZ7Gg7EKP7aGXjZN2NnbE7AFOUmOVMmlaY7gOLS9G2vuXKj/v
v37o0CnwfSL5Ci1Jz/UNSWWutr88DOxHdqMXA6lCecQIauVDkB2BzSCzluGudX+N
IKoQR9PDo+V4aT8LU8I1L4VKLm+ygk9k49JW+oUvSM+0G9JmrwSQRSuQ0WP+3OVk
kksQM6tEZrdBrAE4egfdXaKMbjji96vZEKJIJpMCRPmEkzHQKiQAmWWaZ1TP3iSK
LJiAggB53xyfwM5OM9/5+bgiGV4DLxOX6YEXVWDWnVjD2gJJlSG17vrzECH4b8M4
yuGRledfyd0TQXe32pRuf8RDqqtvDby+A2YoHhfGBvtyDYu9AXAksMBR1FkZeyZa
IbiCDIihO1MCdQVMoPccXE5mTb0spqZXRvs6TdM5+s3j7Bhb8FwSPYUiAb7tfbJ9
gmHNyxr2MLuosMjimETqqQJo0PB9x2FUnm6K2jlH9d7RUsIujEd7mC2opRxjGO/O
GvqGBKQ2k+LfLh+xdprddeBFtUhisxj6dzla02foOivwsxpHtRg=
=rhr9
-----END PGP SIGNATURE-----

--1kxxMaSypB4qzy99wI4XpnGY5s5EB8npf--
