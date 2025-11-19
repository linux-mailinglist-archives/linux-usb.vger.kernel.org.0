Return-Path: <linux-usb+bounces-30700-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C679C6F424
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 15:24:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B2D414FF9F4
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 14:00:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B674C31ED96;
	Wed, 19 Nov 2025 14:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="do4ZW1ZP"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E7CB23B60A
	for <linux-usb@vger.kernel.org>; Wed, 19 Nov 2025 14:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763560852; cv=none; b=JCZc4Ksn4ZbfzkJekyx05AeToRePZdl4k7oW/CdAMIGqPJq+ErEh50Kpun7qpLWEXe5lDizbhUa6ffC6ql66A6tncICTzbRIWsEYcipFUEdrydzY/Ta+7EGC5u9GjAx5y2FSktSVLLdqYvpODJzd9zPFQjeho3Gx8ggdvJzMpPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763560852; c=relaxed/simple;
	bh=qb+dhl9tbICU/SGQdusxXH/uL+b2TRZsfCyPbXW5TTY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fwyU2tThpn0lE+i48NowbgZpSaFmjjm+fDZyKqZFIqmK/iiN9niKJaaYS/0B3L4YsGfV9++RMO++CGtXV49ZkEMI306Eyhxc93wIvo0Hi7DKae3lyTZk2sqJCskxCWZ3n4SJzRiqP6R6W439OA0RfzvMbL2dZsMI4SJR+YDqIVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=do4ZW1ZP; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763560850; x=1795096850;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=qb+dhl9tbICU/SGQdusxXH/uL+b2TRZsfCyPbXW5TTY=;
  b=do4ZW1ZPkQBMVMWlIBrxym4kKvBG/IofrtOO6E3HaFBgTIAA4nNoSQ5S
   uYliN7yZNrdQqFbdSGx4B9OSoEARLW9shj8WSOkXk8yar0u7aLbV4qK7r
   Xx1FluIZe/GSGir3LxWPxDSlkYe+1jOHPf8AB1uWyjSceER+1p1EkeOBv
   2ZIQMJXLnWMO+EE54kOXoPYYDcX+/XcP8mQERzgQ/PHKQsGxGRcS3gQON
   WD7BBTD+ANSGthOBDw/JCWhlJd75n8YbWDqalOKBotN4vnM7q3ymiz6rP
   6fQxpfu51dj6m389aGOQzxw12jSoARlsYG6pwvHHwTolFhQWPG4QWIcTM
   A==;
X-CSE-ConnectionGUID: fmYiBiwqSVScxmxkxST0cw==
X-CSE-MsgGUID: efrSl0XHSaqLsHIdCbWGEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="82989136"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="82989136"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 06:00:47 -0800
X-CSE-ConnectionGUID: rATmUuaeTaKF35g/jJgdMA==
X-CSE-MsgGUID: AP7/Ij2xSGCDyw/1TUujMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="221983418"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO [10.245.244.20]) ([10.245.244.20])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 06:00:46 -0800
Message-ID: <19b2f1a5-8426-485a-b99e-cfc21cf1e035@linux.intel.com>
Date: Wed, 19 Nov 2025 16:00:44 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/13] usb: xhci: Host Controller Capability Registers
 rework
To: Niklas Neronin <niklas.neronin@linux.intel.com>
Cc: linux-usb@vger.kernel.org, michal.pecio@gmail.com
References: <20251113125640.2875608-1-niklas.neronin@linux.intel.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20251113125640.2875608-1-niklas.neronin@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/13/25 14:56, Niklas Neronin wrote:
> This patch series focuses on improving the definitions and organization of
> the Host Controller Capability Registers macros in the xhci driver.
> It is the first step in a larger effort to clean up and restructure the
> xhci header files for better readability and maintainability.
> 
> Because the Structural Parameters 1 register (part of the HC Capability
> Registers) relies heavily on xhci-caps.h, a few related patches from
> another ongoing rework have been included here as well. These address the
> handling of Max Ports and Max Interrupters values.
> The Max Slots handling will follow the same pattern in a future series.
> That change is more involved and will be submitted separately.
> 
> v2 changes:
>   * Change xhci_ist_in_microseconds() argument to 'xhci'.
>   * Rename xhci_ist_in_microseconds() to xhci_ist_microframes().
>   * Revert to (1 << x) from BIT() operaion in HCC_MAX_PSA() macro.
>   * Added macro changes to DWC3 driver.

I'm taking this series up to and including PATCH 11/13.
I tink we can get this into 6.19

PATCH 12/13 touches dwc3, we can look at the rest for next kernel

Thanks
Mathias



