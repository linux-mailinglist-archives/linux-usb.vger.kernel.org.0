Return-Path: <linux-usb+bounces-2961-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81AC37EF3D8
	for <lists+linux-usb@lfdr.de>; Fri, 17 Nov 2023 14:49:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3598D2813D7
	for <lists+linux-usb@lfdr.de>; Fri, 17 Nov 2023 13:49:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDC00328D1;
	Fri, 17 Nov 2023 13:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YL2s4nt9"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB4EE120;
	Fri, 17 Nov 2023 05:49:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700228977; x=1731764977;
  h=message-id:date:mime-version:to:cc:references:from:
   subject:in-reply-to:content-transfer-encoding;
  bh=MOj61IwibiRbGMi9xm3ZBK45QtdUny1wu/WcJXN0C/0=;
  b=YL2s4nt9Sb1aAwVJ12LzpF6qRjNaiwv52GIzQTtpE7bXO3x4YlEaEl5o
   42kuXZUGbIkhpyvaL9PaVs5HUOjAIYE/LMvZ0u728fW7+C0uCLVzrMit7
   2KgQtkbgib+EgkYLCbeP1MxlhcFeq71yFF31NXaWo8AcXxTzluXnX1AZz
   gyVLicZhug9M1J4u0uQpg/E0uqjdSGc3NUduJch7LJBmT8jW3/VaSjPsV
   Tk2WfAeMWWdLQIpgW5GYqw2GlkzrMIoTM0FSZ8TvbYzYuIhLk8F/f5unU
   DFXuEDPdeX2nI9lcQJNR0NJS7aEPyxtCPA0ExDXnYqmzqGOmaLZsC3xYc
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="371480585"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="371480585"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 05:49:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="831617001"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="831617001"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by fmsmga008.fm.intel.com with ESMTP; 17 Nov 2023 05:49:35 -0800
Message-ID: <c77909fd-18d3-4d5f-834c-a696e2abc9c8@linux.intel.com>
Date: Fri, 17 Nov 2023 15:50:50 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Content-Language: en-US
To: Niklas Neronin <niklas.neronin@linux.intel.com>,
 linux-usb@vger.kernel.org, stern@rowland.harvard.edu,
 gregkh@linuxfoundation.org
Cc: stable@vger.kernel.org
References: <20231115121325.471454-1-niklas.neronin@linux.intel.com>
From: Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH] usb: config: fix iteration issue in
 'usb_get_bos_descriptor()'
In-Reply-To: <20231115121325.471454-1-niklas.neronin@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15.11.2023 14.13, Niklas Neronin wrote:
> The BOS descriptor defines a root descriptor and is the base descriptor for
> accessing a family of related descriptors.
> 
> Function 'usb_get_bos_descriptor()' encounters an iteration issue when
> skipping the 'USB_DT_DEVICE_CAPABILITY' descriptor type. This results in
> the same descriptor being read repeatedly.
> 
> To address this issue, a 'goto' statement is introduced to ensure that the
> pointer and the amount read is updated correctly. This ensures that the
> function iterates to the next descriptor instead of reading the same
> descriptor repeatedly.
> 
> Cc: stable@vger.kernel.org
> Fixes: 3dd550a2d365 ("USB: usbcore: Fix slab-out-of-bounds bug during device reset")
> Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
> ---

Acked-by: Mathias Nyman <mathias.nyman@linux.intel.com>



