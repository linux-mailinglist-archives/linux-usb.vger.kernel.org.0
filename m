Return-Path: <linux-usb+bounces-4305-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CD38C8169D4
	for <lists+linux-usb@lfdr.de>; Mon, 18 Dec 2023 10:28:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 64DC628543A
	for <lists+linux-usb@lfdr.de>; Mon, 18 Dec 2023 09:28:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BB3111C8E;
	Mon, 18 Dec 2023 09:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MlfHV2MR"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD3211714
	for <linux-usb@vger.kernel.org>; Mon, 18 Dec 2023 09:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702891712; x=1734427712;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=zyVSQlrO79MWWtbsydfMyh0rsBBh3w9xtidyC4WYJO4=;
  b=MlfHV2MRTEHx2KeHc1y+8bFSBoPHaWWCU1Tw0G/epA9Di+EStn9QsGvK
   JaNSYqar22Hq2M8Kwgi3Uo99XBDH+4piQXyXVnN3q2OPSfgk5ARdow0x/
   EjxWWf0mAKJpBtS0U6IsV21OgwzGeaGnCo32V/3ZQ5Vc2YJAXhhJSaPJr
   kyvo+5nvaqbhk/cXbVPoBuch3r23fpDsT2nRla6PbPDsixDeHphAkUXri
   /oA6HaYibWsvLE4pN985BulRHChyO3RZjyWZw2wxHqb2jIDez2RVux657
   IwZvc//mO95LzaQ6n25Hx4k8ETnH7mjlrRSLBqwIYx0YzqRhcuAesUm1A
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="398264045"
X-IronPort-AV: E=Sophos;i="6.04,285,1695711600"; 
   d="scan'208";a="398264045"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2023 01:28:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="751680083"
X-IronPort-AV: E=Sophos;i="6.04,285,1695711600"; 
   d="scan'208";a="751680083"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by orsmga006.jf.intel.com with ESMTP; 18 Dec 2023 01:28:30 -0800
Message-ID: <865a55f7-bf0d-692a-0187-8fe4c6dabd38@linux.intel.com>
Date: Mon, 18 Dec 2023 11:29:53 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [PATCH 1/1] xhci: Fix null pointer dereference during S4 resume
 when resetting ep0
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, Wendy Wang <wendy.wang@intel.com>
References: <20231215125707.1732989-1-mathias.nyman@linux.intel.com>
 <20231215125707.1732989-2-mathias.nyman@linux.intel.com>
 <2023121515-paper-annuity-a0e3@gregkh>
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <2023121515-paper-annuity-a0e3@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15.12.2023 19.27, Greg KH wrote:
> On Fri, Dec 15, 2023 at 02:57:07PM +0200, Mathias Nyman wrote:
>> During device enumeration usb core resets endpoint 0 if the max packet
>> size value differs from the one read from the device descriptor.
>>
>> usb core will additionally reset endpoint 0 during S4 resume, before
>> re-enumerating the device, if the device has a reset-resume flag set.
>>
>> In this case the xhci device representation vdev may be lost due to
>> xHC restore error and re-initialization during S4 resume.
>>
>> Make sure slot_id and vdev are valid before trying to re-configure max
>> packet size during endpoint 0 reset.
>> max packet size will be re-configured later during re-enumeration.
>>
>> This fixes commit e34900f46cd6 ("xhci: Reconfigure endpoint 0 max packet
>> size only during endpoint reset") which is currently in usb-next,
>> on its way to 6.7
> 
> You mean "6.8" here, right?

Ah, yes it should be 6.8, my mistake.

Thanks
Mathias



