Return-Path: <linux-usb+bounces-36531-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OImGHHIt72mb8wAAu9opvQ
	(envelope-from <linux-usb+bounces-36531-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 11:33:38 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1449546FF85
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 11:33:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 698963006139
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 09:33:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E77523B2FFC;
	Mon, 27 Apr 2026 09:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cW/8ubTk"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EFAC2F39AB;
	Mon, 27 Apr 2026 09:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777282416; cv=none; b=juvvUoKaWJCdY14OvnhVkqy/Re7iX/UEFgNkJuASLNmxiuaNVkk84cTudHZtrZ+oFIzqtiA6Y26By2f2UQwFLV+EWBvor0YuyTRuCoVhClm/h8tujTd7/YGh5psxFnZ8vWViggAJKMkQ5AafMXsVeVQC4BLpBBeJzXOFWTVgQvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777282416; c=relaxed/simple;
	bh=Uirl3JriUyf+qk9P8LZmvsAq5QKe50iwjI6AgT1P3/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DKoJKtPqqK3YkslqeLZGL3/OR1w04mCYIt4POiaizjAS6699d1WSXTXPCeE9W58gjgGC8NJxmYNS+QaX4BBTEgi/D2Cr3uPFMvEN9RyJDbEdXb10sq/KCHbRIBQXKt9T1Af9CwY+JtHI3YPgXeuLjPNyadlQOllFEsdZvLF56BQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cW/8ubTk; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777282414; x=1808818414;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Uirl3JriUyf+qk9P8LZmvsAq5QKe50iwjI6AgT1P3/g=;
  b=cW/8ubTk3S84FkWbA9dtOPsDbRYU3k9qgo8XtHw/YfqpRO/pYoVaTBt5
   FBrPkRiijHUYlbu4i90WpB5enQTfWLdW6kBk4e7NgiHjgVmNGR+37OzIp
   2EKCLeNXbcqkFunckbF8hC7Hg3eOLX3IlsbQWvLsFk7cGnZvpyuahjaXj
   FM16DVFFXJ6LeqUtddpUZDOKpBJ67ZfuVtdTt1sKThAs7iMoOHn55hhnh
   esqVtfD2kozp1/eQNkIQcENC+f1yfuf+cU/R0elRupR8XZlU1qvzIewzB
   Sf2OqDQBJFhVXcBrPERf9W3lMbqrashBc4i0tq1hOANB1uqEpTuRMe9Y0
   g==;
X-CSE-ConnectionGUID: a8n+257lQe6s5Vga+XkvXw==
X-CSE-MsgGUID: KaBIpGcoT/OK5u4eDTxb5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11768"; a="78182865"
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; 
   d="scan'208";a="78182865"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 02:33:34 -0700
X-CSE-ConnectionGUID: fc7BOEXwT0iHbWnvkGjttQ==
X-CSE-MsgGUID: KC7SGBNMRLW+SwOcKR4CKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; 
   d="scan'208";a="238629903"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa005.jf.intel.com with ESMTP; 27 Apr 2026 02:33:32 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id B074395; Mon, 27 Apr 2026 11:33:30 +0200 (CEST)
Date: Mon, 27 Apr 2026 12:33:29 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: badhri@google.com, gregkh@linuxfoundation.org,
	m.grzeschik@pengutronix.de, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v2] usb: typec: tcpm: fix debug accessory mode detection
 for sink ports
Message-ID: <ae8tabVDj2iH6IQf@kuha>
References: <20260424074009.2979266-1-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260424074009.2979266-1-xu.yang_2@nxp.com>
X-Rspamd-Queue-Id: 1449546FF85
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36531-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[heikki.krogerus@linux.intel.com,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,intel.com:dkim,intel.com:email,nxp.com:email]

On Fri, Apr 24, 2026 at 03:40:09PM +0800, Xu Yang wrote:
> The port in debug accessory mode can be either a source or sink. The
> previous tcpm_port_is_debug() function only checked for source port.
> 
> Commit 8db73e6a42b6 ("usb: typec: tcpm: allow sink (ufp) to toggle into
> accessory mode debug") changed the detection logic to support both roles,
> but left some logic in _tcpm_cc_change() unchanged, This causes the state
> machine to transition to an incorrect state when operating as a sink in
> debug accessory mode. Log as below:
> 
> [  978.637541] CC1: 0 -> 5, CC2: 0 -> 5 [state TOGGLING, polarity 0, connected]
> [  978.637567] state change TOGGLING -> SRC_ATTACH_WAIT [rev1 NONE_AMS]
> [  978.637596] pending state change SRC_ATTACH_WAIT -> DEBUG_ACC_ATTACHED @ 180 ms [rev1 NONE_AMS]
> [  978.647098] CC1: 5 -> 0, CC2: 5 -> 5 [state SRC_ATTACH_WAIT, polarity 0, connected]
> [  978.647115] state change SRC_ATTACH_WAIT -> SRC_ATTACH_WAIT [rev1 NONE_AMS]
> 
> It should go to SNK_ATTACH_WAIT instead of SRC_ATTACH_WAIT state.
> 
> To fix this, add tcpm_port_is_debug_source() and tcpm_port_is_debug_sink()
> helper to explicitly identify the power mode in debug accessory mode.
> Update the state transition logic in _tcpm_cc_change() to ensure the state
> machine transitions comply with Type-C specification. Also update the logic
> in run_state_machine() to keep consistency.
> 
> Fixes: 8db73e6a42b6 ("usb: typec: tcpm: allow sink (ufp) to toggle into accessory mode debug")
> Cc: stable@vger.kernel.org
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

FWIW:

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
> Changes in v2:
>  - update tcpm_port_is_debug() in run_state_machine() as well
>    as suggested by Amit
> ---
>  drivers/usb/typec/tcpm/tcpm.c | 25 ++++++++++++++++---------
>  1 file changed, 16 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index dfbb94ddc98a..6d258efae6f0 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -732,9 +732,14 @@ static const char * const pd_rev[] = {
>  	 (tcpm_cc_is_source((port)->cc2) && \
>  	  !tcpm_cc_is_source((port)->cc1)))
>  
> +#define tcpm_port_is_debug_source(port) \
> +	(tcpm_cc_is_source((port)->cc1) && tcpm_cc_is_source((port)->cc2))
> +
> +#define tcpm_port_is_debug_sink(port) \
> +	(tcpm_cc_is_sink((port)->cc1) && tcpm_cc_is_sink((port)->cc2))
> +
>  #define tcpm_port_is_debug(port) \
> -	((tcpm_cc_is_source((port)->cc1) && tcpm_cc_is_source((port)->cc2)) || \
> -	 (tcpm_cc_is_sink((port)->cc1) && tcpm_cc_is_sink((port)->cc2)))
> +	(tcpm_port_is_debug_source(port) || tcpm_port_is_debug_sink(port))
>  
>  #define tcpm_port_is_audio(port) \
>  	(tcpm_cc_is_audio((port)->cc1) && tcpm_cc_is_audio((port)->cc2))
> @@ -5176,7 +5181,7 @@ static void run_state_machine(struct tcpm_port *port)
>  			tcpm_set_state(port, SNK_UNATTACHED, PD_T_DRP_SNK);
>  		break;
>  	case SRC_ATTACH_WAIT:
> -		if (tcpm_port_is_debug(port))
> +		if (tcpm_port_is_debug_source(port))
>  			tcpm_set_state(port, DEBUG_ACC_ATTACHED,
>  				       port->timings.cc_debounce_time);
>  		else if (tcpm_port_is_audio(port))
> @@ -5434,7 +5439,7 @@ static void run_state_machine(struct tcpm_port *port)
>  			tcpm_set_state(port, SRC_UNATTACHED, PD_T_DRP_SRC);
>  		break;
>  	case SNK_ATTACH_WAIT:
> -		if (tcpm_port_is_debug(port))
> +		if (tcpm_port_is_debug_sink(port))
>  			tcpm_set_state(port, DEBUG_ACC_ATTACHED,
>  				       PD_T_CC_DEBOUNCE);
>  		else if (tcpm_port_is_audio(port))
> @@ -5454,7 +5459,7 @@ static void run_state_machine(struct tcpm_port *port)
>  		if (tcpm_port_is_disconnected(port))
>  			tcpm_set_state(port, SNK_UNATTACHED,
>  				       PD_T_PD_DEBOUNCE);
> -		else if (tcpm_port_is_debug(port))
> +		else if (tcpm_port_is_debug_sink(port))
>  			tcpm_set_state(port, DEBUG_ACC_ATTACHED,
>  				       PD_T_CC_DEBOUNCE);
>  		else if (tcpm_port_is_audio(port))
> @@ -6360,10 +6365,10 @@ static void _tcpm_cc_change(struct tcpm_port *port, enum typec_cc_status cc1,
>  
>  	switch (port->state) {
>  	case TOGGLING:
> -		if (tcpm_port_is_debug(port) || tcpm_port_is_audio(port) ||
> +		if (tcpm_port_is_debug_source(port) || tcpm_port_is_audio(port) ||
>  		    tcpm_port_is_source(port))
>  			tcpm_set_state(port, SRC_ATTACH_WAIT, 0);
> -		else if (tcpm_port_is_sink(port))
> +		else if (tcpm_port_is_debug_sink(port) || tcpm_port_is_sink(port))
>  			tcpm_set_state(port, SNK_ATTACH_WAIT, 0);
>  		break;
>  	case CHECK_CONTAMINANT:
> @@ -6371,9 +6376,11 @@ static void _tcpm_cc_change(struct tcpm_port *port, enum typec_cc_status cc1,
>  		break;
>  	case SRC_UNATTACHED:
>  	case ACC_UNATTACHED:
> -		if (tcpm_port_is_debug(port) || tcpm_port_is_audio(port) ||
> +		if (tcpm_port_is_debug_source(port) || tcpm_port_is_audio(port) ||
>  		    tcpm_port_is_source(port))
>  			tcpm_set_state(port, SRC_ATTACH_WAIT, 0);
> +		else if (tcpm_port_is_debug_sink(port))
> +			tcpm_set_state(port, SNK_ATTACH_WAIT, 0);
>  		break;
>  	case SRC_ATTACH_WAIT:
>  		if (tcpm_port_is_disconnected(port) ||
> @@ -6395,7 +6402,7 @@ static void _tcpm_cc_change(struct tcpm_port *port, enum typec_cc_status cc1,
>  		}
>  		break;
>  	case SNK_UNATTACHED:
> -		if (tcpm_port_is_debug(port) || tcpm_port_is_audio(port) ||
> +		if (tcpm_port_is_debug_sink(port) || tcpm_port_is_audio(port) ||
>  		    tcpm_port_is_sink(port))
>  			tcpm_set_state(port, SNK_ATTACH_WAIT, 0);
>  		break;
> -- 
> 2.34.1

thanks,

-- 
heikki

