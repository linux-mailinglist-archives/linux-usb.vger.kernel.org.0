Return-Path: <linux-usb+bounces-18640-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 662109F6371
	for <lists+linux-usb@lfdr.de>; Wed, 18 Dec 2024 11:38:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 81CD118869BB
	for <lists+linux-usb@lfdr.de>; Wed, 18 Dec 2024 10:38:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8064F1991BB;
	Wed, 18 Dec 2024 10:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="SDRKzOHT"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB27F198E92
	for <linux-usb@vger.kernel.org>; Wed, 18 Dec 2024 10:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734518285; cv=none; b=IKChjUCoDwj1cXBO3XL0U34wHiD/qemkh6jySyS9R32XDwKqG09h11g+dF/K5GnunjgCoheWM86jtbsYZGpFQU9aOP/l+zsLh/W2SfVuQ1i7GMEMK6C5aFwjiPsZd9kj5AhzstElKWimyuzJT6diRx2PUTl1IbYLWFQxbd3oNFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734518285; c=relaxed/simple;
	bh=bYLDD8/8TM76bmYy74XFWSp63b13S4DU4o5bbP/qsUY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y7Ree/FfoxvmxnthHXoiYAY9vjJZP5G++VpgdBgBPXbicRKg6Yk5Zr5qjZvcn0YDmojmTmC1Q3/vc0HeGBVFPWhGrhisPWlbTTuwS5AstodQ5LB8dmzWE6vCgOg8ZlNPVVVQtSwrOI0dwY1p9TNpR2R/oj3K9lIs0gzHIzFvtKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=SDRKzOHT; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 82C801FCF7;
	Wed, 18 Dec 2024 11:37:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1734518273;
	bh=w1v0QHKNQOz/R/miGVNt6KYUwMYCc0ptPv/vzKqwCq0=; h=From:To:Subject;
	b=SDRKzOHT/1TjkV5y/uanoyFxmfPB9kdqyxQr2r2kslxgv6kPjP1ZTmq64KyhQHiNB
	 kiN3S6y3/7Odz6/e7n/jaiShZxhnZD+WgDbQLOw24wDanyd68DKtJfinbfK0QRm5y/
	 EukjeJoWGfMarfmaiwOm5l5lDr9HrxWqUe48b0eN+wtsgc7KiVW8h7nDet26oLYGyC
	 J8PNYqBNOBrIZspL2tEO9AqViPS3K45ARiRNW45usKwlBw23KSAR5/O9Qv/zG6GsXJ
	 UI1dpM2SFo0dt97lQv5o5XK7tpuOVz2hO2PnIa4YMxaG/kU19moRSRdEE6PkT6LTh2
	 60wXEfp/T4m7Q==
Date: Wed, 18 Dec 2024 11:37:47 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
	andre.draszik@linaro.org, rdbabiera@google.com,
	m.felsch@pengutronix.de, dan.carpenter@linaro.org,
	emanuele.ghidoli@toradex.com, parth.pancholi@toradex.com,
	francesco.dolcini@toradex.com, u.kleine-koenig@baylibre.com,
	linux-usb@vger.kernel.org, imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v4] usb: typec: tcpci: fix NULL pointer issue on shared
 irq case
Message-ID: <20241218103747.GA4500@francesco-nb>
References: <20241218095328.2604607-1-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241218095328.2604607-1-xu.yang_2@nxp.com>

On Wed, Dec 18, 2024 at 05:53:28PM +0800, Xu Yang wrote:
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
> devm_request_threaded_irq(), the 2nd port interrupt handler will run at
> first. Then the above issue happens due to tcpci is still a NULL pointer
> in tcpci_irq() when dereference to regmap.
> 
>   devm_request_threaded_irq()
> 				<-- port1 irq comes
>   disable_irq(client->irq);
>   tcpci_register_port()
> 
> This will restore the logic to the state before commit (77e85107a771 "usb:
> typec: tcpci: support edge irq").
> 
> However, moving tcpci_register_port() earlier creates a problem when use
> edge irq because tcpci_init() will be called before
> devm_request_threaded_irq(). The tcpci_init() writes the ALERT_MASK to
> the hardware to tell it to start generating interrupts but we're not ready
> to deal with them yet, then the ALERT events may be missed and ALERT line
> will not recover to high level forever. To avoid the issue, this will also
> set ALERT_MASK register after devm_request_threaded_irq() return.
> 
> Fixes: 77e85107a771 ("usb: typec: tcpci: support edge irq")
> Cc: stable@vger.kernel.org
> Tested-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Reviewed-by: Francesco Dolcini <francesco.dolcini@toradex.com>



