Return-Path: <linux-usb+bounces-27323-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C1077B381C1
	for <lists+linux-usb@lfdr.de>; Wed, 27 Aug 2025 13:54:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0E4E4368363
	for <lists+linux-usb@lfdr.de>; Wed, 27 Aug 2025 11:54:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBEE42F8BC8;
	Wed, 27 Aug 2025 11:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C2iIEuDJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE17722A7F9
	for <linux-usb@vger.kernel.org>; Wed, 27 Aug 2025 11:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756295643; cv=none; b=ffXcLbbxii1Fc+72JT7L2lq2cTL/uvfulOD7Nr1IPn/3tq27a52OmTCnL36qfgBy+W8dX9YXxUIeyxCUFlue9nBc+1vFOArkzWK9sYVflNmJXojJHEBiXcZeRwa5YxsKEMs/bvrSn6ublpXtzj5hE5dxYxf99z3W4d1o5of5fJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756295643; c=relaxed/simple;
	bh=VmgWlhMqDyT/9QyEcGf8x+TcB5gb7H+E3RrIw03crnI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=YeHJVh3ah40+9yHmp0/HIxz4IdRlz+2CeUSYlg4dUnWLXv78WwkiD658ifNgz0WwvaBUc8rG2qjRiwgkc7yB9+dYHLlM34r2WgxLN+gFXfmtnotYT6KXyuHq646W4HQ43PE9uUusktn2zoekJAGwLXDxHxIi/aTexk91irfZaTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C2iIEuDJ; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756295641; x=1787831641;
  h=message-id:date:mime-version:from:subject:to:cc:
   references:in-reply-to:content-transfer-encoding;
  bh=VmgWlhMqDyT/9QyEcGf8x+TcB5gb7H+E3RrIw03crnI=;
  b=C2iIEuDJKSSpIExZH9oIApTd++2WRZlyqDwkD7gP8cg8ZvfjnucMbZOq
   3psVZusRlFH71vyzzIn4Tn1UEj95xYZRShdnSBV520cGBS0diCTdHKpLb
   Hg7bYUe6pKDpX3oT7oRJm7AZfbHx+gzbNcZfbh/loxh0AGbfSrvuHuxwS
   CYpSpVpkZeojW+wbcwMNuzu/F9PE2V6YaE5bklTesO5Lwr1qEEvqPNtxd
   2q+h9+H79pzhvUjmh8U5u7xlw+/MPGTYhta4NkZa58eds2XgZvS41OiV1
   jv5s657ck8KesWbTCpCxC4zjsSyvzmgEyqgQEmNZwTVoHNttcniz5ATme
   A==;
X-CSE-ConnectionGUID: gix1TkcMShmkap0WZEL0OQ==
X-CSE-MsgGUID: IhUPNYzVTESgS2f3fglKaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11534"; a="46121352"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="46121352"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2025 04:54:00 -0700
X-CSE-ConnectionGUID: AL7DyD3tSpOrPR9bBuhICg==
X-CSE-MsgGUID: qRg/5UybRNqZaSxfiiltEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="169073846"
Received: from nneronin-mobl1.ger.corp.intel.com (HELO [10.245.83.145]) ([10.245.83.145])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2025 04:53:59 -0700
Message-ID: <7b70c5d1-b83a-4bce-8d3f-9e181a0329a6@linux.intel.com>
Date: Wed, 27 Aug 2025 14:53:14 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: "Neronin, Niklas" <niklas.neronin@linux.intel.com>
Subject: Re: [PATCH 4/4] usb: xhci: handle Set TR Deq Context State Error due
 to Endpoint state
To: =?UTF-8?Q?Micha=C5=82_Pecio?= <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@linux.intel.com>
References: <20250818125742.3572487-1-niklas.neronin@linux.intel.com>
 <20250818125742.3572487-5-niklas.neronin@linux.intel.com>
 <20250822101514.3a730f4f.michal.pecio@gmail.com>
 <20250825091552.350d027e.michal.pecio@gmail.com>
Content-Language: en-US
In-Reply-To: <20250825091552.350d027e.michal.pecio@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


Thank you for the thorough review and the additional debugging efforts;
they are greatly appreciated. :)


I want to clarify my intentions with this patch set:
1. Add exit points for as many error cases as possible. The function
   xhci_handle_cmd_set_deq() is tightly interwoven, causing any change to
   impact all completion cases. By adding exit points to error cases,
   future modifications can be more precise and targeted.

2. Keep it simple. Handle errors that do not require "fixing" and handle
   them simply. For example, Set TR Deq commands that failed because the
   command is no longer needed. In this case, the logical coding pattern
   is to free the command and return. This approach does not require the
   reader to know that a completion handler for some other command has
   freed the TDs.

3. Assume the cause of the errors are according to the xHCI specification,
   section 4.6.10.

With the above in mind, this is how each error IMO should be handled:

case COMP_TRB_ERROR:
	No known fix, print warning without specifying a reason.
case COMP_SLOT_NOT_ENABLED_ERROR:
	The Set TR Deq command is no longer needed, free and exit.
case COMP_CONTEXT_STATE_ERROR:
	case SLOT_STATE_ENABLED:
		The Set TR Deq command is no longer needed, free and exit.

	case EP_STATE_DISABLED:
		The Set TR Deq command is no longer needed, free and exit.
	case EP_STATE_RUNNING:
	case EP_STATE_HALTED:
		No simple fix, print detailed warning and proceed as usual.
	case EP_STATE_STOPPED:
	case EP_STATE_ERROR:
		IMO it is worthwhile to retry the Set TR Deq command.
		If we don't retry, the driver and hardware will become out
		of sync, which eventually leads to a crash. By retrying,
		we either succeed or still face a potential crash.
		But I'm open to simply printing a warning, as this should
		be an extremely uncommon error case.

> 1. I'm not aware of any known cases leading to this situation.

If that's the case, then we have successfully prevented the error,
which is the best outcome. :)
However, if it happens or a future unrelated change causes it to happen,
we have at least some error handling in place.

> 2. A loop which finds and updates the TD_CLEARING_CACHE item already
>    exists, so I think it would be better to modify this loop instead
>    of adding another one. And the loop prints some xhci_dbg(), so it
>    would be nice if they showed up in this case as well.

To keep things simple, it's better to keep them separate for now. 
This patch set is not the final version of the function; instead,
it's a small step.
However, adding a debug message to the 'td_cleanup' is a good idea.


That being said, I'll do some more testing for the cases you mentioned.
And it might be better as a first step to just print a detailed warning
and promptly exit the function for all error cases. Then in separate
patch sets add handling for specific error cases.

Best Regards
Niklas

