Return-Path: <linux-usb+bounces-35144-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IGEQI+f7u2mzqwIAu9opvQ
	(envelope-from <linux-usb+bounces-35144-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 14:36:39 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C912CC121
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 14:36:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2D55030A6E39
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 13:36:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AA353D4107;
	Thu, 19 Mar 2026 13:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gG907ZRr"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A603A4F5F
	for <linux-usb@vger.kernel.org>; Thu, 19 Mar 2026 13:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773927371; cv=none; b=obgih8d7SU2p7wktZPTxYwa8wLr8FyiGhDKkPYZhqCuLA9ORr1AHEFhgfORf6MhWpCd0+WbAAVvcZd+S0W9wfMiM52nF2dALBnJ6s2fYza/Qtf3VCYmtDqwCXua6A7HYSoeMofPuHUFmN2HPqjcB0K74aL4M6OdA+KDwjrRcFHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773927371; c=relaxed/simple;
	bh=O6FjK5S2tLKUo2wcOELV8r4yNP//qK0PWZenKNfx1nk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PkK6fW2zRbpNvaZNAgG0EmUMw7C2KGBqFpFW+DFQt/6/c0GyxWNry/5cowJstIFro4FK/g5XSD0SJWz6+0DUSY/72eclBsGRjB/cG24+91+a+AObIg+awvwY4Y+lLJDd4Cs7PgSzwAjZB0V9mhb2E2u3fUjP+pg8Snbp+ygbJgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gG907ZRr; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773927369; x=1805463369;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=O6FjK5S2tLKUo2wcOELV8r4yNP//qK0PWZenKNfx1nk=;
  b=gG907ZRrcacmb+MapQAYeDBx/07TkCcbEAbHcGj8xhybfRbcsdXj6Zrd
   nNuRcyjmCdzrQAcy+XvTdslIj4+EJlL+Cbem1WcyoQ4S+cJrju/N4fUWX
   bY3/xxziumRmam9yoU+Ubj+IOtiQx6fX+2bFbuRLW4g4FFJygM4mOxa6v
   rdXDqB6/TRuNLTl72g/pwUWzWu+H0OcEPDQnjD39dsZ8n5PnPA49dN6uK
   GHH0wW8AXAxrcvXeIuxcqU3aCdpeEJ3Xfy8hql7ehxjAta2j1Ofx9r0Hz
   5Lufv6XGmUJP3arjzzmxMl9mfdfpczEaBBzJHLT2r9SprQaoXHVojQQaw
   w==;
X-CSE-ConnectionGUID: 7VI0Dq8dSFyD1IjSvn/nBg==
X-CSE-MsgGUID: oo22Ki1+QRmSw7IB9IV7sg==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="78901862"
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="78901862"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 06:36:09 -0700
X-CSE-ConnectionGUID: m8f11AX+QIiU7g4JF8dANQ==
X-CSE-MsgGUID: syROggvsRd69sxXwCl6F9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="223179676"
Received: from nneronin-mobl1.ger.corp.intel.com (HELO [10.246.17.204]) ([10.246.17.204])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 06:36:06 -0700
Message-ID: <4609e95a-9506-4f4f-b21d-861266030108@linux.intel.com>
Date: Thu, 19 Mar 2026 15:35:52 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 9/9] usb: xhci: optimize resuming from S4
 (suspend-to-disk)
To: raoxu <raoxu@uniontech.com>
Cc: linux-usb@vger.kernel.org, mathias.nyman@linux.intel.com,
 michal.pecio@gmail.com
References: <20260317145544.2076387-10-niklas.neronin@linux.intel.com>
 <17081A1362818035+20260319122048.2059838-1-raoxu@uniontech.com>
Content-Language: en-US
From: "Neronin, Niklas" <niklas.neronin@linux.intel.com>
In-Reply-To: <17081A1362818035+20260319122048.2059838-1-raoxu@uniontech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35144-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,linux.intel.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.neronin@linux.intel.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-0.988];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 07C912CC121
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 19/03/2026 14.20, raoxu wrote:
> On 2026-03-17 14:55 Niklas Neronin wrote:
> 
>> +		/* Clear data which is re-initilized during runtime */
>> +		xhci_for_each_ring_seg(xhci->interrupters[0]->event_ring->first_seg, seg)
>> +			memset(seg->trbs, 0, sizeof(union xhci_trb) * TRBS_PER_SEGMENT);
>> +
>> +		for (int i = xhci->max_ports; i > 0; i--)
>> +			xhci_free_virt_devices_depth_first(xhci, i);
> 
> This patch looks good to me overall. I only noticed one possible typo here.
> 
> Should this be `xhci->max_slots` instead?

Good catch. Yes, this should be 'xhci->max_slots'.

Thanks for the review.

-Niklas

> 
> `xhci_free_virt_devices_depth_first()` takes a slot ID, and the previous
> cleanup path in `xhci_mem_cleanup()` also iterated over `xhci->max_slots`
> when freeing virt devices.
> 
> Thanks,
> 
> Xu Rao
> 


