Return-Path: <linux-usb+bounces-27850-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E6FFBB50F28
	for <lists+linux-usb@lfdr.de>; Wed, 10 Sep 2025 09:25:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A84943A7BB7
	for <lists+linux-usb@lfdr.de>; Wed, 10 Sep 2025 07:25:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 057B63090E2;
	Wed, 10 Sep 2025 07:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eroy7Q7U"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0191E1A4E70
	for <linux-usb@vger.kernel.org>; Wed, 10 Sep 2025 07:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757489098; cv=none; b=V6bX2Xk9NhLbkG4NHo+sFWJs/dpEQphSkEpd+Zgeuaiwv9X45in3qoe43SsLh+h6DpwiIUOzBrDIvN1BePrLfg5/GnoiJi6OukFSgs3NPdnNkgUS2SyWV33Uql30Ecg2IyAkA3lQxsRHkgNd+ieyzgzthM4lvSa3bWd46ZWTcvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757489098; c=relaxed/simple;
	bh=ez2sjPVJR++wik++/snFD7+3OEDibcy9FPFLiKIgWsU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CXIQTmOMG6OIKVnyv8SboCQY8+qkNroiowdTivNGq3COaHNbkWH4Zqdw9E3Op0h26pvdzkMIkaPY8GrW3obHqhfk5U4L57NHb+vuq5ET9iYWr/LslbFusIZAMDd2Ba7lQrjs80bfVg7dvyYKcqyNxqvJkJaQTTvl7PlVmoQ10+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eroy7Q7U; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757489097; x=1789025097;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=ez2sjPVJR++wik++/snFD7+3OEDibcy9FPFLiKIgWsU=;
  b=eroy7Q7UQxEfemwvtl/0MCI3oWK6HpHgSYVSpMfwYQnMQBUc2X01SLz2
   oEh/b3wHCSGO3FYwiLtINUuTIllCF8sYC94y09alCsFx8K550pBUjClgo
   BDSrf4lqYF0FwMNXYMzO7cU7pL+7rHD7508tP1ndSU5uzRmzHWgXsbBUo
   qRghjW4wdwZQVF57WA+9uOz8R1AvzrmFTEGNT+eTcYZ+hXXKzyEPupH76
   SzzzTzS6J1VpyODGHUOlrL+kgXOnqHnN7A1+2SIUS9in3j7Y7u7VhrU3r
   IadnJH7DsfGhhy4DObgBm9YujzEB4yBSIb1cY284fxknZjkpXkfkcmSi8
   w==;
X-CSE-ConnectionGUID: 3ENukeozQBSij7Hilqq+Zg==
X-CSE-MsgGUID: AdPrD5LlQY2z4jSwxjQKjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="70889625"
X-IronPort-AV: E=Sophos;i="6.18,253,1751266800"; 
   d="scan'208";a="70889625"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 00:24:51 -0700
X-CSE-ConnectionGUID: 1Q3jFDPARESzuVdwJJxxaQ==
X-CSE-MsgGUID: Qo4e2qtBSByzhCHTYXRGUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,253,1751266800"; 
   d="scan'208";a="210436762"
Received: from unknown (HELO [10.245.255.79]) ([10.245.255.79])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 00:24:49 -0700
Message-ID: <70cf1755-bc20-4703-b812-cce89ef2ef1a@linux.intel.com>
Date: Wed, 10 Sep 2025 10:24:37 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] usb: xhci: rename Port Register Set pointer in struct
 'xhci_port'
To: "Peter Chen (CIX)" <peter.chen@kernel.org>
Cc: mathias.nyman@linux.intel.com, linux-usb@vger.kernel.org
References: <20250904154221.2314596-1-niklas.neronin@linux.intel.com>
 <20250904154221.2314596-8-niklas.neronin@linux.intel.com>
 <20250905024003.GB2473920@nchen-desktop>
Content-Language: en-US
From: "Neronin, Niklas" <niklas.neronin@linux.intel.com>
In-Reply-To: <20250905024003.GB2473920@nchen-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 05/09/2025 5.40, Peter Chen (CIX) wrote:
> On 25-09-04 17:42:20, Niklas Neronin wrote:
>> Rename the Host Controller USB Port Register Set pointer in the 'xhci_port'
>> struct from "addr" to "port_reg". This new name accurately reflects the
>> purpose of the pointer.
>>
> 
> I am also implementing a wrapper that needs to cover all PORTSC
> registers access, it is used to cover the controllers which have some
> problems to access PORTSC when the USB PHY switches to DP for USB/DP
> altmode scenario, current USB core and xHCI core access USB3 PORTSC
> at some places (detail could see the changes you do below) if controller
> supports both USB2 and USB3, even the USB3 connection is not there.
> 
> I am thinking is it possible you add a wrapper like
> xhci_port_readl/xhci_port_writel for all PORTSC access, otherwise I
> also need to change all places you make.
> 

Yes, I will add a read PORTSC functions, in version 2.
I am on vacation this week, so v2 will be ready next week.

Best Regards,
Niklas 



