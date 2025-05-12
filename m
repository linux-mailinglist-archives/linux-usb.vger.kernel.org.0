Return-Path: <linux-usb+bounces-23865-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1713AAB37FF
	for <lists+linux-usb@lfdr.de>; Mon, 12 May 2025 15:02:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 234C13B5EB5
	for <lists+linux-usb@lfdr.de>; Mon, 12 May 2025 13:02:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD756293731;
	Mon, 12 May 2025 13:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LmkewqtI"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2214258CFB
	for <linux-usb@vger.kernel.org>; Mon, 12 May 2025 13:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747054939; cv=none; b=DeiLFHMkQsEWvFULiJcaLG614PVpYRVhdve9OXit5U7szTzhxwohMCBmm4AN4PK3jrzxzvGE8GYypGS9Ft59tfgbKDF72lvjkzQbViP3SRNmpJi24PUR22AnOlYz0O1eoEHI7SjutL7p/ZXJWxlCoFpEcF+S5+6OBZpDORyknxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747054939; c=relaxed/simple;
	bh=mdtAx2fLZGXRM4LKtvL1znZau5b6vQvK8zPRS6XxYXE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SQ5UfPd6R04zkLjMbt3O49Yx/sI4JaLJE68I7MVJO4kqSkTNIzyjqfZXwKQpfRX59imG8wEyJHV1zQFO1kJkJWiBxRAA4tMar8DVNQRoh2yKYZTHEnGpYV5ye+UP18Kb/WYJUWl0jPdeGaWJBQv1emI2EtgDDt3uW/RYZm3qcZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LmkewqtI; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747054937; x=1778590937;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=mdtAx2fLZGXRM4LKtvL1znZau5b6vQvK8zPRS6XxYXE=;
  b=LmkewqtIcYU/o1iZsC2ndX+craBKJFXmKcHbjAx2xgYoprdP/J/i4iG5
   UjcFtIxjBzMNktIWnWzm28zuOkLY7MOj+S2t7vGFTB7PiMPKdQwoT/Aav
   a4jO2M958WaiFXb2uwcZS5/sVLRILiD64MmHdbkyjzrMnaZ6qzzIGz/Ws
   4XuQXJGm9uThs7wl0sD6ytPS0Ew7xBtGUrlCpOUBDNits4xQv/T/51dbW
   3xwO34M80lIBG60lTg34EFYsqPywJDUzjCsG94IZ+Pnz6hLKPVTqyL5v2
   ND8mP0Iuvf1qx59tHaEKg8av9U3CuGzbH48WkEXsowEPrILWO6iY3yeid
   w==;
X-CSE-ConnectionGUID: fT1RftOxQGeKUYmwoDwXcA==
X-CSE-MsgGUID: 7huBKILSQsygz7wS4BgASA==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="60252772"
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; 
   d="scan'208";a="60252772"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 06:02:17 -0700
X-CSE-ConnectionGUID: lKLq16ZcQmODS6Uw+bX65w==
X-CSE-MsgGUID: fyirgvfAROyQr6dGWFSQ6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; 
   d="scan'208";a="137870789"
Received: from nneronin-mobl1.ger.corp.intel.com (HELO [10.245.253.251]) ([10.245.253.251])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 06:02:15 -0700
Message-ID: <c606689d-e680-4796-bb65-87424a157e98@linux.intel.com>
Date: Mon, 12 May 2025 16:02:06 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Problematic Set TR Deq error handling series in xhci-next
To: =?UTF-8?Q?Micha=C5=82_Pecio?= <michal.pecio@gmail.com>,
 Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-usb@vger.kernel.org
References: <20250509114138.7052dd3b@foxbook>
Content-Language: en-US
From: "Neronin, Niklas" <niklas.neronin@linux.intel.com>
In-Reply-To: <20250509114138.7052dd3b@foxbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



> I noticed that xhci/for-usb-next now includes a series which tries
> to handle Set TR Deq errors. It strikes me as a solution looking for
> a problem, and frankly creating new problems where none existed ;)

Hi,

The purpose of this series is to add some error handling and improve
warning messages. Fixing the root cause is another task altogether.

Before, the only difference between a Set TR Deq command failure
and success was that, in the case of failure, a warning was printed,
and the xhci driver ring dequeue pointer was not moved. Otherwise,
a Set TR Deq command failure behaved as if it were successful.

In my opinion, instead of ignoring the Set TR Deq errors it would be
better to retry the command if the error is due to something easily
fixed, such as wrong EP state or Slot state.
In the worst-case scenario, the xhci driver will still fail, but with
a more specific warning message.

> I am aware of three cases leading to errors being handled here, and
> none of them is addressed. One is harmless and easy to fix properly,
> but this series appears to turn it into a "never give back the URB"
> disaster. Tests pending, I hope to find some time this weekend.
> > ...
> 
> The case of "running" (or "halted", which "running" can morth into)
> is possibly more useful, because we assume it's caused by illegal
> state changes without driver's knowledge. But these are supposed to
> be detected and fixed by handle_cmd_stop_ep(), because they cause
> other problems too. It's unclear if retrying Stop Endpoint and Set
> TR Deq again will solve any case not solved yet, but risk exists of
> infinite retries on broken HW. (And HW is broken if we are here).
The infinite retry loop is a good point, did not consider this.
But wouldn't the Stop EP command fail first, otherwise the state is
correct for the Set TR Deq?

Do you still think these changes might result in more negative impacts
than positive ones?

Thank you for the review and comments.

Best Regards,
Niklas

> 
> Queuing a Soft Retry and then doing Set TR Deq out of the halted TD
> instead of restarting the ring is a weird thing to do and IDK if HW
> will get it right. IIRC, some ASMedia had issues in similar cases:
> it would retry the TD anyway, despite Set TR Deq.
> 
> ...
> 
> Regards,
> Michal


