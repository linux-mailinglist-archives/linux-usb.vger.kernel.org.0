Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3AFB46F4010
	for <lists+linux-usb@lfdr.de>; Tue,  2 May 2023 11:25:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233410AbjEBJZU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 2 May 2023 05:25:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233271AbjEBJZT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 2 May 2023 05:25:19 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EBA59D
        for <linux-usb@vger.kernel.org>; Tue,  2 May 2023 02:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683019518; x=1714555518;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=iCN3ZHbEQn8x+F6zgz2fyDFFKue359pVQdG1473pNa8=;
  b=aiO5LBJq2Bxs4XqF+X1bks7WTMKfOiEpm1kaOc/59IB3iDVkuxPUECzx
   TwjyLzhU3JRPk0+DMMQUb4adrvbEYniW0EglWavIUyt5rCY5ZNxv/f0wD
   JDWooHhn85ogDGPfF32NnILRKfFImfyJ1YoSjUSZTma/53Qtzjaxj9OGn
   ZtSjl9BYv9TgLsOFfuR4jI13GcFaRqqn1jnXlbGfShkvWXxM3pBw6JtXe
   iCk/LFHvYmqfnx4OAet91+rnLZSfYbCnA59T9JC5lBGnBEdy3LWJqdosl
   N6AvZQJrl8bWAPoGIofrYMDBJxj76coYLVizkfEsuRqT8QdLbSqicKd2U
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="411486957"
X-IronPort-AV: E=Sophos;i="5.99,243,1677571200"; 
   d="scan'208";a="411486957"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2023 02:25:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="698897816"
X-IronPort-AV: E=Sophos;i="5.99,243,1677571200"; 
   d="scan'208";a="698897816"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by fmsmga007.fm.intel.com with ESMTP; 02 May 2023 02:25:16 -0700
Message-ID: <b645dee2-589b-6449-5ad6-1e7b42452470@linux.intel.com>
Date:   Tue, 2 May 2023 12:26:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.7.1
Subject: Re: [PATCH v4 2/2] xhci: Improve the XHCI system resume time
Content-Language: en-US
To:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
        gregkh@linuxfoundation.org, stern@rowland.harvard.edu,
        mathias.nyman@intel.com, linux-usb@vger.kernel.org
References: <20230428140056.1318981-1-Basavaraj.Natikar@amd.com>
 <20230428140056.1318981-3-Basavaraj.Natikar@amd.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20230428140056.1318981-3-Basavaraj.Natikar@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 28.4.2023 17.00, Basavaraj Natikar wrote:
> Avoid extra 120ms delay during system resume.
> 
> The xHC controller may signal wake up to 120ms before showing which usb
> device caused the wake on the xHC port registers.
> 
> The xhci driver therefore checks for port activity up to 120ms during
> resume, making sure that the hub driver can see the port change, and
> won't immediately runtime suspend back due to no port activity.
> 
> This is however only needed for runtime resume as system resume will
> resume all child hubs and other child usb devices anyway.
> 
> Fixes: 253f588c70f6 ("xhci: Improve detection of device initiated wake signal.")
> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
> ---
>   drivers/usb/host/xhci.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
> index 11a87b9cbb50..4c0a2b9ca7b2 100644
> --- a/drivers/usb/host/xhci.c
> +++ b/drivers/usb/host/xhci.c
> @@ -1315,7 +1315,7 @@ int xhci_resume(struct xhci_hcd *xhci, pm_message_t msg)
>   		 * the first wake signalling failed, give it that chance.
>   		 */
>   		pending_portevent = xhci_pending_portevent(xhci);
> -		if (!pending_portevent) {
> +		if (!pending_portevent && msg.event == PM_EVENT_AUTO_RESUME) {
>   			msleep(120);
>   			pending_portevent = xhci_pending_portevent(xhci);
>   		}

Acked-by: Mathias Nyman <mathias.nyman@linux.intel.com>
