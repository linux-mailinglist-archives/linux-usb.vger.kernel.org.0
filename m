Return-Path: <linux-usb+bounces-31907-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD01CF33E5
	for <lists+linux-usb@lfdr.de>; Mon, 05 Jan 2026 12:27:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 17B07302AAE9
	for <lists+linux-usb@lfdr.de>; Mon,  5 Jan 2026 11:26:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A53833BBB7;
	Mon,  5 Jan 2026 11:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gzn/E+fl"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B136E33B6EF;
	Mon,  5 Jan 2026 11:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767611825; cv=none; b=iLLgF5ySO5yI6fsx0a8aV25QEgQKgkn9QT+5XUpYk2oCWnpaBF9VfwWJABqgYwj8sjbRl7yTF4L0K6YTGZdAsEOROccYn3/ndPQXeUYTpcktgequZ0HU0E5l/DwPYDkGZFQd+RBBjZ9cgi0GSJAqzyZhbfumZ/JMq1WgGQDQzVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767611825; c=relaxed/simple;
	bh=XbS3rGAeIXvoU7BVYTho6eyjseaL/HV7CJbdpQ/GQfM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kxUd7UKV7+I2W+PWvhN5/OAx3v/UIjgB2/J8U0asMO6pjHYvEaVaVzWlTzffUPY/7ysoHeUKPZJ38gOK5T9MvzgLFI9Ao9LobYh6xmNIzaLheJ9c72gs4UozI1aZFO/2DAW2Ja7H0gcLPDCHwcHWU7iaW1dXBbRMWXnJkn2LwI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gzn/E+fl; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767611824; x=1799147824;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XbS3rGAeIXvoU7BVYTho6eyjseaL/HV7CJbdpQ/GQfM=;
  b=gzn/E+flIcW5J5WhUy4Aw+X0q+ZU3eEM2xYUvktE5vUGm1uWqnsXN/Bk
   Puwo2DMbNBNh7wcWeG+2ZStzW31g34AB0KRnCYHn3fS0xCHIzqQJBJcq8
   RDgfPyx1E6lct6uSoyvBplVDbZpNc9JwYlJ3zsmJ/WAEYh+uLsKlzlfNb
   gT1Coxdq+nyxhuNZDVmOEOF4HS6YZXJWG+6Rkq3Kqw0u7Z5V9NFjuxbRZ
   JSrQ5WXb4PTYghK0OnioMfMeQ88j5L2XXHZd5REacs+VGcQ/YYeTetzIu
   o7li5ok+QLbDg4Ma2fmGGWxCsJVfeSj9KwZdtIWdg7NRuZAKR2lNKEKZk
   g==;
X-CSE-ConnectionGUID: 3IDADS0tQnS1VKDgwt9AOg==
X-CSE-MsgGUID: DW+t2H4rQnO0qoetRqZECw==
X-IronPort-AV: E=McAfee;i="6800,10657,11661"; a="56536157"
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; 
   d="scan'208";a="56536157"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2026 03:17:01 -0800
X-CSE-ConnectionGUID: UKe5/PhLQcODhR+XLi48+g==
X-CSE-MsgGUID: kZPViZ8PR62D+kuNpKx5EQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; 
   d="scan'208";a="207401354"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa005.jf.intel.com with ESMTP; 05 Jan 2026 03:16:59 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id DF01995; Mon, 05 Jan 2026 12:16:57 +0100 (CET)
Date: Mon, 5 Jan 2026 12:16:57 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
Cc: Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] thunderbolt: log path activation failures without WARN
 backtraces
Message-ID: <20260105111657.GL2275908@black.igk.intel.com>
References: <20260102031905.27416-1-acelan.kao@canonical.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260102031905.27416-1-acelan.kao@canonical.com>

On Fri, Jan 02, 2026 at 11:19:05AM +0800, Chia-Lin Kao (AceLan) wrote:
> tb_path_activate() currently logs failures with tb_WARN(), which triggers
> a stack trace. Transient conditions such as lane bonding or Type-C link
> hiccups can fail path activation briefly, and the resulting backtraces are
> noisy without aiding diagnosis.
> 
> Switch to tb_warn() for all path activation failures. The error code is
> already returned to callers, and the warning still shows the message
> without the backtrace.
> 
> Signed-off-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>

Applied to thunderbolt.git/next, thanks!

