Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 905316ED0E6
	for <lists+linux-usb@lfdr.de>; Mon, 24 Apr 2023 17:04:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231979AbjDXPEG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 24 Apr 2023 11:04:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231694AbjDXPEE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 24 Apr 2023 11:04:04 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46B7061B0
        for <linux-usb@vger.kernel.org>; Mon, 24 Apr 2023 08:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682348641; x=1713884641;
  h=message-id:date:mime-version:to:cc:references:from:
   subject:in-reply-to:content-transfer-encoding;
  bh=eap7d9PCBozFdOUx06UPoSH8Y2m4Q1vAjq7leEzeJSs=;
  b=G/QE0Il68IZmi6vD/em+fv20cc3q6MiUY/NBtz5W3zupFZ95OxWtmkDi
   u2JXh2PxtiXIgR+iCi+vaIwP72q7PQXogY8QuX2zx62zX0hD7N4b3R8xx
   RDrc2JUL/bluj0jUaRMP0KCJ0N1/z6zK/q216oZ37aLKHr4Ovu0B8Biu5
   Lg6YDAnXgNyuGwZDU2tVC55d7f6X6sOSsRujnP4ne/h8hQVsliQMoAOQa
   qvrbsbnWclL2UWxzHMVpAwp5cGM3EOOGT0aK1k9pJJf56CUApIcjUbzaG
   L/EAgge/jnjKbDjH5s8leTUSRJiX03HHgg8YQYI5X7UtRopH6AX6rSmPb
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="345230159"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; 
   d="scan'208";a="345230159"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2023 08:04:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="686875023"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; 
   d="scan'208";a="686875023"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by orsmga007.jf.intel.com with ESMTP; 24 Apr 2023 08:03:56 -0700
Message-ID: <5a4b3d95-c783-b4b2-93d7-57b69b679f7a@linux.intel.com>
Date:   Mon, 24 Apr 2023 18:05:26 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.7.1
Content-Language: en-US
To:     Basavaraj Natikar <bnatikar@amd.com>,
        Mark Hasemeyer <markhas@chromium.org>,
        basavaraj.natikar@amd.com
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        mathias.nyman@intel.com, stern@rowland.harvard.edu
References: <20230418140817.3651909-3-Basavaraj.Natikar@amd.com>
 <20230420170337.14110-1-markhas@chromium.org>
 <346ea37a-9ec6-af36-b6ed-026aefb2cf4b@amd.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH 2/2] xhci: Improve the XHCI resume time
In-Reply-To: <346ea37a-9ec6-af36-b6ed-026aefb2cf4b@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 21.4.2023 7.58, Basavaraj Natikar wrote:
> 
> On 4/20/2023 10:33 PM, Mark Hasemeyer wrote:
>>> It may be necessary to wait only for auto-resume cases.
>> I find this comment misleading as the patch assumes that it's only necessary to
>> wait for auto-resume cases. Are there any cases where the driver should wait
>> during system-resume?
> 
> Only in case of auto-resume (runtime resume).
> 
> Rewording the commit message as follows.

Thanks for fixing this extra system resume delay

Maybe some kind of big picture explanation could be added to the commit message,
such as:

Avoid extra 120ms delay during system resume.

xHC controller may signal wake up to 120ms before it shows which USB device
caused the wake on the xHC port registers.

The xhci driver therefore checks for port activity up to 120ms during resume,
making sure that the hub driver can see the port change, and won't immediately
runtime suspend back due to no port activity.

This is however only needed for runtime resume as system resume will resume
all child hubs and other child usb devices anyway.

> 
> Each XHCI controller while xhci_resumes by default takes 120 ms more if
> there is no activity on the ports or no ports connected. Therefore, if
> there are more USB controllers on the system, 120 ms more per controller
> will add delay to system resume from suspended states like s2idle, S3 or
> S4 states.
> 
> Once the XHCI controller is in runtime suspended state (D3 state), on USB
> device hotplug controller will runtime resume (D0 state) and check for
> pending port events if no events, wait for 120 ms to re-check for port
> activity to handle missed wake signal.
> 
> A delay of 120 ms more to re-check for port activity is needed only in
> auto-resume (runtime resume) cases. Hence, add a check only for runtime
> resume from runtime suspend (D3->D0) to avoid the 120ms more delay for
> other PM events (system resume from suspend states like s2idle, S3 or S4
> states) so that the system resume time can be improved.
> 
> Please let me know if any inputs.

I can only think of one minor side-effect that would be runtime suspending back
too early after system resume. This could happen when connecting the first
usb device to a roothub on a (system) suspended setup?

steps:
1. in system suspend, no usb devices connected, xhci in D3, can signal wake with PME#
2. connect first usb device, xHC signals PME# wake
3. system resumes, xhci resumes to D0, but no actity visible on xHC port registers
4. rootubs resumes, no other children on this bus.
5. roothubs sees no activity (due to 120ms max latency before visible on port registers)
6. roothubs runtime suspend
7. xhci runtime suspends
8. same device now causes xHC to PME# wake again,
9. runtime reusume xhci, do wait 120ms for port activity
10. see port activity, resume hub, enumerate device.

It might be that this really isn't an issue due to the the graceperiod fix:

33e321586e37 xhci: Add grace period after xHC start to prevent premature runtime suspend.

Thanks
-Mathias


