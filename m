Return-Path: <linux-usb+bounces-31532-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E521CC6C3F
	for <lists+linux-usb@lfdr.de>; Wed, 17 Dec 2025 10:20:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3AF5E3009123
	for <lists+linux-usb@lfdr.de>; Wed, 17 Dec 2025 09:20:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28E57335BAD;
	Wed, 17 Dec 2025 09:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J4RaxtWy"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A521E277CAF
	for <linux-usb@vger.kernel.org>; Wed, 17 Dec 2025 09:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765963209; cv=none; b=TJhQZatGzgJIvyLyosnn7+Ak1kv34Ya+WvWMgVpeztvsoZTUbcbfOCTT6YeKENUK3LTmmD9284SiYkly3u4rELR2F0fny4T8UixdmI/Oys9bjzHBZ7hIjus61N2AyzjA2QRI2yR0jFxS6qpQCJ3iaJaKcza8ls+Wi7oNBM6HusI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765963209; c=relaxed/simple;
	bh=EqsNkSe7MbjBh7uxJgp+Rcx20ReweAPn3zHN/qPSNTU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l6indCA/nI+0PklKXykAkgkTJ2l4+FFfTF6+XWqOYK0jWpZu77RyIJDkojWQZCiiBgpidoAFrHh/x4T/3BHKEWlX3kEHQYAkvBVYs29aZPY61b5MlU9BfM9f9fp/JLbpkMFxoqvZb0o6qE4iU7iC3RSJdb1Q9UWMWitgqxdS3S0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J4RaxtWy; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765963208; x=1797499208;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=EqsNkSe7MbjBh7uxJgp+Rcx20ReweAPn3zHN/qPSNTU=;
  b=J4RaxtWymi9lc/9tZDKM3Fh1bvL2w9HfWN27v8gJlj0y6oil0ZyM8dAC
   6G5MsPj+Z3QDWLAFO+DpTZ4PQGgduPvwfgL3zzCWX9D8DuDMSGFt6pnQq
   Z0cJI9fvqp+PNsNV9y2g4eX5zBxEXIP5Ld3wK9kGWcO4oywYoAzEgzMhW
   zfPWBzLHAZlGB+VIZeP6t5TxsspfuiAG4eGL2azbafswD1Ua9M7REsTFh
   qnVLI3hBtoIup/Dxnzxbv9wp7SJBoEk3u6CSOHzCtCoAJ730YE21tH4tj
   Vc7IRc+AijYLBA82fD664PymAi6gsGv94nfKkRyLAqyoW2RuUm9rttQ8g
   w==;
X-CSE-ConnectionGUID: hLcsI2+uTdqnTDtKFzeqgA==
X-CSE-MsgGUID: 6iWg/4rDR5WmsHbRcN9i6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="85311941"
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; 
   d="scan'208";a="85311941"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2025 01:20:05 -0800
X-CSE-ConnectionGUID: Zzedy3grQsSuin0sHqlF+g==
X-CSE-MsgGUID: NKqrGPOqSseW/0LObowvOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; 
   d="scan'208";a="203161274"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO [10.245.245.160]) ([10.245.245.160])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2025 01:20:03 -0800
Message-ID: <05f48b2f-6f84-49b6-ab5b-44b5c488cc7e@linux.intel.com>
Date: Wed, 17 Dec 2025 11:20:01 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Fwd: USB DBC hang during earlyprintk initialization
To: Milan Oravec <migo.oravec@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
References: <CAAcb1K_MJKWz+BYJmx0FDgrBOzzXm71-M7sgHDUOmBRppXWNzA@mail.gmail.com>
 <CAAcb1K_a2dkj5wv__1BW-fu_Zg=z00OmQzJmekQ-GH4svYQ-GQ@mail.gmail.com>
 <f0d0f71c-bc47-4348-85a6-d728a67c982a@linux.intel.com>
 <CAAcb1K-o7DY3Kvqdr+=MN8OsgRZr+g43-zC6YSLG0hbNxEQUeg@mail.gmail.com>
 <8fe27842-8155-44db-b262-a148b5ce5436@linux.intel.com>
 <CAAcb1K9MDvqJgVbV29ax8tQhXoepJr5ABuh1NHoNpmFdnGxVHw@mail.gmail.com>
 <65b65e02-e51e-4e7e-ae9e-78d755eb8566@linux.intel.com>
 <ba3692e7-6818-41af-8748-71a91cb13db5@linux.intel.com>
 <CAAcb1K9X+ZgigmiQ9btvV5vs+1UmxyZC39RCnS0tVZZUuYjToQ@mail.gmail.com>
 <9dc78bbb-b9db-4ab3-8cd9-bac40e0c8653@linux.intel.com>
 <CAAcb1K_piCRo07Jf3Bzd9tzH9HKxPFisPARGE6OZOhd55-NLyQ@mail.gmail.com>
 <CAAcb1K9QEzaDnTKZJ1AiZ18iLL50z91F6BOB=uj47ma2NLwM8g@mail.gmail.com>
 <aa85ca5c-1594-4775-8d88-141690c2ab56@linux.intel.com>
 <CAAcb1K9hiyWaUOk_KHLDEWc9055zWLa0RFQfpU7N=E_zFoXPPg@mail.gmail.com>
 <CAAcb1K-dcYC5cViGQdJZpr5FvgaOYVzisyQYQWCB1WTZaJP_bw@mail.gmail.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <CAAcb1K-dcYC5cViGQdJZpr5FvgaOYVzisyQYQWCB1WTZaJP_bw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi

On 12/5/25 20:49, Milan Oravec wrote:
> Hello Mathias, I've replaced cat with minicom in the script above and
> let minicom capture the file. First minicom displayed no messages,
> then I realised I need to press and hold enter to be able see messages
> sent from debug target.

You shouldn't need to do that, something is set up oddly.

> 
> Computer hangs and needs a long press of the power button to recover.
> Boot cmd used:
> linux /vmlinuz root=UUID=584262b6-b020-4e4f-95a3-1db754e28b6c
> earlyprintk=keep,xdbc2 debug ignore_loglevel sysrq_always_enabled
> force_early_printk sched_verbose usbcore.autosuspend=-1
> no_console_suspend resume=UUID=54ed98b5-56c0-4ab9-95ea-da1a9322ce49
> 
> I've attached a captured log from deminicom.
> 
> What should I try next?

early_xdbc_write() is called every time a new entry is written to console.
It only uses one transfer buffer, (one TRB).
early_xdbc_write() will block for up to 2 seconds in a udelay loop waiting
for the previous transfer to complete.

blocking for 2 seconds on every console message doesn't sound reasonable.
Maybe for the first message to make sure other side is set up and reading the data.

I'm also not sure the "keep" flag works.
Once the actual xhci driver binds to the device it will reset the controller , losing
DBC capability and console.

You could try without the keep flag, and setting timeout to 100ms instead of 2 seconds

diff --git a/drivers/usb/early/xhci-dbc.c b/drivers/usb/early/xhci-dbc.c
index 41118bba9197..515a172ba25b 100644
--- a/drivers/usb/early/xhci-dbc.c
+++ b/drivers/usb/early/xhci-dbc.c
@@ -855,7 +855,7 @@ static int xdbc_bulk_write(const char *bytes, int size)
  	xdbc_handle_events();
  
  	/* Check completion of the previous request: */
-	if ((xdbc.flags & XDBC_FLAGS_OUT_PROCESS) && (timeout < 2000000)) {
+	if ((xdbc.flags & XDBC_FLAGS_OUT_PROCESS) && (timeout < 100000)) {
  		raw_spin_unlock_irqrestore(&xdbc.lock, flags);
  		udelay(100);
  		timeout += 100;

Thanks
Mathias


