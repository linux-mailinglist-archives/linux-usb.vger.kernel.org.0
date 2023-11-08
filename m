Return-Path: <linux-usb+bounces-2675-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01BFC7E510C
	for <lists+linux-usb@lfdr.de>; Wed,  8 Nov 2023 08:33:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AFF3A28163C
	for <lists+linux-usb@lfdr.de>; Wed,  8 Nov 2023 07:33:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DE79D299;
	Wed,  8 Nov 2023 07:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mmRNkUL8"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B406D28A
	for <linux-usb@vger.kernel.org>; Wed,  8 Nov 2023 07:33:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA9CC12B;
	Tue,  7 Nov 2023 23:33:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699428812; x=1730964812;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xYo4FkY3orhcLQh8jJvOeDqIVSyWwopf5oOTy9TpkEo=;
  b=mmRNkUL8Zwtm10TgrYXeMabu+I9tzfNPanZd6VPxEQqlKA56vZJyAZfV
   K6xvmWAhqug5QbIE4C2deEO2nqNNMuafofq+aYJ60u80KSVxqT+YMpDea
   sZZ2k84z77f8qJg3nO8cEqJAtb8Xadxx70TVzqVVAenZ9mNvIDhZ6BTWH
   cgUm09k46gv6v72GC98yME0x1dQ173sKT5yMrby2zCGKB1UnFTXMHPVnU
   Ocv/tE5yvxDaAhjBdnrYJ9vYmz4VNqb2lQT/T5c758Zhm+ufcKBBTWT1k
   5eZuL2pJc4URPAM/XeHfstt54wKmUFtDcWUgXaFNAaTe7zzg2my3iygWZ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="2649922"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; 
   d="scan'208";a="2649922"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2023 23:33:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="712853254"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; 
   d="scan'208";a="712853254"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by orsmga003.jf.intel.com with SMTP; 07 Nov 2023 23:33:27 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 08 Nov 2023 09:33:26 +0200
Date: Wed, 8 Nov 2023 09:33:26 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Badhri Jagan Sridharan <badhri@google.com>
Cc: gregkh@linuxfoundation.org, linux@roeck-us.net, kyletso@google.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	rdbabiera@google.com, amitsd@google.com, stable@vger.kernel.org
Subject: Re: [PATCH v1] usb: typec: tcpm: Skip hard reset when in error
 recovery
Message-ID: <ZUs5xlX5NUulRunC@kuha.fi.intel.com>
References: <20231101021909.2962679-1-badhri@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231101021909.2962679-1-badhri@google.com>

On Wed, Nov 01, 2023 at 02:19:09AM +0000, Badhri Jagan Sridharan wrote:
> Hard reset queued prior to error recovery (or) received during
> error recovery will make TCPM to prematurely exit error recovery
> sequence. Ignore hard resets received during error recovery (or)
> port reset sequence.
> 
> ```
> [46505.459688] state change SNK_READY -> ERROR_RECOVERY [rev3 NONE_AMS]
> [46505.459706] state change ERROR_RECOVERY -> PORT_RESET [rev3 NONE_AMS]
> [46505.460433] disable vbus discharge ret:0
> [46505.461226] Setting usb_comm capable false
> [46505.467244] Setting voltage/current limit 0 mV 0 mA
> [46505.467262] polarity 0
> [46505.470695] Requesting mux state 0, usb-role 0, orientation 0
> [46505.475621] cc:=0
> [46505.476012] pending state change PORT_RESET -> PORT_RESET_WAIT_OFF @ 100 ms [rev3 NONE_AMS]
> [46505.476020] Received hard reset
> [46505.476024] state change PORT_RESET -> HARD_RESET_START [rev3 HARD_RESET]
> ```
> 
> Cc: stable@vger.kernel.org
> Fixes: f0690a25a140 ("staging: typec: USB Type-C Port Manager (tcpm)")
> Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>

Acked-by: Heikki Krogeus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/tcpm/tcpm.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index 058d5b853b57..b386102f7a3a 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -5391,6 +5391,15 @@ static void _tcpm_pd_hard_reset(struct tcpm_port *port)
>  	if (port->bist_request == BDO_MODE_TESTDATA && port->tcpc->set_bist_data)
>  		port->tcpc->set_bist_data(port->tcpc, false);
>  
> +	switch (port->state) {
> +	case ERROR_RECOVERY:
> +	case PORT_RESET:
> +	case PORT_RESET_WAIT_OFF:
> +		return;
> +	default:
> +		break;
> +	}
> +
>  	if (port->ams != NONE_AMS)
>  		port->ams = NONE_AMS;
>  	if (port->hard_reset_count < PD_N_HARD_RESET_COUNT)
> 
> base-commit: c70793fb7632a153862ee9060e6d48131469a29c
> -- 
> 2.42.0.820.g83a721a137-goog

-- 
heikki

