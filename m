Return-Path: <linux-usb+bounces-29558-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 56794BFF493
	for <lists+linux-usb@lfdr.de>; Thu, 23 Oct 2025 07:56:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D6A2C3A87FE
	for <lists+linux-usb@lfdr.de>; Thu, 23 Oct 2025 05:56:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D81323AE9A;
	Thu, 23 Oct 2025 05:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mrpDi2UR"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 804EF225A38
	for <linux-usb@vger.kernel.org>; Thu, 23 Oct 2025 05:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761198969; cv=none; b=ST4OhzVW+hqBw1r0PK0kqdSbZUadN902BD37wkJCK84XJ4r+PkPxoFNaJBPulWedZIfclyOo3oOyAZNqapT0j/3EIgaRnyD/2VUUxH6Zodst45WAV+8dGwqM/3ayiSTzFGXtoSUaEgbpyeAG6esPMjpOVszLQdSy0eL4PdKwl1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761198969; c=relaxed/simple;
	bh=2NciNRBPHwrcPDZfXdYsljfgXqM0+rIFJLT8ZAejd14=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ey6SdM/fsVplH36IS6TWWi5fqN1fz0z1qZlKm16dtTarOlDJgWz0j7qLF6VkhV21FnkqtUhXaGt8cclfHCASpSEDFSTcoNd97Ig46DR86urwwZfuBfZrlGfymGy5zja0LNclEvGTXZZZR62dthSpfrm2dNyQonvOj03tZGgmUxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mrpDi2UR; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761198967; x=1792734967;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2NciNRBPHwrcPDZfXdYsljfgXqM0+rIFJLT8ZAejd14=;
  b=mrpDi2URjzeAOJb3UhTXtg4xrBDeTQjf5nNf7L0HZur82U3A2A2hWELi
   dK9HoDuYk87Cp/F8VRWAAwzTMkhfPnEergYptL4+siIqHZWLkbwot2QP/
   ZvWoI/GL8N5jg6IW5MEBmDN+AUjE5YCy71saFr9YyXkSDxFWdzKvvemNA
   IU6e+FvETv3B+H2SBfPJ9aYtJWi+s7og8C4Cvejj/ljV4Jw3DT4wXdstW
   ENcD5GizE7Lvxig+SgD6M/LlVQmrrUSacYiS+iVZscETVG85GbeGp4S4u
   lw0xfYWyH8F2njErBmf6dbn1JPBYEMKboV0mfBaFfqnuwVGLd1RfqfBfy
   g==;
X-CSE-ConnectionGUID: F+6q8GOOQT24fA7xn77bog==
X-CSE-MsgGUID: +aQXpFbURwmJ7kUgGrZHfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63505935"
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; 
   d="scan'208";a="63505935"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 22:56:06 -0700
X-CSE-ConnectionGUID: OYwB4hYyTpaqP8zQnV6MBw==
X-CSE-MsgGUID: r6SsDe6OTUiTUQgzDGLVEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; 
   d="scan'208";a="183999374"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa006.fm.intel.com with ESMTP; 22 Oct 2025 22:56:04 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 6F4E895; Thu, 23 Oct 2025 07:56:03 +0200 (CEST)
Date: Thu, 23 Oct 2025 07:56:03 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: "Mario Limonciello (AMD)" <superm1@kernel.org>
Cc: mario.limonciello@amd.com, andreas.noever@gmail.com, westeri@kernel.org,
	YehezkelShB@gmail.com, Sanath.S@amd.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH] thunderbolt: Reset NHI during S4 restore_noirq() callback
Message-ID: <20251023055603.GU2912318@black.igk.intel.com>
References: <20251023050354.115015-1-superm1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251023050354.115015-1-superm1@kernel.org>

Hi,

On Thu, Oct 23, 2025 at 12:03:26AM -0500, Mario Limonciello (AMD) wrote:
> When a machine is restored from S4 if the firmware CM has created
> tunnels there can be an incongruity of expectation from the kernel
> when compared to booting from S5.
> 
> For example this incongruity can lead to problems like the display
> not working properly if the firmware CM didn't turn it on pre-OS
> but the OS had it on before entering S4.
> 
> Add an extra restore_noirq() callback to explicitly reset the NHI
> before running the rest of the resume sequence.  This will allow
> the standard discovery and probing routines to run and create the
> tunnels as expected.
> 
> Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
> ---
> Cc: Sanath.S@amd.com
> ---
>  drivers/thunderbolt/nhi.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
> index 5f63f9b9cf405..042d184637a93 100644
> --- a/drivers/thunderbolt/nhi.c
> +++ b/drivers/thunderbolt/nhi.c
> @@ -51,6 +51,8 @@ static bool host_reset = true;
>  module_param(host_reset, bool, 0444);
>  MODULE_PARM_DESC(host_reset, "reset USB4 host router (default: true)");
>  
> +static void nhi_reset(struct tb_nhi *nhi);

Please move the whole function above nhi_restore_noirq() then.

> +
>  static int ring_interrupt_index(const struct tb_ring *ring)
>  {
>  	int bit = ring->hop;
> @@ -1077,6 +1079,17 @@ static int nhi_resume_noirq(struct device *dev)
>  	return tb_domain_resume_noirq(tb);
>  }
>  
> +static int nhi_restore_noirq(struct device *dev)
> +{
> +	struct pci_dev *pdev = to_pci_dev(dev);
> +	struct tb *tb = pci_get_drvdata(pdev);
> +	struct tb_nhi *nhi = tb->nhi;
> +
> +	nhi_reset(nhi);
> +

Now that we do this, should ge get rid of the S4 things we do in
tb_resume_noirq()? Especially this block:

	/*
	 * If we get here from suspend to disk the boot firmware or the
	 * restore kernel might have created tunnels of its own. Since
	 * we cannot be sure they are usable for us we find and tear
	 * them down.
	 */
	tb_switch_discover_tunnels(tb->root_switch, &tunnels, false);
	list_for_each_entry_safe_reverse(tunnel, n, &tunnels, list) {
		if (tb_tunnel_is_usb3(tunnel))
			usb3_delay = 500;
		tb_tunnel_deactivate(tunnel);
		tb_tunnel_put(tunnel);
	}

Also have you checked that this works when you have tunnels such as P2P
(networking)?

> +	return nhi_resume_noirq(dev);
> +}
> +
>  static int nhi_suspend(struct device *dev)
>  {
>  	struct pci_dev *pdev = to_pci_dev(dev);
> @@ -1449,7 +1462,7 @@ static const struct dev_pm_ops nhi_pm_ops = {
>  					    * pci-tunnels stay alive.
>  					    */
>  	.thaw_noirq = nhi_thaw_noirq,
> -	.restore_noirq = nhi_resume_noirq,
> +	.restore_noirq = nhi_restore_noirq,
>  	.suspend = nhi_suspend,
>  	.poweroff_noirq = nhi_poweroff_noirq,
>  	.poweroff = nhi_suspend,
> -- 
> 2.43.0

