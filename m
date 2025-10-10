Return-Path: <linux-usb+bounces-29118-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 824EABCD39B
	for <lists+linux-usb@lfdr.de>; Fri, 10 Oct 2025 15:24:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7A2F74F246C
	for <lists+linux-usb@lfdr.de>; Fri, 10 Oct 2025 13:24:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80A8C285CB6;
	Fri, 10 Oct 2025 13:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZOtOiwnb"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D572877DC
	for <linux-usb@vger.kernel.org>; Fri, 10 Oct 2025 13:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760102679; cv=none; b=cDLXJf8GNlsTMMtUduuTC4J1Sy1iXzOsxu+VBlyq/lBBQfhXNrcjZBaVTaXBgg46KqRwVPgrtpjDKnY4Ef5T5WkEqJUIMAD89wgC3HLmtPc08jPl8GDn3PMQiMt9/A+/VBd2s6W+ywosjB/HKlB+3pnqD6UBopJE+4mSscYVSTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760102679; c=relaxed/simple;
	bh=huP+hwpAUDoZ35mrIgUibiVz+5cVWzvlvcF58CgRXrY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l+ewZ8W/2+fQbl1C6rP5uueIf+W9uE1vuza5XnYRy2+qLw+ky6fBVu7FYMaTewH9Zu2MYHM684xHZ5pxqm2elbiLxKMF+RbCkw402mY6A3Tdf6g+CBv4g7WEDypnnCBcSTwOT7ZB/KSp62rsmIZAO8hFb35os783N+/odJWkw+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZOtOiwnb; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760102676; x=1791638676;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=huP+hwpAUDoZ35mrIgUibiVz+5cVWzvlvcF58CgRXrY=;
  b=ZOtOiwnbD32dqWrZIdRI4pWbVHU97+yh5X2nthI9FbS+GGY4As/uMs8z
   mE4fbgrVKb9Pcf82wA+xDcxrngwprLFjmbAlVFClww5BpSuqub0W8y+Oi
   mzcFIhWJcVwx7qRcoPfmM8nNKcPceEIFtol591WsyJZvVORz5pJnPT/n4
   912YX7sYDEsiSusotJXxHjj2OgaOaXUsdZAINQd8Bnrn+nHy86+BvGVUS
   sMQxo+mC1O9FMFoHisb8idfTK/NxbbGoDbJpi7iiKgsh0EQIoT6J2LBvc
   k+UVxtfN9VoOEjC5pffKIiLJRH2GZ2fgh5sn5TY68XMzRiQsxzBD1Vxlw
   A==;
X-CSE-ConnectionGUID: E4iWEugISCqRa+h7xeXMcw==
X-CSE-MsgGUID: gWWWyynhTkqFcIGZViimmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11578"; a="62363913"
X-IronPort-AV: E=Sophos;i="6.19,219,1754982000"; 
   d="scan'208";a="62363913"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2025 06:24:36 -0700
X-CSE-ConnectionGUID: Bwkgr6qtS3Wk7q4dACpQVA==
X-CSE-MsgGUID: oIyU18QYReKJIj+cGusFWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,219,1754982000"; 
   d="scan'208";a="211926854"
Received: from nneronin-mobl1.ger.corp.intel.com (HELO [10.94.249.136]) ([10.94.249.136])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2025 06:24:34 -0700
Message-ID: <fa978117-a751-4c66-aa87-adaf6cfc6a11@linux.intel.com>
Date: Fri, 10 Oct 2025 16:24:20 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Regression - commit 719de070f764 usb: xhci-pci: add support for
 hosts with zero USB3 ports
To: Michal Kubecek <mkubecek@suse.cz>
Cc: mathias.nyman@linux.intel.com, linux-usb@vger.kernel.org,
 Nick Nielsen <nick.kainielsen@free.fr>, grm1 <grm1@mailbox.org>
References: <20250826100416.207129-1-niklas.neronin@linux.intel.com>
 <lnb5bum7dnzkn3fc7gq6hwigslebo7o4ccflcvsc3lvdgnu7el@fvqpobbdoapl>
Content-Language: en-US
From: "Neronin, Niklas" <niklas.neronin@linux.intel.com>
In-Reply-To: <lnb5bum7dnzkn3fc7gq6hwigslebo7o4ccflcvsc3lvdgnu7el@fvqpobbdoapl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/10/2025 16.12, Michal Kubecek wrote:
> On Tue, Aug 26, 2025 at 12:04:16PM GMT, Niklas Neronin wrote:
>> Add xhci support for PCI hosts that have zero USB3 ports.
>> Avoid creating a shared Host Controller Driver (HCD) when there is only
>> one root hub. Additionally, all references to 'xhci->shared_hcd' are now
>> checked before use.
>>
>> Only xhci-pci.c requires modification to accommodate this change, as the
>> xhci core already supports configurations with zero USB3 ports. This
>> capability was introduced when xHCI Platform and MediaTek added support
>> for zero USB3 ports.
>>
>> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=220181
>> Tested-by: Nick Nielsen <nick.kainielsen@free.fr>
>> Tested-by: grm1 <grm1@mailbox.org>
>> Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
> 
> Hello,
> 
> while testing 6.18 merge window snapshots, I hit an issue which bisected
> to this patch, mainline commit 719de070f764 ("usb: xhci-pci: add support
> for hosts with zero USB3 ports").
> 
> When booting any kernel with it, my keyboard attached to USB port
> intended for it does not respond. Comparing the logs between "good" and
> "bad" kernel boot, it looks like hubs 9 and 10 are not detected at all
> when booting a kernel with commit 719de070f764.
> 

Hello,

Thank you for reporting.

A fix has been proposed in this thread:
https://lore.kernel.org/linux-usb/CABpa4MA9unucCoKtSdzJyOLjHNVy+Cwgz5AnAxPkKw6vuox1Nw@mail.gmail.com/

The specific fix:
https://lore.kernel.org/linux-usb/20251009142911.6069c164.michal.pecio@gmail.com/

Best Regards,
Niklas


