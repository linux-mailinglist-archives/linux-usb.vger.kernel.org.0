Return-Path: <linux-usb+bounces-35457-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AO1ADiPfw2kgugQAu9opvQ
	(envelope-from <linux-usb+bounces-35457-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 25 Mar 2026 14:12:03 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B3CB33257EA
	for <lists+linux-usb@lfdr.de>; Wed, 25 Mar 2026 14:12:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A997731A0229
	for <lists+linux-usb@lfdr.de>; Wed, 25 Mar 2026 12:28:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 931E43D412C;
	Wed, 25 Mar 2026 12:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LoaORlSW"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05E943D349F;
	Wed, 25 Mar 2026 12:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774441680; cv=none; b=dR26oBfIcvyeyxsLsJ6W6ZS3Peod01EXBe2dAw4bWgDUAH+BJa03o1TCfQl+tsS44/axhrUnc9ZvvJ7EJAXhvF4JD8Sq0yW6WvgUazcJx926sOlhpNP+V9L/U5t23gCTzB9a9B6eocK2izQTfy9kbcOUb7qlmUCex5b4Nn3C1uQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774441680; c=relaxed/simple;
	bh=IByB2XwCRydQfIDr3lH49NKDx9ONCF9CIQqUcUApv9U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cfZVH/uaM/LX4RViWKFTjV23UH2PGUU2yWGs2E8VH7gs3Fxa8/sx010IQDJuYnupKDpUBgD7ieDzGR0BzPrOQ1qWgS18UTbOhzs72omxFrIqrZXLgMd1KXizbJcMzEwbeptV/UFGdwzCUrFJ4pZ6MuuxiakhxbPRov5dKvxyNtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LoaORlSW; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774441679; x=1805977679;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=IByB2XwCRydQfIDr3lH49NKDx9ONCF9CIQqUcUApv9U=;
  b=LoaORlSWeacSeHR1t3FHGpS225upSMsNU93q/ahz5j1yAbH/hCiQ5qWQ
   AqkzIZuZcSmDUvNghnoMXaXKEkGTfybnzJTQebHMJf2iioVV1m00bgEPR
   /oX4Wa6vRwcD62bJ0eCZMlwMeENvfQ0lRhaunXKSGrZjxyV5iiil6v1JS
   /y/CK5gjZe0GKdD/H5Fehggh0n7bmcI/NT05N2GXrBuwx0XSDscs71ztC
   bdM8AD6gtGz/Ys4IFvUrMxkrG5qPIYTzQgklgfgA7sLJ2rHW+C9Xt9Z9P
   VrjjkIFx2M53H/84cTUa1H3v/FUuxoRNTnLxuKkkuo+1Gap5hYueoVZFe
   w==;
X-CSE-ConnectionGUID: fqx2Xk/lQ8qbmEER1xr9Xg==
X-CSE-MsgGUID: h5NIVm0vRtmiat/bAjPmJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="93052983"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="93052983"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 05:27:58 -0700
X-CSE-ConnectionGUID: 6Q0tGT3ISruaRCOl/ZTTkg==
X-CSE-MsgGUID: UxvnzVIWQbWogWZhsMjhNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="224929338"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.245.106]) ([10.245.245.106])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 05:27:57 -0700
Message-ID: <8b94065d-b7b9-4964-803f-c2f2b58becb3@linux.intel.com>
Date: Wed, 25 Mar 2026 14:27:54 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: xhci: Simplify clearing the Event Interrupt bit
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Niklas Neronin <niklas.neronin@linux.intel.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260304114224.62814449.michal.pecio@gmail.com>
 <408ff4ce-1020-472c-9526-312ba8ea2ae1@linux.intel.com>
 <20260320211809.705e0cbd.michal.pecio@gmail.com>
 <20260320212831.0bbabf25.michal.pecio@gmail.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20260320212831.0bbabf25.michal.pecio@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-35457-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mathias.nyman@linux.intel.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux.intel.com:mid]
X-Rspamd-Queue-Id: B3CB33257EA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/20/26 22:28, Michal Pecio wrote:
> On Fri, 20 Mar 2026 21:18:09 +0100, Michal Pecio wrote:
>> Several other cards (VL805, FL1100, uPD720202, ASM1142, ASM3142) wake
>> from s2idle but not S3, including with a keyboard.
>>
>> No difference if this patch is reverted, no difference if PCD is
>> explicitly cleared in xhci_suspend(). And same problem in Windows.
>> Looks like a HW deficiency in those cards.
> 
> Actually it's quite obvious: I know for sure that some of them derive
> Vbus from the 12V rail, and chances are that the others also do.
> 
> Now I'm surprised that NEC and Etron cards bothered to make it work.
> Looks like PCIe cards aren't the best option for testing suspend.

Thanks for testing and clarifying

Adding this patch to queue

-Mathias

