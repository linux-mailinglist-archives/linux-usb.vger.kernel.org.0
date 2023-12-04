Return-Path: <linux-usb+bounces-3689-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 718CE803506
	for <lists+linux-usb@lfdr.de>; Mon,  4 Dec 2023 14:35:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A2A061C20AA8
	for <lists+linux-usb@lfdr.de>; Mon,  4 Dec 2023 13:35:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 734F525101;
	Mon,  4 Dec 2023 13:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HB6LLcnq"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9C8CE5
	for <linux-usb@vger.kernel.org>; Mon,  4 Dec 2023 05:35:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701696918; x=1733232918;
  h=message-id:date:mime-version:to:cc:references:from:
   subject:in-reply-to:content-transfer-encoding;
  bh=0KDs0K99ZmOqRBPqwyd5sQiYFi8EpQJrIqL6exXBb3M=;
  b=HB6LLcnqCiBklz9pIZF0JTg/jtkbR99WfneC5UxjK6aoeCY1qPUvt4us
   u3892h80OPIQS9E7uu2DduU4oAu3L1DYo/LgR0FqAjqq5Lhk6zmBvJuHl
   Kc++W/PvPJXKhbJlUZR6ypETxQX5sVEVyIhcyLmo649lzR/j2JvVq1nie
   eVgE2jWMXCdnlhsG1nsXpnJM/2U2uFBLBK4Y2X7HzMPhI63xaMCqUsLHE
   qN2ql/NtnGUqDBNM/qwPoLWbwdj5ok5xicbchLcgYMHdZwJoK93mu+71N
   hOmgT+Q1amYXiELJbZOUoFt6h6sd2HCk34jP7VDqQqIuCHN+eOtU2yHxU
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="631829"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; 
   d="scan'208";a="631829"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 05:35:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="774257764"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; 
   d="scan'208";a="774257764"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by fmsmga007.fm.intel.com with ESMTP; 04 Dec 2023 05:35:16 -0800
Message-ID: <121c71e7-5425-5341-1050-87415b3be63c@linux.intel.com>
Date: Mon, 4 Dec 2023 15:36:35 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
References: <20231204104534.1335903-1-mathias.nyman@linux.intel.com>
 <2023120400-scorecard-chop-3ac9@gregkh>
From: Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH v2 00/18] xhci features for usb-next
In-Reply-To: <2023120400-scorecard-chop-3ac9@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4.12.2023 15.20, Greg KH wrote:
> On Mon, Dec 04, 2023 at 12:45:16PM +0200, Mathias Nyman wrote:
>> Hi Greg
>>
>> V2 of xhci features and cleanups for usb-next, including xhci dbc
>> cleanups, MSI rework, and fixing how we reconfigure max packet size
>> for xhc.
>>
>> One patch fixes a null pointer deref issue, but this hasn't been seen
>> in real life. It's a theoretical case triggered by adding a 3 second
>> delay in the driver.
>> So I don't think it should go to stable.
>>
>> v2 drops one small cleanup patch as it turned out to not really clarify or
>> simplify things. This was [PATCH 08/19] "xhci: dbc: Use sizeof_field()
>>   where it makes sense" in previous series.
>> Link: https://lore.kernel.org/linux-usb/20231201150647.1307406-9-mathias.nyman@linux.intel.com
> 
> Ick, I just applied all of the v1 series, we crossed emails, sorry, my
> fault.
> 
> But, to be fair, I think your patch is correct, so let me leave it in,
> if it's not buggy.
> 

Yes, it should work just fine. It can be optimized later if someone is still interested.

Thanks
Mathias


