Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F131F3725D1
	for <lists+linux-usb@lfdr.de>; Tue,  4 May 2021 08:29:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229844AbhEDG36 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 4 May 2021 02:29:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:39818 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229804AbhEDG36 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 4 May 2021 02:29:58 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4A29361183;
        Tue,  4 May 2021 06:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620109743;
        bh=KAOE7dEWfxbYxJBfZEZM+stdxadytU78o3Sp6rnyctE=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=h5LKcAV7rjKnh/Cy7cl+WSj3EX7knSuYfctt/CNowEpqO89siX7NDaw4DRECnbbvc
         1lVMxmQMLeKkVZiGwJ0R1GN3vjPrhHvN0eKCymQWXwfeRYLT9MlBCuGy9YNJcp12lg
         eOo0p1gb6iIhuUc0khHwpnJvCgK/b6CP/4MuTiFuKmuBMNJWDjaC+IoucMX2zqlsk4
         wCdsp4SePZ5hb0ne5+OSGYMGhFM5+zIAAVF5yDF3FpuKPURUYYVKDLB9HiDfKF1mcZ
         eidK5vJ3kHYd8xm62AnTMweEPmRHVf9HcI1Rg81QXostINokkB8sRHxeVtsD+KtcQ1
         PvE8Ulx8xP/gg==
From:   Felipe Balbi <balbi@kernel.org>
To:     Sebastian von Ohr <vonohr@smaract.com>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Thinh Nguyen <thinhn@synopsys.com>
Subject: RE: [BUG REPORT] usb: dwc3: Timeouts with USB 2.0 LPM active
In-Reply-To: <3d2305a43c1f4e3dad2e29286f42982d@smaract.com>
References: <c9b5559a05f5459d92e3c704772edb46@smaract.com>
 <87eeenj56b.fsf@kernel.org> <3d2305a43c1f4e3dad2e29286f42982d@smaract.com>
Date:   Tue, 04 May 2021 09:28:54 +0300
Message-ID: <87bl9rhv15.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Sebastian von Ohr <vonohr@smaract.com> writes:

> Thanks for your super-fast reply!
>
>> From: Felipe Balbi [mailto:balbi@kernel.org]
>> Sent: Monday, May 3, 2021 3:52 PM
>> It's like the host is trying to go down to lower LPM states every 100ms:
>>=20
>>      irq/13-dwc3-236     [000] d..1    71.363262: dwc3_event: event (000=
00401): WakeUp [U0]
>>      irq/13-dwc3-236     [000] d..1    71.363315: dwc3_event: event (000=
00401): WakeUp [U0]
>>      irq/13-dwc3-236     [000] d..1    71.363423: dwc3_event: event (000=
06084): ep1out: Transfer In Progress [0] (SIm)
>
> How do you arrive at 100ms? These wakeups are around 50 microseconds apar=
t.

heh, I should've written 100uS :-) but yeah, they're 50uS apart.

>> > Is the USB 2.0 LPM extension even supposed to work with the dwc3 contr=
oller? I
>>=20
>> yes, it should be supported :-)
>
> I've spent some time looking at the code and I don't understand how the d=
evice=20
> is supposed to wake up the host once it's able to receive new data again.=
 The=20

For U1/U2 it's mostly handled by the HW itself. The only thing we do is
set the appropriate bits for the relevant SetFeature requests, see ep0.c.

> closest thing I could find is the __dwc3_gadget_wakeup function which is =
called=20
> by dwc3_send_gadget_ep_cmd. But I don't understand the condition there. T=
he=20
> wakeup is only executed for DWC3_DEPCMD_STARTTRANSFER, but I understand b=
ulk=20
> transfers are only started once the endpoint is configured and then only=
=20
> DWC3_DEPCMD_UPDATETRANSFER is used.

That's a "special note" on the databook :-)

>> could you share a dump of your descriptors? It could be that the wake-up
>> latencies are incorrect which tricks the host into trying to go down to
>> lower LPM states too frequently.
>
> Bus 001 Device 003: ID 3386:0001=20=20
> Device Descriptor:
>   bLength                18
>   bDescriptorType         1
>   bcdUSB               2.10
>   bDeviceClass            0 (Defined at Interface level)
>   bDeviceSubClass         0=20
>   bDeviceProtocol         0=20
>   bMaxPacketSize0        64
>   idVendor           0x3386=20
>   idProduct          0x0001=20
>   bcdDevice            5.12
>   iManufacturer           1 SmarAct
>   iProduct                2 SmarAct Sensor
>   iSerial                 3 PSC-00000038
>   bNumConfigurations      1
>   Configuration Descriptor:
>     bLength                 9
>     bDescriptorType         2
>     wTotalLength           32
>     bNumInterfaces          1
>     bConfigurationValue     1
>     iConfiguration          4 SmarAct Config 1
>     bmAttributes         0xc0
>       Self Powered
>     MaxPower                2mA
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        0
>       bAlternateSetting       0
>       bNumEndpoints           2
>       bInterfaceClass       255 Vendor Specific Class
>       bInterfaceSubClass      0=20
>       bInterfaceProtocol      0=20
>       iInterface              5 SmarAct Sensor
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x81  EP 1 IN
>         bmAttributes            2
>           Transfer Type            Bulk
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0200  1x 512 bytes
>         bInterval               0
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x01  EP 1 OUT
>         bmAttributes            2
>           Transfer Type            Bulk
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0200  1x 512 bytes
>         bInterval               1
> Binary Object Store Descriptor:
>   bLength                 5
>   bDescriptorType        15
>   wTotalLength           22
>   bNumDeviceCaps          2
>   USB 2.0 Extension Device Capability:
>     bLength                 7
>     bDescriptorType        16
>     bDevCapabilityType      2
>     bmAttributes   0x0000010e
>       Link Power Management (LPM) Supported
>   SuperSpeed USB Device Capability:
>     bLength                10
>     bDescriptorType        16
>     bDevCapabilityType      3
>     bmAttributes         0x00
>     wSpeedsSupported   0x000f
>       Device can operate at Low Speed (1Mbps)
>       Device can operate at Full Speed (12Mbps)
>       Device can operate at High Speed (480Mbps)
>       Device can operate at SuperSpeed (5Gbps)
>     bFunctionalitySupport   1
>       Lowest fully-functional device speed is Full Speed (12Mbps)
>     bU1DevExitLat          10 micro seconds

Hmm, this is the maximum allowed value

>     bU2DevExitLat         511 micro seconds

This is not. Can you try setting this to 0x7ff and see if the problem
goes away? It could be that your platform needs more time to
wakeup. Then you're going to have to characterize it to figure out how
much this value should be.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFFBAEBCAAvFiEE9DumQ60WEZ09LIErzlfNM9wDzUgFAmCQ6aYRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzlfNM9wDzUjwqQf9HZACgvgnMFzozLQPHnOnYRiw88sOtmf3
FMDQGcdq81+eY4sest6oisb5n1b/yTN6VXUkAFk2n+J/DCZYSnp5VD+HF5q7KrJk
reXZjz/IFX2o+7XfJ2d80N8/r9h3y+ITRwOwVSwiayd6KP37jDAHyC2BJFAkfYy6
5+IX1dOKVgaUdt3d5tXK+V2vovfdxXTL8tT5DsBRaYGFxGX9U91uRVRIPzfI8iVy
8K9kpEmKzjX53Mh1ahJQ3Sy0Ktu5YjLCXCz4Wst7lYhFQ26aWwgYRaH534DslU3D
woLw+h5Tom9xbEKSUFj56Ty+RVwQYKi6Q2jClRBObnfdEZVropzOnw==
=jwfA
-----END PGP SIGNATURE-----
--=-=-=--
