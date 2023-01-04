Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8050E65DA11
	for <lists+linux-usb@lfdr.de>; Wed,  4 Jan 2023 17:40:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235199AbjADQkj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 Jan 2023 11:40:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235044AbjADQkd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 4 Jan 2023 11:40:33 -0500
Received: from bee.tesarici.cz (bee.tesarici.cz [IPv6:2a03:3b40:fe:2d4::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 942E21C12B
        for <linux-usb@vger.kernel.org>; Wed,  4 Jan 2023 08:40:32 -0800 (PST)
Received: from meshulam.tesarici.cz (dynamic-2a00-1028-83b8-1e7a-4427-cc85-6706-c595.ipv6.o2.cz [IPv6:2a00:1028:83b8:1e7a:4427:cc85:6706:c595])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by bee.tesarici.cz (Postfix) with ESMTPSA id 08C6A12D9BC;
        Wed,  4 Jan 2023 17:40:30 +0100 (CET)
Authentication-Results: mail.tesarici.cz; dmarc=fail (p=none dis=none) header.from=tesarici.cz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tesarici.cz; s=mail;
        t=1672850431; bh=otfQ03yA/RkrXzV9Q/GLg/RAPwYikfuDhYlVJFznMZU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=YhC2nuPX+y5FXN+520IndOqOEtJ94tXA5I5FGXui3rkkRdDdzCoGndrCe4LGwYB72
         FdVcaQnVtTHEP/JrxJ+rscVn5kvrRpYUUPJsk2B41iZtm/SajtSy6TFuEWiECSpk3q
         3OzBMvSjS4Iwequ1/4nmJmsTKmlIYsd9iULOUPitEx57OXuOkeoWnmI+mTK2fpM5mp
         3AAo1nG/oP0JlQ7eAJf5XQIJhPkPYa4iTkaFapNY7x7Gxg7DNFuqBfrmUDhksTleEv
         Mbr41RZd3HObF8ycOSGp/bKeIEXr/XnoFtFGIaN2xCADAh9OdoxzaGX2bQxcADytJG
         NlbQGu1f5eevw==
Date:   Wed, 4 Jan 2023 17:40:30 +0100
From:   Petr =?UTF-8?B?VGVzYcWZw61r?= <petr@tesarici.cz>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Disabling per-device autosuspend
Message-ID: <20230104174030.7c0bdf99@meshulam.tesarici.cz>
In-Reply-To: <Y7Wm1UVGMx8ZeqgD@rowland.harvard.edu>
References: <20230104151341.6f937c0c@meshulam.tesarici.cz>
        <20230104164900.31a3243d@meshulam.tesarici.cz>
        <Y7Wm1UVGMx8ZeqgD@rowland.harvard.edu>
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

Hi Alan,

On Wed, 4 Jan 2023 11:18:29 -0500
Alan Stern <stern@rowland.harvard.edu> wrote:

> On Wed, Jan 04, 2023 at 04:49:00PM +0100, Petr Tesa=C5=99=C3=ADk wrote:
> > On Wed, 4 Jan 2023 15:13:41 +0100
> > Petr Tesa=C5=99=C3=ADk <petr@tesarici.cz> wrote:
> >  =20
> > > Hi folks,
> > >=20
> > > I'm struggling with autosuspend on my Samsung phone in download mode,=
 =20
>=20
> Wait...  Autosuspend is carried out by the host, but you appear to be=20
> stating that the Samsung phone is acting as a USB device (i.e., it's=20
> being autosuspended, not that it is autosuspending something else). =20
> Is that right?

You're right. There's a typo in this sentence. It's not autosuspend _ON_
my Samsung phone, but autosuspend _OF_ my Samsung phone. So, yes, the
phone is in gadget mode, and I'm seeing all these =C3=AFssues on the host (a
ThinkPad E595, but that's most likely irrelevant).

Petr T

> > > as it apparently breaks heimdall/libusb on my Tumbleweed system. Here=
's
> > > what I'm seeing:
> > >=20
> > > - My device is autosuspended, because it has been idle for long enoug=
h.
> > > - cd /sys/bus/usb/devices/1-4/  # my device's port
> > > - echo -1 > power/autosuspend
> > > - The device is reset and gets a new device ID.
> > >   The current directory is no longer valid (becomes empty). =20
> >=20
> > On a second thought, this looks like the actual bug. I don't think
> > we're supposed to see a disconnect+reconnect whenever a suspended USB
> > device is resumed. Then again, I'm no expert on USB... =20
>=20
> In general there should not be a disconnect during a resume.  But it can=
=20
> happen, depending on how the device behaves.  Perhaps your phone is=20
> disconnecting deliberately.
>=20
> The dmesg log ought to contain some useful information, particularly if=20
> you enable USB kernel debugging before starting the experiment:
>=20
> 	echo 'module usbcore =3Dp' >/sys/kernel/debug/dynamic_debug/control
>=20
> Alan Stern

