Return-Path: <linux-usb+bounces-18643-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 62AFF9F655C
	for <lists+linux-usb@lfdr.de>; Wed, 18 Dec 2024 12:53:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BF0E016CB2B
	for <lists+linux-usb@lfdr.de>; Wed, 18 Dec 2024 11:53:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80E2219FA92;
	Wed, 18 Dec 2024 11:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cWYgFrQ3"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D981946C7
	for <linux-usb@vger.kernel.org>; Wed, 18 Dec 2024 11:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734522770; cv=none; b=h4liltrMaWvdYA9XJFlmElMY2UUAGSaAFizXRBxeZYs6zWOuMwV/rJXTn/w2xG6olpcPXYgIERUgwC3zK46WUaYvClWT6cnDvbuCLPbqg/MKb/4/ssMfRTo06TsbuXhQ3a8HwX2lPmcV7+Bwgd+9P/zCK4L/cSYaVDdmG3WxnBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734522770; c=relaxed/simple;
	bh=k7zJD6tvKOhJ5u/ZV0oN3BE14o4iPW3mvVFm4FJ2PuY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XI1reRiZTamjgPyhRSb+De+aQcyAMB1iplxuDXsS1hw6r6O5IsTr5N/aBebwgu6ybpJuQqwrH4ISlPiewurfkJauILs6YNLNUZ5njuMp46Vz5OTmvdhuchE3C7d9sLM1grwVoReOeSTqj1dr3awU6uXh9VcEwl/ld6+6ZxpUGtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cWYgFrQ3; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734522768; x=1766058768;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=k7zJD6tvKOhJ5u/ZV0oN3BE14o4iPW3mvVFm4FJ2PuY=;
  b=cWYgFrQ3HZxmfH0wvcO2MUhWYOMMtX82FIk2VuzAmFRTJQySKvWu3ZDv
   TB3MB3Q9yh0qHxqwWCgX7QnKgAWwrR/cXgy/64pWzOFUVJQ3bVlb2zcQ+
   xkdJD64yn4ybw9R2+xokA2ONobEj+ZShR29A+i0myIUy7rlOMV4Q/ICyR
   UIG3S1llRMREJISAqstC885WVi4IHxu3gSbSTwelojvSUS8VseOvDTqH1
   9JRpJZsK+WXMdVbl2qXGXfQRv6ao+9xcUvpUfItWwDXhhNalRiKvU49xM
   pnz7deOs/a+9EzZzEdbFR+XCfdHSeG4nnV2gybdwOREK0gDMuRPUI6yNh
   A==;
X-CSE-ConnectionGUID: dAlUKFeNQlua665vLSBiyA==
X-CSE-MsgGUID: Yd48piKLS76MyjX9h/BOeA==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="35025994"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; 
   d="scan'208";a="35025994"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2024 03:52:47 -0800
X-CSE-ConnectionGUID: Dp2czX6TT2+nlZjVdslyhw==
X-CSE-MsgGUID: DzR3am8LTKKZDqOKL9z6Cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="101977020"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by fmviesa003.fm.intel.com with SMTP; 18 Dec 2024 03:52:43 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 18 Dec 2024 13:52:42 +0200
Date: Wed, 18 Dec 2024 13:52:42 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: gregkh@linuxfoundation.org, andre.draszik@linaro.org,
	rdbabiera@google.com, m.felsch@pengutronix.de,
	dan.carpenter@linaro.org, emanuele.ghidoli@toradex.com,
	parth.pancholi@toradex.com, francesco.dolcini@toradex.com,
	u.kleine-koenig@baylibre.com, linux-usb@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v4] usb: typec: tcpci: fix NULL pointer issue on shared
 irq case
Message-ID: <Z2K3ilIMDaN306JM@kuha.fi.intel.com>
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

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
> Changes in v4:
>  - squash two patches to one
>  - rewrite commit message
>  - add Tested-by
> Changes in v3:
>  - no changes
> Changes in v2:
>  - no changes
> ---
>  drivers/usb/typec/tcpm/tcpci.c | 25 +++++++++++++++----------
>  1 file changed, 15 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
> index 2f15734a5043..48762508cc86 100644
> --- a/drivers/usb/typec/tcpm/tcpci.c
> +++ b/drivers/usb/typec/tcpm/tcpci.c
> @@ -700,7 +700,7 @@ static int tcpci_init(struct tcpc_dev *tcpc)
>  
>  	tcpci->alert_mask = reg;
>  
> -	return tcpci_write16(tcpci, TCPC_ALERT_MASK, reg);
> +	return 0;
>  }
>  
>  irqreturn_t tcpci_irq(struct tcpci *tcpci)
> @@ -923,22 +923,27 @@ static int tcpci_probe(struct i2c_client *client)
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
>  	if (err < 0)
> -		return err;
> +		goto unregister_port;
>  
> -	/*
> -	 * Disable irq while registering port. If irq is configured as an edge
> -	 * irq this allow to keep track and process the irq as soon as it is enabled.
> -	 */
> -	disable_irq(client->irq);
> -	chip->tcpci = tcpci_register_port(&client->dev, &chip->data);
> -	enable_irq(client->irq);
> +	/* Enable chip interrupts at last */
> +	err = tcpci_write16(chip->tcpci, TCPC_ALERT_MASK, chip->tcpci->alert_mask);
> +	if (err < 0)
> +		goto unregister_port;
>  
> -	return PTR_ERR_OR_ZERO(chip->tcpci);
> +	return 0;
> +
> +unregister_port:
> +	tcpci_unregister_port(chip->tcpci);
> +	return err;
>  }
>  
>  static void tcpci_remove(struct i2c_client *client)
> -- 
> 2.34.1

-- 
heikki

