Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34EA26A3E80
	for <lists+linux-usb@lfdr.de>; Mon, 27 Feb 2023 10:37:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229997AbjB0JhF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Feb 2023 04:37:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230017AbjB0JhC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 27 Feb 2023 04:37:02 -0500
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FC32CA36
        for <linux-usb@vger.kernel.org>; Mon, 27 Feb 2023 01:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677490619; x=1709026619;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=MHZ2Ote4jfPplUnbF8xTvO6kYrMo6Mqpj2OHOVTw4PY=;
  b=Gt3njsm1UPPsQpNsHUegY5wQgw2BgVsy/VA3BB16OKGHq4RZacXnf/zQ
   JYdsKZFngROQ6xUtQfIasD0RfUki/BOPYecU6MjUhDTT3wRxhT4z3BTSO
   ieexM7GCytQyjqPQ9g33sK1CBpOXJ9ee52gFyD4NJ1wMq/ksG7TVDYN20
   cNrvTD9fnypXFdsmXchideU4coTXP6u3l4X6/zkXRVTYN1s/jg4BnbvQ1
   Ah2jrDcI4uDXHjtZOYcXTW7OjsGMwC1m1gRTf2LsqQUbB066yKfTgZgA8
   wrkI53kuNhjacOkl1N5ZPPgrN159cfdJtjrLYgexY8Vzw+oap/AnV/xMi
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="335301496"
X-IronPort-AV: E=Sophos;i="5.97,331,1669104000"; 
   d="scan'208";a="335301496"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2023 01:36:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="737595839"
X-IronPort-AV: E=Sophos;i="5.97,331,1669104000"; 
   d="scan'208";a="737595839"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by fmsmga008.fm.intel.com with ESMTP; 27 Feb 2023 01:36:56 -0800
Message-ID: <a1871c3c-d2a0-72e9-e96c-f0791b4663be@intel.com>
Date:   Mon, 27 Feb 2023 11:38:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.7.1
Subject: Re: USB transaction errors causing ERROR unknown event type 37
Content-Language: en-US
To:     Fengyi WU <fengyi.wu@se.com>,
        "peter.chen@nxp.com" <peter.chen@nxp.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Peter Chen <peter.chen@kernel.org>,
        "mathias.nyman@linux.intel.com" <mathias.nyman@linux.intel.com>
References: <DB7PR04MB40129A44420006C5048D8F7095AF9@DB7PR04MB4012.eurprd04.prod.outlook.com>
From:   Mathias Nyman <mathias.nyman@intel.com>
In-Reply-To: <DB7PR04MB40129A44420006C5048D8F7095AF9@DB7PR04MB4012.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 27.2.2023 6.13, Fengyi WU wrote:
> Hi,
> 
> We have a board NXP i.MX8MPlus EVK. We are running Linux 5.4.24 from NXP on the SoC.
> 
> There is an analog to USB converter connected to the SoC via USB.
> The converter is this.
> https://www.linuxtv.org/wiki/index.php/The_Imaging_Source_DFG-USB2pro#Making_it_Work
> 
> We want to play video on the EVK and the result is that with 640*480 resolution, the video quality is very bad
> And the FPS is only 10.
> Before we applied the patch from Peter Chen, the 640*480 resolution is not playable.
> So the patch from Peter is usable, but not enough for us to make a good video quality.
> 
> The patch is this:
> https://patchwork.kernel.org/project/linux-usb/patch/1573836603-10871-2-git-send-email-mathias.nyman@linux.intel.com/
> 
> And we saw a lot of ERROR unknown event type 37 log on the console while the video is playing when it is not well working
> [  272.942827] xhci-hcd xhci-hcd.1.auto: ERROR unknown event type 37
> [  272.999240] xhci-hcd xhci-hcd.1.auto: ERROR unknown event type 37
> [  273.055696] xhci-hcd xhci-hcd.1.auto: ERROR unknown event type 37
> [  273.112372] xhci-hcd xhci-hcd.1.auto: ERROR unknown event type 37
> [  273.168736] xhci-hcd xhci-hcd.1.auto: ERROR unknown event type 37
> [  273.225463] xhci-hcd xhci-hcd.1.auto: ERROR unknown event type 37
> [  273.281947] xhci-hcd xhci-hcd.1.auto: ERROR unknown event type 37
> [  273.338204] xhci-hcd xhci-hcd.1.auto: ERROR unknown event type 37
> [  273.394560] xhci-hcd xhci-hcd.1.auto: ERROR unknown event type 37
> [  273.451048] xhci-hcd xhci-hcd.1.auto: ERROR unknown event type 37
> [  273.506856] xhci-hcd xhci-hcd.1.auto: ERROR unknown event type 37
> [  273.563624] xhci-hcd xhci-hcd.1.auto: ERROR unknown event type 37
> 
> We do tried the same USB converter device on Ubuntu kernel and everything is working fine, and the USB converter kernel driver between NXP kernel and ubuntu kernel is the same.
> So the problem we think is from the USB 3.0 xhci core driver.

Event type 37 is a "host controller event", usually seen when event ring is full.

The patch from Peter Chen also touches this area, making sure we update the event ring
dequeue pointer in hardware more often.

This error can happen if interrupts are disabled for a long time, or we have a lot of
TRBs on the event ring that don't generate interrupts.

There are some changes in this area since 5.4 kernel.
Is it possible to try a more recent kernel?

For example in kernel 5.5 we are giving back URBs in tasklet context, see:
36dc01657b49 usb: host: xhci: Support running urb giveback in tasklet context

Other things to try:
- set xhci->quirks |= XHCI_AVOID_BEI to make isoc transfers interrupt more often
- adjust the xhci interrupt moderation interval (IMODI)
- Add xhci dynamic debug and tracing to get more details of what is really going on


Thanks
Mathias

