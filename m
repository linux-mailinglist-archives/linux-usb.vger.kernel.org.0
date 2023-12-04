Return-Path: <linux-usb+bounces-3643-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EAABE803019
	for <lists+linux-usb@lfdr.de>; Mon,  4 Dec 2023 11:22:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8B45DB209EC
	for <lists+linux-usb@lfdr.de>; Mon,  4 Dec 2023 10:22:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69F2920B09;
	Mon,  4 Dec 2023 10:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JrKv1s73"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D71A191
	for <linux-usb@vger.kernel.org>; Mon,  4 Dec 2023 02:22:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701685355; x=1733221355;
  h=message-id:date:mime-version:to:cc:references:from:
   subject:in-reply-to:content-transfer-encoding;
  bh=4u4lrx+P6PHxIIV2DHGygciIoa/jQYSB3t+WHNzVJcY=;
  b=JrKv1s73kJjtKOPhebfslZKbJIKH6R7DrcMkrtRSxsRshoXC9QVugA3t
   PGjJgJ6aAuNO8OkjSW5lnv8KvttLeHcr5P4ZVrvU2WVqdDf87EkgBDg35
   a+h8goOPWaEEq3STU71dBzYwrOSb/GHfTtUjtdDdDgj+5598OFYlsq89b
   TW6tKtHyHkhQaG2hd25gWEbYGtpRqb7u8Hd0DpIDtK4m+riDhjBFIkMJX
   pacWKqLWys+AtEhOXn961i4DJbWDb9I68UCHQHURq/t4q+kCEchM295+c
   mVcjKt/uX4tz701EgatFOOAIVXUf1sa3vm35kLzNfi1MXzwrmtCfmVpR4
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="384115376"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; 
   d="scan'208";a="384115376"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 02:22:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="804858816"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; 
   d="scan'208";a="804858816"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by orsmga001.jf.intel.com with ESMTP; 04 Dec 2023 02:22:32 -0800
Message-ID: <e0d6698d-329a-64cb-a8e2-200dd03f3cd2@linux.intel.com>
Date: Mon, 4 Dec 2023 12:23:51 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Content-Language: en-US
To: David Laight <David.Laight@ACULAB.COM>,
 'Andy Shevchenko' <andriy.shevchenko@linux.intel.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
References: <20231201150647.1307406-1-mathias.nyman@linux.intel.com>
 <20231201150647.1307406-9-mathias.nyman@linux.intel.com>
 <e98fd89faf4446e594ca3b7c3cc627fc@AcuMS.aculab.com>
 <ZWovIn0V95c-T74n@smile.fi.intel.com>
 <aa4848b742854ab7921386ca69613866@AcuMS.aculab.com>
From: Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH 08/19] xhci: dbc: Use sizeof_field() where it makes sense
In-Reply-To: <aa4848b742854ab7921386ca69613866@AcuMS.aculab.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2.12.2023 17.50, David Laight wrote:
> From: Andy Shevchenko
>> Sent: 01 December 2023 19:08
>>
>> On Fri, Dec 01, 2023 at 05:31:52PM +0000, David Laight wrote:
>>> From: Mathias Nyman
>>>> Sent: 01 December 2023 15:07
>>
>> ...
>>
>>>> -	memset(dbc->eps, 0, sizeof(struct dbc_ep) * ARRAY_SIZE(dbc->eps));
>>>> +	memset(dbc->eps, 0, sizeof_field(struct xhci_dbc, eps));
>>>
>>> Isn't that just:
>>> 	memset(dpc->eps, 0, sizeof (dpc->eps));
>>> perhaps better written as:
>>> 	memset(&dpc->epc, 0, sizeof (dpc->eps);
>>
>> Maybe...
>> You can send a patch, so it gets tested for regressions!
> 
> Any patch I write will conflict with v2 of this series.
> 

I'll drop this 8/19 patch as it's just a one liner cleanup that does no
harm, but apparently doesn't really help either.

David, I'll be happy to take a patch for this from you, but still need to
run it through some testing

I'll send v2 of this series

Thanks
Mathias

