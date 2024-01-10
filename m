Return-Path: <linux-usb+bounces-4915-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1416A829AB2
	for <lists+linux-usb@lfdr.de>; Wed, 10 Jan 2024 13:54:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3A9A11C25B2B
	for <lists+linux-usb@lfdr.de>; Wed, 10 Jan 2024 12:54:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C34048799;
	Wed, 10 Jan 2024 12:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fEfY/Vyy"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AA1A482F9
	for <linux-usb@vger.kernel.org>; Wed, 10 Jan 2024 12:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704891252; x=1736427252;
  h=message-id:date:mime-version:to:cc:references:from:
   subject:in-reply-to:content-transfer-encoding;
  bh=wTpoowwTvm1PyeCGdfgyrqzjvoVH1whfIwX9QlJen3Y=;
  b=fEfY/Vyy+ygsgII2OYizVzdGUdLAQ7OJpUszz3AxMZR1oBJDDaXGCwU8
   B3SPSZuilT8ZUQavqKajdqYObs/OBgPwxKPYglXSKbCaYYSx+UN9Kb2Qg
   o7Gobl45QtWBSqYGKTEhSYMA8XvwMxwkd0prz0NrAuUAfAjfX6qIyGbmF
   R8rRWuBu+Zx4E/x+KbAjsszVTHE2CLASgCmsKuNDfFYidwtEp/1LYT8Y+
   lIA3/+VYrE4KmXhbz98nUsXYVPCe0GMsL7VvCwmBIPnSMqyNjLzRxXufx
   sbZ20DNSMO/zKnIbcJ5GK9rAfUCP7taIMw4wJaXzZfmLR8UAzo973uVPW
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10948"; a="5866277"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; 
   d="scan'208";a="5866277"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2024 04:54:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10948"; a="731851828"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; 
   d="scan'208";a="731851828"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by orsmga003.jf.intel.com with ESMTP; 10 Jan 2024 04:54:09 -0800
Message-ID: <d79dce2c-c321-bdda-c8df-b7e781a0566f@linux.intel.com>
Date: Wed, 10 Jan 2024 14:55:38 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-usb@vger.kernel.org
References: <ffaa0a1b-5984-4a1f-bfd3-9184630a97b9@moroto.mountain>
From: Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [bug report] xhci: add support to allocate several interrupters
In-Reply-To: <ffaa0a1b-5984-4a1f-bfd3-9184630a97b9@moroto.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi

On 10.1.2024 13.31, Dan Carpenter wrote:
> Hello Mathias Nyman,
> 
> The patch c99b38c41234: "xhci: add support to allocate several
> interrupters" from Jan 2, 2024 (linux-next), leads to the following
> Smatch static checker warning:
> 
> 	drivers/usb/host/xhci-mem.c:1873 xhci_remove_secondary_interrupter()
> 	error: we previously assumed 'ir' could be null (see line 1865)
> 
> drivers/usb/host/xhci-mem.c
>      1863
>      1864         /* interrupter 0 is primary interrupter, don't touch it */
>      1865         if (!ir || !ir->intr_num || ir->intr_num >= xhci->max_interrupters)
>      1866                 xhci_dbg(xhci, "Invalid secondary interrupter, can't remove\n");
> 
> This debug message is kind of pointless...  The Oops will have the stack
> trace already.

Ah, there's a return statement missing here.

Thanks for the report
Mathias


