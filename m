Return-Path: <linux-usb+bounces-32576-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ELAUJvhzcGlSYAAAu9opvQ
	(envelope-from <linux-usb+bounces-32576-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jan 2026 07:36:40 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3835F521FA
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jan 2026 07:36:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A6AEF42A0FA
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jan 2026 06:36:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65E7844A710;
	Wed, 21 Jan 2026 06:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Eo1nHP1A"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644D1266576;
	Wed, 21 Jan 2026 06:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768977354; cv=none; b=FqZB25Jw1FCI2deSnSWuoK5X7iHq3P/8f1+XPxtKB/UIKJdW7F2YknrnRBO4T5GO70A9Iw/FNV0/WVO/uJ8IAGRALfDNgDmQiOGCb9siKyOPS0iCqWZAwzco3qWzuoaidHfMxIXC/YcnEBIrIeAE+H7Uyi1Hu7jZPBzYlmEHUPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768977354; c=relaxed/simple;
	bh=Uxl4oBc6+HNd1D3LlqKHIX/MQOTfbJGg1oqcepCdolY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hs/0iRQ0THiugnif7DNAJcNwxRqZNX19gAn7WTHJ6hNe74OU/aSSYuQTudUs+J98LDbyKv0pUtG2b+jkub6EZOFhcx8TBKZF7hSwiK+4PFI7WXC4ClA9R8cIVH2d/XqeHEjim9PF6wePFNAYQJxrf7fLPjBlXawxUCIk5wVbnOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Eo1nHP1A; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768977352; x=1800513352;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Uxl4oBc6+HNd1D3LlqKHIX/MQOTfbJGg1oqcepCdolY=;
  b=Eo1nHP1AXL3kJ+CIZYuG53L2Qjxr6EojsOK1b67/0MJn+Evgg+mY3WEr
   5PZ0j+m17VJXNyJ75qrCGkC4XxpVz4cFios7fiLZVPzHFvze9ph3i8bi0
   gcdFJOXivgXdKr202Pzl/nJnBd1QeqCULJpbbSxMqi+WVXoiMlgPI9aWb
   8CAWWXpfErb924+SyXZO6e7/MCiPgQGVx9GbxP8Q7nBi2/Kzm31Sd9oyk
   /9h5sGdWgO6y4ydH5FqhguBRE61CggtrdEepTGmOHylwmZa03P9CFehZO
   jfo81QM1b3Q6ToyTzepsTJDbjgq5gVyYeafo8jhzM1QEgCX3GGw+xHNsW
   A==;
X-CSE-ConnectionGUID: dy2h/bq9Q/a2iFNlp+38fg==
X-CSE-MsgGUID: GXToY1BpRHyWbkvvIG0X1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="74066624"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="74066624"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 22:35:48 -0800
X-CSE-ConnectionGUID: mMA5jUPfQ2ecSzD6N7837g==
X-CSE-MsgGUID: LcZ2Sy7nSkiegZllA/87RA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="206414790"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa008.jf.intel.com with ESMTP; 20 Jan 2026 22:35:45 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id B2BC795; Wed, 21 Jan 2026 07:35:44 +0100 (CET)
Date: Wed, 21 Jan 2026 07:35:44 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
Cc: Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] thunderbolt: Fix PCIe device enumeration with delayed
 rescan
Message-ID: <20260121063544.GL2275908@black.igk.intel.com>
References: <20260121060857.237777-1-acelan.kao@canonical.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260121060857.237777-1-acelan.kao@canonical.com>
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-32576-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[intel.com,none];
	DKIM_TRACE(0.00)[intel.com:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mika.westerberg@linux.intel.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,intel.com:dkim,black.igk.intel.com:mid]
X-Rspamd-Queue-Id: 3835F521FA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Jan 21, 2026 at 02:08:57PM +0800, Chia-Lin Kao (AceLan) wrote:
> PCIe devices behind Thunderbolt tunnels may fail to enumerate when
> spurious hotplug events prevent pciehp from detecting link-up.

See my reply for the v1. Let's discuss there.

