Return-Path: <linux-usb+bounces-37708-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CCBUJLpZDGodfwUAu9opvQ
	(envelope-from <linux-usb+bounces-37708-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 14:38:18 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B58F57ED2F
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 14:38:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AEDB13081409
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 12:24:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9F4F4BC030;
	Tue, 19 May 2026 12:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ha+rHb/0"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43FE73E1203
	for <linux-usb@vger.kernel.org>; Tue, 19 May 2026 12:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779193497; cv=none; b=c5621ANZlWOFZcsvstRMj2lduW9fL28mm+Alft4BZJh7wm8AomEizMY0eiikGtg5EyN1mA712WSuTgTak7aGt0vC1fcLoX7lgJORBKegBvSA3MnQlkvWiq6Jvy5+fCPE4hBUcFj8Y+Zf3Gp6hxAu35BqNPw0TRI7jmTtIY/iV3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779193497; c=relaxed/simple;
	bh=jZlJCIQyZrz6zZLxf1zplJW4M7AgcaLS3EMNpVbz888=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y3CdnHXEevGMgj+JuO305/3WqBxtC9HOpQjjUwbYRTpWLCRsUSNA4VT6IPP5bzLeVmLQ8Pm2vDvAskRmpxYH4SZzgLPCF9Om/9Jq4SjU5o6312Fw4s4u1G+WPYLVbzdPKmkhS3qbq8d53ZiWeShRJfOHe3e7qJeIyqQghB8aKe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ha+rHb/0; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779193496; x=1810729496;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jZlJCIQyZrz6zZLxf1zplJW4M7AgcaLS3EMNpVbz888=;
  b=Ha+rHb/0HiFPTzyEyB8NIGg686AT+9u3ciMeDkIOjXD6/VN+rGqX2DMF
   iPcl4cntoEdlwtICbWPOIkXSBXx1ySjyQEzpZ8AslhG3+Hw9jOvoIuwSK
   vlPKWY6K7G7eOCsMs+HpslPC4zIVoAJ2W99f3UF/YT2Wi1AUyq0vW4ysa
   myPisMKidYu+3VMaGY89CSKimS4xz7bLGmPpUlBhzi87vX7zSi6cSX9FP
   oKVT9jpy0341fYK8kG6cArG+xmsN22Frjje0uKQfKyHktSjbWUu/gKsBB
   t+20jRtTszmDWmt/NTSaba+TeMUwxPVaQLEIHmW2tkudN+uQoLqsW8K4L
   g==;
X-CSE-ConnectionGUID: yNjetmJzSAiqpGavXKw1/g==
X-CSE-MsgGUID: srFVeLUTS/yBl9ViA5sygg==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="80120097"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="80120097"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 05:24:56 -0700
X-CSE-ConnectionGUID: nyUZqD4hQJura1MCsoqytQ==
X-CSE-MsgGUID: vgWf9mCqSdK4YrtBBB/FzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="277862256"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa001.jf.intel.com with ESMTP; 19 May 2026 05:24:53 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id A583895; Tue, 19 May 2026 14:24:51 +0200 (CEST)
Date: Tue, 19 May 2026 14:24:51 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>, Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 00/10] thunderbolt: Introduce USB4STREAM
Message-ID: <20260519122451.GC8580@black.igk.intel.com>
References: <20260511102744.1867485-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260511102744.1867485-1-mika.westerberg@linux.intel.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37708-lists,linux-usb=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,wunner.de,linux.intel.com,lunn.ch,lwn.net,linuxfoundation.org,davemloft.net,google.com,kernel.org,redhat.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mika.westerberg@linux.intel.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb,netdev];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 8B58F57ED2F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 11, 2026 at 12:27:34PM +0200, Mika Westerberg wrote:
> Hi all,
> 
> This series adds support for a new protocol over USB4/Thunderbolt cable
> called USB4STREAM. The protocol is super-simple and basically just
> transfers raw packets from one host to another. It is documented as part of
> the thunderbolt_stream driver.
> 
> The driver exposes /dev/tbstreamX devices on each side of the link that can
> be used to transfer data using regular filesystem operations such as
> read(2) and write(2):
> 
>   host1 # cat /dev/tbstream0
>   host2 # echo hello > /dev/tbstream0
> 
> This can be useful in cases where network tooling is not available or just
> for existing applications like 'dd' and 'cat' that do not support sockets.
> 
> thunderbolt_stream can be used at the same time with thunderbolt_net so
> they don't rule each other our. 
> 
> thunderbolt_stream allows multiple streams to be created, for example one
> stream for control traffic and another for data (there are some limitations
> in the core USB4/Thunderbolt driver due to dedicated flow control scheme
> but this is likely change in the future). Each stream is bi-directional
> tunnel over the fabric.
> 
> There are a couple of additional usage examples in the last patch that adds
> the driver itself.
> 
> Previous version of the series is avaiable here:
>   
>    https://lore.kernel.org/linux-usb/20260428072209.3084930-1-mika.westerberg@linux.intel.com/
> 
> Changes from the previous version:
> 
>   * Dropped module parameter from the network driver.
>   * Convert stream driver to use miscdevice instead.
>   * Add documentation how to use stream to admin guide.
> 
> Mika Westerberg (10):
>   thunderbolt: Add tb_property_merge_dir()
>   thunderbolt: Add KUnit test for tb_property_merge_dir()
>   thunderbolt: Allow service drivers to specify their own properties
>   thunderbolt / net: Move ring_frame_size() to thunderbolt.h
>   thunderbolt / net: Let the service drivers configure interrupt throttling
>   thunderbolt: Add helper to figure size of the ring
>   thunderbolt: Add tb_ring_flush()
>   thunderbolt: Add support for ConfigFS
>   thunderbolt: Add support for USB4STREAM
>   docs: admin-guide: thunderbolt: Add instructions how to use USB4STREAM

All applied to thunderbolt.git/next.

