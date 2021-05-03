Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA6CD371642
	for <lists+linux-usb@lfdr.de>; Mon,  3 May 2021 15:52:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233325AbhECNxR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 3 May 2021 09:53:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:42868 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233299AbhECNxP (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 3 May 2021 09:53:15 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6AC1F611CE;
        Mon,  3 May 2021 13:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620049941;
        bh=DgMq6YkE9V6fCCe6L8LNOMd24pkQIacJK3i3At8ZgVI=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=ZcRtoMI+8Ubr4+142aO09JNsaRJdLq69vTOlSOQtyGRjkiAY+z9NYuK/vIXs4ILJ2
         QGB5TqKTELQOo4GWErtjtEww1MWSZvcEJ94MhQjKU+ozJvW4ow/A4URYy6c0AP7SRi
         kqKuUDlA3mH9DddT0IvaOo5FQReJAMtucZdQrKq1KMJyDBpi8aGqrXkl0gk9mbKcfc
         vaBv9uRueLtpwHqauiHJ37SWVrqfFa3G9OuyIlxMIwEuOssv7YRlycef3ICNvdh0vQ
         4SuOFF6V2dNGwfR+yP0uhXdhqysLy2cAtKSPvl1hOK7/naTOuWRQ39WDcm0bRNmg5C
         FxRC0s5Ru6j0A==
From:   Felipe Balbi <balbi@kernel.org>
To:     Sebastian von Ohr <vonohr@smaract.com>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Thinh Nguyen <thinhn@synopsys.com>, balbi@kernel.org
Subject: Re: [BUG REPORT] usb: dwc3: Timeouts with USB 2.0 LPM active
In-Reply-To: <c9b5559a05f5459d92e3c704772edb46@smaract.com>
References: <c9b5559a05f5459d92e3c704772edb46@smaract.com>
Date:   Mon, 03 May 2021 16:52:12 +0300
Message-ID: <87eeenj56b.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

(before anything, thanks for actually following the steps for bug
reporting. Much, much appreciated)

Sebastian von Ohr <vonohr@smaract.com> writes:

> I'm running an Intel Apollo Lake SoM (Celeron N3350E) which I want to use=
 as=20
> a USB gadget with the functionFS gadget driver. I have created two bulk=20
> endpoints for sending and receiving data. The hardware and cabling is onl=
y USB=20
> 2.0 capable. In one test case the receive side of the SoM is slowed down=
=20
> deliberately (200ms sleep between reads) while the host PC tries to send =
as=20
> fast as possible. This setup leads to send timeouts on every second=20
> transmission on the host PC.
>
> I believe this is an issue with the USB 2.0 LPM feature, more specificall=
y=20
> hardware LPM done by the host USB controller. I have tested different USB=
=20

It's like the host is trying to go down to lower LPM states every 100ms:

     irq/13-dwc3-236     [000] d..1    71.363262: dwc3_event: event (000004=
01): WakeUp [U0]
     irq/13-dwc3-236     [000] d..1    71.363315: dwc3_event: event (000004=
01): WakeUp [U0]
     irq/13-dwc3-236     [000] d..1    71.363423: dwc3_event: event (000060=
84): ep1out: Transfer In Progress [0] (SIm)

> descriptors and the issue is gone when removing the USB_LPM_SUPPORT flag =
from=20
> the USB 2.0 extension descriptor (actually removing only USB_BESL_SUPPORT=
 seems=20
> to suffice). Also the issue occurs only on some newer PCs and adding a hu=
b=20

it could be that LPM is disabled on older xHCI revisions. Mathias,
anything you can add here?

> (doesn't matter if 2.0 or 3.0 capable) makes the issue go away. I can=20
> reproduce this issue with a Windows 10 (1909) host running an Intel B360=
=20
> chipset. I use libusb v1.0.24 with the WinUSB driver on the host side to =
send=20
> data on the bulk endpoint.

could you share a dump of your descriptors? It could be that the wake-up
latencies are incorrect which tricks the host into trying to go down to
lower LPM states too frequently.

> See the attached dwc3 trace and registers. It was created using the curre=
nt=20
> 5.12.1 kernel version. It shows multiple WakeUp [U0] events in short succ=
ession=20
> but never any event showing different link states than U0. The host is do=
ing 8=20
> transmissions of 16 bytes to the device, but the device only receives 4 o=
f=20
> these transmissions. The first transmissions always succeeds while the ne=
xt one=20
> will timeout on the host. I believe this is because the device is current=
ly not=20
> ready to receive new data. But instead of sending the data when the delay=
 on=20
> the receive side is over the request never finishes and times out after 1=
=20
> second (or even longer when I increase the timeout value).
>
> Is the USB 2.0 LPM extension even supposed to work with the dwc3 controll=
er? I=20

yes, it should be supported :-)

> can work around this issue currently by downgrading the device to USB 2.0=
 only=20
> (setting bcdUSB to 0x0200). But I believe USB 3.0 capable device must sup=
port=20
> LPM, so this issue might come up again when having USB 3.0 capable hardwa=
re.

correct, LPM is mandatory for USB3.0+. From the traces, we don't see any
errors, though. Everything looks fine.

Mathias, I have an old memory from my time at Intel when we discussed
this very fact. I can't remember what was the conclusion, but is there
anything the peripheral can do to tell the host to *not* enter U1/U2 so
frequently? If my memory doesn't fail me, I don't think there is
anything at all for the peripheral to do, right? Other than not
supporting U1/U2, which means STALLing the relevat SetFeature
requests. Do you know if that would still be a certifiable solution?

cheers

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFFBAEBCAAvFiEE9DumQ60WEZ09LIErzlfNM9wDzUgFAmCQAAwRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzlfNM9wDzUieHwf6AhLS4caFLDoIt1+1Nu4c1bL9YnIA/vTn
61KhbB9P8lfRtm+GeBY+XU198L8V75sckvAJzPNByWHLBhBPfXKA1ni1dd3rUbpO
aIJQ0suuwNmU1OgTpuNbLzy6kqpnO3EKaNlRHN4AIlhfSFea5egU0fyaYKRzev4X
bJuHYPf+Jrmkf1q9E7rMuW9VhjQh1ssnDagsfkyHqG0iMRPQv8FUSHGqO0wm9cbV
kQIFwu59BtuQmjTeySSmTJkz+E1L/EncvxTcnzASJhTlGKHJaxU99D39rnyeygla
Rum6ZZEKEDlF+91aPd3PkUk21j/nTQQeJFwMjTo+xjNHaPimHM+B8g==
=Vy3x
-----END PGP SIGNATURE-----
--=-=-=--
