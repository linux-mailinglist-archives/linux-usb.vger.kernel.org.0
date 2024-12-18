Return-Path: <linux-usb+bounces-18657-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A549F6CA9
	for <lists+linux-usb@lfdr.de>; Wed, 18 Dec 2024 18:50:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C6986170C9F
	for <lists+linux-usb@lfdr.de>; Wed, 18 Dec 2024 17:49:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ED081FA82B;
	Wed, 18 Dec 2024 17:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="GLHJYPU1"
X-Original-To: linux-usb@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD192142624;
	Wed, 18 Dec 2024 17:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734544173; cv=none; b=lerEairuMBEem6lFuao9CYPVpeoyVNMO9cFtMpfLrF+Eg74OpP86/Eof38SKEIRHTFVvO4bZb6Nrqy9Xsb/KtiC71YO3gEcZEidK4IvmZUjet3Sp5vSDDyu3uq7dyjpGKQl6HBhNd33NBZ0eI0AqqG9I4yVREI+oImqr0Y7VT/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734544173; c=relaxed/simple;
	bh=3h4Ad1zi9pBnCC+DUbnbrCJ+TPvXSJ2baWPf5dKb5pw=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=dYFJr9y877gWscaUICPwodODuil+VDMowl8DBIfhpZ5J0L3qBjy1etw15JD5b23ZkUMzYQNqyAKmts966S/smibbhdVRa9EzwlDhWrUaDKUlxpUs+WduHgG68TEUWhj0p8J6JD3Xwrx7CjaRuEmYI/yGs+nkU89AljuNGAsJjhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=GLHJYPU1; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 82DD2E0002;
	Wed, 18 Dec 2024 17:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734544152;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bFgH0z7MZ2T4yjGhodRY50UP6dCNtWf6TRL9SJPWYrQ=;
	b=GLHJYPU12KCDAXahwPpMXLPJA+SzouR/uXILlEEUGZixqWUGens426k1N76CezX3YQsYmz
	GLKRfk6s54GVNGSlHxDryu3TZ6ygcDF/wzF/1QdmC2lBBYIugoyj8FJ7EVQmuDpbHPC2rD
	ZPlXRdNSmNEteWrYgWv1CK5v23tW2FD0hoSqfIr6Hd0KwButVT0lLSBvmUtWSYdPGYrpBK
	DBPJ065WWDsUsEOJ11MLfObvwLgDZ5Fpu7dH9zSj5hTwoKcqmZ0gRA5Jjz9lEKXN8Gt2S+
	myLG4ZIrKrQFIClVL1HgWnfKGEL9ZRE0SUhi6zH0EaDF+OELyIY5qgwBto39oA==
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Dec 2024 18:49:11 +0100
Message-Id: <D6F0L2L02YIS.3D2DW1P7691L4@bootlin.com>
To: "Roger Quadros" <rogerq@kernel.org>, "Peter Chen"
 <peter.chen@kernel.org>, "Pawel Laszczak" <pawell@cadence.com>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, "Mathias Nyman"
 <mathias.nyman@intel.com>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Subject: Re: [PATCH v6 4/5] xhci: introduce xhci->lost_power flag
Cc: =?utf-8?q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, <linux-usb@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20241210-s2r-cdns-v6-0-28a17f9715a2@bootlin.com>
 <20241210-s2r-cdns-v6-4-28a17f9715a2@bootlin.com>
 <70aced7f-0311-43b9-96af-c8325c39ff2b@kernel.org>
 <D6AP7JCNSME9.3FS7XCZJ37GM8@bootlin.com>
 <ed77988a-ba26-4a71-a8cf-b1e5a6425a2e@kernel.org>
In-Reply-To: <ed77988a-ba26-4a71-a8cf-b1e5a6425a2e@kernel.org>
X-GND-Sasl: theo.lebrun@bootlin.com

Hello Roger, Peter, Pawel, Greg, Mathias,

On Tue Dec 17, 2024 at 10:00 PM CET, Roger Quadros wrote:
>
>
> On 13/12/2024 18:03, Th=C3=A9o Lebrun wrote:
> > On Thu Dec 12, 2024 at 1:37 PM CET, Roger Quadros wrote:
> >> On 10/12/2024 19:13, Th=C3=A9o Lebrun wrote:
> >>> The XHCI_RESET_ON_RESUME quirk allows wrappers to signal that they
> >>> expect a reset after resume. It is also used by some to enforce a XHC=
I
> >>> reset on resume (see needs-reset-on-resume DT prop).
> >>>
> >>> Some wrappers are unsure beforehands if they will reset. Add a mechan=
ism
> >>> to signal *at resume* if power has been lost. Parent devices can set
> >>> this flag, that defaults to false.
> >>>
> >>> The XHCI_RESET_ON_RESUME quirk still triggers a runtime_pm_get() on t=
he
> >>> controller. This is required as we do not know if a suspend will
> >>> trigger a reset, so the best guess is to avoid runtime PM.
> >>>
> >>> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>
> >>> ---
> >>>  drivers/usb/host/xhci.c | 3 ++-
> >>>  drivers/usb/host/xhci.h | 6 ++++++
> >>>  2 files changed, 8 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
> >>> index 5ebde8cae4fc44cdb997b0f61314e309bda56c0d..ae2c8daa206a87da24d58=
a62b0a0485ebf68cdd6 100644
> >>> --- a/drivers/usb/host/xhci.c
> >>> +++ b/drivers/usb/host/xhci.c
> >>> @@ -1017,7 +1017,8 @@ int xhci_resume(struct xhci_hcd *xhci, pm_messa=
ge_t msg)
> >>> =20
> >>>  	spin_lock_irq(&xhci->lock);
> >>> =20
> >>> -	if (hibernated || xhci->quirks & XHCI_RESET_ON_RESUME || xhci->brok=
en_suspend)
> >>> +	if (hibernated || xhci->quirks & XHCI_RESET_ON_RESUME ||
> >>> +	    xhci->broken_suspend || xhci->lost_power)
> >>>  		reinit_xhc =3D true;
> >>> =20
> >>>  	if (!reinit_xhc) {
> >>> diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
> >>> index 4914f0a10cff42dbc1448dcf7908534d582c848e..32526df75925989d40cbe=
7d59a187c945f498a30 100644
> >>> --- a/drivers/usb/host/xhci.h
> >>> +++ b/drivers/usb/host/xhci.h
> >>> @@ -1645,6 +1645,12 @@ struct xhci_hcd {
> >>>  	unsigned		broken_suspend:1;
> >>>  	/* Indicates that omitting hcd is supported if root hub has no port=
s */
> >>>  	unsigned		allow_single_roothub:1;
> >>> +	/*
> >>> +	 * Signal from upper stacks that we lost power during system-wide
> >>> +	 * suspend. Its default value is based on XHCI_RESET_ON_RESUME, mea=
ning
> >>> +	 * it is safe for wrappers to not modify lost_power at resume.
> >>> +	 */
> >>> +	unsigned                lost_power:1;
> >>
> >> I suppose this is private to XHCI driver and not legitimate to be acce=
ssed
> >> by another driver after HCD is instantiated?
> >=20
> > Yes it is private.
> >=20
> >> Doesn't access to xhci_hcd need to be serialized via xhci->lock?
> >=20
> > Good question. In theory maybe. In practice I don't see how
> > cdns_host_resume(), called by cdns_resume(), could clash with anything
> > else. I'll add that to be safe.
> >=20
> >> Just curious, what happens if you don't include patch 4 and 5?
> >> Is USB functionality still broken for you?
> >=20
> > No it works fine. Patches 4+5 are only there to avoid the below warning=
.
> > Logging "xHC error in resume" is a lie, so I want to avoid it.
>
> How is it a lie?
> The XHCI controller did loose its save/restore state during a PM operatio=
n.
> As far as XHCI is concerned this is an error. no?

The `xhci->quirks & XHCI_RESET_ON_RESUME` is exactly the same thing;
both the quirk and the flag we add have for purpose:

1. skipping this block

	if (!reinit_xhc) {
		retval =3D xhci_handshake(&xhci->op_regs->status,
					STS_CNR, 0, 10 * 1000 * 1000);
		// ...
		xhci_restore_registers(xhci);
		xhci_set_cmd_ring_deq(xhci);
		command =3D readl(&xhci->op_regs->command);
		command |=3D CMD_CRS;
		writel(command, &xhci->op_regs->command);
		if (xhci_handshake(&xhci->op_regs->status,
			      STS_RESTORE, 0, 100 * 1000)) {
			// ...
		}
	}

2. avoiding this warning:

	xhci_warn(xhci, "xHC error in resume, USBSTS 0x%x, Reinit\n", temp);

I don't think the block skipped is important in resume duration (to be
confirmed). But the xhci_warn() is not desired: we do not want to log
warnings if we know it is expected.

I'll think some more about it.

Thanks,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


