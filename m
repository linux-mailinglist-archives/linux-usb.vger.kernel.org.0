Return-Path: <linux-usb+bounces-11017-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 800E9900255
	for <lists+linux-usb@lfdr.de>; Fri,  7 Jun 2024 13:38:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF29A1F265CB
	for <lists+linux-usb@lfdr.de>; Fri,  7 Jun 2024 11:38:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2131A18FC6D;
	Fri,  7 Jun 2024 11:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QJxNMsDw"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44EE718F2CD
	for <linux-usb@vger.kernel.org>; Fri,  7 Jun 2024 11:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717760286; cv=none; b=WAirj8vCyG/QvL6G60QYt60/UEI5nvwEFSphzslZUuT6hckh96U4XI28J0cqQHV4uGTxu542p6q6DVuGj8Lp5E1S/je0bDoE+iZ3xyl0qq2HOE9nW32DDPCu2x5fdM4HxjRtNWahq3Hi9GdpUqTxRazUoZIgsiXgldhcDp5bA9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717760286; c=relaxed/simple;
	bh=jk8YglklVD2fYLpHtEV5say+ujQ4zFsi+OKzRdDxgvg=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:From:Subject:
	 In-Reply-To:Content-Type; b=MK4J6YafY4SiWgM5gY9YATcp/W+m58a8ofQUi/Ag/VKOsf0eInjn83ZdkZrLaux1mGPS0h2ZFk2s3s7A2V7vsOzv9er48yVi9gya5+ZvL4Qal159b6YYEG9FNNwh5qYZDuH53Lehto8F1Q2FfOXsNRAz+VcRMBhsPnMD67/CVzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QJxNMsDw; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717760285; x=1749296285;
  h=message-id:date:mime-version:to:cc:references:from:
   subject:in-reply-to:content-transfer-encoding;
  bh=jk8YglklVD2fYLpHtEV5say+ujQ4zFsi+OKzRdDxgvg=;
  b=QJxNMsDwWv6nJHglk+oxBYuGyvdt0ASrAnhU77ZsGPuosSWPzJoT4DMo
   OPdd8OjKwJgM0kr0fE2k37Qb90FFrgaq5b3BkxTm3SAsgiQvZjLzS/waG
   RlNLJ7QVXGEJ0Aky/OiFbIO63H8Ioe173j8aS3SMWjqiecWujBE2QPC72
   faBAq4zsHUSR4t4kbzk893bnMoOMWwDeGLzZkERQZgJnOCT5iPJwqKpDQ
   tH1kFFvcOnBrqinmt6RGGgk2tFB3C03UtVV6Nye2eDgQM8+/SQ8843MB2
   wS+aJx0tXjkUzV1vJERuD5BAvfSZNmKG5r9iGD4xl59IKD9iYIWY350tn
   Q==;
X-CSE-ConnectionGUID: xtyPq4BvRPaqxVQ2YZJENQ==
X-CSE-MsgGUID: 6uePG8uRS6ugMUW9OiF5QA==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="14610626"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; 
   d="scan'208";a="14610626"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2024 04:38:05 -0700
X-CSE-ConnectionGUID: U49kSiLNQyarla00Op2YYw==
X-CSE-MsgGUID: g+JMbTnjQv2HMw2nlrPuDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; 
   d="scan'208";a="38235275"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by fmviesa006.fm.intel.com with ESMTP; 07 Jun 2024 04:38:03 -0700
Message-ID: <41b21cbc-a5ff-334b-c269-d7dec248573e@linux.intel.com>
Date: Fri, 7 Jun 2024 14:40:00 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Content-Language: en-US
To: Zhangzhansheng <zhang.zhansheng@h3c.com>
Cc: Ladislav Michl <oss-lists@triops.cz>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 Sneeker Yeh <sneeker.yeh@gmail.com>, Wangxiaoqing <wangxiaoqing@h3c.com>,
 Xinhaining <xinhaining@h3c.com>, Zhangchun <zhang.chunA@h3c.com>,
 Alan Stern <stern@rowland.harvard.edu>
References: <23cecbd846eb47099cf9e5bd986e434d@h3c.com>
From: Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: =?UTF-8?Q?Re=3a_=e3=80=90=5bConsulting_about=3a_The_scsi_disk_drive?=
 =?UTF-8?Q?r_of_ub_and_storage_kernel_2=2e6=2e39_=5d=e3=80=91?=
In-Reply-To: <23cecbd846eb47099cf9e5bd986e434d@h3c.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi

On 7.6.2024 13.14, Zhangzhansheng wrote:
> Mathias：
> 
> I am so sorry to trouble you again.
> 
> As you know, the kernel 2.6.39 has two scsi drivers including the ub and the mass storage, which those respectively located at directory drivers/block/ub.c and drivers/usb/storage.
> 
> The Ub and storage driver both can be used for USB storage driver of USB device, So I want to know which driver should be correctly used in kernel 2.6.39.

2.6.39 is very old, 13 years now.
Only recommendation I can give is to update the kernel.

> 
> The question is as follow:
> I recently use the kernel 2.6.39 scsi disk driver ub.c , encountered one deadlock issue. The root cause is that the tasklet function of ub_scsi_action(ub.c) on the CPU0
> cutting off the CPU hardware interrupt for a long time which causing IPI interrupt sended by CPU1 without response. At the same time, the tasklet function of ub_scsi_action on CPU0 core
> is attempting to obtain the lockA holded by the other thread task on CPU1 core which causing the lockA occurred deadlock.
> 
> If I replace the ub (drivers/block/ub.c ) with the mass storage (drivers/usb/storage) in kernel 2.6.39 , whether it will cause potential problem?

I'm not familiar with the Ub driver at all. Looks like it was removed in v3.7 kernel.
It doesn't make much sense for anybody to look into it anymore.

Alan Stern would know about the mass storage driver

Thanks
Mathias

