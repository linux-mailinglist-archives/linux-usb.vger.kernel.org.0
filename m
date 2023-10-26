Return-Path: <linux-usb+bounces-2220-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 626EC7D834B
	for <lists+linux-usb@lfdr.de>; Thu, 26 Oct 2023 15:09:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C565282050
	for <lists+linux-usb@lfdr.de>; Thu, 26 Oct 2023 13:09:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EA232DF87;
	Thu, 26 Oct 2023 13:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PuXhTyBa"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F07AE11C9F
	for <linux-usb@vger.kernel.org>; Thu, 26 Oct 2023 13:09:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DF951B2;
	Thu, 26 Oct 2023 06:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698325756; x=1729861756;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=n+kVWa3f2cmp3SRwLEUoICIQIxRvnp43WE1fOthA6Ak=;
  b=PuXhTyBa9SwkTn7AKJTI0d/HOfMsbaBA6dSx6lvBVV5EoJCWbn2Zuzr+
   U3vBtqXyttqmXJZPJ/odr5cdQnF27EIGop5OtfWM8sJD/iuq9SsvwgLOg
   Ex2F4s9d/JPY2GmfVBDZkPAtAwmvRGmpcMku6ARkVzLcz9rU5CyFh5ZwH
   YroQCWfbHP6PLEgOYSYrPa9kU6dcbSzvDRhy0LTTin1MR6MSv1AmFJi8h
   bYP5LjvQV7ourIVIwXSEE1Fkop6UHgZvjyyDyh9qQflem1qXO54VuqMYK
   /1qCETZoliu4CIxME4paZoMlcj/Icyg3oZcim2muetx0QhnMbteBimkyI
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="366883217"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="366883217"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2023 06:06:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="752709156"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="752709156"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by orsmga007.jf.intel.com with ESMTP; 26 Oct 2023 06:06:39 -0700
Message-ID: <e82b71ad-edbf-103f-54fe-80ddc1b2e47e@linux.intel.com>
Date: Thu, 26 Oct 2023 16:08:09 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [PATCH v6] usb: Reduce the 'SET_ADDRESS' request timeout with a
 new quirk
Content-Language: en-US
To: Hardik Gajjar <hgajjar@de.adit-jv.com>, gregkh@linuxfoundation.org,
 stern@rowland.harvard.edu, mathias.nyman@intel.com
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 erosca@de.adit-jv.com
References: <20231025164019.GA121292@vmlxhi-118.adit-jv.com>
 <20231026101551.36551-1-hgajjar@de.adit-jv.com>
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20231026101551.36551-1-hgajjar@de.adit-jv.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26.10.2023 13.15, Hardik Gajjar wrote:
> This patch introduces a new USB quirk,
> USB_QUIRK_SHORT_SET_ADDRESS_REQ_TIMEOUT, which modifies the timeout value
> for the 'SET_ADDRESS' request. The standard timeout for USB request/command
> is 5000 ms, as recommended in the USB 3.2 specification (section 9.2.6.1).
> 
> However, certain scenarios, such as connecting devices through an APTIV
> hub, can lead to timeout errors when the device enumerates as full speed
> initially and later switches to high speed during chirp negotiation.
> 
> In such cases, USB analyzer logs reveal that the bus suspends for
> 5 seconds due to incorrect chirp parsing and resumes only after two
> consecutive timeout errors trigger a hub driver reset.
> 
> Packet(54) Dir(?) Full Speed J(997.100 us) Idle(  2.850 us)
> _______| Time Stamp(28 . 105 910 682)
> _______|_____________________________________________________________Ch0
> Packet(55) Dir(?) Full Speed J(997.118 us) Idle(  2.850 us)
> _______| Time Stamp(28 . 106 910 632)
> _______|_____________________________________________________________Ch0
> Packet(56) Dir(?) Full Speed J(399.650 us) Idle(222.582 us)
> _______| Time Stamp(28 . 107 910 600)
> _______|_____________________________________________________________Ch0
> Packet(57) Dir Chirp J( 23.955 ms) Idle(115.169 ms)
> _______| Time Stamp(28 . 108 532 832)
> _______|_____________________________________________________________Ch0
> Packet(58) Dir(?) Full Speed J (Suspend)( 5.347 sec) Idle(  5.366 us)
> _______| Time Stamp(28 . 247 657 600)
> _______|_____________________________________________________________Ch0
> 
> This 5-second delay in device enumeration is undesirable, particularly
> in automotive applications where quick enumeration is crucial
> (ideally within 3 seconds).
> 
> The newly introduced quirks provide the flexibility to align with a
> 3-second time limit, as required in specific contexts like automotive
> applications.
> 
> By reducing the 'SET_ADDRESS' request timeout to 500 ms, the
> system can respond more swiftly to errors, initiate rapid recovery, and
> ensure efficient device enumeration. This change is vital for scenarios
> where rapid smartphone enumeration and screen projection are essential.
> 
> To use the quirk, please write "vendor_id:product_id:p" to
> /sys/bus/usb/drivers/hub/module/parameter/quirks
> 
> For example,
> echo "0x2c48:0x0132:p" > /sys/bus/usb/drivers/hub/module/parameters/quirks"
> 
> Signed-off-by: Hardik Gajjar <hgajjar@de.adit-jv.com>
> ---

For the xhci parts:

Reviewed-by: Mathias Nyman <mathias.nyman@linux.intel.com>

