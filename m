Return-Path: <linux-usb+bounces-16857-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B5FFF9B625B
	for <lists+linux-usb@lfdr.de>; Wed, 30 Oct 2024 12:55:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E7A081C2082E
	for <lists+linux-usb@lfdr.de>; Wed, 30 Oct 2024 11:55:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A6101E5738;
	Wed, 30 Oct 2024 11:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J0gnKpkc"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87FBD1E573C
	for <linux-usb@vger.kernel.org>; Wed, 30 Oct 2024 11:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730289310; cv=none; b=aR5bjHFIKPzJCPSH8yaiHX3UuvmBgyyOGUp31UonuiE6OsfHOfbP8O4Q72cf1uMpiyufumY8VLMf7oOfNJSu1L6pcJRGSnmiFkd6FsZKynGQ3vwRffXY0R9gDE4jQXwSzgQdXmlk0YOq/7PqOob+DEvPDY0ye23CAvwEl+eDE1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730289310; c=relaxed/simple;
	bh=qDZZbbgVFRQrVb4VeESWuuBlHtNnNtBU8m3GqzTb50g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CRCbvBfAvL1pZMc90c+hshkAdEWvn4VvWHicjSgy68FtWo07v90YBMv2CQkJGdWhYBV+snzwgX/EqIemV0XT36bmlJyfNXh0APuc40/1D32dq3jcyHm5zBDGMOBEEucjP/ixr/+AFEBkCDIAvchEpViimXTLTJY2JdcooOERgLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J0gnKpkc; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730289308; x=1761825308;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=qDZZbbgVFRQrVb4VeESWuuBlHtNnNtBU8m3GqzTb50g=;
  b=J0gnKpkchZSfgeMN+CtnIUMkO7baXw+pTfgXO29wKACStQiVPjtOS76I
   xVXy/erUF3LyyjOHLR5Bq2oxkJNfofsrhGPg1QggKZE6Rt5I24Ar7/Gdm
   aE2WOopda25c41A9zAnmr1jsjmzRBbqK4vcGJnWEkVcg9KGokrghB/7nM
   4n89PnYtnl0gVr+reM47SEt/On+6tqbKwAsC/swJbuzhNTv5TG3GaXJWl
   3lCH3/6QgK/T7eYRKAhbpX49aUW5mOV2Um7jIOS9COzSFYHoB1rTbKl/q
   hB8NBeVZcj4FG6J7u/XgGOOp3B6t1nHuZesEdLv2YdRrgvYTaOyIOgNJG
   w==;
X-CSE-ConnectionGUID: SjWZPw+LSKOz5RYnTL9oRw==
X-CSE-MsgGUID: LbFuJ1NdSo6/osgrPPccgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11240"; a="29404151"
X-IronPort-AV: E=Sophos;i="6.11,245,1725346800"; 
   d="scan'208";a="29404151"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2024 04:55:08 -0700
X-CSE-ConnectionGUID: auuLWnscRqS7JV5eKQqzYg==
X-CSE-MsgGUID: hyVv6TdrTdywKF8th3XQrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,245,1725346800"; 
   d="scan'208";a="86847511"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by fmviesa005.fm.intel.com with ESMTP; 30 Oct 2024 04:55:06 -0700
Message-ID: <0df67ac4-1b41-4a3b-94ba-ff1e80aed333@linux.intel.com>
Date: Wed, 30 Oct 2024 13:57:20 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] xhci: Use pm_runtime_get to prevent RPM on unsupported
 systems
To: Mario Limonciello <mario.limonciello@amd.com>,
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>, mathias.nyman@intel.com,
 gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Cc: johan@kernel.org
References: <20241024133718.723846-1-Basavaraj.Natikar@amd.com>
 <5718b41e-09f7-42d3-a6fd-68bccac50e42@amd.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <5718b41e-09f7-42d3-a6fd-68bccac50e42@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24.10.2024 16.38, Mario Limonciello wrote:
> On 10/24/2024 08:37, Basavaraj Natikar wrote:
>> Use pm_runtime_put in the remove function and pm_runtime_get to disable
>> RPM on platforms that don't support runtime D3, as re-enabling it through
>> sysfs auto power control may cause the controller to malfunction. This
>> can lead to issues such as hotplug devices not being detected due to
>> failed interrupt generation.
>>
>> Fixes: a5d6264b638e ("xhci: Enable RPM on controllers that support low-power states")
>> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
> 
> Cc: stable@vger.kernel.org
> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>

Adding to queue

Thanks
Mathias


  


