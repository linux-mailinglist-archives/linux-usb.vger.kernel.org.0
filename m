Return-Path: <linux-usb+bounces-37159-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mIUSL0c3/mkroAAAu9opvQ
	(envelope-from <linux-usb+bounces-37159-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 08 May 2026 21:19:35 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE234FB093
	for <lists+linux-usb@lfdr.de>; Fri, 08 May 2026 21:19:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 45A63304046F
	for <lists+linux-usb@lfdr.de>; Fri,  8 May 2026 19:18:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A52CB37B41A;
	Fri,  8 May 2026 19:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuta.io header.i=@tuta.io header.b="KldPkETa"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail.w13.tutanota.de (mail.w13.tutanota.de [185.205.69.213])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8415F2E7BD3
	for <linux-usb@vger.kernel.org>; Fri,  8 May 2026 19:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.205.69.213
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778267912; cv=none; b=PquOiELzxJfuNjCuvSWWqoZrcfwxhegWpgiJ6urcomCVMt8RYaJ4Mn+6HrmizxW6B+FGm5i/PMkZ2NeeuG6giJx/5Q5OFQW6YbggeT8P/CSBzO/Gfa/TL9oShD0WvBC6v977VykWepCY9o12cUJkbPFK+7iniSEWz62ELmKL6Jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778267912; c=relaxed/simple;
	bh=8fqWe1ryF1keueQEJ5PqfHBnau4YVZ3t6D3unao25H8=;
	h=Date:From:To:Cc:Message-ID:Subject:MIME-Version:Content-Type; b=lLZJltaXXdJPOLc7PY1AZ4XFB2UQu7drdALIhw4+DqBm9EtYW0P2K4sCuw/DwyM/mwogwzSipaOJjve9xXuqZkDj/CrMlmA9EHb3CNxsVoIpVindhu7nySX0DtaSw6OUsqsyDac7un6S5YgWlDSZ6HBr5dZw3eT7MTNU/UJekaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuta.io; spf=pass smtp.mailfrom=tuta.io; dkim=pass (2048-bit key) header.d=tuta.io header.i=@tuta.io header.b=KldPkETa; arc=none smtp.client-ip=185.205.69.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuta.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuta.io
Received: from tutadb.w10.tutanota.de (w10.api.tuta.com [IPv6:fd:ac::d:10])
	by mail.w13.tutanota.de (Postfix) with ESMTP id E0D08139D4899
	for <linux-usb@vger.kernel.org>; Fri,  8 May 2026 21:18:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1778267902;
	s=s1; d=tuta.io;
	h=From:From:To:To:Subject:Subject:Content-Description:Content-ID:Content-Type:Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:In-Reply-To:MIME-Version:MIME-Version:Message-ID:Message-ID:Reply-To:References:Sender;
	bh=NDlGD9CxqEMywawWbeYCyMDm7b85g14dPZAQYacbYCk=;
	b=KldPkETaUaFYgJ1YkhilrISjy4v47Ticnb1XuUypBBgNBLaRFq51Opymo42J/zB5
	W8PnoJyztrR4m3j+0tste5q8GFc265z5NO9v1BcqezUXsQD89RC7iBUgW67u4taUznV
	q2f5Mz4zQhNHzRmLt658IyBrcKIZSHuA+jDRr4eHr/MKDCfJ4TV86/v5BGEEFsAj9gc
	V2ba44Y68LWlTaSzm/yBm6Yig0GNXe5/2UGIrO0yMKLdnpB7upMqpnCXOB2XfKPn0ll
	Bc9yFMzzuWs/qir/jewBSf3pyaJWShXo1EskmB+Go0079L+aTATiuK3LtEw5dpE3W/P
	lTevQhOnZQ==
Date: Fri, 8 May 2026 21:18:22 +0200 (CEST)
From: c2mismo <c2mismo@tuta.io>
To: Linux Usb <linux-usb@vger.kernel.org>
Cc: Gregkh <gregkh@linuxfoundation.org>
Message-ID: <Os7vNaR--F-9@tuta.io>
Subject: =?UTF-8?Q?USB:_Lexar_E300_21c4:b083_fails_SuperSpeedPlus_negotiatio?=
 =?UTF-8?Q?n_due_to_missing_BOS_descript?=
 =?UTF-8?Q?or_=E2=80=94_request_for_NO=5FBOS_quirk?=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_143930_745445106.1778267902914"
Feedback-ID: 018e5b700cb2c8a4221317c29fd969cf4102c3a1344db71daf386d41a6b3176c30b0c69a2452d499883682cadbe0e8114a:TurnOnPrivacy!:tutamail
X-Rspamd-Queue-Id: 1BE234FB093
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[tuta.io,quarantine];
	R_DKIM_ALLOW(-0.20)[tuta.io:s=s1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,multipart/alternative,text/plain,text/x-log];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37159-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	TO_DN_ALL(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[tuta.io:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[c2mismo@tuta.io,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~,4:+,5:+]
X-Rspamd-Action: no action

------=_Part_143930_745445106.1778267902914
Content-Type: multipart/alternative; 
	boundary="----=_Part_143931_1019511716.1778267902914"

------=_Part_143931_1019511716.1778267902914
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable


Dear USB subsystem maintainers,

I have a Lexar E300 M.2 SSD enclosure (idVendor=3D0x21c4, idProduct=3D0xb08=
3)
that supports USB 3.2 Gen 2 (10 Gbps). Under Linux it always negotiates
down to 5 Gbps, while on Windows the same hardware (cable, port) works
correctly at 10 Gbps (CrystalDiskMark ~1087 MB/s vs ~450 MB/s on Linux).

The kernel log shows that the device initially attempts SuperSpeed Plus
(Gen 2x1) but fails to provide a valid BOS descriptor, causing an error
-71 and a forced fallback to SuperSpeed (5 Gbps):

[=C2=A0 179.146227] usb 2-1: new SuperSpeed Plus Gen 2x1 USB device number =
4 using xhci_hcd
[=C2=A0 182.237405] usb 2-1: USB disconnect, device number 4
[=C2=A0 182.420843] sd 12:0:0:0: [sda] Synchronize Cache(10) failed: Result=
: hostbyte=3DDID_ERROR driverbyte=3DDRIVER_OK
[=C2=A0 182.552343] usb usb2-port1: config error
[=C2=A0 183.131966] usb 2-1: new SuperSpeed USB device number 5 using xhci_=
hcd

"lsusb -t" always reports the device at 5000M, even when connected to a
20 Gbps port.

I have reliable reports that other users on Ubuntu experience the
identical issue with the same enclosure.

The likely cause is that the enclosure's firmware does not handle the
BOS descriptor request correctly. The fix is to mark it with the
USB_QUIRK_NO_BOS flag, already existsting in previous kernels
(since commit 7b2f6c5b1b1c, "USB: core: Add quirk for devices that
can't handle BOS"). That quirk would prevent the kernel from trying to
read the BOS descriptor and thus avoid the downgrade.

i did try to add the following entry to drivers/usb/core/quirks.c
in the usb_quirk_list[]:

{ USB_DEVICE(0x21c4, 0xb083), .driver_info =3D USB_QUIRK_NO_BOS },

I am running Arch Linux with kernel 7.0.3 (in the recent version does not c=
ontain
the NO_BOS definition in its source), so I have been unable to test the
patch myself. However, I am fully available to test any patch or
directly apply and verify a fix if a developer can provide one. I can
also provide additional debug output if needed.

Thank you for your time and for maintaining the USB subsystem.

Best regards,=C2=A0

Miguel Angel Ruiz Gallegoc2mismo@tuta.io
------=_Part_143931_1019511716.1778267902914
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"content-type" content=3D"text/html; charset=3DUTF-8=
">
  </head>
  <body>
<div dir=3D"auto"><br></div><div dir=3D"auto">Dear USB subsystem maintainer=
s,<br></div><div dir=3D"auto"><br></div><div dir=3D"auto">I have a Lexar E3=
00 M.2 SSD enclosure (idVendor=3D0x21c4, idProduct=3D0xb083)<br></div><div =
dir=3D"auto">that supports USB 3.2 Gen 2 (10 Gbps). Under Linux it always n=
egotiates<br></div><div dir=3D"auto">down to 5 Gbps, while on Windows the s=
ame hardware (cable, port) works<br></div><div dir=3D"auto">correctly at 10=
 Gbps (CrystalDiskMark ~1087 MB/s vs ~450 MB/s on Linux).<br></div><div dir=
=3D"auto"><br></div><div dir=3D"auto">The kernel log shows that the device =
initially attempts SuperSpeed Plus<br></div><div dir=3D"auto">(Gen 2x1) but=
 fails to provide a valid BOS descriptor, causing an error<br></div><div di=
r=3D"auto">-71 and a forced fallback to SuperSpeed (5 Gbps):<br></div><div =
dir=3D"auto"><br></div><div dir=3D"auto">[&nbsp; 179.146227] usb 2-1: new S=
uperSpeed Plus Gen 2x1 USB device number 4 using xhci_hcd<br></div><div dir=
=3D"auto">[&nbsp; 182.237405] usb 2-1: USB disconnect, device number 4<br><=
/div><div dir=3D"auto">[&nbsp; 182.420843] sd 12:0:0:0: [sda] Synchronize C=
ache(10) failed: Result: hostbyte=3DDID_ERROR driverbyte=3DDRIVER_OK<br></d=
iv><div dir=3D"auto">[&nbsp; 182.552343] usb usb2-port1: config error<br></=
div><div dir=3D"auto">[&nbsp; 183.131966] usb 2-1: new SuperSpeed USB devic=
e number 5 using xhci_hcd<br></div><div dir=3D"auto"><br></div><div dir=3D"=
auto">"lsusb -t" always reports the device at 5000M, even when connected to=
 a<br></div><div dir=3D"auto">20 Gbps port.<br></div><div dir=3D"auto"><br>=
</div><div dir=3D"auto">I have reliable reports that other users on Ubuntu =
experience the<br></div><div dir=3D"auto">identical issue with the same enc=
losure.<br></div><div dir=3D"auto"><br></div><div dir=3D"auto">The likely c=
ause is that the enclosure's firmware does not handle the<br></div><div dir=
=3D"auto">BOS descriptor request correctly. The fix is to mark it with the<=
br></div><div dir=3D"auto">USB_QUIRK_NO_BOS flag, already existsting in pre=
vious kernels<br></div><div dir=3D"auto">(since commit 7b2f6c5b1b1c, "USB: =
core: Add quirk for devices that<br></div><div dir=3D"auto">can't handle BO=
S"). That quirk would prevent the kernel from trying to<br></div><div dir=
=3D"auto">read the BOS descriptor and thus avoid the downgrade.<br></div><d=
iv dir=3D"auto"><br></div><div dir=3D"auto">i did try to add the following =
entry to drivers/usb/core/quirks.c<br></div><div dir=3D"auto">in the usb_qu=
irk_list[]:<br></div><div dir=3D"auto"><br></div><div dir=3D"auto">{ USB_DE=
VICE(0x21c4, 0xb083), .driver_info =3D USB_QUIRK_NO_BOS },<br></div><div di=
r=3D"auto"><br></div><div dir=3D"auto">I am running Arch Linux with kernel =
7.0.3 (in the recent version does not contain<br></div><div dir=3D"auto">th=
e NO_BOS definition in its source), so I have been unable to test the<br></=
div><div dir=3D"auto">patch myself. However, I am fully available to test a=
ny patch or<br></div><div dir=3D"auto">directly apply and verify a fix if a=
 developer can provide one. I can<br></div><div dir=3D"auto">also provide a=
dditional debug output if needed.<br></div><div dir=3D"auto"><br></div><div=
 dir=3D"auto">Thank you for your time and for maintaining the USB subsystem=
.<br></div><div dir=3D"auto"><br></div><div dir=3D"auto">Best regards,&nbsp=
;<br></div><div dir=3D"auto"><br></div><div dir=3D"auto">Miguel Angel Ruiz =
Gallego</div><div dir=3D"auto">c2mismo@tuta.io</div>  </body>
</html>

------=_Part_143931_1019511716.1778267902914--

------=_Part_143930_745445106.1778267902914
Content-Type: text/x-log; charset=us-ascii; name=lexar_e300_dmesg.log
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=lexar_e300_dmesg.log

[    0.384012] xhci_hcd 0000:0e:00.0: Host supports USB 3.2 Enhanced SuperSpeed
[    0.442317] xhci_hcd 0000:10:00.0: Host supports USB 3.1 Enhanced SuperSpeed
[    0.445051] xhci_hcd 0000:13:00.3: Host supports USB 3.1 Enhanced SuperSpeed
[    0.446009] xhci_hcd 0000:13:00.4: Host supports USB 3.1 Enhanced SuperSpeed
[    0.991140] usb 2-1: new SuperSpeed USB device number 2 using xhci_hcd
[    1.003817] usb 2-1: New USB device found, idVendor=21c4, idProduct=b083, bcdDevice=31.02
[    1.003822] usb 2-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[    1.003823] usb 2-1: Product: Lexar M.2 SSD Enclosure
[    1.003824] usb 2-1: Manufacturer: Lexar
[    1.003825] usb 2-1: SerialNumber: 000020250916
[    1.126605] usb 2-4: new SuperSpeed USB device number 3 using xhci_hcd
[   24.747065] usb 2-1: reset SuperSpeed USB device number 2 using xhci_hcd
[   24.894818] usb 2-1: reset SuperSpeed USB device number 2 using xhci_hcd

------=_Part_143930_745445106.1778267902914
Content-Type: text/x-log; charset=us-ascii; name=lexar_e300_lsusb.log
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=lexar_e300_lsusb.log


Bus 002 Device 002: ID 21c4:b083 Lexar Lexar M.2 SSD Enclosure
Negotiated speed: SuperSpeed (5Gbps)
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               3.20
  bDeviceClass            0 [unknown]
  bDeviceSubClass         0 [unknown]
  bDeviceProtocol         0 
  bMaxPacketSize0         9
  idVendor           0x21c4 Lexar
  idProduct          0xb083 Lexar M.2 SSD Enclosure
  bcdDevice           31.02
  iManufacturer           1 Lexar
  iProduct                2 Lexar M.2 SSD Enclosure
  iSerial                 3 xxxxxxxxxxxx
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x0079
    bNumInterfaces          1
    bConfigurationValue     1
    iConfiguration          0 
    bmAttributes         0xc0
      Self Powered
    MaxPower                0mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           2
      bInterfaceClass         8 Mass Storage
      bInterfaceSubClass      6 SCSI
      bInterfaceProtocol     80 Bulk-Only
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst              15
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x02  EP 2 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst              15
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       1
      bNumEndpoints           4
      bInterfaceClass         8 Mass Storage
      bInterfaceSubClass      6 SCSI
      bInterfaceProtocol     98 USB Attached SCSI
      iInterface             10 MSC USB Attached SCSI
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x01  EP 1 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst               0
        Command pipe (0x01)
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x82  EP 2 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst               0
        MaxStreams             32
        Status pipe (0x02)
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst               3
        MaxStreams             32
        Data-in pipe (0x03)
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x04  EP 4 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst              15
        MaxStreams             32
        Data-out pipe (0x04)
Binary Object Store Descriptor:
  bLength                 5
  bDescriptorType        15
  wTotalLength       0x0046
  bNumDeviceCaps          4
  USB 2.0 Extension Device Capability:
    bLength                 7
    bDescriptorType        16
    bDevCapabilityType      2
    bmAttributes   0x00000f0e
      BESL Link Power Management (LPM) Supported
      Baseline BESL value  10000 us 
  SuperSpeed USB Device Capability:
    bLength                10
    bDescriptorType        16
    bDevCapabilityType      3
    bmAttributes         0x00
    wSpeedsSupported   0x000e
      Device can operate at Full Speed (12Mbps)
      Device can operate at High Speed (480Mbps)
      Device can operate at SuperSpeed (5Gbps)
    bFunctionalitySupport   1
      Lowest fully-functional device speed is Full Speed (12Mbps)
    bU1DevExitLat          10 micro seconds
    bU2DevExitLat          32 micro seconds
  Platform Device Capability:
    bLength                28
    bDescriptorType        16
    bDevCapabilityType      5
    bReserved               0
    PlatformCapabilityUUID    {d8dd60df-4589-4cc7-9cd2-659d9e648a9f}
    CapabilityData[0]    0x00
    CapabilityData[1]    0x00
    CapabilityData[2]    0x03
    CapabilityData[3]    0x06
    CapabilityData[4]    0x10
    CapabilityData[5]    0x00
    CapabilityData[6]    0x0a
    CapabilityData[7]    0x00
  SuperSpeedPlus USB Device Capability:
    bLength                20
    bDescriptorType        16
    bDevCapabilityType     10
    bmAttributes         0x00000001
      Sublink Speed Attribute count 2
      Sublink Speed ID count 1
    wFunctionalitySupport   0x1100
      Min functional Speed Attribute ID: 0
      Min functional RX lanes: 1
      Min functional TX lanes: 1
    bmSublinkSpeedAttr[0]   0x000a4030
      Speed Attribute ID: 0 10Gb/s Symmetric RX SuperSpeedPlus
    bmSublinkSpeedAttr[1]   0x000a40b0
      Speed Attribute ID: 0 10Gb/s Symmetric TX SuperSpeedPlus
Device Status:     0x0001
  Self Powered

------=_Part_143930_745445106.1778267902914--

