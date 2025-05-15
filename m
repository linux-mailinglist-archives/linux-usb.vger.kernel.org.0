Return-Path: <linux-usb+bounces-23965-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C3224AB7E8B
	for <lists+linux-usb@lfdr.de>; Thu, 15 May 2025 09:11:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4DAA31892DAA
	for <lists+linux-usb@lfdr.de>; Thu, 15 May 2025 07:12:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 983E223E334;
	Thu, 15 May 2025 07:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QsjUiPPG"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F24D282F1
	for <linux-usb@vger.kernel.org>; Thu, 15 May 2025 07:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747293106; cv=none; b=Mw9XVFwYBhrtF6Pxkp3FJHLOhUpXxhq0itiAoCa5kJQWBQluzZUd2KM1wKNyrLg7w5fG5VcGG6iN5CiRcP5jiOI9j60XVz/akl8zWLYUXSjvG6VpES4JtYqQ7KzPoy7dGcVZdQFKizbWgV7tETPDhr/Vj5McW7wmA6jeMPo46Hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747293106; c=relaxed/simple;
	bh=1G8SJmzthIYQS9Mfa6GXAFCys27UTYMWa72m1FIZe3k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hh+MeiG+lAeof+kL8HPvJ/JuGLJNeelEAzWwtilTt0EnNlbIcRZJ3pN9MoZ1eZ5Cc8HwmRZPBArRt5bzBYeo6T5scs0b9N/cvELy72hqpepAV7EglvVx/p8VknuSgOfolXtquxBLRYop1yZCyv73+G8JvZPJDjsZ/KegumsP+eQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QsjUiPPG; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747293105; x=1778829105;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=1G8SJmzthIYQS9Mfa6GXAFCys27UTYMWa72m1FIZe3k=;
  b=QsjUiPPGqaBKBRWlpfgz5t+887/i5lqnDI7FpKHNpAcPnJNsKE4x3bkf
   0fV4Emm1VHIFRmMALJz3I8yFhwUB4xOzWVdDNhKu/iAffPMJZ2vCe3ef2
   h9d0K0Bhr0PSTbNM5wF2oEvRaVTRcGrFn9ORvsoN5G/75JenBi/boKGX3
   Knanu1edCRKdx1vjuHTgVkklsrzFOhziEV2joUyiHrrLBJpC7c91GNhBf
   rK28PFgKDOe+IwFvffj/tvyY9AzzyQ5Kq+rCnhNOGLdcn75WPsSP1FYf6
   6+40kX/OSOKQuetfARNFF3sV8UuvlyCaqHMahIqGK1bJmb60CqQCS9yHK
   A==;
X-CSE-ConnectionGUID: b5+pk89xTLK1t4/ClMGTbw==
X-CSE-MsgGUID: OIcUbGeLQZ+mMkdJDKa4vg==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="49082706"
X-IronPort-AV: E=Sophos;i="6.15,290,1739865600"; 
   d="scan'208";a="49082706"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 00:11:42 -0700
X-CSE-ConnectionGUID: zcJAjzopSYyuooqQ/F4Xwg==
X-CSE-MsgGUID: 0moGxm5BTueu9NAnyt85Ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,290,1739865600"; 
   d="scan'208";a="139177420"
Received: from nneronin-mobl1.ger.corp.intel.com (HELO [10.245.120.28]) ([10.245.120.28])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 00:11:41 -0700
Message-ID: <736fca13-f53f-43eb-8fc3-c66e55e314c7@linux.intel.com>
Date: Thu, 15 May 2025 10:11:31 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Problematic Set TR Deq error handling series in xhci-next
To: =?UTF-8?Q?Micha=C5=82_Pecio?= <michal.pecio@gmail.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org
References: <20250509114138.7052dd3b@foxbook>
 <c606689d-e680-4796-bb65-87424a157e98@linux.intel.com>
 <20250514113431.632efb74@foxbook>
Content-Language: en-US
From: "Neronin, Niklas" <niklas.neronin@linux.intel.com>
In-Reply-To: <20250514113431.632efb74@foxbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 14/05/2025 12.34, Michał Pecio wrote:
> On Mon, 12 May 2025 16:02:06 +0300, Neronin, Niklas wrote:
>>> The case of "running" (or "halted", which "running" can morth into)
>>> is possibly more useful, because we assume it's caused by illegal
>>> state changes without driver's knowledge. But these are supposed to
>>> be detected and fixed by handle_cmd_stop_ep(), because they cause
>>> other problems too. It's unclear if retrying Stop Endpoint and Set
>>> TR Deq again will solve any case not solved yet, but risk exists of
>>> infinite retries on broken HW. (And HW is broken if we are here).  
>> The infinite retry loop is a good point, did not consider this.
>> But wouldn't the Stop EP command fail first, otherwise the state is
>> correct for the Set TR Deq?
> 
> ...
> 
> Either that, or handle_cmd_stop_ep() gives up retrying too early and
> a "late restart" condition is ignored. In the latter case, one more
> retry after Set Deq failure will likely stop the endpoint, but damage
> may already be done. Such bugs should be avoided in the first place.
> 
Thank you for the testing and review.
I've decided to hold off on the Set TR Deq series for now.

Best Regards,
Niklas


