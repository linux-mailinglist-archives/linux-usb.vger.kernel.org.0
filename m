Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 627FA572942
	for <lists+linux-usb@lfdr.de>; Wed, 13 Jul 2022 00:24:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233343AbiGLWYz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 12 Jul 2022 18:24:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233061AbiGLWYy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 12 Jul 2022 18:24:54 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CA74599F1
        for <linux-usb@vger.kernel.org>; Tue, 12 Jul 2022 15:24:52 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 8C391B81BF7
        for <linux-usb@vger.kernel.org>; Tue, 12 Jul 2022 22:24:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA86EC3411C;
        Tue, 12 Jul 2022 22:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657664690;
        bh=Nc/RalkLKFrfs5wlBXF790lfsNyxJhWS8H2KfEls988=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=X2fn3W1FsqsHNzWnYpbs+lNdKromFL/1zSteR5eTNm3Lmrgob+ul90MBwy6r2smVV
         +bpNffmEk4/oaUfCdBrEquoBNqRGBz0Epz1/zUlZChPJ5SxHPDZv64rHZyBHgu8HKC
         UxdEX8ynLyiUtCDiz1EVKI1fd+I8dmeuHaPyOehbHDx5xhVqOAEY+la8lfZ9bPZJf3
         6xl7Xurf64eVUDrDo4YzE3rO98fK6E104CEolzK4CyGJ+3klNQeeKjOnurkufsFVlN
         e5YzMxYQpTgV4GDqS/VqhEwMJdQsSRMNO7Skx++TOvTfyGLeLiUMrUtZAhdNnvfw27
         58vW6x8UTXlRQ==
Date:   Wed, 13 Jul 2022 00:24:45 +0200
From:   Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To:     Rob Pearce <rob@flitspace.org.uk>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 2/7] USB: serial: ftdi_sio: Add missing baud rate
 validation
Message-ID: <20220713002445.6afbccc9@thinkpad>
In-Reply-To: <33c0f2c5-5873-1d1c-8721-9c715f4034cb@flitspace.org.uk>
References: <20220712115306.26471-1-kabel@kernel.org>
        <20220712115306.26471-3-kabel@kernel.org>
        <33c0f2c5-5873-1d1c-8721-9c715f4034cb@flitspace.org.uk>
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 12 Jul 2022 18:27:28 +0100
Rob Pearce <rob@flitspace.org.uk> wrote:

> On 12/07/2022 12:53, Marek Beh=C3=BAn wrote:
> > From: Pali Roh=C3=A1r <pali@kernel.org>
> >
> > Add lower checks for requested baud rate for FT8U232AM, FT232BM, FT2232=
C,
> > FT232RL, FTX, FT2232H, FT4232H and FT232H. For all of these the minimum
> > baud rate they can generate is 183 Baud.
> >
> > Signed-off-by: Pali Roh=C3=A1r <pali@kernel.org>
> > Tested-by: Marek Beh=C3=BAn <kabel@kernel.org>
> > Signed-off-by: Marek Beh=C3=BAn <kabel@kernel.org>
> > ---
> >   drivers/usb/serial/ftdi_sio.c | 6 +++---
> >   1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/usb/serial/ftdi_sio.c b/drivers/usb/serial/ftdi_si=
o.c
> > index ea40f367e70c..717b97f4e094 100644
> > --- a/drivers/usb/serial/ftdi_sio.c
> > +++ b/drivers/usb/serial/ftdi_sio.c
> > @@ -1330,7 +1330,7 @@ static u32 get_ftdi_divisor(struct tty_struct *tt=
y,
> >   		}
> >   		break;
> >   	case FT8U232AM: /* 8U232AM chip */
> > -		if (baud <=3D 3000000) {
> > +		if (baud >=3D 183 && baud <=3D 3000000) {
> >   			div_value =3D ftdi_232am_baud_to_divisor(baud);
> >   		} else {
> >   			dev_dbg(dev, "%s - Baud rate too high!\n", __func__); =20
> Due to the above change, this debug message is now incorrect.

Thx for noticing that. I will update. Also I will probably do some more
refactors, I am not yet sure.

Marek

> > @@ -1343,7 +1343,7 @@ static u32 get_ftdi_divisor(struct tty_struct *tt=
y,
> >   	case FT2232C: /* FT2232C chip */
> >   	case FT232RL: /* FT232RL chip */
> >   	case FTX:     /* FT-X series */
> > -		if (baud <=3D 3000000) {
> > +		if (baud >=3D 183 && baud <=3D 3000000) {
> >   			u16 product_id =3D le16_to_cpu(
> >   				port->serial->dev->descriptor.idProduct);
> >   			if (((product_id =3D=3D FTDI_NDI_HUC_PID)		||
> > @@ -1367,7 +1367,7 @@ static u32 get_ftdi_divisor(struct tty_struct *tt=
y,
> >   	case FT232H:  /* FT232H chip */
> >   		if ((baud <=3D 12000000) && (baud >=3D 1200)) {
> >   			div_value =3D ftdi_2232h_baud_to_divisor(baud);
> > -		} else if (baud < 1200) {
> > +		} else if (baud >=3D 183 && baud < 1200) {
> >   			div_value =3D ftdi_232bm_baud_to_divisor(baud);
> >   		} else {
> >   			dev_dbg(dev, "%s - Baud rate too high!\n", __func__); =20
> As above
>=20
>=20

