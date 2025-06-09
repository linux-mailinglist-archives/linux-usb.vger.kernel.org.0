Return-Path: <linux-usb+bounces-24598-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A12AD1E01
	for <lists+linux-usb@lfdr.de>; Mon,  9 Jun 2025 14:42:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C0F4116AE94
	for <lists+linux-usb@lfdr.de>; Mon,  9 Jun 2025 12:42:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E05DE1E0DCB;
	Mon,  9 Jun 2025 12:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HMl4FPua"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E11EA273FD
	for <linux-usb@vger.kernel.org>; Mon,  9 Jun 2025 12:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749472974; cv=none; b=nYuNZyXjMFzlDVHZ8GQ6TAY8UTg8EQ5YzVhcMKb0T19fHgv6Yy4y8beG6HQkr3tmtgL41dhs4JxWGdabkyZVXpkFVEdJbn33PTOcsF52+GFWrE3sw1vSI84cblV/ZLxd1SP9mOBt+1Wgl3K/P8LGx7AcR9/JLf4i71tH1oaHmKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749472974; c=relaxed/simple;
	bh=VJhm32WqzNxmNXYeSvwo9FjWKn3seWLVlyuIOYKkRvc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QLn5gIm8JBiLgPs5uNBxqU8USQoev2dEaHF+9mCU4gC2nbBtRt2LkGHII41ZdjsBkpC9xMIGJlpuLOjo23MJHa8cck+nNkMH6eyR+w53lPU/MEt+Yzgv4kHPvGa9cbBmxDuobhvBnhMplxYK95nyyw+Y6iTO+hQjC7/2JxsHXDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HMl4FPua; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749472973; x=1781008973;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=VJhm32WqzNxmNXYeSvwo9FjWKn3seWLVlyuIOYKkRvc=;
  b=HMl4FPua6x8W+CCq8f+PdUKEecynSn4B8rGXPDCkEMLFJJu9iQMqUY6K
   IuG0ChOvzNiYwlcHKwuYshfSS4Su16+Vp3/OTQDBt4HTwV9mzoctCZHAA
   Jyx/l4XxFWc5bcgmSbM+lB7ZJEMk3qzSeFki9DjqoMXzmIqOopmyqXdr3
   Lg+swtLo5h4oowXXDsGldRk6wzhpS0J3h2gEkV/DPfK502OPTCAOCGXEM
   eshGAXe893/7ZEZjQDkin/XohuQpNQnPhz/N+29yb7JrCfwDQUPpwZ/i0
   SqsBWFT7Rd9DcZGXFQMfUa0YfYKrpMCRcZQCJvkTPWn2g81uKa50RAfQN
   A==;
X-CSE-ConnectionGUID: AaXX0fcjS2O6y/X4Wwku7Q==
X-CSE-MsgGUID: CNljqY35SGe64LqLFb7xJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="51252252"
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; 
   d="scan'208";a="51252252"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 05:42:53 -0700
X-CSE-ConnectionGUID: dnhRhrIJSla+PsJfo1SnMQ==
X-CSE-MsgGUID: fTPOeDv6QkSIxMdqIYOOqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; 
   d="scan'208";a="146430586"
Received: from unknown (HELO [10.237.72.199]) ([10.237.72.199])
  by orviesa010.jf.intel.com with ESMTP; 09 Jun 2025 05:42:51 -0700
Message-ID: <12a8fd39-e910-4558-8fec-d41d2eecfd15@linux.intel.com>
Date: Mon, 9 Jun 2025 15:42:49 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] usb: xhci: Avoid showing errors during surprise
 removal
To: Mario Limonciello <superm1@kernel.org>, mario.limonciello@amd.com,
 mathias.nyman@intel.com, gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org
References: <20250609020223.269407-1-superm1@kernel.org>
 <20250609020223.269407-4-superm1@kernel.org>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20250609020223.269407-4-superm1@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9.6.2025 4.58, Mario Limonciello wrote:
> From: Mario Limonciello <mario.limonciello@amd.com>
> 
> When a USB4 dock is unplugged from a system it won't respond to ring
> events. The PCI core handles the surprise removal event and notifies
> all PCI drivers. The XHCI PCI driver sets a flag that the device is
> being removed as well.
> 
> When that flag is set don't show messages in the cleanup path for
> marking the controller dead.
> 
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

Acked-by: Mathias Nyman <mathias.nyman@linux.intel.com>


