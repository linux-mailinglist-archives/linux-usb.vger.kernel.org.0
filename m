Return-Path: <linux-usb+bounces-31266-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 83439CAC82F
	for <lists+linux-usb@lfdr.de>; Mon, 08 Dec 2025 09:34:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 882563003163
	for <lists+linux-usb@lfdr.de>; Mon,  8 Dec 2025 08:34:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 304AD2D97A5;
	Mon,  8 Dec 2025 08:34:44 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF3F4C97
	for <linux-usb@vger.kernel.org>; Mon,  8 Dec 2025 08:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765182883; cv=none; b=cdfDUsBuglmAo2KLN936ak84K0kSLWXRFjQpOlInXWRkdDHefSqrczpQZIXOFCyf+iMIVHlhq3wktZm6A9UBFWsVfnX1Svzm8Z4K4b8InKsPaSOjGp5/DxauTZtPBOSbuSeTcr2lCicMVbpNy6xFYYgy905T/2BdcJy8ysMXfGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765182883; c=relaxed/simple;
	bh=wxklaITTiQXTVJ+dbLE+L/UFZqjXXbmDp/4K8U20LKY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fPfyYMhQsmZRKUoYG1DeYbe4cjKk1TA0+E8zKpeVw7ki0PpwUTyOzDf+SQcwDxaxKdZvdfU7J66/PU/m6pmFD1RIe/MSrWB17u6opSo8xIcBsM3PFhPZ/Kts8NOm2EImqGk66g5iREPrgK8x4djBlOR5vlXM+ZN+e82gKSLW9Qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vSWhM-0007Da-2M; Mon, 08 Dec 2025 09:34:24 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vSWhK-004a29-2n;
	Mon, 08 Dec 2025 09:34:22 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vSWhK-000000003Xn-3MwU;
	Mon, 08 Dec 2025 09:34:22 +0100
Message-ID: <b417865397822176e83bca6b9d8094fe92ff2451.camel@pengutronix.de>
Subject: Re: [PATCH 0/2] usb: host: Drop resume calls on
 {e,o}hci_platform_suspend()
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Biju Das <biju.das.jz@bp.renesas.com>, Alan Stern
	 <stern@rowland.harvard.edu>, "biju.das.au" <biju.das.au@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Claudiu Beznea	
 <claudiu.beznea.uj@bp.renesas.com>, "linux-usb@vger.kernel.org"	
 <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org"	
 <linux-kernel@vger.kernel.org>, Geert Uytterhoeven
 <geert+renesas@glider.be>,  Prabhakar Mahadev Lad
 <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "linux-renesas-soc@vger.kernel.org"	 <linux-renesas-soc@vger.kernel.org>
Date: Mon, 08 Dec 2025 09:34:22 +0100
In-Reply-To: <TY3PR01MB1134603CBC4385178E2E57E3886A2A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20251207124742.96526-1-biju.das.jz@bp.renesas.com>
	 <db985cbf-4813-44d1-a4c6-16826f935c17@rowland.harvard.edu>
	 <TY3PR01MB1134603CBC4385178E2E57E3886A2A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org

On Mo, 2025-12-08 at 07:50 +0000, Biju Das wrote:
> Hi Alan Stern,
>=20
> > -----Original Message-----
> > From: Alan Stern <stern@rowland.harvard.edu>
> > Sent: 07 December 2025 16:36
> > Subject: Re: [PATCH 0/2] usb: host: Drop resume calls on {e,o}hci_platf=
orm_suspend()
> >=20
> > On Sun, Dec 07, 2025 at 12:47:25PM +0000, Biju wrote:
> > > From: Biju Das <biju.das.jz@bp.renesas.com>
> > >=20
> > > As per the suspend_devices_and_enter() [1], if .suspend() fails, it
> > > invoke the .resume() callback.
> >=20
> > Quite wrong.  If .suspend() fails, the core assumes the device is still=
 at full power.  It does not
> > try to resume the device.
>=20
> But now in ehci/ohci suspend() is calling ehci_resume without checking th=
e status of reset_deassert
> that can lead to synchronous abort and reboot is the only way to recover.
>=20
> For the reset_assert failure cases in suspend(),
>=20
> Case 1) Exclusive reset assert, reset register bit set to assert, but sta=
tus bit is not set, so we get timeout error
> 	  The following access to ehci registers can lead to synchronous abort.

Let the reset controller driver set the reset register bit back to
deasserted state when returning a timeout error after waiting for the
status bit to change.

> Case 2) Array reset assert, reset register bit is set to deassert, but we=
 are not checking the status bit
>         and if the device not transitioned to deassert state, then that c=
an lead to synchronous abort

The status of array resets can not be checked with the current API.

> I guess we should explicirtly call reset_control_deassert(priv->rsts) to =
make sure
> the device is in deasserted state before calling ehci_resume().
>=20
> I may be wrong. Please correct me if I am wrong.

The reset controller driver should leave the reset in a deasserted
state when returning an error from reset_control_assert().

regards
Philipp

