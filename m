Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B8376EDEA5
	for <lists+linux-usb@lfdr.de>; Tue, 25 Apr 2023 11:02:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233086AbjDYJCy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 25 Apr 2023 05:02:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233595AbjDYJCv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 25 Apr 2023 05:02:51 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8EF04495
        for <linux-usb@vger.kernel.org>; Tue, 25 Apr 2023 02:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682413369; x=1713949369;
  h=message-id:date:mime-version:to:cc:references:from:
   subject:in-reply-to:content-transfer-encoding;
  bh=i9CFIwx5bvWinc0VErzbt/DMCK2TJe5nPYhOumuAtrE=;
  b=BAptvcNfX1UYwYgZFDgflnlh/mMRvk5tT6d38YiStm37RZXUTWIZm9LM
   uDVvaoJr1OvONbOymxVJ4U0HSw8UQKC1Q5p25PTvHKJJvRDuXnAqH15OU
   B24D434VTefM4TxeAjezuY++/iFoGXcBVZPRFx/KfSJVk3c1a7jhSKAjs
   m2rJtoGjlYY/xqh4O99sZKyu58X/QKW4CbgUSvYotcRDFeibd7x98zrGQ
   8SrHR1MhIrt+yS9WD7LWVawykCASBa5dK7pISFY+aEb322A/A9FvgXQBd
   s7cFhoRfMCWNOsuHJM34vjutnZV2FLNSVgCW/nnjIO9M7xTrQ9apIQqnP
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="409648573"
X-IronPort-AV: E=Sophos;i="5.99,225,1677571200"; 
   d="scan'208";a="409648573"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2023 02:02:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="693418327"
X-IronPort-AV: E=Sophos;i="5.99,225,1677571200"; 
   d="scan'208";a="693418327"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by orsmga002.jf.intel.com with ESMTP; 25 Apr 2023 02:02:46 -0700
Message-ID: <a81a39ed-bc05-19e7-ec05-25632535ea5c@linux.intel.com>
Date:   Tue, 25 Apr 2023 12:04:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.7.1
Content-Language: en-US
To:     Wesley Cheng <quic_wcheng@quicinc.com>,
        Basavaraj Natikar <bnatikar@amd.com>,
        Mark Hasemeyer <markhas@chromium.org>,
        basavaraj.natikar@amd.com
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        mathias.nyman@intel.com, stern@rowland.harvard.edu
References: <20230418140817.3651909-3-Basavaraj.Natikar@amd.com>
 <20230420170337.14110-1-markhas@chromium.org>
 <346ea37a-9ec6-af36-b6ed-026aefb2cf4b@amd.com>
 <5a4b3d95-c783-b4b2-93d7-57b69b679f7a@linux.intel.com>
 <5157f331-0e0d-c6c2-1896-bb09c13ee3c0@quicinc.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH 2/2] xhci: Improve the XHCI resume time
In-Reply-To: <5157f331-0e0d-c6c2-1896-bb09c13ee3c0@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 25.4.2023 3.09, Wesley Cheng wrote:
> Hi Mathias,
> 
> On 4/24/2023 8:05 AM, Mathias Nyman wrote:
>> On 21.4.2023 7.58, Basavaraj Natikar wrote:
>>>
>>> On 4/20/2023 10:33 PM, Mark Hasemeyer wrote:
>>>>> It may be necessary to wait only for auto-resume cases.
>>>> I find this comment misleading as the patch assumes that it's only necessary to
>>>> wait for auto-resume cases. Are there any cases where the driver should wait
>>>> during system-resume?
>>>
>>> Only in case of auto-resume (runtime resume).
>>>
>>> Rewording the commit message as follows.
>>
>> Thanks for fixing this extra system resume delay
>>
>> Maybe some kind of big picture explanation could be added to the commit message,
>> such as:
>>
>> Avoid extra 120ms delay during system resume.
>>
>> xHC controller may signal wake up to 120ms before it shows which USB device
>> caused the wake on the xHC port registers.
>>
>> The xhci driver therefore checks for port activity up to 120ms during resume,
>> making sure that the hub driver can see the port change, and won't immediately
>> runtime suspend back due to no port activity.
>>
>> This is however only needed for runtime resume as system resume will resume
>> all child hubs and other child usb devices anyway.
>>
>>>
>>> Each XHCI controller while xhci_resumes by default takes 120 ms more if
>>> there is no activity on the ports or no ports connected. Therefore, if
>>> there are more USB controllers on the system, 120 ms more per controller
>>> will add delay to system resume from suspended states like s2idle, S3 or
>>> S4 states.
>>>
>>> Once the XHCI controller is in runtime suspended state (D3 state), on USB
>>> device hotplug controller will runtime resume (D0 state) and check for
>>> pending port events if no events, wait for 120 ms to re-check for port
>>> activity to handle missed wake signal.
>>>
>>> A delay of 120 ms more to re-check for port activity is needed only in
>>> auto-resume (runtime resume) cases. Hence, add a check only for runtime
>>> resume from runtime suspend (D3->D0) to avoid the 120ms more delay for
>>> other PM events (system resume from suspend states like s2idle, S3 or S4
>>> states) so that the system resume time can be improved.
>>>
>>> Please let me know if any inputs.
>>
>> I can only think of one minor side-effect that would be runtime suspending back
>> too early after system resume. This could happen when connecting the first
>> usb device to a roothub on a (system) suspended setup?
>>
>> steps:
>> 1. in system suspend, no usb devices connected, xhci in D3, can signal wake with PME#
>> 2. connect first usb device, xHC signals PME# wake
>> 3. system resumes, xhci resumes to D0, but no actity visible on xHC port registers
> 
> Thanks for bringing up this topic Basavaraj.
> 
> Sorry for jumping into this thread, but was looking to optimize this resume timing as well, since it is affecting some of the host driven bus resume situations.  Just had a quick question about where the 120ms delay is required...
> 
>  From what I'm gathering from the USB3 spec, the 120ms timeout is the recommended time for tU3WakeupRetryDelay ("Table 7-12. LTSSM State Transition Timeouts").  This is the retry time that the device will wait before re-issuing another (potential) LFPS U3 wake.
> 
> My idea was to see if we could limit this delay only for when a SSUSB device is already connected to the root hub.  (ignore if HSUSB device connected)  We would be able to eliminate the delay for:
> 1.  No device connected to root hub
> 2.  Only HSUSB device connected
> 
> Is that a possibility we can add on top of what Basavaraj is adding?
> 

Sounds reasonable,
Yes the 120ms was intended for the U3 wake delay for SuperSpeed devices.

We should probably also check for CAS bit in xhci_pending_portevent()
(I'll add that CAS check)

-Mathias

  

