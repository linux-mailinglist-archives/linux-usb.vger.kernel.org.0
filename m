Return-Path: <linux-usb+bounces-1508-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28AA37C701D
	for <lists+linux-usb@lfdr.de>; Thu, 12 Oct 2023 16:12:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A829F282ABA
	for <lists+linux-usb@lfdr.de>; Thu, 12 Oct 2023 14:12:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53A3030FA1;
	Thu, 12 Oct 2023 14:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l/IfSs5k"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 749752941E
	for <linux-usb@vger.kernel.org>; Thu, 12 Oct 2023 14:12:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC54C91
	for <linux-usb@vger.kernel.org>; Thu, 12 Oct 2023 07:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697119923; x=1728655923;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=u6RE3VHUmFcb14AYSTpBkU2wHwqq7oh9a3qBjUAtrY8=;
  b=l/IfSs5kKWVO/G2/1C0ljb4aGi9LD1T/Jg9wL6640j/emsbd2peEkYP1
   UytdaR9E1o7twuTV3Tk+1KaMDI8u142kATMQc5FBdOPNKPbgbv9uBg9zc
   Nek1es9SdBIZ0fxZMSFLVl9zhCVM/ogSAP6vK2wo6WzYboqRWqabSykaT
   o6J9RYIHISE2hKZn5BoguOp3pAIleeXz93OPc/wgmAj/Ikp9gJWc1ziVe
   NaWMF9WAFRAYyfprAVktSvM0B8JZnKLfmXKzoGUVQIuRFGw7bkXMwbu/z
   OvYG03Itwn8q6seCvZDBdbghu9z6yRne2qpWckNnnY8x/z6aQEbbgNPK/
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="387775902"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="387775902"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 07:12:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="870588936"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="870588936"
Received: from unknown (HELO [10.237.72.199]) ([10.237.72.199])
  by fmsmga002.fm.intel.com with ESMTP; 12 Oct 2023 07:11:59 -0700
Message-ID: <edb99fbe-854e-11f7-b718-b31c921a962e@linux.intel.com>
Date: Thu, 12 Oct 2023 17:13:26 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [PATCH v5] usb: host: xhci-plat: fix possible kernel oops while
 resuming
Content-Language: en-US
To: Sergey Shtylyov <s.shtylyov@omp.ru>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>
References: <c8c4ea38-c0f7-756d-01fb-cab51a3f8393@omp.ru>
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <c8c4ea38-c0f7-756d-01fb-cab51a3f8393@omp.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On 4.10.2023 23.47, Sergey Shtylyov wrote:
> If this driver enables the xHC clocks while resuming from sleep, it calls
> clk_prepare_enable() without checking for errors and blithely goes on to
> read/write the xHC's registers -- which, with the xHC not being clocked,
> at least on ARM32 usually causes an imprecise external abort exceptions
> which cause kernel oops.  Currently, the chips for which the driver does
> the clock dance on suspend/resume seem to be the Broadcom STB SoCs, based
> on ARM32 CPUs, as it seems...
> 
> Found by Linux Verification Center (linuxtesting.org) with the Svace static
> analysis tool.
> 
> Fixes: 8bd954c56197 ("usb: host: xhci-plat: suspend and resume clocks")
> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
> 
> ---
> This patch is against the 'usb-next' branch of Greg KH's 'usb.git' repo...

Looks good to me, adding to queue

Thanks
Mathias


