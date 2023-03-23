Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD14B6C6A83
	for <lists+linux-usb@lfdr.de>; Thu, 23 Mar 2023 15:14:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231236AbjCWOON (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Mar 2023 10:14:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229682AbjCWOOM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 23 Mar 2023 10:14:12 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3AB0233CC
        for <linux-usb@vger.kernel.org>; Thu, 23 Mar 2023 07:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679580851; x=1711116851;
  h=message-id:date:mime-version:to:cc:references:from:
   subject:in-reply-to:content-transfer-encoding;
  bh=Xn+rLOn+HsKhcuT7nI2iKY4L3uGJgS8mgnqXmJXx/88=;
  b=gaPap2CY8ImWyWrmc7vEeqBYj+F4DI2LTB3NyAK9E6+RSt12vZWYElfC
   EdrHDrV8aFuh+IjR4vxZMvGe/r8jSqGnCSDR9wv2BKI/MqyscKEhcmzHR
   MHKgXw5ZT08oBxgqrlRW3Tn1v+OqM+Z4/7iQ3WTKflJ2Bry5FHjKY5cMC
   A2jRGUs6xRroaa9b1VCUOcE6UiEWDkN++h0VaCddTXjbMqiP3ILs0i0ZA
   /F9+DzNf3YL8BYGd1KKp4NfZ4GGKITEIk5bEzvJCEh9AV5hyMqQhojjZg
   2XUufrU5njuEOrWx9Aofca5mZx7oTp/OxO4EtMC4JxexMzD+mMmVKAQfc
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="341874851"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; 
   d="scan'208";a="341874851"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2023 07:14:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="659638386"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; 
   d="scan'208";a="659638386"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by orsmga006.jf.intel.com with ESMTP; 23 Mar 2023 07:14:09 -0700
Message-ID: <6edd8939-062a-9548-893b-8f02598c2fec@linux.intel.com>
Date:   Thu, 23 Mar 2023 16:15:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.7.1
Content-Language: en-US
To:     Udipto Goswami <quic_ugoswami@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>
Cc:     Pratham Pratap <quic_ppratap@quicinc.com>,
        Jack Pham <quic_jackp@quicinc.com>, linux-usb@vger.kernel.org
References: <20230323131315.21764-1-quic_ugoswami@quicinc.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH] usb: xhci: Remove unused udev from xhci_log_ctx trace
 event
In-Reply-To: <20230323131315.21764-1-quic_ugoswami@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 23.3.2023 15.13, Udipto Goswami wrote:
> xhci_log_ctx event is not utilizing the extracted udev to
> print out anything, hence removing it.
> 
> Fixes: 1d27fabec068 ("xhci: add xhci_address_ctx trace event")
> Signed-off-by: Udipto Goswami <quic_ugoswami@quicinc.com>
> ---
>   drivers/usb/host/xhci-trace.h | 4 ----
>   1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-trace.h b/drivers/usb/host/xhci-trace.h
> index 4286dba5b157..7555c4ea7c4b 100644
> --- a/drivers/usb/host/xhci-trace.h
> +++ b/drivers/usb/host/xhci-trace.h
> @@ -80,20 +80,16 @@ DECLARE_EVENT_CLASS(xhci_log_ctx,
>   		__field(dma_addr_t, ctx_dma)
>   		__field(u8 *, ctx_va)
>   		__field(unsigned, ctx_ep_num)
> -		__field(int, slot_id)
>   		__dynamic_array(u32, ctx_data,
>   			((HCC_64BYTE_CONTEXT(xhci->hcc_params) + 1) * 8) *
>   			((ctx->type == XHCI_CTX_TYPE_INPUT) + ep_num + 1))
>   	),
>   	TP_fast_assign(
> -		struct usb_device *udev;
>   
> -		udev = to_usb_device(xhci_to_hcd(xhci)->self.controller);

Looks like this was flawed from the beginning, forcing a device struct for a host controller into
a struct usb_device

Adding to queue

Thanks
Mathias
