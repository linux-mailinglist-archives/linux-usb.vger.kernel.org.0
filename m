Return-Path: <linux-usb+bounces-37280-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gPIQIs4vAmq/ogEAu9opvQ
	(envelope-from <linux-usb+bounces-37280-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 21:36:46 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 998C55152B6
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 21:36:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5C6073039CA9
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 19:36:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BD4A4D2EEE;
	Mon, 11 May 2026 19:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gVGBXAZa"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 754834534A9
	for <linux-usb@vger.kernel.org>; Mon, 11 May 2026 19:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778528167; cv=none; b=JKTWDdbLsHlCPN6NvZIWkKmlMSAnw3MBW3iHd5nBWZEpJJdUCRhg8spK1Ry1hvOlxCoXHvlF5nul4xOQ/E3kdThUzOvzBAkW1X5q5aRvZnM23Gb1f5gLFfij4Drm5elxHthMe6bsvBVf14kbhEvMnX9KXzxaSYNWTN8NX0FsoDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778528167; c=relaxed/simple;
	bh=uV3FvdeBefYvOg1SwTosZJq3hPp+d6+Vk93YaUI42F4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q8An6qjIW6moxGWH1GJ1B3aFAd1q2ivMKlnwpvg67PVR5lCHnuYx0EHJ7FTTvcZcCfIJ/9Z7QJt6icAUiuODTtywYecdZxlPnzQc+EtAJCVwbD1aoq7hwdGr4WNiTnZXOj7WLowktf0GSdz4k1623iI41vxIVcQDzYbknHS6NQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gVGBXAZa; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778528165; x=1810064165;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=uV3FvdeBefYvOg1SwTosZJq3hPp+d6+Vk93YaUI42F4=;
  b=gVGBXAZaQHvoAtkuNpxJKcZgIiPAI6s5oRTAWo9qDzPhXGaA4fOBxP4t
   1SEN2UNA+Oh3PWTWOEsQkt9bcdrJI5ITpcX84mkuKd5qLCxEtrTiemE15
   Qn1XIPr9mZFtvci1FBk2ASNUUvqi+FZsaNMNSbi9dLZEOPQkb3XLQ4FfI
   51ymI7n6GiqzQNLnNWV9WwfI5BtTBr1DM3IVO/36Tif4+4jjCynyVmQB/
   pDFwm8Dhn+VtNb3fCFh/XQtSaatP1oJO6s4IoyS6QOVerDg85Cffc3eTk
   WNE1aeHJTcRVIHfNfqfExdtJpPBYwHKVFQLGQW2zhOJuypqJ7HTt3q+qo
   w==;
X-CSE-ConnectionGUID: So5fxrNbQnKzLt7sXfRyZg==
X-CSE-MsgGUID: uJZNvV88RLK45tubOceSSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="78459461"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; 
   d="scan'208";a="78459461"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 12:36:05 -0700
X-CSE-ConnectionGUID: 9US7mhYLQZuEmHYTGW0hQw==
X-CSE-MsgGUID: v3mldMBiR7Gr1F5jjbGnjA==
X-ExtLoop1: 1
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO [10.245.245.61]) ([10.245.245.61])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 12:36:03 -0700
Message-ID: <3ba5b536-4131-46b2-a4ac-8971c8feb0b3@linux.intel.com>
Date: Mon, 11 May 2026 22:36:01 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFT PATCH] xhci: fix frame id calculation for isoc transfer
To: dylan_robinson@motu.com
Cc: linux-usb@vger.kernel.org, mathias.nyman@intel.com,
 michal.pecio@gmail.com, stern@rowland.harvard.edu
References: <CA+Df+jeoj_QL6XNzUyP963HF7ngCWoAs0MjqQXPr3Fa6VW3rXw@mail.gmail.com>
 <20260511192105.3756809-1-mathias.nyman@linux.intel.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20260511192105.3756809-1-mathias.nyman@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 998C55152B6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,intel.com,gmail.com,rowland.harvard.edu];
	TAGGED_FROM(0.00)[bounces-37280-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mathias.nyman@linux.intel.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email,intel.com:dkim,linux.intel.com:mid]
X-Rspamd-Action: no action

On 5/11/26 22:21, Mathias Nyman wrote:
> Always calculate estimated start frame, and set urb->start_frame
> 
> Fix valid frame window start and end calculation to match xhci
> spec 4.11.2.5
> 
> Don't inclease frame id with 1 if a URB mod transfer is queued late.
> Queue it with next expected frame ID but print a message if URB is
> next expected frame id does not fir valid frame window range (URB mid
> transfer is queued late)
> 
> This patch doesn't switch to URB_ISO_ASAP /SIA scheduling if URB is queued
> late, not sure if that would help as it only moves the frame id glitch
> problem forward, unless _every_ URB queued after a late URB is forced to
> use SIA, which again would defeat the point of Frame ID use.
> 
> get rid of the annoying 'xep' and 'xdev' variables, xhci driver uses
> ep and vdev naming everywhere else
> 
> Contains some FIXMEs, patch for initial testing purposes
> 
> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> ---

Butchered the commit message but code should be testable

First URB is aligned to full frame, or to interval start if interval is longer
than a frame

For urbs queued mid isoch transfer we check if the next expected frame id
is withinh the accepted frame window, but only print a message if not.
It doesn't alter the expected start frame id, or switch to URB_ISO_ASAP/SIA
scheduling if the check fails.

Always calculate and set urb->start_frame.

URBs with intrval less than a frame do not need to be aligned to entire frame,
next urb can continue mid frame.

-Mathias


