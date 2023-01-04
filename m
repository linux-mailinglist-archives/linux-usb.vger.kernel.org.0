Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EDAB365DB3F
	for <lists+linux-usb@lfdr.de>; Wed,  4 Jan 2023 18:27:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239372AbjADR1z (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 Jan 2023 12:27:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233514AbjADR1y (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 4 Jan 2023 12:27:54 -0500
Received: from bee.tesarici.cz (bee.tesarici.cz [IPv6:2a03:3b40:fe:2d4::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0813BF03F
        for <linux-usb@vger.kernel.org>; Wed,  4 Jan 2023 09:27:52 -0800 (PST)
Received: from meshulam.tesarici.cz (dynamic-2a00-1028-83b8-1e7a-4427-cc85-6706-c595.ipv6.o2.cz [IPv6:2a00:1028:83b8:1e7a:4427:cc85:6706:c595])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by bee.tesarici.cz (Postfix) with ESMTPSA id EC18212D0E9;
        Wed,  4 Jan 2023 18:27:50 +0100 (CET)
Authentication-Results: mail.tesarici.cz; dmarc=fail (p=none dis=none) header.from=tesarici.cz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tesarici.cz; s=mail;
        t=1672853271; bh=xg+rtuSXyYj44GGGgEfbZE6btHaqTFgdrteFIV2CKu0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=kmAwyX+vWj6BwUmJfmHdHLBhQmjoP2Fvt57KfTWZoZ1czYTWJ7TzbQu6wQZYRnswv
         TASl+Mynr+XHpxRL6UTHRao5rU6yLwQsycxyXsSJ8xiVRVwD7DwStW0vnir1VtX6ub
         A/qMmrWg6qb8KedliGJDmwQNo+wmWWft3fn35SX7icXB+XYXiG93L9ayWuqgZgHyt2
         OKGO312w4vCirvcBxDXNioeTaePxZEusgAmF26F9bZwnPJiY+ERFI4F8gnOQDlBQ76
         L7kKV0fXrqfmi6uPuqQmyWfYVsQzh5HCaOImZFdusAlDIgZYuOgtZKYueE4Bq4N9nM
         wq/uPNy8PXCIg==
Date:   Wed, 4 Jan 2023 18:27:50 +0100
From:   Petr =?UTF-8?B?VGVzYcWZw61r?= <petr@tesarici.cz>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Disabling per-device autosuspend
Message-ID: <20230104182750.1529bd78@meshulam.tesarici.cz>
In-Reply-To: <Y7WxltobCK0zQz9k@rowland.harvard.edu>
References: <20230104151341.6f937c0c@meshulam.tesarici.cz>
        <20230104164900.31a3243d@meshulam.tesarici.cz>
        <Y7Wm1UVGMx8ZeqgD@rowland.harvard.edu>
        <20230104174731.5527b1ed@meshulam.tesarici.cz>
        <Y7WxltobCK0zQz9k@rowland.harvard.edu>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 4 Jan 2023 12:04:22 -0500
Alan Stern <stern@rowland.harvard.edu> wrote:

> On Wed, Jan 04, 2023 at 05:47:31PM +0100, Petr Tesa=C5=99=C3=ADk wrote:
>[...]
> > V Wed, 4 Jan 2023 11:18:29 -0500
> > Alan Stern <stern@rowland.harvard.edu> naps=C3=A1no:
> >  =20
> > > On Wed, Jan 04, 2023 at 04:49:00PM +0100, Petr Tesa=C5=99=C3=ADk wrot=
e: =20
>[...]
> > > > On a second thought, this looks like the actual bug. I don't think
> > > > we're supposed to see a disconnect+reconnect whenever a suspended U=
SB
> > > > device is resumed. Then again, I'm no expert on USB...   =20
> > >=20
> > > In general there should not be a disconnect during a resume.  But it =
can=20
> > > happen, depending on how the device behaves. =20
> >=20
> >  =20
> > >  Perhaps your phone is=20
> > > disconnecting deliberately.
> > >=20
> > > The dmesg log ought to contain some useful information, particularly =
if=20
> > > you enable USB kernel debugging before starting the experiment:
> > >=20
> > > 	echo 'module usbcore =3Dp' >/sys/kernel/debug/dynamic_debug/control =
=20
> >=20
> > I can see there is an -EIO after the resume attempt:
> >=20
> > Jan 04 17:44:38 meshulam kernel: usb 1-4: usb auto-resume
> > Jan 04 17:44:38 meshulam kernel: hub 1-0:1.0: state 7 ports 4 chg 0000 =
evt 0010
> > Jan 04 17:44:38 meshulam kernel: usb 1-4: Waited 0ms for CONNECT
> > Jan 04 17:44:38 meshulam kernel: usb 1-4: finish resume =20
>=20
> At this point the host sends a Get-Device-Status request to the device=20
> (not shown in the log).
>=20
>  [...] =20
>=20
> The fact that the host is retrying means that the status request got an=20
> error.  Unfortunately the log message doesn't say sort of error=20
> occurred.

OK, I see. The URB indicates success, but there is no data:

45	0.432232	host	1.50.0	USB	64	GET STATUS Request
46	0.432659	1.50.0	host	USB	64	GET STATUS Response

Frame 46: 64 bytes on wire (512 bits), 64 bytes captured (512 bits) on inte=
rface usbmon1, id 0
USB URB
    [Source: 1.50.0]
    [Destination: host]
    URB id: 0xffff98b4383c8d80
    URB type: URB_COMPLETE ('C')
    URB transfer type: URB_CONTROL (0x02)
    Endpoint: 0x80, Direction: IN
    Device: 50
    URB bus id: 1
    Device setup request: not relevant ('-')
    Data: present ('\0')
    URB sec: 1672851450
    URB usec: 569060
    URB status: Success (0)
    URB length [bytes]: 0
    Data length [bytes]: 0
-------------------------^
This should be 2, and the device should send a 16-bit status word. Hm.

    [Request in: 45]
    [Time from request: 0.000427000 seconds]
    Unused Setup Header
    Interval: 0
    Start frame: 0
    Copy of Transfer Flags: 0x00000200, Dir IN
    Number of ISO descriptors: 0

While I do agree that the Samsung phone download mode USB stack
implementation is crappy, multiple models and many users are affected. I
wonder what would be a sensible workaround in heimdall and/or libusb...

Setting a global module parameter does not sound great.

Petr T

> > Jan 04 17:44:38 meshulam kernel: usb 1-4: reset high-speed USB device n=
umber 46 using xhci_hcd
> > Jan 04 17:44:38 meshulam kernel: usb 1-4: gone after usb resume? status=
 -5 =20
>=20
> And here is where the phone disconnected itself, or at least, failed to=20
> respond properly following the reset.
>=20
> If you want even more detailed information, you can get a usbmon trace=20
> (see Documentation/usb/usbmon.rst in the kernel source) of the resume=20
> procedure.  However, I doubt that knowing what happened will help to fix=
=20
> the problem.
>=20
> If you want to prevent the phone from being autosuspended in the first=20
> place, you can write -1 to /sys/module/usbcore/parameters/autosuspend=20
> before the phone is plugged in.  But of course, this will then affect=20
> _all_ USB devices plugged in before you set the autosuspend delay back=20
> to 2.
>=20
> Alan Stern

