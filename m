Return-Path: <linux-usb+bounces-38083-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eCEnOjOaFmq1ngcAu9opvQ
	(envelope-from <linux-usb+bounces-38083-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 27 May 2026 09:16:03 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C295E04F6
	for <lists+linux-usb@lfdr.de>; Wed, 27 May 2026 09:16:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ABA1C301F193
	for <lists+linux-usb@lfdr.de>; Wed, 27 May 2026 07:14:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAD013B8BD8;
	Wed, 27 May 2026 07:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jYYSQrbt"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1982A2D9797;
	Wed, 27 May 2026 07:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779866090; cv=none; b=jlJQAOqTEiYIHguVUzqCpQ6qaDg4eeOwNZ63UPHLQfu9LwH8RDvIvfddFz76vN+V9D6HHhoZRTrv/H8Q2TWlnuFY780dzZNF6TvRfKAVyktaZghF+VYV9UVNbv7Dw+BIE50z550uUphXXCbu6+93DJilbkFuhEDWA0XkJVNaJSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779866090; c=relaxed/simple;
	bh=2wvkYd3Clc8cW4WV7vZE5aTThz5zjywS+Nb7NDLL+YU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BYxPcaaWmKii5LkM1aFOfds1Ft5i4RWs0epam7LQvZCD52otPx0lYjyHnyQDvjWVDbSc9OOPSBj14JXUiStvhgyfnNWTHZFNsptFIPMkKZOkwIWApE4Jo1q5kd0I5+nmG5OyBtixVueyPSaxn3zbAhwfFnOZ5MzZumEbwFp1MY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jYYSQrbt; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779866089; x=1811402089;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2wvkYd3Clc8cW4WV7vZE5aTThz5zjywS+Nb7NDLL+YU=;
  b=jYYSQrbtvaR1Rl+91K7YlM8FqsgnANaB99VmVTIwW22Avm1vabKtMm3C
   QOnEr8/XitHCn/0Ffyi4JmcMoUat/jEKVtOSDJmgPU98vCssb9IdNGXpj
   1+tLW+2UgX8vSyQsfyE1ZejgKCp0vvTcdI/y1QbWpvZAoqwwUgGunRA2J
   yOgo4iy7SS0pLe5d4alBbSWG5FMDTi3eEOWECgFke9pBB0uNDHQHQpK1K
   IR5HEQE3D/czO525Jd74vnvGmLyLC3s1F2gOOAasjC0AoGLA6n95h4fRJ
   0yAWRhsU9mc2vhPTXykntBsShLwSYoKpzzyhHTjNmHdE7TCwkAo1zugx/
   A==;
X-CSE-ConnectionGUID: W2jtIHbNR06+JJGcDC/Xiw==
X-CSE-MsgGUID: pTUSZNwWSAuW7Z/fHODdIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="80595100"
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; 
   d="scan'208";a="80595100"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 00:14:48 -0700
X-CSE-ConnectionGUID: 9NeJ3CpMTj2LMEdS7ell+w==
X-CSE-MsgGUID: RaXE4L5ZSrW/3v2Jvp1D9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; 
   d="scan'208";a="272486683"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa002.jf.intel.com with ESMTP; 27 May 2026 00:14:47 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id D8C8195; Wed, 27 May 2026 09:14:45 +0200 (CEST)
Date: Wed, 27 May 2026 09:14:45 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: ChunAn Wu <an.wu@canonical.com>
Cc: andreas.noever@gmail.com, michael.jamet@intel.com,
	YehezkelShB@gmail.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] thunderbolt: Defer DP tunnel teardown until display
 driver is ready
Message-ID: <20260527071445.GB3102@black.igk.intel.com>
References: <20260527064121.173952-1-an.wu@canonical.com>
 <20260527064121.173952-2-an.wu@canonical.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260527064121.173952-2-an.wu@canonical.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,intel.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-38083-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mika.westerberg@linux.intel.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,canonical.com:email,intel.com:dkim]
X-Rspamd-Queue-Id: 23C295E04F6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On Wed, May 27, 2026 at 02:41:21PM +0800, ChunAn Wu wrote:
> When the Thunderbolt driver loads early (e.g., from initramfs)
> and discovers a BIOS-established DisplayPort tunnel, it starts
> asynchronous DPRX polling which checks if the GPU driver has
> read DPCD from the connected monitor within a 12-second timeout
> (TB_DPRX_TIMEOUT).
> 
> On systems with Full Disk Encryption (FDE/LUKS), the GPU driver
> (i915, xe, amdgpu, etc.) resides on the encrypted root filesystem
> and cannot load until the user enters the passphrase. This creates
> a driver load ordering issue where the DPRX timeout fires before
> the GPU driver has had a chance to initialize, causing the
> Thunderbolt driver to permanently tear down the DP tunnel and
> remove the DP IN adapter from available resources. Recovery
> requires a physical re-plug of the dock.
> 
> Fix this by deferring the DP tunnel teardown when no PCI display
> driver has bound yet. Register a PCI bus notifier that watches
> for display class (PCI_BASE_CLASS_DISPLAY) driver bind events.
> When the DPRX timeout fires:
> 
>  - If no display driver is bound: tear down the tunnel but keep
>    the DP IN adapter in the available resources list, allowing
>    a retry.
>  - If a display driver is already bound: proceed with the
>    existing behavior of permanently removing the DP IN resource.
> 
> When a display driver eventually binds, the notifier triggers a
> DP tunnel retry via a scheduled work item, re-establishing the
> connection.
> 
> This approach requires no changes to GPU drivers and handles all
> GPU vendors (Intel, AMD, NVIDIA) through the generic PCI base
> class check (0x03xx covers VGA, XGA, 3D, and other display
> controllers). It also handles the FDE case gracefully since the
> defer and retry can span an unbounded passphrase wait.
> 
> Tested on Dell Pro Max 14 MC14250 with Dell SD25TB5 Thunderbolt
> 5 Dock and LUKS full disk encryption. Simulated a 58-second
> delay between TB and GPU driver loading -- display came up
> successfully after display driver bound.
> 
> Signed-off-by: ChunAn Wu <an.wu@canonical.com>
> ---
>  drivers/thunderbolt/tb.c | 96 ++++++++++++++++++++++++++++++++++++----
>  1 file changed, 88 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
> index 95d84612e06e..48e0b540fbec 100644
> --- a/drivers/thunderbolt/tb.c
> +++ b/drivers/thunderbolt/tb.c
> @@ -62,6 +62,9 @@ MODULE_PARM_DESC(asym_threshold,
>   * @remove_work: Work used to remove any unplugged routers after
>   *		 runtime resume
>   * @groups: Bandwidth groups used in this domain.
> + * @pci_nb: PCI bus notifier to detect when a display driver binds
> + * @display_bound: Set when a PCI display driver has bound
> + * @display_retry_work: Work to retry DP tunneling after display driver binds
>   */
>  struct tb_cm {
>  	struct list_head tunnel_list;
> @@ -69,6 +72,9 @@ struct tb_cm {
>  	bool hotplug_active;
>  	struct delayed_work remove_work;
>  	struct tb_bandwidth_group groups[MAX_GROUPS];
> +	struct notifier_block pci_nb;
> +	bool display_bound;
> +	struct work_struct display_retry_work;
>  };
>  
>  static inline struct tb *tcm_to_tb(struct tb_cm *tcm)
> @@ -1914,6 +1920,58 @@ static struct tb_port *tb_find_dp_out(struct tb *tb, struct tb_port *in)
>  	return NULL;
>  }
>  
> +static void tb_tunnel_dp(struct tb *tb);
> +
> +/*
> + * Check if any PCI display class (0x03xx) device has a driver bound.
> + * Used to decide whether to defer DPRX polling at boot.
> + */
> +static bool tb_is_display_driver_bound(void)
> +{
> +	struct pci_dev *pdev = NULL;
> +
> +	while ((pdev = pci_get_base_class(PCI_BASE_CLASS_DISPLAY, pdev))) {

There is no way we are going to call PCI functions from the core of the CM.
We are actually going to the opposite direction to be able to support
non-PCIe hosts.

Why not put the TB driver as part of the encrypted volume as well if the
graphics driver is there? Or put the graphics drivers part of the
initramfs?

