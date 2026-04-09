Return-Path: <linux-usb+bounces-36104-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EExKBDqW12mGPwgAu9opvQ
	(envelope-from <linux-usb+bounces-36104-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 09 Apr 2026 14:06:18 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C9963CA14B
	for <lists+linux-usb@lfdr.de>; Thu, 09 Apr 2026 14:06:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B091F303CC2B
	for <lists+linux-usb@lfdr.de>; Thu,  9 Apr 2026 12:05:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D924C2571A0;
	Thu,  9 Apr 2026 12:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hoiD1ZPh"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 586EC3939DD;
	Thu,  9 Apr 2026 12:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775736303; cv=none; b=BH/VqRDX8gL84RQqI1za9zoFapQizPLgHQMQ/l2MfLMkEkXUcsCVnLmK1blXsgKUXRCnRDByxq9bjxz3NR6azFRM2Jdf3qeRgRa2YVfUNYcLDG/2GeisJJ2bYZ+UFw17r8+maMIrBgCBLE7x70M2Qx9ENcpOJpYq35XCooHAfMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775736303; c=relaxed/simple;
	bh=z0vMcjDf+OzG6Qo6JZuj+cRAJ1QN9F4vcScBEtA2KaA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U2aqop9/wNInwl6Vagi3SAflSGEgrLUrr5Er/QVf9pO0jtZ5HZwhvQeGthwRX+Diu0mPo8vabjZuKfSCCrWcLWaHWBoWTF6lSQ++5l3eRVWAsCbWPbCHId1LPgS1q66Z4iZY4Wk4/+/kqLNSNW2dDHN3wufLGXMldLJnNCmnbn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hoiD1ZPh; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775736301; x=1807272301;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=z0vMcjDf+OzG6Qo6JZuj+cRAJ1QN9F4vcScBEtA2KaA=;
  b=hoiD1ZPhtgOMUA7T8hU/qKef0hq5ltLHppnDr98O1BKgN6zitBWziPdV
   9iqKGYonbFplIz9wmDEIPjlElyOqCFTQyhyY2SM2jaeEgI2MJtWMZIh27
   PjzUq097TnA0BY232GiazbvocqWz+s7EvdHQED/vXiyVMLb7kQ5Y0fkki
   lb3hJoPwxlWOGCbV0wQCHJXmrD/RzX+041XCDQiyPiEV07XblVA0IGbjx
   D0D2UTON+mhVVJVhpFJMTLWXHNpGCPALsVv2w3cjQ9otnDIhiq5GH8l8i
   pdaXPEGeaAsiAJ1xDKuD//b53ed+Fh2sv0Pgz6ojO5Urc5UzQ3GwUAGqX
   g==;
X-CSE-ConnectionGUID: LUI91qhmS7GG5De4DcrPDg==
X-CSE-MsgGUID: I7TfSkZETUWcbUVX0KVBhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="87362540"
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; 
   d="scan'208";a="87362540"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 05:05:00 -0700
X-CSE-ConnectionGUID: C2XiKIefT6q2mS+jWq3tCg==
X-CSE-MsgGUID: Bh5IpzJ8Q/+uilBtcqMc+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; 
   d="scan'208";a="266727655"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa001.jf.intel.com with ESMTP; 09 Apr 2026 05:04:58 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 63A2798; Thu, 09 Apr 2026 14:04:57 +0200 (CEST)
Date: Thu, 9 Apr 2026 14:04:57 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	usb4-upstream@oss.qualcomm.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] thunderbolt: debugfs: Don't stop reading SB registers if
 just one fails
Message-ID: <20260409120457.GH3552@black.igk.intel.com>
References: <20260409-topic-tbt_sb_debugfs-v1-1-131540e0cc2b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260409-topic-tbt_sb_debugfs-v1-1-131540e0cc2b@oss.qualcomm.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,oss.qualcomm.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36104-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mika.westerberg@linux.intel.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,black.igk.intel.com:mid]
X-Rspamd-Queue-Id: 6C9963CA14B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On Thu, Apr 09, 2026 at 01:22:01PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The GEN4 TxFFE register is not part of the USB4 v1.0 specification, so
> understandably some pre-USB4v2 retimers (like the Parade PS8830) don't
> seem to implement it.
>
> The immediate idea to counter this would be to introduce a version
> check for that specific register, but on a second thought, the current
> flow only returns a quiet -EIO if there's _any_ failures, without
> hinting at what the actual problem is.

Please don't use _any_ emphasis in the commit messages here or in the
future.

> To take care of both of these issues, simply print an error line for
> each SB register read that fails and go on with attempting to read the
> others.
> 
> Note that this is not quite in-spec behavior ("The SB Register Space
> registers shall have the structure and fields described in Table 4-17.
> Registers not listed in Table 4-20 are undefined and shall not be
> used."), but it's the easiest fix that shouldn't (TM) have real-world
> bad side effects.

Also drop the "(TM)" thing.

I assume you have tested this on a hardware that supports this too, right?

> Fixes: 6d241fa00159 ("thunderbolt: Add sideband register access to debugfs")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/thunderbolt/debugfs.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/thunderbolt/debugfs.c b/drivers/thunderbolt/debugfs.c
> index 042f6a0d0f7f..8237e1ea6d09 100644
> --- a/drivers/thunderbolt/debugfs.c
> +++ b/drivers/thunderbolt/debugfs.c
> @@ -2361,8 +2361,10 @@ static int sb_regs_show(struct tb_port *port, const struct sb_reg *sb_regs,
>  		memset(data, 0, sizeof(data));
>  		ret = usb4_port_sb_read(port, target, index, regs->reg, data,
>  					regs->size);
> -		if (ret)
> -			return ret;
> +		if (ret) {
> +			seq_printf(s, "0x%02x Error reading register: %d\n", regs->reg, ret);

Why not tb_port_dgb/warn()() here instead so it goes into dmesg, not to the
output.

> +			continue;
> +		}
>  
>  		seq_printf(s, "0x%02x", regs->reg);
>  		for (j = 0; j < regs->size; j++)
> 
> ---
> base-commit: db7efce4ae23ad5e42f5f55428f529ff62b86fab
> change-id: 20260409-topic-tbt_sb_debugfs-2e500fee9706
> 
> Best regards,
> -- 
> Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

