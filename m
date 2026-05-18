Return-Path: <linux-usb+bounces-37591-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CC+oIDbxCmpv+AQAu9opvQ
	(envelope-from <linux-usb+bounces-37591-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 13:00:06 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E90BE56B1E4
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 13:00:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 618D8308541B
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 10:39:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CB793EFFCB;
	Mon, 18 May 2026 10:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JZGwc6dc"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBA0A3E6DE4;
	Mon, 18 May 2026 10:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779100485; cv=none; b=Bl8YWip9JVIsmpmjX+34kyEP7zWYFWs6PbrJ6XxQYIdbvuvOFG3GvKrhCSYMUWwXPfXsAbtt8P0o68tyxaATsO14vgc2GEInyfYWqOREsMIGfbLml3Usfvzb9Kyd71bQ7rYfRmAkwSKm6KN1dFzY8uXlVWJAwU1Qxzl6Rt9IrCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779100485; c=relaxed/simple;
	bh=bUVWdNxVawTz2qdVRttd4IF9/ZJSZEQk7WJ5JUXEZl4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=acWkMYw6fx1RF+3iulQiikbasCShouUNmUlJXtWS/svkWUJeRp8t5QIMQZ49gRugN6bEftf9clffXdw2BQhHP8dkaiM1aojz+f6OSmSNohi+TpbiAsGwyav8mjxEGxlV6NTt6jOH1mp0r9q65OKvvBFE4gl9m/ic6cwUzcnJ/E8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JZGwc6dc; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779100472; x=1810636472;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bUVWdNxVawTz2qdVRttd4IF9/ZJSZEQk7WJ5JUXEZl4=;
  b=JZGwc6dcCA5d3jrLD0RdNwVq2d7UTugDdDp9wZS3CS17hCLAQ6p1CoRF
   2w9h7Fzf5D1/M6vgpp1+/X+LFjEA0rWLQF4hpTAPULtcz8yY4HwVSyRzx
   5cMnFQYqMItRvv794ExrZoQ2FQktuongjTHlppJxRN09RNu3fZoM6Gaff
   GatRUarIHMex3GsM1NsW+WAflRKPQAOsf7mH1AT11KhhWJ34hPXuh78Qj
   r0+w8VcFGpXJBXe3VHBrmvhDxzmR4R/ey+vs/NsVXehIh1JMQaEr3Tv3u
   BQzmJiVYVJ/NY6EZtnTwqbcXAEn5byPT6+S7H1D9ijqDGXV1rcK3U7frl
   Q==;
X-CSE-ConnectionGUID: BSLsh/QCTR68Brn1l5XuaQ==
X-CSE-MsgGUID: 6g+vdW3fTQWUYLLhO07a/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11789"; a="90531134"
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="90531134"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 03:34:22 -0700
X-CSE-ConnectionGUID: TqWd15ELTAKcsjjoV9hscg==
X-CSE-MsgGUID: wYUsmrvZSYmcIC6viRbocg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="244370525"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa005.jf.intel.com with ESMTP; 18 May 2026 03:34:21 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id EA8C995; Mon, 18 May 2026 12:34:19 +0200 (CEST)
Date: Mon, 18 May 2026 13:34:18 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, git@amd.com
Subject: Re: [PATCH 3/3] usb: typec: tipd: name TPS_REG_POWER_STATUS field
 masks
Message-ID: <agrrKmF53AVhdbgP@kuha>
References: <20260513182850.165349-1-radhey.shyam.pandey@amd.com>
 <20260513182850.165349-4-radhey.shyam.pandey@amd.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513182850.165349-4-radhey.shyam.pandey@amd.com>
X-Rspamd-Queue-Id: E90BE56B1E4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37591-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[heikki.krogerus@linux.intel.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email,intel.com:dkim,amd.com:email]
X-Rspamd-Action: no action

On Wed, May 13, 2026 at 11:58:50PM +0530, Radhey Shyam Pandey wrote:
> Define named masks for Power Status fields (connection and source/sink)
> and reuse them consistently for both field extraction and value
> construction. This avoids raw bit usage, keeps the definitions aligned.
> No functional change.
> 
> Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/tipd/tps6598x.h | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/typec/tipd/tps6598x.h b/drivers/usb/typec/tipd/tps6598x.h
> index 03edbb77bbd6..d4140f4da5bb 100644
> --- a/drivers/usb/typec/tipd/tps6598x.h
> +++ b/drivers/usb/typec/tipd/tps6598x.h
> @@ -142,9 +142,13 @@
>  #define TPS_SYSTEM_POWER_STATE_S4	0x04
>  #define TPS_SYSTEM_POWER_STATE_S5	0x05
>  
> -/* TPS_REG_POWER_STATUS bits */
> -#define TPS_POWER_STATUS_CONNECTION(x)  TPS_FIELD_GET(BIT(0), (x))
> -#define TPS_POWER_STATUS_SOURCESINK(x)	TPS_FIELD_GET(BIT(1), (x))
> +/* TPS_REG_POWER_STATUS bits (masks shared by TPS_FIELD_GET accessors and FIELD_PREP) */
> +#define TPS_POWER_STATUS_CONNECTION_MASK	BIT(0)
> +#define TPS_POWER_STATUS_SOURCESINK_MASK	BIT(1)
> +#define TPS_POWER_STATUS_CONNECTION(x) \
> +	TPS_FIELD_GET(TPS_POWER_STATUS_CONNECTION_MASK, (x))
> +#define TPS_POWER_STATUS_SOURCESINK(x) \
> +	TPS_FIELD_GET(TPS_POWER_STATUS_SOURCESINK_MASK, (x))
>  #define TPS_POWER_STATUS_BC12_DET(x)	TPS_FIELD_GET(BIT(2), (x))
>  
>  #define TPS_POWER_STATUS_TYPEC_CURRENT_MASK GENMASK(3, 2)
> -- 
> 2.44.4

-- 
heikki

