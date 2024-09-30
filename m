Return-Path: <linux-usb+bounces-15586-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC54989CB1
	for <lists+linux-usb@lfdr.de>; Mon, 30 Sep 2024 10:23:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8A3F81C219D6
	for <lists+linux-usb@lfdr.de>; Mon, 30 Sep 2024 08:23:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5836E170A0C;
	Mon, 30 Sep 2024 08:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YBg7DGf6"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FDFE4204B
	for <linux-usb@vger.kernel.org>; Mon, 30 Sep 2024 08:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727684625; cv=none; b=W0TC3p5C4AumJAMKFAOL4eufoAkq6Yf/SjkFkbWXOoCtFVC253ZAx9U1hhXO4gBz7elXKMUNyxGTPFOBKHidkuIa9MelsUDnKfb4BcF4WqcNpEDZCuLVT/KFYCmyf9YDomjTI5XOfd9gFHe+d6kkqIvb+yNz8iHFUSB4l/HsDo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727684625; c=relaxed/simple;
	bh=J87psKeoVU00tfUHQ/zu/Lwm1CEI7WfVAmat/vdOqDQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i1HjzvgXNPEMRDJrNt+Wb8h78YppaaLksZDM95OilGsVfzI0raNSJTzMRq2s0XDdEXwD6koQ0EZp5QftdbDANCfQc3v1trLEAwDXzzhgft4YMPdHSFqv5apPmu0/PoRFGUkIoxK16m+rPI1/aoUfNxO4Te/kVp6hNyu4XCz13pM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YBg7DGf6; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727684625; x=1759220625;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=J87psKeoVU00tfUHQ/zu/Lwm1CEI7WfVAmat/vdOqDQ=;
  b=YBg7DGf6oeaA+iWmgjRloUtTKRZvc73UbjYAOf8a51Wtg3WKSGRl4YzM
   Q+RbLaPlGacqT5h9/dehTqnhF+mZIbUPOlMghIIyUr1MZNRaYKFeMUexO
   BbJJQyhuK9/UgXDfZxVsUhj0E3vqu5GRxrMbgVK0C0ATzf77njMhaj/XO
   yOcj61B77ObDMl+c4qTONvmc6moF3YMqmu9oAzVd4Qp5K7k931H3OwFJH
   xqU9KD8QjOcO6CrzB1uZIN7sohkiF7skQdy3XZBa7LstDkzGk9Drnz+OU
   wkcCt640xfBEuF0EHbFaZDifpvLBJBr9UdyXkPxp1/zMCrQfXywbrUC6H
   A==;
X-CSE-ConnectionGUID: 7mg7+PGeTc2OxdIv/ZF8mw==
X-CSE-MsgGUID: 9R0HyDw9QqWHOChyGD3JTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="14383920"
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; 
   d="scan'208";a="14383920"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 01:23:43 -0700
X-CSE-ConnectionGUID: N79CofDoSVqSsbMpVkns9Q==
X-CSE-MsgGUID: ppWztQD4TeWLeYTJ+5NzMw==
X-Ironport-Invalid-End-Of-Message: True
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; 
   d="scan'208";a="104015900"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by fmviesa001.fm.intel.com with ESMTP; 30 Sep 2024 01:23:41 -0700
Message-ID: <4e2775ca-7a5b-4c7c-81c4-4db3778e4568@linux.intel.com>
Date: Mon, 30 Sep 2024 11:25:50 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xhci: Change pm_runtime_forbid to pm_runtime_disable
To: Basavaraj Natikar <Basavaraj.Natikar@amd.com>, mathias.nyman@intel.com,
 gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Cc: Mario Limonciello <mario.limonciello@amd.com>
References: <20240925161520.2736895-1-Basavaraj.Natikar@amd.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20240925161520.2736895-1-Basavaraj.Natikar@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25.9.2024 19.15, Basavaraj Natikar wrote:
> Change pm_runtime_forbid to pm_runtime_disable to disable RPM on
> platforms that don't support runtime D3, as re-enabling it through sysfs
> auto power control may cause the controller to malfunction. This can lead
> to issues such as hotplug devices not being detected due to failed
> interrupt generation.
> 
> Fixes: a5d6264b638e ("xhci: Enable RPM on controllers that support low-power states")
> Suggested-by: Mario Limonciello <mario.limonciello@amd.com>
> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
> ---

Added to queue

Thanks
-Mathias


