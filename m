Return-Path: <linux-usb+bounces-19135-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50161A058EC
	for <lists+linux-usb@lfdr.de>; Wed,  8 Jan 2025 11:59:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3FCB51659E6
	for <lists+linux-usb@lfdr.de>; Wed,  8 Jan 2025 10:59:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47ED11F868E;
	Wed,  8 Jan 2025 10:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Ntr0yoDE"
X-Original-To: linux-usb@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D46F10E3;
	Wed,  8 Jan 2025 10:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736333973; cv=none; b=gVgnVJpNr/a5Yx8zH7yOXns/Up1N/O7NsY3HNIeyMrliPP503L8/Oyrqkt/9QOlocuqZ18wC4fJxDuHVuz57DKh25h7euh/NoVYI084P+lPFuv4m5cs8o1/Rd5PYtWQQIn2GKWApFZCA3wJvVCkAW1cnZ3cZsZPczJSq/pqeCcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736333973; c=relaxed/simple;
	bh=FFE0PNIbajsF/s0HO4l2aKn2wYyVaBM0yCRZ5OZknLA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=DR52sdLRspho2h/qDPHNY354C6RF7eKoxqW5y+cVlI9vmPYx54395LX3DX+NY7tonaWq/RPiXRnjsMSAugCw8Txn7kd8i39Tjv4cD6sf/45Rbt0JJ0lzXSKPcjUkWunxOkhuzWzX39S5+Q6+jHvmhuaqZjHrBEtrRsNOk20vz/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Ntr0yoDE; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2472760005;
	Wed,  8 Jan 2025 10:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736333969;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h42L6gXl7l42Jrse552yQWFkJpHdHExpZN2RsknfPBs=;
	b=Ntr0yoDE4FvTcl8ccbMZF5H3WCtKMKuZ8C2CcpCC08BWrOvtyA4aivc2EdXenL0TN21CM3
	dAQTT6D4KYMkXikaC+n2HGgaVmhF0/qiV2F6BVo05YKOxiSsNC4pMkWu4CUOjwxu/qflHn
	YI19XH3iHfrSziwjbkyxyTfYwgPOIxucwMQcgKcgpaLZCeHJKX9ZZbBtO43abcHi8UU2K7
	Xk1tBW5M6uRy/uS1Vosa9yPsmi3M0sN7iSjtQJmeRKB94+nBQNZvflZo93ho6Uo7a/P93u
	dfKdvd1SgQgAMejHLuTcReA38mc9bhEQIUmCjDAJuv471nb3/N+0KID16cKVgQ==
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 08 Jan 2025 11:59:27 +0100
Message-Id: <D6WN0T0DLMFJ.30GP099520IHT@bootlin.com>
Subject: Re: [PATCH v6 4/5] xhci: introduce xhci->lost_power flag
Cc: =?utf-8?q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, <linux-usb@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
To: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, "Roger Quadros"
 <rogerq@kernel.org>, "Peter Chen" <peter.chen@kernel.org>, "Pawel Laszczak"
 <pawell@cadence.com>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Mathias Nyman" <mathias.nyman@intel.com>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20241210-s2r-cdns-v6-0-28a17f9715a2@bootlin.com>
 <20241210-s2r-cdns-v6-4-28a17f9715a2@bootlin.com>
 <70aced7f-0311-43b9-96af-c8325c39ff2b@kernel.org>
 <D6AP7JCNSME9.3FS7XCZJ37GM8@bootlin.com>
 <ed77988a-ba26-4a71-a8cf-b1e5a6425a2e@kernel.org>
 <D6F0L2L02YIS.3D2DW1P7691L4@bootlin.com>
In-Reply-To: <D6F0L2L02YIS.3D2DW1P7691L4@bootlin.com>
X-GND-Sasl: theo.lebrun@bootlin.com

On Wed Dec 18, 2024 at 6:49 PM CET, Th=C3=A9o Lebrun wrote:
> On Tue Dec 17, 2024 at 10:00 PM CET, Roger Quadros wrote:
> > On 13/12/2024 18:03, Th=C3=A9o Lebrun wrote:
> > > On Thu Dec 12, 2024 at 1:37 PM CET, Roger Quadros wrote:
> > >> On 10/12/2024 19:13, Th=C3=A9o Lebrun wrote:
> > >>> The XHCI_RESET_ON_RESUME quirk allows wrappers to signal that they
> > >>> expect a reset after resume. It is also used by some to enforce a X=
HCI
> > >>> reset on resume (see needs-reset-on-resume DT prop).
> > >>>
> > >>> Some wrappers are unsure beforehands if they will reset. Add a mech=
anism
> > >>> to signal *at resume* if power has been lost. Parent devices can se=
t
> > >>> this flag, that defaults to false.
> > >>>
> > >>> The XHCI_RESET_ON_RESUME quirk still triggers a runtime_pm_get() on=
 the
> > >>> controller. This is required as we do not know if a suspend will
> > >>> trigger a reset, so the best guess is to avoid runtime PM.
> > >>>
> > >>> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>
> > >>> ---
> > >>>  drivers/usb/host/xhci.c | 3 ++-
> > >>>  drivers/usb/host/xhci.h | 6 ++++++
> > >>>  2 files changed, 8 insertions(+), 1 deletion(-)
> > >>>
> > >>> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
> > >>> index 5ebde8cae4fc44cdb997b0f61314e309bda56c0d..ae2c8daa206a87da24d=
58a62b0a0485ebf68cdd6 100644
> > >>> --- a/drivers/usb/host/xhci.c
> > >>> +++ b/drivers/usb/host/xhci.c
> > >>> @@ -1017,7 +1017,8 @@ int xhci_resume(struct xhci_hcd *xhci, pm_mes=
sage_t msg)
> > >>> =20
> > >>>  	spin_lock_irq(&xhci->lock);
> > >>> =20
> > >>> -	if (hibernated || xhci->quirks & XHCI_RESET_ON_RESUME || xhci->br=
oken_suspend)
> > >>> +	if (hibernated || xhci->quirks & XHCI_RESET_ON_RESUME ||
> > >>> +	    xhci->broken_suspend || xhci->lost_power)
> > >>>  		reinit_xhc =3D true;
> > >>> =20
> > >>>  	if (!reinit_xhc) {
> > >>> diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
> > >>> index 4914f0a10cff42dbc1448dcf7908534d582c848e..32526df75925989d40c=
be7d59a187c945f498a30 100644
> > >>> --- a/drivers/usb/host/xhci.h
> > >>> +++ b/drivers/usb/host/xhci.h
> > >>> @@ -1645,6 +1645,12 @@ struct xhci_hcd {
> > >>>  	unsigned		broken_suspend:1;
> > >>>  	/* Indicates that omitting hcd is supported if root hub has no po=
rts */
> > >>>  	unsigned		allow_single_roothub:1;
> > >>> +	/*
> > >>> +	 * Signal from upper stacks that we lost power during system-wide
> > >>> +	 * suspend. Its default value is based on XHCI_RESET_ON_RESUME, m=
eaning
> > >>> +	 * it is safe for wrappers to not modify lost_power at resume.
> > >>> +	 */
> > >>> +	unsigned                lost_power:1;
> > >>
> > >> I suppose this is private to XHCI driver and not legitimate to be ac=
cessed
> > >> by another driver after HCD is instantiated?
> > >=20
> > > Yes it is private.
> > >=20
> > >> Doesn't access to xhci_hcd need to be serialized via xhci->lock?
> > >=20
> > > Good question. In theory maybe. In practice I don't see how
> > > cdns_host_resume(), called by cdns_resume(), could clash with anythin=
g
> > > else. I'll add that to be safe.
> > >=20
> > >> Just curious, what happens if you don't include patch 4 and 5?
> > >> Is USB functionality still broken for you?
> > >=20
> > > No it works fine. Patches 4+5 are only there to avoid the below warni=
ng.
> > > Logging "xHC error in resume" is a lie, so I want to avoid it.
> >
> > How is it a lie?
> > The XHCI controller did loose its save/restore state during a PM operat=
ion.
> > As far as XHCI is concerned this is an error. no?
>
> The `xhci->quirks & XHCI_RESET_ON_RESUME` is exactly the same thing;
> both the quirk and the flag we add have for purpose:
>
> 1. skipping this block
>
> 	if (!reinit_xhc) {
> 		retval =3D xhci_handshake(&xhci->op_regs->status,
> 					STS_CNR, 0, 10 * 1000 * 1000);
> 		// ...
> 		xhci_restore_registers(xhci);
> 		xhci_set_cmd_ring_deq(xhci);
> 		command =3D readl(&xhci->op_regs->command);
> 		command |=3D CMD_CRS;
> 		writel(command, &xhci->op_regs->command);
> 		if (xhci_handshake(&xhci->op_regs->status,
> 			      STS_RESTORE, 0, 100 * 1000)) {
> 			// ...
> 		}
> 	}
>
> 2. avoiding this warning:
>
> 	xhci_warn(xhci, "xHC error in resume, USBSTS 0x%x, Reinit\n", temp);
>
> I don't think the block skipped is important in resume duration (to be
> confirmed). But the xhci_warn() is not desired: we do not want to log
> warnings if we know it is expected.
>
> I'll think some more about it.

About this series, there were two discussions:

 - The desire to avoid putting the hardware init sequence of cdns3-ti
   inside  runtime_resume() as we don't do runtime PM.
   *That is fine and will be fixed for the next revision.*
   See [PATCH V6 2/5]: https://lore.kernel.org/lkml/8a1ed4be-c41c-46b6-ae25=
-33a6035b8c8d@kernel.org/

 - [PATCH V6 4/5] and [PATCH V6 5/5] are dedicated to avoiding a warning
   at XHCI resume on J7200:

      xhci_warn(xhci, "xHC error in resume, USBSTS 0x%x, Reinit\n", temp);

   https://lore.kernel.org/lkml/20241210-s2r-cdns-v6-4-28a17f9715a2@bootlin=
.com/
   https://lore.kernel.org/lkml/20241210-s2r-cdns-v6-5-28a17f9715a2@bootlin=
.com/

   Roger Quadros asked if we should not instead keep it, as there is
   indeed a reinit of the xHC block. I don't think we do: we don't want
   a warning at resume; IMO it would imply the reinit was unexpected.

   Proof is there is already a platform with a ->broken_suspend boolean
   that disables the warning even though there is a reinit. It doesn't
   log a warning as the reinit was expected.

   So we currently have:
    - xhci->broken_suspend: set at probe & implies the resume sequence
      won't work.
    - xhci->quirks & XHCI_RESET_ON_RESUME: set at probe & implies the
      controller reset during suspend.

   IIUC xhci->broken_suspend is NOT equivalent to "the controller reset
   during suspend". Else we wouldn't have both the broken_suspend flag
   and the XHCI_RESET_ON_RESUME quirk.

   In our case we want exactly the same thing as the
   XHCI_RESET_ON_RESUME quirk but updated at resume depending on what
   the wrapper driver detects.

   We could either:
   1. Update xhci->quirks at resume from upper layers.
   2. Introduce a xhci->lost_power flag. It would be strictly equivalent
      to the XHCI_RESET_ON_RESUME quirk BUT updated at resume from
      upper layers.

   @Mathias Nyman: what is your thought on the matter? Option (2) was
   the one taken in this series. Is there another option I am missing?

Thanks,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


