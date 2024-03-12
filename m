Return-Path: <linux-usb+bounces-7876-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C78BA8791EA
	for <lists+linux-usb@lfdr.de>; Tue, 12 Mar 2024 11:25:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 578422831A2
	for <lists+linux-usb@lfdr.de>; Tue, 12 Mar 2024 10:25:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93A2479954;
	Tue, 12 Mar 2024 10:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZXrQ/mup"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F8C79DCA
	for <linux-usb@vger.kernel.org>; Tue, 12 Mar 2024 10:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710239048; cv=none; b=EqgpUZ1vPvMtUZSQir7+/okwKkQT0e3mhPBASgUpTTd0MCp+/eKViqBPCulr7RzGq7UDnFE5FNzYU2Hsd/qJucikbnC+sKGsWXsJ288Bu7m4BT456JEceHN2SAEBk5XJaY8sbAExk6eiUBaXPXBxSO36z2l5Uls4zwBxdflCH9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710239048; c=relaxed/simple;
	bh=L+emXpy4E1cPrVtT+/AhGt41NFT89QhDf4iYygXx3GU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fYRhPZNZIvKCBA/eCBu14E4jHQRQwV3wSB5HCLdcf1LfACpH/sWZHXIBnkj0knU0ZIPm2a/5IHRIY527PwuW+D5j9e3DekbYTE9/9KAWWIkOQkZbKsfnl64FZUZ2eFtp7ayA4ly2rnGuHVOGCdE05GcsoQV8tCZWoC2cFww+hkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZXrQ/mup; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710239046; x=1741775046;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=L+emXpy4E1cPrVtT+/AhGt41NFT89QhDf4iYygXx3GU=;
  b=ZXrQ/mupWGzn9BV1TMH4jKKWGkA0KcycKXwTM2vU0vPysFSGS6s501YQ
   yYvNufdHDDDWGfjpixUXwlTXJ+80+OS6xmvlrTgvTqcoZ4FWbOon8XSct
   H2LE/nnLaR1w5gdUleC1abVPZw+czMcrlvTJ2NEaqeEsYIH6UIc5Y9J/R
   Xek/uS52/Yvq1ScW+glhWK964gQGABiwjSqJxq9bUAqR+UPSxavxRX60R
   62RyxksPgKVPkMs/XLu+REUr0cXpBIt+My40j0/ajr6jAh7l5VoiDO4Zj
   GsGhHZ/eRm4sNSYvArc6SZIHMWmj2favqwqFoMVngYNh4qoRiwnzfs5Cy
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="4795257"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="4795257"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 03:24:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="937051638"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="937051638"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 12 Mar 2024 03:24:01 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 12 Mar 2024 12:24:01 +0200
Date: Tue, 12 Mar 2024 12:24:01 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: gregkh@linuxfoundation.org, linux@roeck-us.net, rdbabiera@google.com,
	badhri@google.com, frank.wang@rock-chips.com, kyletso@google.com,
	zhipeng.wang_1@nxp.com, aisheng.dong@nxp.com, jun.li@nxp.com,
	linux-usb@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH] usb: typec: tcpm: fix double-free issue in
 tcpm_port_unregister_pd()
Message-ID: <ZfAtQVGLIDuBTY+e@kuha.fi.intel.com>
References: <20240311065219.777037-1-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240311065219.777037-1-xu.yang_2@nxp.com>

On Mon, Mar 11, 2024 at 02:52:19PM +0800, Xu Yang wrote:
> When unregister pd capabilitie in tcpm, KASAN will capture below double
> -free issue. The root cause is the same capabilitiy will be kfreed twice,
> the first time is kfreed by pd_capabilities_release() and the second time
> is explicitly kfreed by tcpm_port_unregister_pd().
> 
> [    3.988059] BUG: KASAN: double-free in tcpm_port_unregister_pd+0x1a4/0x3dc
> [    3.995001] Free of addr ffff0008164d3000 by task kworker/u16:0/10
> [    4.001206]
> [    4.002712] CPU: 2 PID: 10 Comm: kworker/u16:0 Not tainted 6.8.0-rc5-next-20240220-05616-g52728c567a55 #53
> [    4.012402] Hardware name: Freescale i.MX8QXP MEK (DT)
> [    4.017569] Workqueue: events_unbound deferred_probe_work_func
> [    4.023456] Call trace:
> [    4.025920]  dump_backtrace+0x94/0xec
> [    4.029629]  show_stack+0x18/0x24
> [    4.032974]  dump_stack_lvl+0x78/0x90
> [    4.036675]  print_report+0xfc/0x5c0
> [    4.040289]  kasan_report_invalid_free+0xa0/0xc0
> [    4.044937]  __kasan_slab_free+0x124/0x154
> [    4.049072]  kfree+0xb4/0x1e8
> [    4.052069]  tcpm_port_unregister_pd+0x1a4/0x3dc
> [    4.056725]  tcpm_register_port+0x1dd0/0x2558
> [    4.061121]  tcpci_register_port+0x420/0x71c
> [    4.065430]  tcpci_probe+0x118/0x2e0
> 
> To fix the issue, this will remove kree() from tcpm_port_unregister_pd().
> 
> Fixes: cd099cde4ed2 ("usb: typec: tcpm: Support multiple capabilities")
> cc: <stable@vger.kernel.org>
> Suggested-by: Aisheng Dong <aisheng.dong@nxp.com>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/tcpm/tcpm.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index 3d505614bff1..afbb0d832db2 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -6940,9 +6940,7 @@ static void tcpm_port_unregister_pd(struct tcpm_port *port)
>  	port->port_source_caps = NULL;
>  	for (i = 0; i < port->pd_count; i++) {
>  		usb_power_delivery_unregister_capabilities(port->pd_list[i]->sink_cap);
> -		kfree(port->pd_list[i]->sink_cap);
>  		usb_power_delivery_unregister_capabilities(port->pd_list[i]->source_cap);
> -		kfree(port->pd_list[i]->source_cap);
>  		devm_kfree(port->dev, port->pd_list[i]);
>  		port->pd_list[i] = NULL;
>  		usb_power_delivery_unregister(port->pds[i]);
> -- 
> 2.34.1

-- 
heikki

