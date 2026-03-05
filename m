Return-Path: <linux-usb+bounces-34096-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kMV3KLiYqWm7AgEAu9opvQ
	(envelope-from <linux-usb+bounces-34096-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 15:52:40 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A59ED213E09
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 15:52:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5E7D23049CBF
	for <lists+linux-usb@lfdr.de>; Thu,  5 Mar 2026 14:39:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30C2E3A6F0C;
	Thu,  5 Mar 2026 14:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YHgxfWfU"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E558A334685
	for <linux-usb@vger.kernel.org>; Thu,  5 Mar 2026 14:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772721564; cv=none; b=glR7zXLEeU9MeMjutxbkcLr/glGU6A3BCsmQ8Nfn4r2QYCKfZMc+1inRa/ON50x3VNbU9SU9uXOE2abohf3e2imeal6IDv5jDk7kvutxg/M7sZowBZvchE0sYtfTAEU3Q9LHqhpRVPGfeVWRV0DoebSByYKkh+uiq/yaYRrU6Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772721564; c=relaxed/simple;
	bh=PB6SxVuJpu/RTPNsX17ZXqmfSffjf2qo6+eVcN6l5po=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PnScROj+jixv8kmX6/XRXjeh3rfr6YHiWV4qndAaOrQzJ9iAnrtN3yGCIFKVEtWcTFjgeyuHKFbUzk1OM20suA/qEzpmrGdocm71KDqnU9TSyYxSf88DBsJ1NxefStminHfQQltFxQoUiOY8xuFifzbL9PqVmEB/6GU7cPIdv9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YHgxfWfU; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772721563; x=1804257563;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=PB6SxVuJpu/RTPNsX17ZXqmfSffjf2qo6+eVcN6l5po=;
  b=YHgxfWfU4Q2uoabLBrrodZQr3px3E7AGo0CEny1ZSAcTYBv0LDuFVzkj
   lv6NqB9xNbWpxIu862U7rMkVbb0fwhY2s8v4Noywx9mxL38X5dDduU5u5
   cix7VV4ZsxL9uK+FAA+T1Q0tnGNaid1IQf0syOX6aa2A8wQVLkdyuCGxP
   gNJh7whFpx0XjV2sNf2JB+4U+q8jNjbhyFxaWKobC4Wsj0MaJalARGXnu
   WBisHmuvDWcG+6RrQ3AsG7Zz9fWrv3OvO4Pk9CThS3lYU7ov1D0AtGQDk
   vXyHenhP8Q5bZmnNT7dQZHxh7fPhqssFSn51caclXB9xTXz85UzXumzy+
   w==;
X-CSE-ConnectionGUID: U/am5vY7QNWySfzFcZAbuw==
X-CSE-MsgGUID: njsq0SujQT6KufVyBJXfqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="73008891"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="73008891"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 06:39:22 -0800
X-CSE-ConnectionGUID: gTdKngaHRO+wUeLjTC1I/g==
X-CSE-MsgGUID: BpaEqA7LQRiR1Z8wu79Q1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="218830473"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO [10.245.244.90]) ([10.245.244.90])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 06:39:21 -0800
Message-ID: <1dba3a9b-9e5f-47bd-b106-6a0799f99c87@linux.intel.com>
Date: Thu, 5 Mar 2026 16:39:17 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v13 1/2] usb: xhci: refactor IRQ/interrupter
 plumbing for multi-vector support
To: raoxu <raoxu@uniontech.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 michal.pecio@gmail.com, niklas.neronin@linux.intel.com,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>
References: <8338541D6B5694ED+20260305095256.691595-1-raoxu@uniontech.com>
 <B651758378034E76+20260305100123.703595-1-raoxu@uniontech.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <B651758378034E76+20260305100123.703595-1-raoxu@uniontech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: A59ED213E09
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34096-lists,linux-usb=lfdr.de];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,gmail.com,linux.intel.com,synopsys.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mathias.nyman@linux.intel.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

On 3/5/26 12:01, raoxu wrote:
> From: Xu Rao <raoxu@uniontech.com>
> 
> Prepare xHCI for multiple IRQ vectors/interrupters without changing the
> current behavior.
> 
> Introduce a per-vector irq context (hcd + intr_num) to use as request_irq()
> dev_id, and track the active vector count in xhci->irqs_enabled.  Use this
> single bound to enable/disable interrupters consistently across run/stop/
> resume and to sync/free IRQs.
> 
> Legacy IRQ fallback also keeps irqs_enabled >= 1 so interrupter 0 remains
> functional when MSI/MSI-X is unavailable.
> 
> No functional change intended: still uses interrupter 0 only.
> 

I still think we can get rid of the new array and context.

Niklas has been working on decoupling the memory allocation and xHC
re-initialization.

With his change the secondary interrupters are no longer freed and re-allocated
even when xHC is reset in resume, meaning we can pass secondary interrupter
struct xhci_interrupter pointers as data in request_irq().

This should remove the need for the new array and context.

There is a bit more testing needed, but we agreed with Niklas he'll post it as
an RFC now for you and others to comment.

Thanks
Mathias


