Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B761D199AE6
	for <lists+linux-usb@lfdr.de>; Tue, 31 Mar 2020 18:07:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730366AbgCaQHM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 31 Mar 2020 12:07:12 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:44722 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730845AbgCaQHL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 31 Mar 2020 12:07:11 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 02VFlRFY004571;
        Tue, 31 Mar 2020 16:07:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to;
 s=corp-2020-01-29; bh=4J3dLfsHmD7RfHP5l7UDiE2X8T66wQUJFnJqd7zHmnk=;
 b=n9Ons4+3h5IzDw2MoE6poLbUapsGJn6dJz06liEgwY5OfeX77KHFMnKUuIvr2ch47Uh+
 fZP4uiQJQZXStPxNolDPB+hAgguKVNZYJK2ucyX63bHYzsKeNwfPw4beA99Lji2R0rcN
 AFH/+UOa1LQcy56Q34Nmz/B50FuoJtAWdp0zfQ7RNqP3oj3CrtML8ZV0e6Jb4bE8zSn8
 ROaDVYZ3TDrmK2zNeAy64L68xuzgryZ6yXLh7WFaaUD1oLIv4ulk8hHIK8niwDntfJYm
 VCBpzCI0n50BFJVTBW4BZZoh5VEKJA2BqxVjQVpxtB4xKrvqsc9cwtxjqRy7XLp/VBT/ tQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by aserp2120.oracle.com with ESMTP id 303yun34va-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 31 Mar 2020 16:07:08 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 02VG71HL096213;
        Tue, 31 Mar 2020 16:07:07 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by userp3030.oracle.com with ESMTP id 302g2ecgy3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 31 Mar 2020 16:07:07 +0000
Received: from abhmp0009.oracle.com (abhmp0009.oracle.com [141.146.116.15])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 02VG751L019190;
        Tue, 31 Mar 2020 16:07:05 GMT
Received: from dhcp-10-39-193-97.vpn.oracle.com (/10.39.193.97)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 31 Mar 2020 09:07:05 -0700
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Subject: Re: ehci-pci : WARNING: CPU: 0 PID: 347 at kernel/dma/direct.c:34
From:   John Donnelly <john.p.donnelly@oracle.com>
In-Reply-To: <Pine.LNX.4.44L0.2003311000010.27552-100000@netrider.rowland.org>
Date:   Tue, 31 Mar 2020 11:07:02 -0500
Cc:     linux-usb@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <4BC4ADAB-FB33-4172-90EC-3EE38A3E3DE8@oracle.com>
References: <Pine.LNX.4.44L0.2003311000010.27552-100000@netrider.rowland.org>
To:     Alan Stern <stern@rowland.harvard.edu>
X-Mailer: Apple Mail (2.3445.9.1)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9576 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0 mlxscore=0
 adultscore=0 phishscore=0 bulkscore=0 suspectscore=4 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2003310144
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9576 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 mlxlogscore=999 bulkscore=0
 suspectscore=4 mlxscore=0 spamscore=0 impostorscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2003310143
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



> On Mar 31, 2020, at 9:17 AM, Alan Stern <stern@rowland.harvard.edu> =
wrote:
>=20
> On Mon, 30 Mar 2020, John Donnelly wrote:
>=20
>> The debug method produces the following:
>>=20
>> iommu=3Don  ( no BCM is discovered )
>>=20
>> [    9.911027] hub 4-0:1.0: state 7 ports 6 chg 0000 evt 0000
>> [    9.923028] usb 3-3: new high-speed USB device number 2 using =
xhci_hcd
>> [    9.950106] In hub_port_connect .. init
>> [    9.963879] usb 3-3: udev 2, busnum 3, minor =3D 257
>> [    9.963882] usb 3-3: New USB device found, idVendor=3D0424,=20
>> idProduct=3D2660, bcdDevice=3D 8.01
>> [    9.978980] usb 3-3: New USB device strings: Mfr=3D0, Product=3D0,=20=

>> SerialNumber=3D0
>> [    9.994524] usb 3-3: usb_probe_device
>> [    9.994527] usb 3-3: configuration #1 chosen from 1 choice
>> [    9.994790] usb 3-3: adding 3-3:1.0 (config #1, interface 0)
>> [    9.994826] hub 3-3:1.0: usb_probe_interface
>> [    9.994828] hub 3-3:1.0: usb_probe_interface - got id
>> [    9.994831] hub 3-3:1.0: USB hub found
>> [   10.008224] hub 3-3:1.0: 2 ports detected
>> [   10.021669] hub 3-3:1.0: compound device; port removable status: =
FR
>> [   10.021671] hub 3-3:1.0: individual port power switching
>> [   10.021672] hub 3-3:1.0: individual port over-current protection
>> [   10.021674] hub 3-3:1.0: Single TT
>> [   10.021676] hub 3-3:1.0: TT requires at most 8 FS bit times (666 =
ns)
>> [   10.021678] hub 3-3:1.0: power on to power good time: 100ms
>> [   10.021753] hub 3-3:1.0: local power source is good
>> [   10.021872] hub 3-3:1.0: enabling power on all ports
>> [   10.022120] hub 2-1:1.0: state 7 ports 8 chg 0000 evt 0000
>> [   10.127115] hub 3-3:1.0: state 7 ports 2 chg 0000 evt 0000
>> [   10.327902] i8042: Can't read CTR while initializing i8042
>>=20
>>=20
>> Produces this configuration without the BCM devices :
>>=20
>>=20
>> lsusb -t
>> /:  Bus 04.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dxhci_hcd/6p, =
5000M
>> /:  Bus 03.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dxhci_hcd/15p, =
480M
>>     |__ Port 3: Dev 2, If 0, Class=3DHub, Driver=3Dhub/2p, 480M
>> /:  Bus 02.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dehci-pci/2p, =
480M
>>     |__ Port 1: Dev 2, If 0, Class=3DHub, Driver=3Dhub/8p, 480M
>> /:  Bus 01.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dehci-pci/2p, =
480M
>>     |__ Port 1: Dev 2, If 0, Class=3DHub, Driver=3Dhub/6p, 480M
>>=20
>>=20
>>=20
>> BCM is discovered  intel_iommu=3Doff :
>>=20
>>=20
>> [    8.947539] usb 4-3: adding 4-3:1.0 (config #1, interface 0)
>> [    8.947569] hub 4-3:1.0: usb_probe_interface
>> [    8.947571] hub 4-3:1.0: usb_probe_interface - got id
>> [    8.947574] hub 4-3:1.0: USB hub found
>> [    8.960496] usb 3-1: skipped 1 descriptor after interface
>> [    8.960499] usb 3-1: skipped 1 descriptor after interface
>> [    8.960562] hub 4-3:1.0: 2 ports detected
>> [    8.974067] usb 3-1: default language 0x0409
>> [    8.974074] hub 4-3:1.0: compound device; port removable status: =
FR
>> [    8.974075] hub 4-3:1.0: individual port power switching
>> [    8.974077] hub 4-3:1.0: individual port over-current protection
>> [    8.974079] hub 4-3:1.0: Single TT
>> [    8.974081] hub 4-3:1.0: TT requires at most 8 FS bit times (666 =
ns)
>> [    8.974083] hub 4-3:1.0: power on to power good time: 100ms
>> [    8.974157] hub 4-3:1.0: local power source is good
>> [    8.974259] hub 4-3:1.0: enabling power on all ports
>> [    8.979469] usb 3-1: udev 2, busnum 3, minor =3D 257
>> [    8.979473] usb 3-1: New USB device found, idVendor=3D03f0,=20
>> idProduct=3D7029, bcdDevice=3D 0.02
>> [    8.994797] usb 3-1: New USB device strings: Mfr=3D1, Product=3D2,=20=

>> SerialNumber=3D0
>> [    9.010633] usb 3-1: Product: Virtual Keyboard
>> [    9.024416] usb 3-1: Manufacturer: BMC
>> [    9.037858] usb 3-1: usb_probe_device
>> [    9.037860] usb 3-1: configuration #1 chosen from 1 choice
>> [    9.039418] usb 3-1: adding 3-1:1.0 (config #1, interface 0)
>> [    9.041507] usb 3-1: adding 3-1:1.1 (config #1, interface 1)
>> [    9.076272] hub 4-3:1.0: state 7 ports 2 chg 0000 evt 0000
>>=20
>> I am not accustomed to looking the USB Bus.port.dev mappings , =
obviously=20
>> with BCM discovered there are 05 Bus instead of 4 .
>>=20
>> /:  Bus 05.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dxhci_hcd/6p, =
5000M
>> /:  Bus 04.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dxhci_hcd/15p, =
480M
>>     |__ Port 3: Dev 2, If 0, Class=3DHub, Driver=3Dhub/2p, 480M
>> /:  Bus 03.Port 1: Dev 1, Class=3Droot_hub, Driver=3Duhci_hcd/2p, 12M
>>     |__ Port 1: Dev 2, If 0, Class=3DHuman Interface Device,=20
>> Driver=3Dusbhid, 12M
>>     |__ Port 1: Dev 2, If 1, Class=3DHuman Interface Device,=20
>> Driver=3Dusbhid, 12M
>> /:  Bus 02.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dehci-pci/2p, =
480M
>>     |__ Port 1: Dev 2, If 0, Class=3DHub, Driver=3Dhub/8p, 480M
>> /:  Bus 01.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dehci-pci/2p, =
480M
>>     |__ Port 1: Dev 2, If 0, Class=3DHub, Driver=3Dhub/6p, 480M
>=20
> It seems pretty clear that your system (or at least the BMC part) =20
> doesn't work as intended when the iommu is turned on.
>=20
>> Here are the pci mappings:
>>=20
>> [    6.381615] input: BMC Virtual Keyboard  as=20
>> =
/devices/pci0000:00/0000:00:1c.2/0000:01:00.4/usb3/3-1/3-1:1.0/0003:03F0:7=
029.0001/input/input1
>> [    6.463638] hid-generic 0003:03F0:7029.0001: input,hidraw0: USB =
HID=20
>> v1.01 Keyboard [BMC Virtual Keyboard ] on usb-0000:01:00.4-1/input0
>> [    6.496589] input: BMC Virtual Keyboard  as=20
>> =
/devices/pci0000:00/0000:00:1c.2/0000:01:00.4/usb3/3-1/3-1:1.1/0003:03F0:7=
029.0002/input/input2
>> [    6.529449] hid-generic 0003:03F0:7029.0002: input,hidraw1: USB =
HID=20
>> v1.01 Mouse [BMC Virtual Keyboard ] on usb-0000:01:00.4-1/input1
>> [    6.563139] usbcore: registered new interface driver usbhid
>> [    6.580222] usbhid: USB HID core driver
>=20
> I don't know why you call these "pci mappings".  They have nothing to=20=

> do with PCI, and the last two lines don't talk about mappings at all.
>=20
>> The last activity done seen on both traces is :
>>=20
>>     "  enabling power on all ports  "
>=20
> Why do you say this is the last activity seen on both traces?  In both
> of the log extracts you included above there are plenty of lines
> following those "enabling power" messages.
>=20
>> Is this when the BCM discovery is suppose to  occur ? In the function=20=

>> example is when the udev appears:
>>=20
>>    usb 3-1: udev 2, busnum 3, minor =3D 257
>=20
> The BCM discovery is supposed to occur at the time you see it in the=20=

> second log extract above.
>=20
> One thing I didn't notice before: With iommu=3Doff, you get an entire =
new=20
> USB host controller and bus.  It is called bus 3, and neither it nor=20=

> the 3-1 device (mouse and keyboard) is present when iommu=3Don.  In=20
> fact, by comparing the listings you can see that buses 4 and 5 (with=20=

> iommu=3Doff) are really the same as buses 3 and 4 (with iommu=3Don).
>=20
> I'd say that your BMC does not work with iommu=3Don, and it is that
> failure which causes these extra devices not to be discovered.  In
> fact, they appear not be real physical devices at all, but rather
> virtual devices created by the BMC firmware.
>=20
> If you want to find out why the BMC doesn't work with iommu=3Don, you=20=

> should ask the company that manufactured your computer's motherboard. =20=

> They are probably the only people who know the answer.
>=20
> Alan Stern
>=20


  Hi Alan.

Thank you for your assistance and insight.   I=E2=80=99ve tried  older =
kernels  (4.14, and 4.18 ) with iommu=3Don
and the BMC is recognized . This is obviously a regression somewhere  =
along the way.


Let me do some more bisecting.

Thank you,
JD




