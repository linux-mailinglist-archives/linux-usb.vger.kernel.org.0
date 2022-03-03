Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E1614CBD14
	for <lists+linux-usb@lfdr.de>; Thu,  3 Mar 2022 12:48:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232901AbiCCLtK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Mar 2022 06:49:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229741AbiCCLtI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Mar 2022 06:49:08 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B5426FA24
        for <linux-usb@vger.kernel.org>; Thu,  3 Mar 2022 03:48:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646308102; x=1677844102;
  h=to:cc:references:from:subject:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=Ybg0+ozAxYOdaStjFzx7N6WGF1+kvUBfjv87WPT1mcg=;
  b=ll0aOJvfpgPuVujmm8vkB7ehujUn40IlHOnOr2g8RYzV30A9spVXGv74
   GSX6C7vpqJJTJExma641rbH5g0y++bUjXys/bgVU1YtrpxRgWcri0nihw
   U+DNcZrICfRk84tYjrzZNIhKNb7K8P9WjKecFHucA6z4KHfcnlEAVYse3
   c3Deho/YY9KBbJElBQ1YNEUYZHBc6ZfNZq1VVEOOh0gYqkPFIwB0ABb2N
   d+IGQpmbgWzjLMbi7XBqiK456hnbtMj+/FUI1xqvAHQhi1o/y7toxIYiK
   GkCfS1wgEHZgfSsDUC5yWMoWt0b8gak4vIWstx2Ugc6hFcYx2D5lzGaqF
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10274"; a="241072686"
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400"; 
   d="scan'208";a="241072686"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2022 03:48:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400"; 
   d="scan'208";a="576461193"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by orsmga001.jf.intel.com with ESMTP; 03 Mar 2022 03:48:20 -0800
To:     Alan Stern <stern@rowland.harvard.edu>,
        Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Jack Pham <quic_jackp@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux USB Mailing List <linux-usb@vger.kernel.org>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        Tung Nguyen <tunguyen@apm.com>,
        Mathias Nyman <mathias.nyman@intel.com>
References: <994d8963-ca4d-d4cb-a3f6-988d6aa9bcd7@gmail.com>
 <YhWXgyJ4lk8OpT57@rowland.harvard.edu>
 <4701f080-ef18-dbb2-7dd9-d9171a73411f@gmail.com>
 <YhZB9C/xGaoslZzT@rowland.harvard.edu>
 <131166ee-9926-2eb5-2abd-6bab294d2937@gmail.com>
 <Yhaxb0OvMwLtd6vr@rowland.harvard.edu>
 <20220224200637.GE13801@jackp-linux.qualcomm.com>
 <7522820e-0b6d-7e2b-89db-30329c6c2245@gmail.com>
 <YhfougN/KOTZeGV7@rowland.harvard.edu>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH] usb: core: improve handling of hubs with no ports
Message-ID: <4b0c7f0d-749b-a8a8-9b25-720ed826ae2a@linux.intel.com>
Date:   Thu, 3 Mar 2022 13:50:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YhfougN/KOTZeGV7@rowland.harvard.edu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 24.2.2022 22.21, Alan Stern wrote:
> On Thu, Feb 24, 2022 at 09:16:05PM +0100, Heiner Kallweit wrote:
>> On 24.02.2022 21:06, Jack Pham wrote:
>>> On Wed, Feb 23, 2022 at 05:13:03PM -0500, Alan Stern wrote:
>>>> On Wed, Feb 23, 2022 at 09:58:56PM +0100, Heiner Kallweit wrote:
>>>>> On 23.02.2022 15:17, Alan Stern wrote:
>>>>>> Don't change register_root_hub().  Just change xhci_plat_probe(); make 
>>>>>> it skip the second call to usb_add_hcd() if there are no USB-3 ports.
>>>
>>> I believe this had been attempted in the past, but it does not appear
>>> that patch was ever accepted:
>>>
>>> https://lore.kernel.org/linux-usb/1517221474-19627-1-git-send-email-tqnguyen@apm.com/
>>>
>> I also found that xhci at several places relies on a proper shared_hcd,
>> even if there are no USB3 ports. Therefore maybe go with the less invasive
>> original version of my patch?
>>
>> https://www.spinics.net/lists/linux-usb/msg222998.html
> 
> The patch that Jack refers to, written by Tung Nguyen, does always 
> create the shared_hcd.  It simply avoids registering the shared_hcd 
> when there are no USB-3 ports.
> 
> You should try that patch and see if it works on your system.
> 
> Alan Stern
> 
>>> Jack
>>>
>>>>> This works on my system. However a consequence is that xhci->shared_hcd
>>>>> is NULL.
>>>>
>>>> Why is that?  xhci->shared_hcd doesn't get set in usb_add_hcd(), so 
>>>> skipping that call shouldn't cause it to be NULL.
>>>>
>>>> Note: If you skip calling usb_add_hcd(), you will also have to skip the 
>>>> corresponding call to usb_remove_hcd().  There may be a few more 
>>>> subtleties involved as well; like I said before, I'm not an expert on 
>>>> this driver.  You should ask the xhci-hcd maintainer for advice.

I think we need to start supporting xHC conreollers with just one roothub. 
Only call usb_add_hcd() once in those cases.

Even prepare for special cases where xHCI only has usb3 ports (usb2 pins routed
to a different host controller)

Currently driver reads port capabilities in:
usb_add_hcd()
  hcd->driver->reset   ...-> xhci_gen_setup()
    xhci_gen_setup()
      xhci_init(hcd)
        xhci_mem_init()
          xhci_setup_port_arrays()
  
Driver makes some assumptions based on if hcd is primary or not early in
xhci_gen_setup(), and initializes values like hcd->speed = HCD_USB2;

Should be doable, changes needed in at least xhci_run(), xhci_stop(),
xhci_resume(), xhci_suspend(), xhci_gen_setup() and probe.

-Mathias

