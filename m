Return-Path: <linux-usb+bounces-21992-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3340FA6B874
	for <lists+linux-usb@lfdr.de>; Fri, 21 Mar 2025 11:05:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ABF9E189A6AE
	for <lists+linux-usb@lfdr.de>; Fri, 21 Mar 2025 10:05:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82D971F153E;
	Fri, 21 Mar 2025 10:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ANbZ8BSj"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5FB3EEB3
	for <linux-usb@vger.kernel.org>; Fri, 21 Mar 2025 10:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742551535; cv=none; b=cGbTFF3WC/3mr12Y+Ya8wEpN1l1dmzL/Pz0CA1Duapu8UYNl8sy1GvzpJmsyIceXbUqtfBRl+D40DV2a03gpY4l/JghtBaNZObSGEGCTLB2b0REcT5iMoprIDVi5R3ExEbmfngTGLVkGcRm/FwvBk1LPT6SYrpT9doAnjw1eQtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742551535; c=relaxed/simple;
	bh=sCY3goQq/Immx8uEyGA+tNYb/cvc2kmvN2pTxWuFLaI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yq7uh4+9TyADIo4Ztm4S0w5DNm1ShkpRXK5dT4bTL+mjG2Nqb22MXyg8gIl3m83twyMmh9DHzzZ5AiySotT5LezgwT+jkWOOCOfmG7lSZL3LATxaStKCOdj79/3t0/SFR/dFMRXJW9GGVPUlrW/vMuBQ+Gm2YwFKwu9ynIirKHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ANbZ8BSj; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742551533; x=1774087533;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=sCY3goQq/Immx8uEyGA+tNYb/cvc2kmvN2pTxWuFLaI=;
  b=ANbZ8BSjmYpWg7yaS42umQeOHF44duAuXUYkfQKaDONzGHmtuwyqv+BY
   dJ3WMo8Odn/juDXnGkY69DTA721jDVm9zO3h/CToOECYPNReF/m6xgx9+
   hNaEH33AdlYmA1bFy+JZcB+nbMQDeibOgiKgZOz3BCBoQId1oiP3Rt1w7
   HEc8wyAyv/gIxqhwYLLYwr1ojywkJeILVievEgiJLs/4ximA4qce4oV6F
   I1ropDvQStCqJhkKENMRY8guRFnXzbdnuFQnIf49X3j42eefhuMJu0C3g
   9QdaQKXdzHot+wDG1/d2YdSI6aBnhNYjqy6gOCyF5phsysAAC3wHBma8D
   Q==;
X-CSE-ConnectionGUID: k/CHQ+ysRDy2QaGVTqyG0A==
X-CSE-MsgGUID: tEzrV7GUT0iN+XoKxEJKjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="43826380"
X-IronPort-AV: E=Sophos;i="6.14,264,1736841600"; 
   d="scan'208";a="43826380"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2025 03:05:33 -0700
X-CSE-ConnectionGUID: XjNHBkcdRmi83Ucy7aXlWw==
X-CSE-MsgGUID: iQFvBkx7QuO9urDNVOmzlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,264,1736841600"; 
   d="scan'208";a="123383512"
Received: from unknown (HELO [10.237.72.199]) ([10.237.72.199])
  by orviesa006.jf.intel.com with ESMTP; 21 Mar 2025 03:05:29 -0700
Message-ID: <c5b57cf2-3972-4507-b8de-8611933e75c9@linux.intel.com>
Date: Fri, 21 Mar 2025 12:06:35 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFT PATCH] xhci: Limit time spent with interrupts disabled
 during bus resume
To: liudingyuan <liudingyuan@huawei.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "patchwork-bot@kernel.org" <patchwork-bot@kernel.org>,
 "mricon@kernel.org" <mricon@kernel.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Cc: "Fangjian (Jay)" <f.fangjian@huawei.com>,
 Kangfenglong <kangfenglong@huawei.com>, yangxingui <yangxingui@huawei.com>,
 "fengsheng (A)" <fengsheng5@huawei.com>,
 lingmingqiang <lingmingqiang@huawei.com>,
 liulongfang <liulongfang@huawei.com>,
 zhonghaoquan <zhonghaoquan@hisilicon.com>,
 "yanzhili (A)" <yanzhili7@huawei.com>, "huyihua (A)" <huyihua4@huawei.com>,
 "Zengtao (B)" <prime.zeng@hisilicon.com>,
 "shenjian (K)" <shenjian15@huawei.com>, liuyonglong
 <liuyonglong@huawei.com>, Jonathan Cameron <jonathan.cameron@huawei.com>
References: <168e63cfc8864f9e920a7eb40d45b23f@huawei.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <168e63cfc8864f9e920a7eb40d45b23f@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21.3.2025 8.47, liudingyuan wrote:
> I have already tested that this solution can solve the problem.
> And the specific verification details were described in the previous reply.
> 
> Thanks!
> 
> Tested-by: Devyn Liu <liudingyuan@huawei.com>

Thanks for testing it

I'll submit the patch after the merge window, once 6.15-rc1 is out.

Would you like me to also add a "Reported-by:" tag for you, or someone else
in the team?

Thanks
Mathias

