Return-Path: <linux-usb+bounces-18392-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D11689ECB92
	for <lists+linux-usb@lfdr.de>; Wed, 11 Dec 2024 12:51:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D0C861637A0
	for <lists+linux-usb@lfdr.de>; Wed, 11 Dec 2024 11:51:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ACFC211A37;
	Wed, 11 Dec 2024 11:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="0cHN60wz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF724211A0E
	for <linux-usb@vger.kernel.org>; Wed, 11 Dec 2024 11:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733917871; cv=none; b=OgNfSuEtZJEpgUJSIbZbJndtNm5gBqAO/JHsE1iqzteJ4YAnu/S33qzY15eS5mCwCv8SBrlNtA/lFiaVEpzd4ylc9h0+15qiE4cu1u4D5AMUzbGFUVxp95bIU6VwqNNeav5/w6WY/CtLjVAhbxi8STIppzeONi3f/Zfq5sz4BwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733917871; c=relaxed/simple;
	bh=JfSAZV8nHR7plBqhAcM3ssz1fJ5m7AvASguGF56Ca+8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rd9Pa8TxU3aUSHzupmkwKlS7VZ62dAb9hjfKwv2Gyw3JX/zY4mkm2luY/QR6QujpI+Xi+UnO2e2qdkTEIhONypfZ4yJUAF5FQTju7Ym6ETenB4e5tpwDAQUT+lSWaJvUXJHNcDeNVmJzFOD3rzoDe1V8c9ddpO5c6sjGhldlFFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=0cHN60wz; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Received: from gaggiata.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id BA73B1FB2E;
	Wed, 11 Dec 2024 12:51:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1733917866;
	bh=hQspnATgpoCR69ojpggcdOmMaSmUW/pX/983LFLSYiA=;
	h=Received:From:To:Subject;
	b=0cHN60wzef/opGNij18/2TU1VDwE80xdaREvdMjRO1MevBXTj2yUWLw0DnzdEuBht
	 fvMMPu31LBVDRBoJSOEvV21yBnD+/LMKAedVAk+Q1sVGY0Hsl1IKylVSQ/E6QuloK+
	 KnPW6Lbn5Zb6c8MCRb2cpGd+vWDMxlTAiIYdfSQzAQfQaPGT9oi7dgggxopOi91YTU
	 HJQd6OPPcNsQr08lNjpvTaYP/supSBVASX22fNFgNq1A4cisVj0pllMlsgw6pcWyJV
	 6MUjD2S2CblvmeDalqbS3v9rRQBQ79YqdiUkIZERuYxLM40Cs6nrO5GR9PnBWokm5w
	 M0E4tcMhET8og==
Received: by gaggiata.pivistrello.it (Postfix, from userid 1000)
	id 620807F96B; Wed, 11 Dec 2024 12:51:06 +0100 (CET)
Date: Wed, 11 Dec 2024 12:51:06 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
	andre.draszik@linaro.org, rdbabiera@google.com,
	m.felsch@pengutronix.de, dan.carpenter@linaro.org,
	emanuele.ghidoli@toradex.com, parth.pancholi@toradex.com,
	francesco.dolcini@toradex.com, linux-usb@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH] usb: typec: tcpci: fix NULL pointer issue on shared irq
 case
Message-ID: <Z1l8qiIu-169Gyxj@gaggiata.pivistrello.it>
References: <20241211105953.1205343-1-xu.yang_2@nxp.com>
 <20241211110928.GA25492@francesco-nb>
 <20241211114006.ebrut7rvmixznc22@hippo>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241211114006.ebrut7rvmixznc22@hippo>

On Wed, Dec 11, 2024 at 07:40:51PM +0800, Xu Yang wrote:
> On Wed, Dec 11, 2024 at 12:09:28PM +0100, Francesco Dolcini wrote:
> > Hello,
> > 
> > On Wed, Dec 11, 2024 at 06:59:53PM +0800, Xu Yang wrote:
> > > The tcpci_irq() may meet below NULL pointer dereference issue:
> > > 
> > > [    2.641851] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000010
> > > [    2.641951] status 0x1, 0x37f
> > > [    2.650659] Mem abort info:
> > > [    2.656490]   ESR = 0x0000000096000004
> > > [    2.660230]   EC = 0x25: DABT (current EL), IL = 32 bits
> > > [    2.665532]   SET = 0, FnV = 0
> > > [    2.668579]   EA = 0, S1PTW = 0
> > > [    2.671715]   FSC = 0x04: level 0 translation fault
> > > [    2.676584] Data abort info:
> > > [    2.679459]   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
> > > [    2.684936]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
> > > [    2.689980]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
> > > [    2.695284] [0000000000000010] user address but active_mm is swapper
> > > [    2.701632] Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
> > > [    2.707883] Modules linked in:
> > > [    2.710936] CPU: 1 UID: 0 PID: 87 Comm: irq/111-2-0051 Not tainted 6.12.0-rc6-06316-g7f63786ad3d1-dirty #4
> > > [    2.720570] Hardware name: NXP i.MX93 11X11 EVK board (DT)
> > > [    2.726040] pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> > > [    2.732989] pc : tcpci_irq+0x38/0x318
> > > [    2.736647] lr : _tcpci_irq+0x14/0x20
> > > [    2.740295] sp : ffff80008324bd30
> > > [    2.743597] x29: ffff80008324bd70 x28: ffff800080107894 x27: ffff800082198f70
> > > [    2.750721] x26: ffff0000050e6680 x25: ffff000004d172ac x24: ffff0000050f0000
> > > [    2.757845] x23: ffff000004d17200 x22: 0000000000000001 x21: ffff0000050f0000
> > > [    2.764969] x20: ffff000004d17200 x19: 0000000000000000 x18: 0000000000000001
> > > [    2.772093] x17: 0000000000000000 x16: ffff80008183d8a0 x15: ffff00007fbab040
> > > [    2.779217] x14: ffff00007fb918c0 x13: 0000000000000000 x12: 000000000000017a
> > > [    2.786341] x11: 0000000000000001 x10: 0000000000000a90 x9 : ffff80008324bd00
> > > [    2.793465] x8 : ffff0000050f0af0 x7 : ffff00007fbaa840 x6 : 0000000000000031
> > > [    2.800589] x5 : 000000000000017a x4 : 0000000000000002 x3 : 0000000000000002
> > > [    2.807713] x2 : ffff80008324bd3a x1 : 0000000000000010 x0 : 0000000000000000
> > > [    2.814838] Call trace:
> > > [    2.817273]  tcpci_irq+0x38/0x318
> > > [    2.820583]  _tcpci_irq+0x14/0x20
> > > [    2.823885]  irq_thread_fn+0x2c/0xa8
> > > [    2.827456]  irq_thread+0x16c/0x2f4
> > > [    2.830940]  kthread+0x110/0x114
> > > [    2.834164]  ret_from_fork+0x10/0x20
> > > [    2.837738] Code: f9426420 f9001fe0 d2800000 52800201 (f9400a60)
> > > 
> > > This may happen on shared irq case. Such as two Type-C ports share one
> > > irq. After the first port finished tcpci_register_port(), it may trigger
> > > interrupt. However, if the interrupt comes by chance the 2nd port finishes
> > > devm_request_threaded_irq(), the 2nd port interrupt handler may be run at
> > > first. Then the above issue may happen.
> > > 
> > >   devm_request_threaded_irq()
> > > 				<-- port1 irq comes
> > >   disable_irq(client->irq);
> > >   tcpci_register_port()
> > > 
> > > This will restore the logic to the state before commit (77e85107a771 "usb:
> > > typec: tcpci: support edge irq").
> > > 
> > > Fixes: 77e85107a771 ("usb: typec: tcpci: support edge irq")
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > > ---
> > >  drivers/usb/typec/tcpm/tcpci.c | 18 ++++++++----------
> > >  1 file changed, 8 insertions(+), 10 deletions(-)
> > > 
> > > diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
> > > index 2f15734a5043..db42f4bf3632 100644
> > > --- a/drivers/usb/typec/tcpm/tcpci.c
> > > +++ b/drivers/usb/typec/tcpm/tcpci.c
> > > @@ -923,22 +923,20 @@ static int tcpci_probe(struct i2c_client *client)
> > >  
> > >  	chip->data.set_orientation = err;
> > >  
> > > +	chip->tcpci = tcpci_register_port(&client->dev, &chip->data);
> > > +	if (IS_ERR(chip->tcpci))
> > > +		return PTR_ERR(chip->tcpci);
> > > +
> > >  	err = devm_request_threaded_irq(&client->dev, client->irq, NULL,
> > >  					_tcpci_irq,
> > >  					IRQF_SHARED | IRQF_ONESHOT,
> > >  					dev_name(&client->dev), chip);
> > 
> > I do not think this is the correct fix, what about using
> > IRQF_NO_AUTOEN ? Would it solve the issue? You need to adjust also the
> > disable/enable irq accordingly.
> 
> Not work. Probe failed directly.
> 
> [    2.646391] tcpci 2-0050: probe with driver tcpci failed with error -22
> [    2.680086] tcpci 2-0051: probe with driver tcpci failed with error -22

Ok, clear. The reason is the shared IRQ.

I think your change will break the support for edge IRQ, because we have
interrupt generated calling tcpci_register_port and they will just be lost if
the interrupt is not already requested.

I think a better solution is needed.

Francesco



