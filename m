Return-Path: <linux-usb+bounces-31906-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F2CCACF31FB
	for <lists+linux-usb@lfdr.de>; Mon, 05 Jan 2026 12:03:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8F8F6301F3C9
	for <lists+linux-usb@lfdr.de>; Mon,  5 Jan 2026 11:02:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77FD42F39B9;
	Mon,  5 Jan 2026 11:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QaO2q6LA"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06308286D5D;
	Mon,  5 Jan 2026 11:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767610935; cv=none; b=u3GjQ6CUEVuZh0HOTmvYnJLtAoM8zS08SqnbXuSKsZiXIHWnZ2r5BnWrhK1qp0KzvfLd6oQz6qlm0Oh8NH2f0+lEHXyc8KFw5EhhXDpAooIaR45r1oasVFwkH90kYNmpbDSKFHwDe/w7Seq1NBCHatxt+4Y4PlkuKnGQCq464sE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767610935; c=relaxed/simple;
	bh=pHP2D1BgYaYQ8DgAa2gFsL9KyNwEmylQzHmEOL7BH7Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fJ18re/EcQQqBO4XdLxzPcwLxdL2JMlUPM356unJJ36UxDYoSX6Kl7qyvPjD5MIvVdlJJy7DxlOiOt7kcX2GxukZ28+r4k8iTJYEkUcCFrMfo46euGFqVOfmeMcSOvMaLMy/Gwprc5iJbmD5pbK096MCE7KTBU8ys8mcRD/YutA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QaO2q6LA; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767610933; x=1799146933;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=pHP2D1BgYaYQ8DgAa2gFsL9KyNwEmylQzHmEOL7BH7Q=;
  b=QaO2q6LAkUtrStSiWUPFOpAt6W5HaGJPPKS7E0jog0U45oyxGJ+CLrGh
   HaUbMiIIfDxPl+XZoajdwoX9GQvakysmUxsldpk1ZigZB5OkJd6O5d3P6
   vOYdVhcYiFMbul2aHUTXPIOzo1OPobnZlpdH5T8Vyt9fnsHO/rD8E41bn
   FeCBmBfRSI8Xs/fEZFtbaknU2Pg+gPTzJ1JyCkC/RHPs86A93oJHfmKEb
   4/4DGCwDqyTRFCQ7uFZVvxDh59IRHWf4+5ftK/J8D1pGEqg3l5BBw3VxV
   AhkUWFu3nBbub5RATFUkilrDyHpjzpOtWX67FiwaDZEX5I0reAgJ2AzKZ
   g==;
X-CSE-ConnectionGUID: OmmJkyAXS3mUf1rCsiL3Ng==
X-CSE-MsgGUID: cumE/iI1SLOdQw2cKOGsAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11661"; a="68168509"
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; 
   d="scan'208";a="68168509"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2026 03:02:12 -0800
X-CSE-ConnectionGUID: 8CWK8pc0QjCZlVLrXx1aPQ==
X-CSE-MsgGUID: wS3FUhkuQeS7aAs3AE5U5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; 
   d="scan'208";a="202415871"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO [10.245.244.156]) ([10.245.244.156])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2026 03:02:10 -0800
Message-ID: <5f0e0401-fc0b-4ac7-ab95-7f85e6677b86@linux.intel.com>
Date: Mon, 5 Jan 2026 13:02:03 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] usb: xhci: Skip configure EP for disabled slots
 during teardown
To: Udipto Goswami <udipto.goswami@oss.qualcomm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260105084805.2155251-1-udipto.goswami@oss.qualcomm.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20260105084805.2155251-1-udipto.goswami@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi

On 1/5/26 10:48, Udipto Goswami wrote:
> Consider a scenario when a HS headset fails resume and the hub performs
> a logical disconnect, the USB core tears down endpoints and calls
> hcd->check_bandwidth() on the way out, which with xHCI translates to a
> drop-only Configure Endpoint command (add_flags == SLOT_FLAG, drop_flags
> != 0). If the slot is already disabled (slot_id == 0) or the virtual
> device has been freed, issuing this Configure Endpoint command is
> pointless and may appear stuck until event handling catches up,
> causing unnecessary delays during disconnect teardown.
> 
> Fix this by adding a check in xhci_check_bandwidth(), return success
> immediately if slot_id == 0 or vdev is missing, preventing the
> Configure Endpoint command from being queued at all. Additionally,
> in xhci_configure_endpoint() for drop-only Configure Endpoint operations,
> return success early if slot_id == 0 or vdev is already freed,
> avoiding spurious command waits.
> 
> Signed-off-by: Udipto Goswami <udipto.goswami@oss.qualcomm.com>

Makes sense to prevent unnecessary 'configure endpoint' commands

Could you share more details how we end up tearing down endpoints and
calling xhci_check_bandwidth() after vdev is freed and slot_id set to zero?

Did the whole xHC controller fail to resume and was reinitialized in
xhci_resume() power_lost path?

Or is this related to audio offload and xhci sideband usage?

If we end up in this situation in normal headset resume failure then there
might be something else wrong.

Thanks
Mathias


