Return-Path: <linux-usb+bounces-35662-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GPk+APViymn27gUAu9opvQ
	(envelope-from <linux-usb+bounces-35662-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 13:48:05 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C93635A837
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 13:48:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F1ACF305F194
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 11:45:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BC293C5525;
	Mon, 30 Mar 2026 11:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QrP9Nzst"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED3413C6A2B
	for <linux-usb@vger.kernel.org>; Mon, 30 Mar 2026 11:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774871099; cv=none; b=L8JrJUvG74tpgR2D1xmcIBYN/NpSLV6ABsm7xsmIrs9DzFABjQG3iQ+pHpj1g5hrQQ7dv5zjhfEh0NXDOPvtdjqIJHmuztphEbEGqI+jSwfXS2MNB2Rt1XWeziTUFBzNNYOxhHTYAN/KaOimm5OTUOABDCELHur3pt+wnNsGZac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774871099; c=relaxed/simple;
	bh=2gwNHPgx7diOc+6eOq9eGZo0wBqjAvb/jUl9K0S1PhA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=B51lAnH3qHtVQR+MeF9tfoN7/bcNFdKB1j5rvVpIofr39hh6rfY5bM9GDiR+sMWPlY7jfqKWk+eybtKTkYJDcXVwH/PkWGe/Adxfynci9mQsRInCtAOL8kEFOMn2j/1Bme8ImxKmdLfq8Bl9aKCXkeRFiobdKzHxw1cdXxPpswk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QrP9Nzst; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774871098; x=1806407098;
  h=message-id:date:mime-version:from:subject:to:cc:
   references:in-reply-to:content-transfer-encoding;
  bh=2gwNHPgx7diOc+6eOq9eGZo0wBqjAvb/jUl9K0S1PhA=;
  b=QrP9NzstXI+BKZu3S5FK12AeaH8uVrw0VFUA5DsYhEjvV46PmzrAWvIb
   7soXZKqewPN5JVkcUuWM2IWD3B5TpyHBw7N+UAfq3J938/wyixM7OyFiu
   oxtWVxM/SDfcfwCPJB53wkBiBiP7ZrVnJSl8mptHdpp7eSQI7X3MGXHXs
   qE+X13osE2sUodDj8D1sh+CTJUdwrFhwzwxqQhVLYYeiFcEjVlxr1ODKL
   uPFREVBblI3OtrYQ+NZdNFccmj/Nr9C4EY5pID/ZLdlJcyXWi5uc2NA9R
   ZVyzUizDdNeoljGhmp+fNAbb+ilW+gLHrc3Q8JfMLtJ0/5GkBQYXP/EU8
   w==;
X-CSE-ConnectionGUID: E0sNAEucS5GybUr11ao7pQ==
X-CSE-MsgGUID: nnvDPoRPQyGoj22Ory63ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="76053014"
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="76053014"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 04:44:57 -0700
X-CSE-ConnectionGUID: aWy0k28tRxCu/J+L0mxqpQ==
X-CSE-MsgGUID: C9d2karvSNezUFooL0iDBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="225208921"
Received: from nneronin-mobl1.ger.corp.intel.com (HELO [10.94.250.130]) ([10.94.250.130])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 04:44:56 -0700
Message-ID: <3778537d-6eee-4f62-a851-6259199ec768@linux.intel.com>
Date: Mon, 30 Mar 2026 14:44:52 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: "Neronin, Niklas" <niklas.neronin@linux.intel.com>
Subject: Re: [PATCH 8/9] usb: xhci: improve debug messages during suspend
To: Michal Pecio <michal.pecio@gmail.com>
Cc: mathias.nyman@linux.intel.com, linux-usb@vger.kernel.org,
 raoxu@uniontech.com
References: <20260327123441.806564-1-niklas.neronin@linux.intel.com>
 <20260327123441.806564-9-niklas.neronin@linux.intel.com>
 <20260330111421.65c2eb06.michal.pecio@gmail.com>
Content-Language: en-US
In-Reply-To: <20260330111421.65c2eb06.michal.pecio@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-35662-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.neronin@linux.intel.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5C93635A837
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 30/03/2026 12.14, Michal Pecio wrote:
>>
>> Currently, the SRE error is only observed and warning is printed.
>> This patch does not introduce deeper error handling, as the correct
>> response is unclear and changes to suspend behavior may risk
>> regressions once the resume path is updated.
> 
> I think patch 10/9 should add setting xhci->broken_suspend if this is
> detected. It's ridiculous to try State Restore after State Save error.
> At best, it should fail. At worst, it might not fail...

I plan to follow‑up with a cleanup/optimization patch after this patch set.
(Forgot to mention this in the cover letter)

The primary goal of this initial patch set is narrowly scoped:
to change resume handling from a full teardown and reinitialization,
to a minimal reset‑and‑restore flow. This has a higher risk of triggering
issues on some hardware.
Because of that, I deliberately avoided refactoring or optimizing
unrelated xhci code in this first step. Keeping changes minimal to helps
isolate resume issues, if they arise :)

Once this new resume path has had broader testing and any regressions
are resolved, I intend to follow up with cleanup and optimization patches,
where the surrounding code can be refactored with less risk of obscuring
resume memory state issues.

Thanks,
Niklas

