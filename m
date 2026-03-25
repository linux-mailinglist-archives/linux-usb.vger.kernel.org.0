Return-Path: <linux-usb+bounces-35456-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2MBsO2Tcw2lwuQQAu9opvQ
	(envelope-from <linux-usb+bounces-35456-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 25 Mar 2026 14:00:20 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 170E132554D
	for <lists+linux-usb@lfdr.de>; Wed, 25 Mar 2026 14:00:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B5E773026BDA
	for <lists+linux-usb@lfdr.de>; Wed, 25 Mar 2026 12:24:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B2533D16F5;
	Wed, 25 Mar 2026 12:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UcSZK9Oq"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF36533A6E9;
	Wed, 25 Mar 2026 12:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774441490; cv=none; b=sSF4TAy7x3LgKPtaTL9J3wHTApJ/7LF/QW6s6DhW4uyEQPEJwlcwsV4m22gZ/gvG2RsNilGA09DMfXfIxKWVKsyLN/KiK0Q3idhs8NJB+1Mp+CCy0Eq09oen9cHV9gCx6OjqL4i4c4mAa0XjnxjHMy5xN3r/jE4u/B/Gw98SW7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774441490; c=relaxed/simple;
	bh=ALWKNvVNm0+2r3Ry2QG32tAeoyhy7TVqmqpTEmbO2Kw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lj2QSQ1uSAG8R3EJeVOpYTLmLf5Nl/AyFz0ApiYc6B9aXiUgwLvAkBXMI5Cw7HwnPakY+2BkC28Gc8abiehekC7jHTFAL9gXG1CwmV89CEo4b9mV/LEMIojtgyoV11yBXjNHRwcyoBwtJVzOa5mSNGOEmq6JNXsl8o+puZ1psWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UcSZK9Oq; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774441489; x=1805977489;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=ALWKNvVNm0+2r3Ry2QG32tAeoyhy7TVqmqpTEmbO2Kw=;
  b=UcSZK9Oq5P/FEtsTwqWcmW+WZzr5aNMZiTeDZ99KZloCMJEi+FpM6Whh
   p7WdEhnmwn5SqT/MREA8JUQ69tb5mAEWxPdeOGpu86SrEJRABG0vh0lwG
   iqVQmtBLynlXgR+KgXY33ZjMcts2g3X45h1KNixF5TdNGWt55lqOLoVCZ
   /pvPalMhQ9VTMnI0KhkyqCtKNuHW5kflKbIN0brUIoHqRluyD0uorLSxg
   uODCdmjmO2sK8FRZi3WUf39gVXfykXsjox9ucZ51kDh0te25XKZKLiqLs
   0daNqAS7JS9tFxn28+6HlTc81Aq56sys/V6Ayfe20ACkRno7EncBvHmra
   w==;
X-CSE-ConnectionGUID: S6d3ug8gSbyXnsKanwMpLQ==
X-CSE-MsgGUID: 1lwjvAPETQ2Mjj02yXqEzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="75363446"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="75363446"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 05:24:49 -0700
X-CSE-ConnectionGUID: 9BW7yyEAQaKCWYAUnfO/RQ==
X-CSE-MsgGUID: fvTQur7XR22g/4FM1CTggA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="248184268"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.245.106]) ([10.245.245.106])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 05:24:47 -0700
Message-ID: <a6d6478e-e6a9-430c-a8f9-1d003d949c2f@linux.intel.com>
Date: Wed, 25 Mar 2026 14:24:44 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: xhci: Fix debugfs bandwidth reporting
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Xu Rao
 <raoxu@uniontech.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260304114928.110be4c4.michal.pecio@gmail.com>
 <d9ae5a8b-3aa0-451e-8a42-80ef73e2d210@linux.intel.com>
 <20260325113246.07681667.michal.pecio@gmail.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20260325113246.07681667.michal.pecio@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35456-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mathias.nyman@linux.intel.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linux.intel.com:mid]
X-Rspamd-Queue-Id: 170E132554D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/25/26 12:32, Michal Pecio wrote:
> On Thu, 19 Mar 2026 23:04:38 +0200, Mathias Nyman wrote:
>> On 3/4/26 12:49, Michal Pecio wrote:
>>> Replace kernel USB speed numbers with xHCI protocol IDs expected by HW.
>>> They are numerically equal up to high speed, but instead of SuperSpeed
>>> we were querying SuperSpeed+.
>>>
>>> Gen1 hardware rejects such commands with TRB Error, which resulted in
>>> zero available bandwidth being shown.
>>>
>>> While at that, report command failure as IO error, not zero bandwidth.
>>>
>>> Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
>>
>> Added to queue
> 
> Hi,
> 
> Thanks for taking the patch, but can we have a last minute swap for
> a v2 or optionally v3?
> 

Sure, no problem.

> Problem is that returning -EIO is common (the command is optional)
> and it upsets userspace: "grep -r" spams the console with errors,
> "zip -R" terminates and doesn't include remaining files, etc.
> So I would prefer to print an error string in this case.
> "Real" errors will still be returned ordinarily.
> 
> The optional v3 also renames the new directory for consistency.
> Technically it's a breaking change, but I believe it's permissible
> in debugfs, particularly for an interface only added recently.
> 

lets stick with v2, avoiding possible breakage due to debugfs file rename.

Thanks
Mathias


