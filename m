Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C5D611657C
	for <lists+linux-usb@lfdr.de>; Mon,  9 Dec 2019 04:37:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726834AbfLIDhq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 8 Dec 2019 22:37:46 -0500
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:58411 "EHLO
        wout2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726748AbfLIDhq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 8 Dec 2019 22:37:46 -0500
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
        by mailout.west.internal (Postfix) with ESMTP id 6802F90F;
        Sun,  8 Dec 2019 22:37:44 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute7.internal (MEProxy); Sun, 08 Dec 2019 22:37:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=IQH0MJ
        I1L5Q8fQB1hqDdSQYhd/Tu3jPUJFTgbgqb2AY=; b=v7isBk8elxevloOa1E+ovs
        dQ9Ijw8NJZ6TSTXyhb3Yaw6P3PzyPe3kKyo4SEYgIpLGbh5wSbXX3mz+SXxJj2Zi
        tqRltqBL84qCu3uJOL2Wh2VlNmn/9aUJCOpBYmICTLt5twXWCLHyX6OfHGVKqJ//
        mBZKIw9DxV7G45YblZfPahTrvF9axjsiCdRCthK4HCh8jATdXXNxIMPwbAER/lJ5
        AgcxbxYbDJEMMoR900+C778SvRYGhH1cGXxM8ws8CWgKeo8cN8qNn1BqtzTvp0mo
        +egmyZtRrlSxpt6VacdfK9dTlAK2To47DZLq9kEL9Qg0TERpHU+rhIGNZCqzM9UA
        ==
X-ME-Sender: <xms:h8HtXb3Z8OZZmXHLKYwAOPR_b6ju92tSfcVVOeDczm2cZVR0F5Hxhw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudekledgheekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucffohhmrghinhephihusghitgho
    rdgtohhmnecukfhppeeluddrieehrdefgedrfeefnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmnecu
    vehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:h8HtXVoqeh631BemOGpHK39CDD62bOx428KeuN82k4jxWnOHOTUhIw>
    <xmx:h8HtXb6AA6FxwIaTjeshEmeGoyKPqmrhH5jcglz_WcZyqZdkKrrVhA>
    <xmx:h8HtXVx4oSkxGm6pRrIPVARd87L3Oo5DfIkb9auj2AoMvzOblaN6vg>
    <xmx:iMHtXTkomCjB-2vaG0zjLEIFsrfcsoyX66wCZUMotc_tbE_rVi5mpg>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
        by mail.messagingengine.com (Postfix) with ESMTPA id 289373060130;
        Sun,  8 Dec 2019 22:37:43 -0500 (EST)
Date:   Mon, 9 Dec 2019 04:37:40 +0100
From:   Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= 
        <marmarek@invisiblethingslab.com>
To:     Suwan Kim <suwan.kim027@gmail.com>
Cc:     linux-usb@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>,
        Valentina Manea <valentina.manea.m@gmail.com>
Subject: Re: "usbip: Implement SG support to vhci-hcd and stub driver" causes
 a deadlock
Message-ID: <20191209033740.GA27394@mail-itl>
References: <20191206032406.GE1208@mail-itl>
 <20191206065058.GA9792@localhost.localdomain>
 <20191206205742.GP1122@mail-itl>
 <20191209020130.GA2909@localhost.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="gBBFr7Ir9EOA20Yy"
Content-Disposition: inline
In-Reply-To: <20191209020130.GA2909@localhost.localdomain>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--gBBFr7Ir9EOA20Yy
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: "usbip: Implement SG support to vhci-hcd and stub driver" causes
 a deadlock

On Mon, Dec 09, 2019 at 11:01:30AM +0900, Suwan Kim wrote:
> On Fri, Dec 06, 2019 at 09:57:42PM +0100, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > On Fri, Dec 06, 2019 at 03:50:58PM +0900, Suwan Kim wrote:
> > > On Fri, Dec 06, 2019 at 04:24:06AM +0100, Marek Marczykowski-G=C3=B3r=
ecki wrote:
> > > > Hello,
> > > >=20
> > > > I've hit an issue with recent 4.19 and 5.4 kernels. In short: if I
> > > > connect Yubikey 4 and use its CCID interface (for example `ykman oa=
th
> > > > list` command), the client side hangs (100% reliably). After 60s I =
get a
> > > > message that a CPU hangs waiting for a spinlock (see below).
> > > >=20
> > > > I've bisected it to a ea44d190764b4422af ("usbip: Implement SG supp=
ort
> > > > to vhci-hcd and stub driver") commit. Which indeed is also backport=
ed to
> > > > 4.19.
> > > >=20
> > > > Any idea what is going on here? I can easily provide more informati=
on,
> > > > if you tell me how to get it.
> > > >=20
> > >=20
> > > Hi,
> > >=20
> > > Thanks for reporting. Could you turn on lockdep and USBIP_DEBUG
> > > in kernel config and send dmesg log? It will be helpful to figure
> > > out lock dependency in vhci_hcd.
> >=20
> > Hmm, I've tried, but I don't see much more information there (see
> > below). I've just enabled PROVE_LOCKING and USBIP_DEBUG. Do I need to do
> > anything more, like some boot option?
> >=20
> > Also, this one (as the previous one) is from 4.19.84. Interestingly, on
> > 4.19.87 I don't get the message at all.
> >=20
> > Hmm, I've done also another test: got 4.19.84 with "usbip: Implement SG
> > support to vhci-hcd and stub driver" reverted and it still hangs...
>=20
> If so, deadlock is caused by other causes, and why is it different
> from the results of bisect?

No idea, but as you've seen in the other email, another bisect returned
exactly the same commit.


> > I'm going for another bisect round (4.19.81 works, 4.19.84 doesn't).
> >=20
> > [  212.890519] usb 1-1: recv xbuf, 42
>=20
> This message is printed by receive error and before that, driver
> canceled URB transmission. we need to know the exact situation
> before this message.

I've added some more messages and found recv_size is 0.

> Could you send me a longer log messages showing the situation
> before "[  212.890519] usb 1-1: recv xbuf, 42"?

Sure, with added extra messages (debug patch below).

[  131.397522] usb 1-1: num_sgs 0
[  131.406588] usb 1-1: num_sgs 0
[  131.410621] usb 1-1: num_sgs 0
[  131.411950] usb 1-1: num_sgs 0
[  131.413186] usb 1-1: num_sgs 0
[  131.414590] usb 1-1: num_sgs 0
[  131.417086] usb 1-1: num_sgs 0
[  131.418188] usb 1-1: num_sgs 0
[  131.419228] usb 1-1: num_sgs 0
[  131.420248] usb 1-1: num_sgs 0
[  131.457315] usb 1-1: num_sgs 5
[  131.457345] usb 1-1: size 42, copy 42 recv 42, recv_size 42, sg->length =
16384
[  131.457359] usb 1-1: size 42, copy 0 recv -22, recv_size 0, sg->length 1=
6384
[  131.457372] usb 1-1: recv xbuf, 42 size 42
[  131.458263] vhci_hcd: vhci_shutdown_connection:1024: stop threads
[  131.458318] vhci_hcd: vhci_shutdown_connection:1032: release socket
[  131.458431] vhci_hcd: vhci_shutdown_connection:1058: disconnect device
[  131.460171] usb 1-1: USB disconnect, device number 2

(...)

If I add "if (!recv_size) continue;" there, it works!

> And please also send the result of "lsusb -v".

Bus 003 Device 006: ID 1050:0407 Yubico.com Yubikey 4 OTP+U2F+CCID
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.00
  bDeviceClass            0=20
  bDeviceSubClass         0=20
  bDeviceProtocol         0=20
  bMaxPacketSize0        64
  idVendor           0x1050 Yubico.com
  idProduct          0x0407 Yubikey 4 OTP+U2F+CCID
  bcdDevice            4.34
  iManufacturer           1 Yubico
  iProduct                2 Yubikey 4 OTP+U2F+CCID
  iSerial                 0=20
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x0096
    bNumInterfaces          3
    bConfigurationValue     1
    iConfiguration          0=20
    bmAttributes         0x80
      (Bus Powered)
    MaxPower               30mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass         3 Human Interface Device
      bInterfaceSubClass      1 Boot Interface Subclass
      bInterfaceProtocol      1 Keyboard
      iInterface              0=20
        HID Device Descriptor:
          bLength                 9
          bDescriptorType        33
          bcdHID               1.10
          bCountryCode            0 Not supported
          bNumDescriptors         1
          bDescriptorType        34 Report
          wDescriptorLength      71
          Report Descriptor: (length is 71)
            Item(Global): Usage Page, data=3D [ 0x01 ] 1
                            Generic Desktop Controls
            Item(Local ): Usage, data=3D [ 0x06 ] 6
                            Keyboard
            Item(Main  ): Collection, data=3D [ 0x01 ] 1
                            Application
            Item(Global): Usage Page, data=3D [ 0x07 ] 7
                            Keyboard
            Item(Local ): Usage Minimum, data=3D [ 0xe0 ] 224
                            Control Left
            Item(Local ): Usage Maximum, data=3D [ 0xe7 ] 231
                            GUI Right
            Item(Global): Logical Minimum, data=3D [ 0x00 ] 0
            Item(Global): Logical Maximum, data=3D [ 0x01 ] 1
            Item(Global): Report Size, data=3D [ 0x01 ] 1
            Item(Global): Report Count, data=3D [ 0x08 ] 8
            Item(Main  ): Input, data=3D [ 0x02 ] 2
                            Data Variable Absolute No_Wrap Linear
                            Preferred_State No_Null_Position Non_Volatile B=
itfield
            Item(Global): Report Count, data=3D [ 0x01 ] 1
            Item(Global): Report Size, data=3D [ 0x08 ] 8
            Item(Main  ): Input, data=3D [ 0x01 ] 1
                            Constant Array Absolute No_Wrap Linear
                            Preferred_State No_Null_Position Non_Volatile B=
itfield
            Item(Global): Report Count, data=3D [ 0x05 ] 5
            Item(Global): Report Size, data=3D [ 0x01 ] 1
            Item(Global): Usage Page, data=3D [ 0x08 ] 8
                            LEDs
            Item(Local ): Usage Minimum, data=3D [ 0x01 ] 1
                            NumLock
            Item(Local ): Usage Maximum, data=3D [ 0x05 ] 5
                            Kana
            Item(Main  ): Output, data=3D [ 0x02 ] 2
                            Data Variable Absolute No_Wrap Linear
                            Preferred_State No_Null_Position Non_Volatile B=
itfield
            Item(Global): Report Count, data=3D [ 0x01 ] 1
            Item(Global): Report Size, data=3D [ 0x03 ] 3
            Item(Main  ): Output, data=3D [ 0x01 ] 1
                            Constant Array Absolute No_Wrap Linear
                            Preferred_State No_Null_Position Non_Volatile B=
itfield
            Item(Global): Report Count, data=3D [ 0x06 ] 6
            Item(Global): Report Size, data=3D [ 0x08 ] 8
            Item(Global): Logical Minimum, data=3D [ 0x00 ] 0
            Item(Global): Logical Maximum, data=3D [ 0x65 ] 101
            Item(Global): Usage Page, data=3D [ 0x07 ] 7
                            Keyboard
            Item(Local ): Usage Minimum, data=3D [ 0x00 ] 0
                            No Event
            Item(Local ): Usage Maximum, data=3D [ 0x65 ] 101
                            Keyboard Application (Windows Key for Win95 or =
Compose)
            Item(Main  ): Input, data=3D [ 0x00 ] 0
                            Data Array Absolute No_Wrap Linear
                            Preferred_State No_Null_Position Non_Volatile B=
itfield
            Item(Local ): Usage, data=3D [ 0x03 ] 3
                            Keyboard Error Undefined
            Item(Global): Report Size, data=3D [ 0x08 ] 8
            Item(Global): Report Count, data=3D [ 0x08 ] 8
            Item(Main  ): Feature, data=3D [ 0x02 ] 2
                            Data Variable Absolute No_Wrap Linear
                            Preferred_State No_Null_Position Non_Volatile B=
itfield
            Item(Main  ): End Collection, data=3Dnone
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0008  1x 8 bytes
        bInterval              10
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       0
      bNumEndpoints           2
      bInterfaceClass         3 Human Interface Device
      bInterfaceSubClass      0=20
      bInterfaceProtocol      0=20
      iInterface              0=20
        HID Device Descriptor:
          bLength                 9
          bDescriptorType        33
          bcdHID               1.10
          bCountryCode            0 Not supported
          bNumDescriptors         1
          bDescriptorType        34 Report
          wDescriptorLength      34
          Report Descriptor: (length is 34)
            Item(Global): Usage Page, data=3D [ 0xd0 0xf1 ] 61904
                            (null)
            Item(Local ): Usage, data=3D [ 0x01 ] 1
                            (null)
            Item(Main  ): Collection, data=3D [ 0x01 ] 1
                            Application
            Item(Local ): Usage, data=3D [ 0x20 ] 32
                            (null)
            Item(Global): Logical Minimum, data=3D [ 0x00 ] 0
            Item(Global): Logical Maximum, data=3D [ 0xff 0x00 ] 255
            Item(Global): Report Size, data=3D [ 0x08 ] 8
            Item(Global): Report Count, data=3D [ 0x40 ] 64
            Item(Main  ): Input, data=3D [ 0x02 ] 2
                            Data Variable Absolute No_Wrap Linear
                            Preferred_State No_Null_Position Non_Volatile B=
itfield
            Item(Local ): Usage, data=3D [ 0x21 ] 33
                            (null)
            Item(Global): Logical Minimum, data=3D [ 0x00 ] 0
            Item(Global): Logical Maximum, data=3D [ 0xff 0x00 ] 255
            Item(Global): Report Size, data=3D [ 0x08 ] 8
            Item(Global): Report Count, data=3D [ 0x40 ] 64
            Item(Main  ): Output, data=3D [ 0x02 ] 2
                            Data Variable Absolute No_Wrap Linear
                            Preferred_State No_Null_Position Non_Volatile B=
itfield
            Item(Main  ): End Collection, data=3Dnone
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x04  EP 4 OUT
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               2
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x84  EP 4 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               2
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        2
      bAlternateSetting       0
      bNumEndpoints           3
      bInterfaceClass        11 Chip/SmartCard
      bInterfaceSubClass      0=20
      bInterfaceProtocol      0=20
      iInterface              0=20
      ChipCard Interface Descriptor:
        bLength                54
        bDescriptorType        33
        bcdCCID              1.00
        nMaxSlotIndex           0
        bVoltageSupport         7  5.0V 3.0V 1.8V=20
        dwProtocols             2  T=3D1
        dwDefaultClock       4000
        dwMaxiumumClock      4000
        bNumClockSupported      0
        dwDataRate         307200 bps
        dwMaxDataRate      307200 bps
        bNumDataRatesSupp.      0
        dwMaxIFSD            2038
        dwSyncProtocols  00000000=20
        dwMechanical     00000000=20
        dwFeatures       000400FE
          Auto configuration based on ATR
          Auto activation on insert
          Auto voltage selection
          Auto clock change
          Auto baud rate change
          Auto parameter negotiation made by CCID
          Short and extended APDU level exchange
        dwMaxCCIDMsgLen      3072
        bClassGetResponse    echo
        bClassEnvelope       echo
        wlcdLayout           none
        bPINSupport             0=20
        bMaxCCIDBusySlots       1
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x02  EP 2 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x82  EP 2 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0008  1x 8 bytes
        bInterval              32
Device Status:     0x0000
  (Bus Powered)



And the debug patch:

diff --git a/drivers/usb/usbip/usbip_common.c b/drivers/usb/usbip/usbip_com=
mon.c
index d88a5b15f..89b87d5ed 100644
--- a/drivers/usb/usbip/usbip_common.c
+++ b/drivers/usb/usbip/usbip_common.c
@@ -709,6 +709,7 @@ int usbip_recv_xbuff(struct usbip_device *ud, struct ur=
b *urb)
 		/* should not happen, probably malicious packet */
 		goto error;
=20
+	dev_err(&urb->dev->dev, "num_sgs %d\n", urb->num_sgs);
 	if (urb->num_sgs) {
 		copy =3D size;
 		for_each_sg(urb->sg, sg, urb->num_sgs, i) {
@@ -721,6 +722,7 @@ int usbip_recv_xbuff(struct usbip_device *ud, struct ur=
b *urb)
=20
 			recv =3D usbip_recv(ud->tcp_socket, sg_virt(sg),
 						recv_size);
+			dev_err(&urb->dev->dev, "size %d, copy %d recv %d, recv_size %d, sg->le=
ngth %d\n", size, copy, recv, recv_size, sg->length);
=20
 			if (recv !=3D recv_size)
 				goto error;
@@ -740,7 +742,7 @@ int usbip_recv_xbuff(struct usbip_device *ud, struct ur=
b *urb)
 	return ret;
=20
 error:
-	dev_err(&urb->dev->dev, "recv xbuf, %d\n", ret);
+	dev_err(&urb->dev->dev, "recv xbuf, %d size %d\n", ret, size);
 	if (ud->side =3D=3D USBIP_STUB || ud->side =3D=3D USBIP_VUDC)
 		usbip_event_add(ud, SDEV_EVENT_ERROR_TCP);
 	else


--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--gBBFr7Ir9EOA20Yy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl3twYQACgkQ24/THMrX
1yyGVgf/V+zbYz7waMrlUYmwFBBq+dEN55L/5WTTWNF5A2BmE9BkP8dHDBmp9EgK
XG5TWYC6xc94f46Hp3BQsyQv4+z5R+yZTaznxkGQHlMp61xvnQrOChlIyfhhhOK5
bHmwOUKLkDqAx82Ko3GBkNvNd4qChagEi9VaZSbey2zXZnsWOabQefpzQUPOgb3x
O19C9Jesoxu+91M1RYlZ/95aUiJ5AG0YCHBDRM2zK+qvhtvpBMfURULIgvHkvCVe
mJ3bATUgJp4aFJRUlXc74VnDyiaaeB3rtNp9LcebFGNMmAW+geIdAtTQId682TfA
zOrfphzhL3g04haFlnxAWtOQxxHvXw==
=3kTZ
-----END PGP SIGNATURE-----

--gBBFr7Ir9EOA20Yy--
