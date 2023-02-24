Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C50BD6A1C19
	for <lists+linux-usb@lfdr.de>; Fri, 24 Feb 2023 13:22:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229906AbjBXMWy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Feb 2023 07:22:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229634AbjBXMWw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 24 Feb 2023 07:22:52 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73E4B2D6C
        for <linux-usb@vger.kernel.org>; Fri, 24 Feb 2023 04:22:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677241371; x=1708777371;
  h=message-id:date:mime-version:to:cc:references:from:
   subject:in-reply-to:content-transfer-encoding;
  bh=9XBXHElmYjaK7Xyk9qkJT6ahzA4RstIe7M/qnposHQQ=;
  b=BNKySdpaXwZ+NX9PfBzcW0U8qqJQjapy0G4eF/L669XlHPcfBSps5tKw
   xkjl6yc+W2ZwJ5u34k6UhpW3X1pOrvHgShLtQIP/jFBjgGkO3q1UNLJK9
   F4M1YDbLzYHGIie1VyW5URx5FErhjP6AGUDFSHNDtdeGUHlYBEQRJGWAA
   IGnqEvLq4xSM06o9haJAOvyogSvjGpDeTAqN1I3rELx0Rd4+9YDR1oGhH
   a8Ov1U1vUgOWgRJk2Ftknz4+p2P74+G4awNbKFRnwntruvSyXI2Ciy4Hc
   93xK8gQboRR8NpFbzv5mn/uT3k5HTevsdr8N5ZbKpmNGQIVOQnJiXSKyO
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="331199753"
X-IronPort-AV: E=Sophos;i="5.97,324,1669104000"; 
   d="scan'208";a="331199753"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2023 04:22:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="666145238"
X-IronPort-AV: E=Sophos;i="5.97,324,1669104000"; 
   d="scan'208";a="666145238"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by orsmga007.jf.intel.com with ESMTP; 24 Feb 2023 04:22:49 -0800
Message-ID: <39df1d39-f1f9-ce69-64b8-981b19731d30@linux.intel.com>
Date:   Fri, 24 Feb 2023 14:24:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.7.1
Content-Language: en-US
To:     Seth Bollinger <seth.boll@gmail.com>,
        Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org, sethb@digi.com
References: <CA+JN8xMXu=sVQ2nyR9SgF25fquCZhH43wdsnuvfjDu+yGRv2yA@mail.gmail.com>
 <b13655bf-4a04-bece-71e4-698bfec83e2d@linux.intel.com>
 <CA+JN8xOOyU8yLJrxnKPwAMhQFKE70rTi=aLa3Adt7Og4dfPRVg@mail.gmail.com>
 <Y/eKwvQAihZYKUos@rowland.harvard.edu>
 <CA+JN8xOWzo8ugtzyrAeSB5wN7XSxXs1-69kTZyJ-ZSPLTvFx-A@mail.gmail.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: HC died
In-Reply-To: <CA+JN8xOWzo8ugtzyrAeSB5wN7XSxXs1-69kTZyJ-ZSPLTvFx-A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 23.2.2023 18.05, Seth Bollinger wrote:
>> Note that the USB-2.0 spec says (section 9.2.6.3, Set Address
>> Processing):
>>
>>          After the reset/resume recovery interval, if a device receives a
>>          SetAddress() request, the device must be able to complete
>>          processing of the request and be able to successfully complete
>>          the Status stage of the request within 50 ms.
>>
>> These devices' 9.6 seconds to process a Set-Address request is a _lot_
>> longer than 50 ms.  No wonder they don't work properly.  Why on earth do
>> they take so long?
> 
> The device can't actually respond as it's no longer present on the
> bus.  The hardware is taking this long to complete the TRB when the
> device disappears in the middle of the transaction (at least this is
> the theory).
> 
> I'm not trying to argue that these devices aren't crappy.  However, it
> does seem like there are quite a lot of crappy devices in the field.
> It would be nice if the driver didn't die when encountering these
> devices.
> 
>> Of course, xHCI controller drivers should be able to cancel an
>> Address-Device TRB without waiting for it to complete.
> 
> Agreed.  Is there some way I could try to cancel this command ring
> TRB?  The hardware seems hung enough that it's not responding to
> whatever we're trying to do in the cleanup routine when the timeout
> handler fires though.

xhci driver does exactly this, but fails to stop the command ring while
trying to abort the command TRB.

Does increasing the timeout for stopping command ring help?

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index f5b0e1ce22af..6cecbca34cca 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -397,7 +397,7 @@ static int xhci_abort_cmd_ring(struct xhci_hcd *xhci, unsigned long flags)
          * and try to recover a -ETIMEDOUT with a host controller reset.
          */
         ret = xhci_handshake(&xhci->op_regs->cmd_ring,
-                       CMD_RING_RUNNING, 0, 5 * 1000 * 1000);
+                       CMD_RING_RUNNING, 0, 10 * 1000 * 1000);
         if (ret < 0) {
                 xhci_err(xhci, "Abort failed to stop command ring: %d\n", ret);
                 xhci_halt(xhci);
Thanks
-Mathias
