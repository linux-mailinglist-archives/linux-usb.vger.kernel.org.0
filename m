Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CECEF542F68
	for <lists+linux-usb@lfdr.de>; Wed,  8 Jun 2022 13:46:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238374AbiFHLqB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 Jun 2022 07:46:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230231AbiFHLp7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 8 Jun 2022 07:45:59 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 220F26352D
        for <linux-usb@vger.kernel.org>; Wed,  8 Jun 2022 04:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654688758; x=1686224758;
  h=message-id:date:mime-version:to:cc:references:from:
   subject:in-reply-to:content-transfer-encoding;
  bh=RGITRYmV5DP15vOW/C60uIZgds4LbezQ1OqZ3owNink=;
  b=bGpVxxBgBCDOL5sCbcMrKICjVV9RK/i/AmorrnUnwjBv+xIgIg6Ih7/M
   dWcpoxXgn3r080qT7H54ITXxB74KdmPbGGwbByUQtPt+A8Z/YEeOiLTLf
   3BcZ/N8ylXPwrW2bJ8XWUn0FXB/S0HqdC08yn3iAGoS1U3+8Ul7UvMjso
   0DweM9MbOfOTq9ecGKnDYsTea9XwKseUo8cu6BgKaNAf04jh3J/UVW5RD
   CSG4bQwPqnSLhBEEx+KZDcUlFD/jmauPlqCx1Gn+GCyKC0SuxnV84j7os
   yIT/r1kU55ivzUlibLB9O0Oe0BdHMdcL3EGWXqdH4WjM4iFSFN3YxXp3Y
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10371"; a="274393160"
X-IronPort-AV: E=Sophos;i="5.91,286,1647327600"; 
   d="scan'208";a="274393160"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2022 04:45:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,286,1647327600"; 
   d="scan'208";a="723821319"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by fmsmga001.fm.intel.com with ESMTP; 08 Jun 2022 04:45:55 -0700
Message-ID: <36fdbf28-47fa-522e-8789-23bb1afa9176@linux.intel.com>
Date:   Wed, 8 Jun 2022 14:47:22 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.8.1
Content-Language: en-US
To:     Oliver Neukum <oneukum@suse.com>, linux-usb@vger.kernel.org,
        stern@rowland.harvard.edu
Cc:     evgreen@google.com, shobhit.srivastava@intel.com
References: <20220607135836.627711-1-mathias.nyman@linux.intel.com>
 <400be833-468c-be0d-c80a-f3617800750d@suse.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [RFC PATCH 0/1] hibernate and roothub port power
In-Reply-To: <400be833-468c-be0d-c80a-f3617800750d@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-9.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 8.6.2022 11.19, Oliver Neukum wrote:
> 
> 
> On 07.06.22 15:58, Mathias Nyman wrote:
> 
> Hi,
> 
>> In shutdown (S5), with xHCI as host, this can be solved fairly easily
>> by turning off roothub port power in the .shutdown path.
> 
> That would suck for the people who charge their phone from their
> computer.

Good point.
My guess is that xHC port power bits won't actually turn off VBus for those
Sleep-and-charge, or Always-on ports.
VBus is allowed to be on even if port is in power-off state, but usb link state
should be forced to ss.Disabled from other states, like U3.

Need to try it out, it's possible this turns off VBus for some usb-A ports
on some older systems that earlier (accidentally?) supplied VBus on
"normal" ports after shutdown.

> 
>> This is discussed in xhci spec 4.19.4 for driver unload:
>> "Before the xHC driver is unloaded, the driver should clear the
>> Port Power (PP) flag of all Root Hub ports to place them into
>> the Disabled state and reduce port power consumption."
> 
> Yes, you could say that the standard calls for this.
> 
>> But I can't come up with a better solution, so this RFC patch
>> does exactly that. It turns off port power for xHC roothub ports
>> in the hibernate poweroff_late stage, but only if the host isn't set
>> to wake up the system from S4.
> 
> In general this looks like the sane strategy.
> However, what will this do if the port is in an alternate mode
> or if this is the port the system's battery is to be charged through?

I have to double check this, but my understanding is that xHC port power bits
don't have any impact here. These cases are handled by other parts like the
power delivery controller before the connector may even be muxed to a xHC.
Most likely turning off xHC port power bits here will only force a connected
usb device link state to ss.Disabled (or usb2 equivalent state).

Thanks for the feedback

-Mathias
