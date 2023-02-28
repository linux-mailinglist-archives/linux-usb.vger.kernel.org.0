Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9C046A58B1
	for <lists+linux-usb@lfdr.de>; Tue, 28 Feb 2023 12:56:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229629AbjB1L4x (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 28 Feb 2023 06:56:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230059AbjB1L4v (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 28 Feb 2023 06:56:51 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E21A2FCCB
        for <linux-usb@vger.kernel.org>; Tue, 28 Feb 2023 03:56:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677585384; x=1709121384;
  h=message-id:date:mime-version:to:cc:references:from:
   subject:in-reply-to:content-transfer-encoding;
  bh=rA0YYpX5RALIgtVftjW7ARq8mmzxVDdlxWSYkHzNZ84=;
  b=SxBQ3bYgVO0od3xeACzBmF9Su/2JpTJBhoqGtzWE3oyvoAihx4BPrBXI
   plFxLaNbD+liwBrE8D9SWKTSliG4A5IpIcmRK3ebi2yTw489VT5ZTNqDm
   eBM330Xf3o5g7xbBS5cTwcVQDUPUF2d6IBV6rEX8j7PAWuiZlL7ONLzVZ
   4qpzpUx0w7qYEor0ycBUxlTOs8D/xD7F42ZYDICrL/sPIRZl6SIpfkKNY
   Ii31xDNJtTDpXfea8zmi7pm7Rj7jEOTtHpyOgWb6750tpMI1+eD+dxlGQ
   97VtiwEEGMWJJQHPR9O+3QYl0jRP3Ua5YlTLG9KIJcCbE16W7Pm2s62Z7
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="336405578"
X-IronPort-AV: E=Sophos;i="5.98,221,1673942400"; 
   d="scan'208";a="336405578"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2023 03:55:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="742951801"
X-IronPort-AV: E=Sophos;i="5.98,221,1673942400"; 
   d="scan'208";a="742951801"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by fmsmga004.fm.intel.com with ESMTP; 28 Feb 2023 03:55:21 -0800
Message-ID: <65506fa7-9c49-2b80-5a29-c8e619f02894@linux.intel.com>
Date:   Tue, 28 Feb 2023 13:56:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.7.1
To:     Fengyi WU <fengyi.wu@se.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        "peter.chen@nxp.com" <peter.chen@nxp.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Peter Chen <peter.chen@kernel.org>
References: <DB7PR04MB40129A44420006C5048D8F7095AF9@DB7PR04MB4012.eurprd04.prod.outlook.com>
 <a1871c3c-d2a0-72e9-e96c-f0791b4663be@intel.com>
 <VI1PR04MB401592DD04F6BE20FE7F5EE895AC9@VI1PR04MB4015.eurprd04.prod.outlook.com>
 <DB7PR04MB401234A7AC2028D1E0A15A9F95AC9@DB7PR04MB4012.eurprd04.prod.outlook.com>
Content-Language: en-US
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: USB transaction errors causing ERROR unknown event type 37
In-Reply-To: <DB7PR04MB401234A7AC2028D1E0A15A9F95AC9@DB7PR04MB4012.eurprd04.prod.outlook.com>
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

Hi

(squashing and modifying the two top posted emails a bit to make this more readable)

On 28.2.2023 6.37, Fengyi WU wrote:

> We followed your suggestion and tried to add this patch to the 5.4 kernel,nothing has changed.
> 36dc01657b49 usb: host: xhci: Support running urb giveback in tasklet context
> 
> We also adjusted the xhci interrupt moderation interval (IMODI) from 40000 to 10000.
> Nothing changed either.
> 
> And we are thinking to try the 5.5 kernel next, but not sure if this will make any difference or not.
> 

I'd recommend trying a more recent upstream 6.1 or 6.2 kernel

> We do tried the ubuntu kernel 5.4, it was working without any problem as I mentioned.

If the problem is only visible with a custom NXP kernel then there isn't much I can do.

> Let me give you more info, so we can debug and analysis together.
> I did a trace using the command below, can you check the atttached trace file?
> echo 81920 > /sys/kernel/debug/tracing/buffer_size_kb
> echo 1 > /sys/kernel/debug/tracing/events/xhci-hcd/enable
> 
> I do found Event Ring Full Error inside the trace file.

Trace shows there are a lot of isoc TRBs with BEI (Block Event Interrupt) flag queued.
These will fill the event ring with transfer events without issuing interrupts.

Did setting the XHCI_AVOID_BEI flag for this host help?

An more reasonable interrupt rate can be achieved by setting both XHCI_AVOID_BEI
flag, and adding:
"edc649a82341 xhci: Tune interrupt blocking for isochronous transfers"
from 5.10 kernel.

This in addition to "36dc01657b49 usb: host: xhci: Support running urb giveback in tasklet context"
and the patch by Peter Chen mentioned earlier

Thanks
Mathias

