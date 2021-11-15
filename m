Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AAF9450008
	for <lists+linux-usb@lfdr.de>; Mon, 15 Nov 2021 09:36:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229842AbhKOIjW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 15 Nov 2021 03:39:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229613AbhKOIjU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 15 Nov 2021 03:39:20 -0500
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [IPv6:2a01:488:42:1000:50ed:8234::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53608C061746
        for <linux-usb@vger.kernel.org>; Mon, 15 Nov 2021 00:36:24 -0800 (PST)
Received: from ip4d173d4a.dynamic.kabel-deutschland.de ([77.23.61.74] helo=[192.168.66.200]); authenticated
        by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        id 1mmXTQ-0005F5-Gz; Mon, 15 Nov 2021 09:36:20 +0100
Message-ID: <bb5c5d0f-2ae7-8426-0021-baeca8f7dd11@leemhuis.info>
Date:   Mon, 15 Nov 2021 09:36:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: bug: usb: gadget: FSL_UDC_CORE Corrupted request list leads to
 unrecoverable loop.
Content-Language: en-BS
To:     Joakim Tjernlund <Joakim.Tjernlund@infinera.com>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        "Eugene_Bordenkircher@selinc.com" <Eugene_Bordenkircher@selinc.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Cc:     "leoyang.li@nxp.com" <leoyang.li@nxp.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "balbi@kernel.org" <balbi@kernel.org>
References: <MWHPR2201MB152074F47BF142189365627B91879@MWHPR2201MB1520.namprd22.prod.outlook.com>
 <2c275adc278477e1e512ea6ecc0c1f4dcc46969d.camel@infinera.com>
 <6659a2c7fd9fffac766b8389244e5885ccbd38bd.camel@infinera.com>
From:   Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <6659a2c7fd9fffac766b8389244e5885ccbd38bd.camel@infinera.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1636965385;7428ea0a;
X-HE-SMSGID: 1mmXTQ-0005F5-Gz
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi, this is your Linux kernel regression tracker speaking.

This looks stalled, as afaics nothing to get this regression fixed
happened since below mail. How can we things rolling again?

Eugene, were you able to look into the patch from Joakim?

Or did I miss anything and some progress to fix this was made elsewhere?
Please let me know if that's the case.

Ciao, Thorsten (carrying his Linux kernel regression tracker hat)

P.S.: As a Linux kernel regression tracker I'm getting a lot of reports
on my table. I can only look briefly into most of them. Unfortunately
therefore I sometimes will get things wrong or miss something important.
I hope that's not the case here; if you think it is, don't hesitate to
tell me about it in a public reply. That's in everyone's interest, as
what I wrote above might be misleading to everyone reading this; any
suggestion I gave they thus might sent someone reading this down the
wrong rabbit hole, which none of us wants.

P.P.S.: Feel free to ignore the following lines, they are only meant for
regzbot, my Linux kernel regression tracking bot
(https://linux-regtracking.leemhuis.info/regzbot/):

#regzbot poke

On 02.11.21 22:15, Joakim Tjernlund wrote:
> On Sat, 2021-10-30 at 14:20 +0000, Joakim Tjernlund wrote:
>> On Fri, 2021-10-29 at 17:14 +0000, Eugene Bordenkircher wrote:
>
>>> We've discovered a situation where the FSL udc driver (drivers/usb/gadget/udc/fsl_udc_core.c) will enter a loop iterating over the request queue, but the queue has been corrupted at some point so it loops infinitely.  I believe we have narrowed into the offending code, but we are in need of assistance trying to find an appropriate fix for the problem.  The identified code appears to be in all versions of the Linux kernel the driver exists in.
>>>
>>> The problem appears to be when handling a USB_REQ_GET_STATUS request.  The driver gets this request and then calls the ch9getstatus() function.  In this function, it starts a request by "borrowing" the per device status_req, filling it in, and then queuing it with a call to list_add_tail() to add the request to the endpoint queue.  Right before it exits the function however, it's calling ep0_prime_status(), which is filling out that same status_req structure and then queuing it with another call to list_add_tail() to add the request to the endpoint queue.  This adds two instances of the exact same LIST_HEAD to the endpoint queue, which breaks the list since the prev and next pointers end up pointing to the wrong things.  This ends up causing a hard loop the next time nuke() gets called, which happens on the next setup IRQ.
>>>
>>> I'm not sure what the appropriate fix to this problem is, mostly due to my lack of expertise in USB and this driver stack.  The code has been this way in the kernel for a very long time, which suggests that it has been working, unless USB_REQ_GET_STATUS requests are never made.  This further suggests that there is something else going on that I don't understand.  Deleting the call to ep0_prime_status() and the following ep0stall() call appears, on the surface, to get the device working again, but may have side effects that I'm not seeing.
>>>
>>> I'm hopeful someone in the community can help provide some information on what I may be missing or help come up with a solution to the problem.  A big thank you to anyone who would like to help out.
>>>
>>> Eugene
>>
>> Run into this to a while ago. Found the bug and a few more fixes.
>> This is against 4.19 so you may have to tweak them a bit.
>> Feel free to upstream them.
>>
>>  Jocke 
> 
> Curious, did my patches help? Good to known once we upgrade as well.
> 
>  Jocke
