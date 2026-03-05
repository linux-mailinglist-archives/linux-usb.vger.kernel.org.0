Return-Path: <linux-usb+bounces-34123-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qGqECTfzqWkdIgEAu9opvQ
	(envelope-from <linux-usb+bounces-34123-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 22:18:47 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 749D1218770
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 22:18:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8314C303A877
	for <lists+linux-usb@lfdr.de>; Thu,  5 Mar 2026 21:18:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FA4235DA44;
	Thu,  5 Mar 2026 21:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NQK+RLlK"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F338C306B05;
	Thu,  5 Mar 2026 21:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772745517; cv=none; b=Sb5XgdF5j6SIQHaZtB85jZHeVrRWWslnsooIcfNWYMFCyjjp/1Aww5Q/BBfsamH93HF4mbUxe+e8l9hLo5xnMrJdppYN4jHp2OTLCBELTMHQQTGD87LlaJAyU4DM+IyqJYaYZMK897QmR+fKxPmofh/atIRzw1BrzERASyOoMww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772745517; c=relaxed/simple;
	bh=6H2FBr+h/R7p6UFbOa1JlXKs8KnLDNSITprKGuUVwgk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hEyqf+X4Vva3nONPMFWYknelvLzeJ95aFqnmqx9TJlPkFZmURxuN2ZesgVRZETAQtzKDmePQe1w0Ge4oM1gLKM73+KSprexlIgWvwVMEd3tOVAULBgfe9YfIAdYZh5L8JYx57Z4XXUgcPf+qh3F0qhqwlWiONQd3t8L3UemDi00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NQK+RLlK; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772745516; x=1804281516;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=6H2FBr+h/R7p6UFbOa1JlXKs8KnLDNSITprKGuUVwgk=;
  b=NQK+RLlKZh/uTXhOH1O2a3FpRQcrmb2zfqeCPdpDagW7dFHa0fbDyKrh
   xAZTrIa5ROEYcNBkM1/KJRWwk55LCJB/lNpFAlBbu2tbZnftgcUt5CbkZ
   Qwkpew1wbefUkHWK8T8jlczH2CorR27ZCENUxGfxFSRw3sZDC9L0uMrvv
   VJQaXXsXz/Q3PKUIGlolP4yFGmshzbW5HhSCZHhcALqxN5ujVLm1OTAMc
   HMmE7wVPgXj8KgqsxgyO4eZqeR8Z+D4mekD5IyzRWgJLmQWkra4a+QtzX
   RArxInAVqjj2iKZgLdNvC93ZzRJSZSFvvppNWX3z/gKmQQRgqKwnHwzHd
   g==;
X-CSE-ConnectionGUID: +kjADFt5SiSJWdYxjsyEAg==
X-CSE-MsgGUID: 3rmXB9+iRXCItS69V9tNug==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="73921730"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="73921730"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 13:18:35 -0800
X-CSE-ConnectionGUID: Jpr2x9n2RTi0MZCT//8IMQ==
X-CSE-MsgGUID: 4QmsBi6TSGeHgZbJNENP6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="223505518"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO [10.245.244.90]) ([10.245.244.90])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 13:18:32 -0800
Message-ID: <aad2d38e-a0ef-49b1-a82e-f3a9b4750612@linux.intel.com>
Date: Thu, 5 Mar 2026 23:18:29 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: hcd: queue wakeup_work to system_freezable_wq
 workqueue
To: Alan Stern <stern@rowland.harvard.edu>, Xu Yang <xu.yang_2@nxp.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, gregkh@linuxfoundation.org,
 tglx@kernel.org, mingo@kernel.org, claudiu.beznea.uj@bp.renesas.com,
 kees@kernel.org, bigeasy@linutronix.de, ulf.hansson@linaro.org,
 rafael.j.wysocki@intel.com, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, jun.li@nxp.com
References: <20260304115729.857136-1-xu.yang_2@nxp.com>
 <c35d4aae-038f-428c-9b69-09230043dd60@rowland.harvard.edu>
 <dia6g5nbekt6brmi73dovchyklugjnd6ok3tsifbd6nfcjnnvd@xus2sw5wodhe>
 <b5a3d627-8cc5-41a9-848a-1e67c96bc191@rowland.harvard.edu>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <b5a3d627-8cc5-41a9-848a-1e67c96bc191@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 749D1218770
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-34123-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mathias.nyman@linux.intel.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:dkim]
X-Rspamd-Action: no action

On 3/5/26 17:47, Alan Stern wrote:

> 
>>> A better question to ask would be: Why does xhci_resume() call
>>> usb_hcd_resume_root_hub()?  That does not seem like the right thing to
>>> do -- at least, not in this scenario.  The proper time to resume the
>>> root hub after a system sleep is when the PM core calls its resume
>>> routine.
>>
>> Good question, it seems like commit 79989bd4ab86 ("xhci: always resume
>> roothubs if xHC was reset during resume") is added to fix some issues.
> 
> The changelog for that commit says that it was meant to take care of
> problems during runtime resume, but it also affects system resume.  This
> appears to be an oversight.

That is possible

We should probably limit the all the usb_hcd_resume_root_hub() calls in
xhci_resume() to runtime resume cases only.

There is a similar case further down in xhci_resume() where driver is looking
for pending port events.

Thanks
Mathias



