Return-Path: <linux-usb+bounces-18390-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D149ECADD
	for <lists+linux-usb@lfdr.de>; Wed, 11 Dec 2024 12:10:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B22971889D20
	for <lists+linux-usb@lfdr.de>; Wed, 11 Dec 2024 11:09:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5C67211A06;
	Wed, 11 Dec 2024 11:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="aBnrzWPl"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD62208986
	for <linux-usb@vger.kernel.org>; Wed, 11 Dec 2024 11:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733915386; cv=none; b=KErAbHFqRnWu/xAGyWAr+1SjzVSGRyY0Wp3N8FDov/0CBVfdn10G+AL8710gwMhvTuAeYg1eHtbSHgwFlko5IHgtJTTLUrKKl8/tk3o21CvRqcWC8GCNBmVPOm3E4CTJCZtvKlDTq6hFO79+G/2kyc44NHDo0FCstb6XRTT9dsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733915386; c=relaxed/simple;
	bh=5XW1MXMJiyQVejT4LJdoJEB596wJTQRRrH1+iaaZcbs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AMe+ouG8ayZ0H/AcZFAbOhflKJdxdTD2Ldrqfc50GUK8a/AfXt515TVMVaDsBPENDTTvDthgRmVqEIaV19gtsV14lA0AIR4tU7IiClm0WpdqKf5SRTfFiRIfonN/RwPbyTMRY0XXy1pHMIVc8GnVC/WXu7wwUegjqm9WysIu4kA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=aBnrzWPl; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 998DD1F942;
	Wed, 11 Dec 2024 12:09:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1733915373;
	bh=Up1IBkKEKTFr1NEKqMm7curMzYYIKnuuQ1bN5YxAuvk=; h=From:To:Subject;
	b=aBnrzWPl0LSxl9hA62Sv1kkR+JxDmbXsE99C8iwMwwd6Rshf8gL0sDMc7glC+EqZq
	 RK75DahkxipixGgarb+xhThjRViElbPZmcs/8lMEAx7KXTjTwfRjEPyYVDElJ1KqhJ
	 eEik0k/YeiVPZh+JSZaRobe2nvobHQ/4Kfp624GNoE/9E5s/wHW88dR7u8YhSidci2
	 WieiqXaLWGUOay6TrxSdK0PndCS5/2z1pn3kWXOWh3NMdSVsza9UnsUEFnoDgW6v3p
	 zuhjWilyVPrYQZR6apN2JHTM+rIKApThuGdE0c/Z3W1t96ze0jE0X8OwI2CtPWHvnO
	 hCJdVpDsmYKAg==
Date: Wed, 11 Dec 2024 12:09:28 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
	andre.draszik@linaro.org, rdbabiera@google.com,
	m.felsch@pengutronix.de, dan.carpenter@linaro.org,
	emanuele.ghidoli@toradex.com, parth.pancholi@toradex.com,
	francesco.dolcini@toradex.com, linux-usb@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH] usb: typec: tcpci: fix NULL pointer issue on shared irq
 case
Message-ID: <20241211110928.GA25492@francesco-nb>
References: <20241211105953.1205343-1-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241211105953.1205343-1-xu.yang_2@nxp.com>

Hello,

On Wed, Dec 11, 2024 at 06:59:53PM +0800, Xu Yang wrote:
> The tcpci_irq() may meet below NULL pointer dereference issue:
> 
> [    2.641851] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000010
> [    2.641951] status 0x1, 0x37f
> [    2.650659] Mem abort info:
> [    2.656490]   ESR = 0x0000000096000004
> [    2.660230]   EC = 0x25: DABT (current EL), IL = 32 bits
> [    2.665532]   SET = 0, FnV = 0
> [    2.668579]   EA = 0, S1PTW = 0
> [    2.671715]   FSC = 0x04: level 0 translation fault
> [    2.676584] Data abort info:
> [    2.679459]   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
> [    2.684936]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
> [    2.689980]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
> [    2.695284] [0000000000000010] user address but active_mm is swapper
> [    2.701632] Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
> [    2.707883] Modules linked in:
> [    2.710936] CPU: 1 UID: 0 PID: 87 Comm: irq/111-2-0051 Not tainted 6.12.0-rc6-06316-g7f63786ad3d1-dirty #4
> [    2.720570] Hardware name: NXP i.MX93 11X11 EVK board (DT)
> [    2.726040] pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [    2.732989] pc : tcpci_irq+0x38/0x318
> [    2.736647] lr : _tcpci_irq+0x14/0x20
> [    2.740295] sp : ffff80008324bd30
> [    2.743597] x29: ffff80008324bd70 x28: ffff800080107894 x27: ffff800082198f70
> [    2.750721] x26: ffff0000050e6680 x25: ffff000004d172ac x24: ffff0000050f0000
> [    2.757845] x23: ffff000004d17200 x22: 0000000000000001 x21: ffff0000050f0000
> [    2.764969] x20: ffff000004d17200 x19: 0000000000000000 x18: 0000000000000001
> [    2.772093] x17: 0000000000000000 x16: ffff80008183d8a0 x15: ffff00007fbab040
> [    2.779217] x14: ffff00007fb918c0 x13: 0000000000000000 x12: 000000000000017a
> [    2.786341] x11: 0000000000000001 x10: 0000000000000a90 x9 : ffff80008324bd00
> [    2.793465] x8 : ffff0000050f0af0 x7 : ffff00007fbaa840 x6 : 0000000000000031
> [    2.800589] x5 : 000000000000017a x4 : 0000000000000002 x3 : 0000000000000002
> [    2.807713] x2 : ffff80008324bd3a x1 : 0000000000000010 x0 : 0000000000000000
> [    2.814838] Call trace:
> [    2.817273]  tcpci_irq+0x38/0x318
> [    2.820583]  _tcpci_irq+0x14/0x20
> [    2.823885]  irq_thread_fn+0x2c/0xa8
> [    2.827456]  irq_thread+0x16c/0x2f4
> [    2.830940]  kthread+0x110/0x114
> [    2.834164]  ret_from_fork+0x10/0x20
> [    2.837738] Code: f9426420 f9001fe0 d2800000 52800201 (f9400a60)
> 
> This may happen on shared irq case. Such as two Type-C ports share one
> irq. After the first port finished tcpci_register_port(), it may trigger
> interrupt. However, if the interrupt comes by chance the 2nd port finishes
> devm_request_threaded_irq(), the 2nd port interrupt handler may be run at
> first. Then the above issue may happen.
> 
>   devm_request_threaded_irq()
> 				<-- port1 irq comes
>   disable_irq(client->irq);
>   tcpci_register_port()
> 
> This will restore the logic to the state before commit (77e85107a771 "usb:
> typec: tcpci: support edge irq").
> 
> Fixes: 77e85107a771 ("usb: typec: tcpci: support edge irq")
> Cc: stable@vger.kernel.org
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  drivers/usb/typec/tcpm/tcpci.c | 18 ++++++++----------
>  1 file changed, 8 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
> index 2f15734a5043..db42f4bf3632 100644
> --- a/drivers/usb/typec/tcpm/tcpci.c
> +++ b/drivers/usb/typec/tcpm/tcpci.c
> @@ -923,22 +923,20 @@ static int tcpci_probe(struct i2c_client *client)
>  
>  	chip->data.set_orientation = err;
>  
> +	chip->tcpci = tcpci_register_port(&client->dev, &chip->data);
> +	if (IS_ERR(chip->tcpci))
> +		return PTR_ERR(chip->tcpci);
> +
>  	err = devm_request_threaded_irq(&client->dev, client->irq, NULL,
>  					_tcpci_irq,
>  					IRQF_SHARED | IRQF_ONESHOT,
>  					dev_name(&client->dev), chip);

I do not think this is the correct fix, what about using
IRQF_NO_AUTOEN ? Would it solve the issue? You need to adjust also the
disable/enable irq accordingly.

Francesco


