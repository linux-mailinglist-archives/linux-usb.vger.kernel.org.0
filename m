Return-Path: <linux-usb+bounces-34860-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2EylEgjpt2mzWwEAu9opvQ
	(envelope-from <linux-usb+bounces-34860-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 12:27:04 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B210C298A5F
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 12:27:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 55655301CFC9
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 11:26:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12DDD351C37;
	Mon, 16 Mar 2026 11:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QEo+WNan"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 916FE280A5B;
	Mon, 16 Mar 2026 11:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773660413; cv=none; b=L0g0iJsvVUzaVT5KJLtRbrctLqkXt0TINrE5xKnTCUttOpvNt46WYxPTwjqBTMpcKXkG56WF4WiPSxHJ/BCDhbm6ZrmvfaD+z6ZtqChZewzyVFMlwDK2gOZofFJ/i1QNadqx9AxlJB2QnaguvOP/qsZspHzXW6J1ZQY1929LWxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773660413; c=relaxed/simple;
	bh=QetyuG1foWhX51Rr7BgxJ6T4Rbnm5Vn2HUNXepnr2z4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m7hhY9z8aoI3MDrDE4V2hO+FWU3zSluTIzW/v8Weq4c2NfpNzproIGQTDV8iUNuTENyPlPRICdhDE9Uq70msGbdpYHQCQwMN+At0QQbqyqWhBlbkSD6RNIx5pYBAp2cYRMBb8RdvVUS1IaF9u5UQ7vfR4tAXJlryP9WFRN+0sEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QEo+WNan; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773660413; x=1805196413;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QetyuG1foWhX51Rr7BgxJ6T4Rbnm5Vn2HUNXepnr2z4=;
  b=QEo+WNanjl7w3WW5FdzfCQu8DpOH0yEeR0qEhNkcPFAstkB6r6Z1z3fF
   ldUc4Hr6jixqj5UPc6WF+oqZUKp2Gnsfs4rOyhZJ/gZVL7/yi7Drb4Iaz
   GIYIUiBrvvH8AQM+mf4yya4iarUWNGUHQ8+zNExxXrBDp0MZMuh83O79B
   5H1nM3ed/fXWvCJyqrJ3o9PH+p+0fHzMdq4+JwAmXWNabErVuzIh5ei2n
   3iX3ut+jOQ+ZKGZssr/K5ErpHZySfhibixPcOvcq4ok/00phb26GDrKFu
   XtiNF3rjXDxrckgVq7APPn4VGMHb+QRsSUYhp6oGDBdOv7tH3586H/p/E
   Q==;
X-CSE-ConnectionGUID: ziYVFAC3Sue6J0RIpBUS5Q==
X-CSE-MsgGUID: p61wqQxrTey9dtTDw+fYWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11730"; a="74559235"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="74559235"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2026 04:26:53 -0700
X-CSE-ConnectionGUID: S0lDIxIQQMOiAABDkIGdQA==
X-CSE-MsgGUID: JA9DtR3XSXuxReN+3qQhvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="221970554"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa008.jf.intel.com with ESMTP; 16 Mar 2026 04:26:51 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id DFE5495; Mon, 16 Mar 2026 12:26:48 +0100 (CET)
Date: Mon, 16 Mar 2026 12:26:48 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-usb@vger.kernel.org, Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:KERNEL HARDENING (not covered by other areas):Keyword:b__counted_by(_le|_be)?b" <linux-hardening@vger.kernel.org>
Subject: Re: [PATCH] thunderbolt: use kzalloc_flex
Message-ID: <20260316112648.GC2275908@black.igk.intel.com>
References: <20260311232205.18137-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260311232205.18137-1-rosenp@gmail.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,kernel.org];
	TAGGED_FROM(0.00)[bounces-34860-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mika.westerberg@linux.intel.com,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B210C298A5F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Penev,

On Wed, Mar 11, 2026 at 04:22:05PM -0700, Rosen Penev wrote:
> Simplifies allocation by using a flexible arraay member.
> 
> Added __counted_by for extra runtime analysis.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

There is this report from LKP:

https://lore.kernel.org/linux-usb/202603121824.MZubfxH0-lkp@intel.com/

Please fix and resend.

