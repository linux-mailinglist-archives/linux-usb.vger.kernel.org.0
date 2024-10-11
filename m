Return-Path: <linux-usb+bounces-16079-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9319199A2A6
	for <lists+linux-usb@lfdr.de>; Fri, 11 Oct 2024 13:24:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4184B284EAA
	for <lists+linux-usb@lfdr.de>; Fri, 11 Oct 2024 11:24:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2790F21502F;
	Fri, 11 Oct 2024 11:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aqW1xKFy"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5332E20C46C
	for <linux-usb@vger.kernel.org>; Fri, 11 Oct 2024 11:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728645856; cv=none; b=sPVksSVMYjNqOFTjwmGbLm0hmR8PmEsXXvqVGCYhXiwUe1vdgCZQoAaRLtgucx3Ay+GOo33kfpHD1+hgWcnhZjj+ZX8aAy3CMlgbJYfR1w1Jum5WXYl0ptrm+oZ0cUeNHiq746s88vawXN2xyIvVSc+R2DPrE6pRuI5bC5MAEns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728645856; c=relaxed/simple;
	bh=EYll+E0fitBF+f8YuB3+wgtVI++e0hO09DKxhjFoHcI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WoxMsRgn92GdzRB7/FG9XdfHcaIl8rctUAqoHiXdQUGtFrmj4cKZ5ejOSzSX4qQTw4x580yShhG3j7qaspdcLXUNuAt6zZ2d1u+TbijPbZGffb5RS8CC1XZH+Sm2wPrM8ZkiIUMzEl6oq31CJyCBCs5NhmewAxupiAvg7seZMU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aqW1xKFy; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728645855; x=1760181855;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EYll+E0fitBF+f8YuB3+wgtVI++e0hO09DKxhjFoHcI=;
  b=aqW1xKFycbc5V5qHflYtUtVppV3Lvri1JUvk9bqnITLWvVhYIkQMW167
   xfvz2tNCd1/p60qUcy6kkJr9Putxn3satjX9npo90wekEzd9S1GOCKFnC
   V1clIhoYOvU99bDmN85QV67dQbD1OhKjyZNKVrQy3F0icPC/cPM6m6iKm
   o1nzZMH5nvlynbGC8AabIQ95b6gMrz9DknUx26/T2WpNnB4I+nCSZ7P0N
   flFI8k0Hou7RhPUvJ9zshFjA+8/gQzVDvKiPa9o8iqymoYIHJA9+higv8
   Kd88+WXt4Utlws1WeUkNzbmUE+fF4Rz5wAe9+xKYrduDZbKy4NKDB38bG
   g==;
X-CSE-ConnectionGUID: RcCQ1Uv4TweFvn5eFhrxbg==
X-CSE-MsgGUID: eFdoGe6vQLyI5LQXh0TMFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="28132065"
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; 
   d="scan'208";a="28132065"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2024 04:24:15 -0700
X-CSE-ConnectionGUID: tsWQO4BLQkaC/dFSRdQaEQ==
X-CSE-MsgGUID: WlAexTMqRt6/aAZgj5ZVvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; 
   d="scan'208";a="77188885"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa010.fm.intel.com with ESMTP; 11 Oct 2024 04:24:13 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 0A7A4184; Fri, 11 Oct 2024 14:24:11 +0300 (EEST)
Date: Fri, 11 Oct 2024 14:24:11 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: [PATCH] thunderbolt: Fix KASAN reported stack out-of-bounds read
 in tb_retimer_scan()
Message-ID: <20241011112411.GI275077@black.fi.intel.com>
References: <20241009060701.2434897-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241009060701.2434897-1-mika.westerberg@linux.intel.com>

On Wed, Oct 09, 2024 at 09:07:01AM +0300, Mika Westerberg wrote:
> KASAN reported following issue:
> 
>  BUG: KASAN: stack-out-of-bounds in tb_retimer_scan+0xffe/0x1550 [thunderbolt]
>  Read of size 4 at addr ffff88810111fc1c by task kworker/u56:0/11
>  CPU: 0 UID: 0 PID: 11 Comm: kworker/u56:0 Tainted: G     U             6.11.0+ #1387
>  Tainted: [U]=USER
>  Workqueue: thunderbolt0 tb_handle_hotplug [thunderbolt]
>  Call Trace:
>   <TASK>
>   dump_stack_lvl+0x6c/0x90
>   print_report+0xd1/0x630
>   kasan_report+0xdb/0x110
>   __asan_report_load4_noabort+0x14/0x20
>   tb_retimer_scan+0xffe/0x1550 [thunderbolt]
>   tb_scan_port+0xa6f/0x2060 [thunderbolt]
>   tb_handle_hotplug+0x17b1/0x3080 [thunderbolt]
>   process_one_work+0x626/0x1100
>   worker_thread+0x6c8/0xfa0
>   kthread+0x2c8/0x3a0
>   ret_from_fork+0x3a/0x80
>   ret_from_fork_asm+0x1a/0x30
> 
> This happens because the loop variable still gets incremented by one so
> max becomes 3 instead of 2, and this makes the second loop read past the
> the array declared on the stack.
> 
> Fix this by assigning to max directly in the loop body.
> 
> Fixes: ff6ab055e070 ("thunderbolt: Add receiver lane margining support for retimers")
> CC: stable@vger.kernel.org
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Applied to thunderbolt.git/fixes.

