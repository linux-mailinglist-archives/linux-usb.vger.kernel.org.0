Return-Path: <linux-usb+bounces-33751-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GJ3hGHmDoGkDkgQAu9opvQ
	(envelope-from <linux-usb+bounces-33751-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 26 Feb 2026 18:31:37 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF131AC793
	for <lists+linux-usb@lfdr.de>; Thu, 26 Feb 2026 18:31:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D662E315211C
	for <lists+linux-usb@lfdr.de>; Thu, 26 Feb 2026 16:59:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5E8E429827;
	Thu, 26 Feb 2026 16:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HSS0dCj0"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD480423A83;
	Thu, 26 Feb 2026 16:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772124250; cv=none; b=XYrMRobdEYrnH7O9vR/EhqS52GXFW8iViurSG0jhRtR96cEfU7hO0vOhqSEqll+R2zfKtWvuBfhMg4smbz+fTMk9EUGu9EKpJ6XhHwxHsCjoGLRhHl0jqcGnlZ0MNhKJk9g7YtPRa8DrnMu6PsyLo3I0MbY7SLY8Nzsg8B7W0yQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772124250; c=relaxed/simple;
	bh=7dKWMwT/O2PlQf5BVGfcabh9d+0bFRlULY77i+YBJLs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cpkzQNTlL94i3O6to8hZQhP/uum7W14OqffCo0K+Jl4stwFy4Z719riauLp7z0voeTBf6BGRO4w7oNhId8OtXkuJCZ/uE4erlX2kl4wKoPpV997XpQ9XuY2TRPZOXZOA1QtxzbShBMQ/F/uzP3z+pyE5U1Gc+24oed5toP5E99k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HSS0dCj0; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772124249; x=1803660249;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=7dKWMwT/O2PlQf5BVGfcabh9d+0bFRlULY77i+YBJLs=;
  b=HSS0dCj0fmkcr9dU9+JzIY68ogZpiKy8pr93Jd48C7d9kzg0air8A5aJ
   S+FPCzPSuwDYx5BeBwMLIKIyOBFM3hCJYMy96haDlwmYP4EHHY5ZjItxE
   D7F/yQP0SpJjDLdKhjk6CscJXzobrPXSk92QGrTIQuGCr03OKznUl7jpV
   2W4R8AuX/fyMjzV6ISJ7wKVFCJ+TYw/e5HZiNzflWVD74kFiSqzTfX9ZA
   t4KZFx6feq7B53ozKGjkroVpXwirzQixvnwIylx3NVLEuPUxvrKUINSx8
   7FWjvl93GgAsqQUMSgfCUtbH1P7Vxcp4Fn8nBiVeiQurZQYWrCclzPg4J
   w==;
X-CSE-ConnectionGUID: taE2ThIBTmWsOCllu6nPQw==
X-CSE-MsgGUID: lDNmCX+XRB2hDNU3rQke/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="60765714"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="60765714"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 08:44:08 -0800
X-CSE-ConnectionGUID: IGU0+H4JRLm3e1viC1FyUA==
X-CSE-MsgGUID: +AgIzeksT1GjXM6bMMEihA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="221135351"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO [10.245.244.225]) ([10.245.244.225])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 08:44:05 -0800
Message-ID: <871991ab-6c8f-47d4-a5b4-b65751750e71@linux.intel.com>
Date: Thu, 26 Feb 2026 18:44:02 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: xhci: add xhci_halt() for HCE Handling
To: Dayu Jiang <jiangdayu@xiaomi.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mathias Nyman <mathias.nyman@intel.com>,
 Longfang Liu <liulongfang@huawei.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, yudongbin <yudongbin@xiaomi.com>,
 guhuinan <guhuinan@xiaomi.com>, chenyu45 <chenyu45@xiaomi.com>,
 mahongwei3 <mahongwei3@xiaomi.com>
References: <20260127110422.306711-1-jiangdayu@xiaomi.com>
 <2026012708-liability-sincere-5ed4@gregkh>
 <aXnNcQa5Ooq2wIX2@oa-jiangdayu.localdomain>
 <2026012857-deprive-putdown-0ee8@gregkh>
 <aaAR5VOtnMhvoCem@oa-jiangdayu.localdomain>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <aaAR5VOtnMhvoCem@oa-jiangdayu.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33751-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mathias.nyman@linux.intel.com,linux-usb@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DDF131AC793
X-Rspamd-Action: no action

On 2/26/26 11:27, Dayu Jiang wrote:
> Hi Greg,
> 
> I have updated the changelog text as requested and resubmitted the patch.
> https://lore.kernel.org/linux-usb/20260128100746.561626-1-jiangdayu@xiaomi.com/
> Please kindly review it and let me know if it is acceptable now.

I'll send it forward, but changed the commit message.
Does this modified version still describe the case accurately:

usb: xhci: Prevent interrupt storm on host controller error (HCE)

The xHCI controller reports a Host Controller Error (HCE) in UAS Storage
Device plug/unplug scenarios on Android devices, which is checked in
xhci_irq() function and causes an interrupt storm (since the interrupt
isn’t cleared), leading to severe system-level faults.

When the xHC controller reports HCE in the interrupt handler, the driver
only logs a warning and assumes xHC activity will stop. The interrupt storm
does however continue until driver manually disables xHC interrupt and
stops the controller by calling xhci_halt().

The change is made in xhci_irq() function where STS_HCE status is
checked, mirroring the existing error handling pattern used for
STS_FATAL errors.

This only fixes the interrupt storm. Proper HCE recovery requires resetting
and re-initializing the xHC.

Thanks
Mathias

