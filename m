Return-Path: <linux-usb+bounces-32785-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +MH/NoaLeGmqqwEAu9opvQ
	(envelope-from <linux-usb+bounces-32785-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 10:55:18 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6190F92292
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 10:55:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 05A68301624C
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 09:53:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B5E63375A7;
	Tue, 27 Jan 2026 09:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A0yBOmRd"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB6B2868B4
	for <linux-usb@vger.kernel.org>; Tue, 27 Jan 2026 09:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769507619; cv=none; b=hBkBfgqhQNvTa+k68u23fsO27TgfGV70l5Gv+KfUw8+w7dKRE16j7jUay2msSP9OekXlrrKugTz+ZC4rkQJqxUcdii6K+MFYKhF6Vkx96R1OFTKh4OBzxpMigAM1t+KxxsXHCYMWzntun/s6zf0NLKnPyS8Kdn/Q1PdCRcduU40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769507619; c=relaxed/simple;
	bh=2CAkGbXDMmb5hxB2DtjAmt0gaBElOZMBg1Yk2ZW7Rmk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hpkrqvDnDMGVc0eQNGB2jaJPnWsPBbCILcRx8DpIGvLpTw2EqRzX3wEDOh6lxv5eZixf4ry0l+LEP37uH3R0suj32APWyyqeHVgS4g460+HVWqc6WYBdBy/4FrBqWbXLC78/1zOvxNr8KbSk6Va3daiuLN3aHC2ZBx3MqN2/49Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A0yBOmRd; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769507618; x=1801043618;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2CAkGbXDMmb5hxB2DtjAmt0gaBElOZMBg1Yk2ZW7Rmk=;
  b=A0yBOmRdEDX+9IDWapI/fhPOBbO6GXrx7d1EUCuE5MPVd5Qm/o2+Kvig
   fhYJ2ACXx582iZYpOq5MhFY3P4NAV71a4TNcSXOPHKEmsEIVi0hVsB6IN
   zht6riMCQWzzg8/zHMYe0tn+4YlBRZn6Cq3jvI3onpSaEGg3hfgvCtfUY
   wxZmC8WyJy1rO2pcaMdk3Haykm44kUkOnOG5wpA/kKpAp/mxW8RM3n98m
   lpatGDwj0S5hEwl+unHJWC/6/GrD9xY/+wG86M5cy7lZMerLzijbMLlma
   or8tOWOhAArr0CD9pie/tGZUIYJWnjBsZ+ckND/bxdEd1ektlO4bagHL9
   w==;
X-CSE-ConnectionGUID: ZNV1IadcT+yvraFH+qR8LA==
X-CSE-MsgGUID: YvbH0fUySH+9OC/Mm1PoAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="74561545"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="74561545"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 01:53:37 -0800
X-CSE-ConnectionGUID: 49GNw+rfTiSuWZ4VCcKXlg==
X-CSE-MsgGUID: FRNwgNHYT7eAl8H6ve06rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="208362519"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa009.fm.intel.com with ESMTP; 27 Jan 2026 01:53:35 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id CC7C398; Tue, 27 Jan 2026 10:53:34 +0100 (CET)
Date: Tue, 27 Jan 2026 10:53:34 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Gil Fine <gil.fine@linux.intel.com>
Cc: andreas.noever@gmail.com, YehezkelShB@gmail.com, gil.fine@intel.com,
	linux-usb@vger.kernel.org, lukas@wunner.de
Subject: Re: [PATCH 3/5] thunderbolt: Verify Router Ready bit is set after
 router enumeration
Message-ID: <20260127095334.GG2275908@black.igk.intel.com>
References: <20260126220606.3476657-1-gil.fine@linux.intel.com>
 <20260126220606.3476657-4-gil.fine@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260126220606.3476657-4-gil.fine@linux.intel.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,intel.com,vger.kernel.org,wunner.de];
	TAGGED_FROM(0.00)[bounces-32785-lists,linux-usb=lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:email,intel.com:dkim]
X-Rspamd-Queue-Id: 6190F92292
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 12:06:04AM +0200, Gil Fine wrote:
> The USB4 Connection Manager guide specifies that after enumerating a
> router, the Connection Manager shall verify that the Router Ready bit
> (ROUTER_CS_6.RR) has been set to ensure hardware configuration has completed.
> Currently, this step is missing from the enumeration sequence.
> 
> Add this check to follow the Connection Manager guide more closely.
> 
> Signed-off-by: Gil Fine <gil.fine@linux.intel.com>
> ---
>  drivers/thunderbolt/switch.c  | 5 +++++
>  drivers/thunderbolt/tb_regs.h | 1 +
>  2 files changed, 6 insertions(+)
> 
> diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
> index e7faa203b782..11e8c1dd3090 100644
> --- a/drivers/thunderbolt/switch.c
> +++ b/drivers/thunderbolt/switch.c
> @@ -2641,6 +2641,11 @@ int tb_switch_configure(struct tb_switch *sw)
>  			return ret;
>  
>  		ret = usb4_switch_setup(sw);
> +		if (ret)
> +			return ret;
> +
> +		ret = tb_switch_wait_for_bit(sw, ROUTER_CS_6, ROUTER_CS_6_RR,
> +					     ROUTER_CS_6_RR, 500);

Can you move this inside usb4_switch_setup()?


>  	} else {
>  		if (sw->config.vendor_id != PCI_VENDOR_ID_INTEL)
>  			tb_sw_warn(sw, "unknown switch vendor id %#x\n",
> diff --git a/drivers/thunderbolt/tb_regs.h b/drivers/thunderbolt/tb_regs.h
> index 71bed02a6974..7e65bc9bcb12 100644
> --- a/drivers/thunderbolt/tb_regs.h
> +++ b/drivers/thunderbolt/tb_regs.h
> @@ -216,6 +216,7 @@ struct tb_regs_switch_header {
>  #define ROUTER_CS_6_WOPS			BIT(2)
>  #define ROUTER_CS_6_WOUS			BIT(3)
>  #define ROUTER_CS_6_HCI				BIT(18)
> +#define ROUTER_CS_6_RR				BIT(24)
>  #define ROUTER_CS_6_CR				BIT(25)
>  #define ROUTER_CS_7				0x07
>  #define ROUTER_CS_9				0x09
> -- 
> 2.43.0

