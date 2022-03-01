Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD09A4C86D4
	for <lists+linux-usb@lfdr.de>; Tue,  1 Mar 2022 09:46:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232809AbiCAIqi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Mar 2022 03:46:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231214AbiCAIqh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 1 Mar 2022 03:46:37 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08AC6887B0
        for <linux-usb@vger.kernel.org>; Tue,  1 Mar 2022 00:45:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646124357; x=1677660357;
  h=to:cc:references:from:subject:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=kZlnL7Cjf3OQonGGAlDqlXfRnXMN3fkRvXe0n8J+s50=;
  b=FZZ+nVW1dFM8Stp3hSHROW7jH3kQ8cM1P6mvCRE3De5n3tL5BDDGiEO7
   mtIZlmWSwNVUVzs8qKfcYJdC7yldD8Ka9mmgFvgK/Iai6vIf9Ce6jkSN/
   YvcU7LUV5bkyMsKgQumevsUTn2T8JwV2rcZRirNJKALfI6C1CdmgmD374
   Pht0uzAwz/pGULRVBmjXt/2PBcShs1H3FmJgL6rH7Cml8EpBtWXT0tJq1
   1W4cfaw6K1x6EbPjXwImEeuaicK4Z8RN5IMy89g6XD2fzH70kC6GMgMd8
   Q9PS/0uazoXWa2CwH689S0uIpniMzNMX81XznXr09wkXHdH7urYazaCrM
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10272"; a="277754605"
X-IronPort-AV: E=Sophos;i="5.90,145,1643702400"; 
   d="scan'208";a="277754605"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2022 00:45:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,145,1643702400"; 
   d="scan'208";a="575626988"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by orsmga001.jf.intel.com with ESMTP; 01 Mar 2022 00:45:55 -0800
To:     Pavan Kondeti <quic_pkondeti@quicinc.com>,
        Jack Pham <quic_jackp@quicinc.com>
Cc:     s.shtylyov@omp.ru, linux-usb@vger.kernel.org
References: <20220217135643.1321889-1-mathias.nyman@linux.intel.com>
 <20220301014949.GG13801@jackp-linux.qualcomm.com>
 <20220301040339.GA11371@hu-pkondeti-hyd.qualcomm.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [RFT PATCH] xhci: make xhci_handshake timeout for xhci_reset()
 adjustable
Message-ID: <ffc9abb1-908b-1c09-cd9d-cbd83ea4e478@linux.intel.com>
Date:   Tue, 1 Mar 2022 10:47:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220301040339.GA11371@hu-pkondeti-hyd.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 1.3.2022 6.03, Pavan Kondeti wrote:
> On Mon, Feb 28, 2022 at 05:49:49PM -0800, Jack Pham wrote:
>> Hi Mathias,
>>
>> On Thu, Feb 17, 2022 at 03:56:43PM +0200, Mathias Nyman wrote:
>>> xhci_reset() timeout was increased from 250ms to 10 seconds in order to
>>> give Renesas 720201 xHC enough time to get ready in probe.
>>
>> This suggests that the only place we really need the long timeout is
>> in xhci_gen_setup().
>>
>>> @@ -1163,7 +1161,7 @@ int xhci_resume(struct xhci_hcd *xhci, bool hibernated)
>>>  		xhci_dbg(xhci, "Stop HCD\n");
>>>  		xhci_halt(xhci);
>>>  		xhci_zero_64b_regs(xhci);
>>> -		retval = xhci_reset(xhci);
>>> +		retval = xhci_reset(xhci, XHCI_RESET_LONG_USEC);
>>
>> Since preemption is disabled here (spin_lock_irq() is called near the
>> start of this function), shouldn't we also limit this to 250ms here in
>> xhci_resume() as well?
>>> The rationale of decreasing the timeout to 250 in certain places is based
> on the criticality of the operation but not on the preemption/irq state.
> Since xHC reset is critical in startup and resume, the 10 seconds timeout
> is enforced so that we don't break Renesas 720201 xHC.
> 
> Since all of our internl test reports indicate that the timeout is happening
> from stop hcd, this patch is helping.
> 

This was pretty much my reasoning as well.
I could add a comment about this to the commit message

In addition we want a targeted fix for a real world issue that we can send to
stable without changing too much, risking regressions.

I also think we should focus more on fixing the locking (preemption/irq state)
around xhci_reset() in xhci_resume() than tuning the timeout, but this needs more
thought and should be a separate patch for later.

Additionally I guess xhci_reset() is more likely to fail in xhci_stop() and
xhci_shutdown() as power or clocks for xHC may be disabled, or entire xHC removed from the
bus by then.   

Thanks
-Mathias
