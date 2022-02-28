Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2EDA14C6AB9
	for <lists+linux-usb@lfdr.de>; Mon, 28 Feb 2022 12:37:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235882AbiB1LiZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 28 Feb 2022 06:38:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235485AbiB1LiX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 28 Feb 2022 06:38:23 -0500
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75D5F1A808
        for <linux-usb@vger.kernel.org>; Mon, 28 Feb 2022 03:37:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646048264; x=1677584264;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=XClrDydasJs3bfEf61lLT5SWAC+IuVng5M/uMKS4c7w=;
  b=cpFHmiS+4z3hgfBiFmWmspAE7aSdeKWGG8NIbrGjLf4y1zJqxPQLUmtd
   DbyTKnYY0CpwFKzaN9d5whotoY+vzJfns8ffVBZLHU2um7sH65Rw5bXLK
   mZyLkYhJl/sgRh386e/h8myeEF8N6BdZdTKtwPw9YvN2a+uRicHmajz3m
   QKQBo/aJOhmEBldo5FfMMouFz8N0zxZ0E7pDXYIsXlW4nqz2HooZVIJAU
   cPLkiP3vqywHpJ/X7Wn+LempPy3kwT4HSIdXuRwhKs19rUlrdtRlrukMe
   G9GjQ1z4ZEZmSuoFK01c+D1722D86s+xDABNtW6yaKQcBGho7FWQNdpkN
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10271"; a="251696003"
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400"; 
   d="scan'208";a="251696003"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2022 03:37:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400"; 
   d="scan'208";a="575287674"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by orsmga001.jf.intel.com with ESMTP; 28 Feb 2022 03:37:29 -0800
Subject: Re: [RFT PATCH] xhci: make xhci_handshake timeout for xhci_reset()
 adjustable
To:     Udipto Goswami <quic_ugoswami@quicinc.com>,
        Pavan Kondeti <quic_pkondeti@quicinc.com>
Cc:     s.shtylyov@omp.ru, linux-usb@vger.kernel.org
References: <20220217135643.1321889-1-mathias.nyman@linux.intel.com>
 <20220218094133.GA28120@hu-pkondeti-hyd.qualcomm.com>
 <0edc0822-d75b-238a-16d4-d828710c1b60@quicinc.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Message-ID: <27f7aec3-cd86-3f55-dfa6-8f2b76437c90@linux.intel.com>
Date:   Mon, 28 Feb 2022 13:39:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <0edc0822-d75b-238a-16d4-d828710c1b60@quicinc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 24.2.2022 10.44, Udipto Goswami wrote:
> Hi Pavan, Mathias,
> 
> we have tested the patch in the testing environment where initially we were hitting the issue. We don't see any issue after including this.
> 
> On 18-02-2022 03:11 pm, Pavan Kondeti wrote:
>> On Thu, Feb 17, 2022 at 03:56:43PM +0200, Mathias Nyman wrote:
>>> xhci_reset() timeout was increased from 250ms to 10 seconds in order to
>>> give Renesas 720201 xHC enough time to get ready in probe.
>>>
>>> xhci_reset() is called with interrupts disabled in other places, and
>>> waiting for 10 seconds there is not acceptable.
>>>
>>> Add a timeout parameter to xhci_reset(), and adjust it back to 250ms
>>> when called from xhci_stop() or xhci_shutdown() where interrupts are
>>> disabled, and successful reset isn't that critical.
>>>
>>> Additionally change the signed integer timeout parameter in
>>> xhci_handshake() to a u64 to match the timeout value we pass to
>>> readl_poll_timeout_atomic()
>>>
>>> Reported-by: Sergey Shtylyov <s.shtylyov@omp.ru>
>>> Reported-by: Pavan Kondeti <quic_pkondeti@quicinc.com>
>>> Fixes: 22ceac191211 ("xhci: Increase reset timeout for Renesas 720201 host.")
>>> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
>> We have tested the patch and found no issues. Since the issue happens
>> very rarely, we have included in our builds for the wider testing.
>>
>> Thanks,
>> Pavan

Thanks 
Can I add a "Tested-by: Pavan Kondeti <quic_pkondeti@quicinc.com>" tag?

-Mathias
