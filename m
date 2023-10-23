Return-Path: <linux-usb+bounces-2071-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D51C7D38DA
	for <lists+linux-usb@lfdr.de>; Mon, 23 Oct 2023 16:05:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A12E328154B
	for <lists+linux-usb@lfdr.de>; Mon, 23 Oct 2023 14:05:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5141F1B273;
	Mon, 23 Oct 2023 14:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hJC2gYt4"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29DD21A583
	for <linux-usb@vger.kernel.org>; Mon, 23 Oct 2023 14:04:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29E8BD79;
	Mon, 23 Oct 2023 07:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698069894; x=1729605894;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=+C2/Ry6NP0cEOVCtYHcHZQPHV/tKXSmdj1EwbBKyWs4=;
  b=hJC2gYt4tuqh0NVWFmO9QIixix4LYzVZr7kdiph8gW1kK3fC9RWTwm/0
   M6MbSBc+H3So7Hd8Dh18aGcmX4PsvbSu7U3Q6NeHmOo6kzMLVyxuZUmGt
   bhj3q81uMbYDszAvuDOdxSJB232rC1HdMJh5k9pAF8cVD07CiNbCN8CCw
   S1Xu8CLF8fDDlL3RsXqr3ofIdyftaVZxrH1n/pTeoBx19Ot5TuP+28aDs
   gYi4t1U/x7n1xzthxPTjYhz5X1iyy1OB3zm1RWENQmA/DMx2+BVCTmiW8
   ogcWuaYiDC5lvT2ouEBKfpF+wHIKeIaglbl1uX/N5WvcULIe8iJSYxIvN
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="5470690"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; 
   d="scan'208";a="5470690"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 07:04:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="758151299"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; 
   d="scan'208";a="758151299"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by orsmga002.jf.intel.com with ESMTP; 23 Oct 2023 07:04:50 -0700
Message-ID: <830bfe86-06bd-146e-af28-6f79e638060f@linux.intel.com>
Date: Mon, 23 Oct 2023 17:06:20 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [PATCH v2 05/10] xhci: dbc: Check for errors first in
 xhci_dbc_stop()
To: Sergei Shtylyov <sergei.shtylyov@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20231016130934.1158504-1-andriy.shevchenko@linux.intel.com>
 <20231016130934.1158504-6-andriy.shevchenko@linux.intel.com>
 <8b3537e4-db84-7ba7-7c63-0a605631507e@gmail.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <8b3537e4-db84-7ba7-7c63-0a605631507e@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16.10.2023 19.55, Sergei Shtylyov wrote:
> On 10/16/23 4:09 PM, Andy Shevchenko wrote:
> 
>> The usual patter is to check for errors and then continue if none.
> 
>     Pattern. :-)
> 

I'll fix it while applying

-Mathias


