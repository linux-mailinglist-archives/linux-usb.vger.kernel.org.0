Return-Path: <linux-usb+bounces-35814-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AARqCumdzWm9fQYAu9opvQ
	(envelope-from <linux-usb+bounces-35814-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 00:36:25 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE1438104B
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 00:36:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 69451302925F
	for <lists+linux-usb@lfdr.de>; Wed,  1 Apr 2026 22:35:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6492341AB6;
	Wed,  1 Apr 2026 22:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QpzjlcK5"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35CCB3C3C01
	for <linux-usb@vger.kernel.org>; Wed,  1 Apr 2026 22:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775082915; cv=none; b=cD3N+XBgc6/sVGzA884xNa7zbwHtR1yFJkS2V1ePVtq10zMco/6da2c1hgW0GFkK+pNtN+sWfCUDjOEGHnDFi4vE1AFYBSMp5FOnvp05GkVUfx58JJYApolkxf9RjgTymnj9cf4Men5zFGbiccSIAwuOnuqlk9RjR3efOXtbijk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775082915; c=relaxed/simple;
	bh=Mn5GEeyXHxiDa8vdjegRewqqo1b1PN95NUyc1xFUFtE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FQuAstWyo9YFK0wukf/2JPeaQXiekwRg1ma9aKZxXKecYf1ztX13otXU8BM5yz0w1pIDrYPXvkYRk+OKcI2dZwImHdCvGG35WI62JO5srIyKdhBSycacbVVIkOLUJIiCmCpE6/rINfF8W+Q+mz9gPxr53INOLC2/tdDms1n2Uc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QpzjlcK5; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775082903; x=1806618903;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Mn5GEeyXHxiDa8vdjegRewqqo1b1PN95NUyc1xFUFtE=;
  b=QpzjlcK5e4YnrdTjq+Rqjl85228JDqdQCZTo4gGUSV8q474qtRzYoZ5V
   QEQ8Rb+itAx6ftWleKUve7y5oDPeDFvDh+6mp1i5p1L5kAsgeyc2mpity
   cbkFhkmhe9Htp7GhrhRA9lv07+kA6mcN/jS2QFkTguXKLmwqLqe9nqy47
   1SYJJca+cfKQZTmFaZYL5iyi7HaZ1E6PgWOJyysOn8pgeYQlh4FfVvKOm
   QqgIOtfjRw5ac5ufz5CaHZ0QtLhQujPsiJsnpw+OGRU+/Oy/y3BA4/eMx
   CuBzGWnfioq64tPxB5e3J51n4YBxRo19NnhlEWKXfSAkeh4Un0V6Kcvs+
   g==;
X-CSE-ConnectionGUID: HGuyy7ckTMiXzbj7fsPTYA==
X-CSE-MsgGUID: rvxMgJ+dTKe9kGBp2u9Tjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="76151652"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="76151652"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2026 15:34:59 -0700
X-CSE-ConnectionGUID: hZCgaVzKSvyxBoLc0fVf+Q==
X-CSE-MsgGUID: MsRqWQcKQse+rp6sZV4qZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="222442754"
Received: from vpanait-mobl.ger.corp.intel.com (HELO [10.245.244.145]) ([10.245.244.145])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2026 15:34:57 -0700
Message-ID: <aa2f5418-5070-403a-8fcf-ed6169662e9e@linux.intel.com>
Date: Thu, 2 Apr 2026 01:34:55 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/2] xhci: prevent automatic endpoint restart after
 stall or error
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "stern@rowland.harvard.edu" <stern@rowland.harvard.edu>,
 "michal.pecio@gmail.com" <michal.pecio@gmail.com>,
 "oneukum@suse.com" <oneukum@suse.com>,
 "niklas.neronin@linux.intel.com" <niklas.neronin@linux.intel.com>
References: <20260323122512.2019893-1-mathias.nyman@linux.intel.com>
 <20260323122512.2019893-2-mathias.nyman@linux.intel.com>
 <20260325015110.v4r5smfvdd62fcua@synopsys.com>
 <0f38e10d-ecac-4beb-ad2c-3a42c2546c3c@linux.intel.com>
 <20260326011910.t7ijezht7g7ttrec@synopsys.com>
 <9cf4008e-2d12-4025-809a-8d9371f45dac@linux.intel.com>
 <20260326232400.zkplsxflhykhayyb@synopsys.com>
 <2604e951-01e8-44d0-a11e-be63b0849c23@linux.intel.com>
 <20260401220816.ynyhgxr5yoeszoea@synopsys.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20260401220816.ynyhgxr5yoeszoea@synopsys.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35814-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,rowland.harvard.edu,gmail.com,suse.com,linux.intel.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mathias.nyman@linux.intel.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim]
X-Rspamd-Queue-Id: 5EE1438104B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/2/26 01:08, Thinh Nguyen wrote:
> On Mon, Mar 30, 2026, Mathias Nyman wrote:
>>
>>>
>>> On a separate note, will you plan to implement the clear-halt for EPROTO
>>> in xhci?
>>
>> I don't think this should be part of xhci driver. Decision to send control requests
>> to the device should be done by core or class drivers.
>>
> 
> This not like STALL where it's standardized for the core or class driver
> to know how to handle. The programming sequence for the errors that
> resulted in EPROTO from xhci is specific to xhci. That is, the xhci
> reset endpoint command will reset the bulk sequence, it's specific to
> xhci. The xhci spec recommends to send a clear-halt for this scenario,
> not the USB spec or any other class specific spec. So we should not
> delegate this to the core or class driver to handle.
> 
USB 2 Specification does mention handling halt conditions due to  transmission
erros _OR_ STALL handshake with clearing halt and resetting both host and device
endpoint toggle.

See USB 2

5.7.5 Interrupt Transfer Data Sequences

"If a halt condition is detected on an interrupt pipe due to transmission errors or
  a STALL handshake being returned from the endpoint, all pending IRPs are retired.
  Removal of the halt condition is achieved via software intervention through a
  separate control pipe. This recovery will reset the data toggle bit to DATA0 for
  the endpoint on both the host and the device"

5.8.5 Bulk Transfer Data Sequences

"If a halt condition is detected on a bulk pipe due to transmission errors or a
  STALL handshake being returned from the endpoint, all pending IRPs are retired.
  Removal of the halt condition is achieved via software intervention through a
  separate control pipe. This recovery will reset the data toggle bit to DATA0
  for the endpoint on both the host and the device"

Thanks
Mathias

