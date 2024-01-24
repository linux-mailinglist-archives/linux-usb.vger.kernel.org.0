Return-Path: <linux-usb+bounces-5462-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E96BA83AB1C
	for <lists+linux-usb@lfdr.de>; Wed, 24 Jan 2024 14:48:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 66DD7B249AE
	for <lists+linux-usb@lfdr.de>; Wed, 24 Jan 2024 13:47:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F38B877F25;
	Wed, 24 Jan 2024 13:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dsz/WGFJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD9B77F10
	for <linux-usb@vger.kernel.org>; Wed, 24 Jan 2024 13:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706104067; cv=none; b=hGRMyoGnsLggUtsmkGLx2PJeazoAeK4h82VAcGextjaSW+2BbU/cgM1wUJFE+RvTQ4PjZ2ITmkEuN9GOd/XVXKbFr+JvOdfVxwaxRyaIS21VWgQbGUUgei8lwg3SfhhuBgK783lclwLW/+aUi0nRm/AopoycS/6mxo7wayg6Jfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706104067; c=relaxed/simple;
	bh=m0HyGkPwupofsANmk+00mQbx6C+NaAUL5gDivybtmnI=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:From:Subject:
	 In-Reply-To:Content-Type; b=njdbP02xSJZAfuPHfhGCruzNCHrg3X59ylQqheBifnpPCTqtcsy7xjfdZcBrWJgGJboxb6TkaBqqUSJWN7YHIUUg+CIj5YglB+Kh32DltjwO49pM6eJCQHJ8S3AcWSfKZRAzaj6wW3ZSF2BBaan4jsDMT60b1ZjYdRbmdYxHsTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dsz/WGFJ; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706104066; x=1737640066;
  h=message-id:date:mime-version:to:cc:references:from:
   subject:in-reply-to:content-transfer-encoding;
  bh=m0HyGkPwupofsANmk+00mQbx6C+NaAUL5gDivybtmnI=;
  b=dsz/WGFJgWPr4SHbNFxUu7hja3vWagmAuLjeQNPRTPQj345uqpDZjx7y
   at47sWEqNOdHeeGCOgMfqZynaTLWi8livT01DN2ddxjVGEaopdAQ3J49i
   +1orNNJjTTbiNDjJ9F799fODx4ffOjGDlLHvaRO5pPanLzCEf1L4C0A0n
   VouY+4igdHsh5YGJaDdTeyTRcPPODuPsbgECEbcQV/YBTEc+0a7wXnBUu
   TLfrik1h6eLGOxLcPzxchGHYQ+3BTrgFAe+QrntvFq0kaUohn4etxjiWe
   AJMGCj5Y1LL55umk0N+DrtcjcdUBD0koGBRkxWg6TI+o6n0kzLfECG4m/
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="20401746"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="20401746"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2024 05:47:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="1117621410"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="1117621410"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by fmsmga005.fm.intel.com with ESMTP; 24 Jan 2024 05:47:41 -0800
Message-ID: <c756521f-ea5b-7816-5d60-0c61f3275305@linux.intel.com>
Date: Wed, 24 Jan 2024 15:49:14 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Content-Language: en-US
To: Zhangzhansheng <zhang.zhansheng@h3c.com>,
 Ladislav Michl <oss-lists@triops.cz>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 Sneeker Yeh <sneeker.yeh@gmail.com>, Wangxiaoqing <wangxiaoqing@h3c.com>,
 Xinhaining <xinhaining@h3c.com>
References: <7b049561ce33406ab9b5d0cee7fbd497@h3c.com>
 <9e8bebd2-e51a-cd24-3522-a781bb0b237e@linux.intel.com>
 <e7fddc9147af4adc84f76c07b559ed77@h3c.com>
 <57883406-83f3-9956-16c3-2954ab3744ca@linux.intel.com>
 <64e4153a5cd54cf9bc3eaaf823ba0a31@h3c.com>
From: Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: =?UTF-8?B?UmU6IOetlOWkjTog562U5aSNOiBbQ29uc3VsdGluZyBhYm91dDogeEhD?=
 =?UTF-8?Q?I_host_dies_on_device_unplug=5d?=
In-Reply-To: <64e4153a5cd54cf9bc3eaaf823ba0a31@h3c.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 24.1.2024 13.42, Zhangzhansheng wrote:
> Mathias：
> 
> 
> In regard to the question “What the reason of the usb host controller handing the stop endpoint command timeout maybe two a) and b).”Just to add the follow  one :
> When the problem arising, the function of “xhci_halt “ operated the host controller successfully. So I think the usb host controller should be ok.
> 
> So, I gussess that the usb host controller has no enough time to handle with a large number of xhci command.
> 

This issue was resolved in 5.19 kernel with patch:
25355e046d29 xhci: use generic command timer for stop endpoint commands.

After this patch the timer is started when xHC start processing the command, not
when driver queues it.

I strongly recommend trying a more recent kernel where all these issues are
fixed already.

Thanks
Mathias

