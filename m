Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9DD24683FF
	for <lists+linux-usb@lfdr.de>; Sat,  4 Dec 2021 11:26:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237579AbhLDKaN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 4 Dec 2021 05:30:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234334AbhLDKaN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 4 Dec 2021 05:30:13 -0500
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [IPv6:2a01:488:42:1000:50ed:8234::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9540C061751;
        Sat,  4 Dec 2021 02:26:47 -0800 (PST)
Received: from [77.23.61.74] (helo=[192.168.66.200]); authenticated
        by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        id 1mtSFi-0007Rk-5G; Sat, 04 Dec 2021 11:26:46 +0100
Message-ID: <73b325e3-d5d9-f768-9033-3aa0d3683e47@leemhuis.info>
Date:   Sat, 4 Dec 2021 11:26:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: Regression: plugging in USB scanner breaks all USB functionality
Content-Language: en-BS
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     regressions@lists.linux.dev, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <35f7428b39f996c793f5b4a6a314772681c73d7a.camel@apache.org>
 <3eb9c3f8-6bca-da08-47ec-af2a02d6a485@leemhuis.info>
 <e03ddc81-c60b-bd28-b959-0602142f0efc@leemhuis.info>
 <Yas83rCCAQcabahe@kroah.com>
From:   Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <Yas83rCCAQcabahe@kroah.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1638613608;142a686f;
X-HE-SMSGID: 1mtSFi-0007Rk-5G
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On 04.12.21 11:03, Greg KH wrote:
> On Fri, Dec 03, 2021 at 06:24:52PM +0100, Thorsten Leemhuis wrote:
>> On 02.12.21 16:13, Thorsten Leemhuis wrote:
>>> Hi, this is your Linux kernel regression tracker speaking.
>>>
>>> Thanks for the report.
>>>
>>> Top-posting for once, to make this easy accessible to everyone.
>>>
>>> FWIW, 5.14 is EOL, so it might not be fixed there. As the problem is in
>>> newer kernels as well, I suspect that it was a change applies to 5.15 or
>>> 5.16 that got backported. Maybe one of the developers might have an idea
>>> which commit causes it. If that's not the case you likely should try a
>>> bisection to find the culprit. Performing one between v5.14.11..v5.14.14
>>> is likely the easiest and quickest way to find it.
>>>
>>> To be sure this issue doesn't fall through the cracks unnoticed, I'm
>>> adding it to regzbot, my Linux kernel regression tracking bot:
>>>
>>> #regzbot ^introduced v5.14.11..v5.14.14
>>> #regzbot title usb: plugging in USB scanner breaks all USB functionality
>>> [regression present in 5.15.2 und 5.16-rc3, too]
>>> #regzbot ignore-activity
>>
>> #regzbot introduced ff0e50d3564f
>> #regzbot fixed-by 385b5b09c3546c87cfb730b76abe5f8d73c579a2
>
> Odd, where did that git commit id come from?  I don't see it in
> linux-next or Linus's tree.
> 
> confused,

Yeah, sorry, after sending that mail it occurred to me that this wasn't
ideal and hard to follow.

I got it from here:
https://lore.kernel.org/lkml/a649395b-0b91-a0d2-c510-ea8ec4aef917@linux.intel.com/

I already decided that next time something like this comes up I'll reply
to the mail with the details instead (with proper quoting) to make this
easier to follow.

Reading that message again I suspect that I might have been a bit quick
as well, as this might not be the commit id this ends up with when it
gets merged: I now see that this is likely a developers tree and not one
that gets indirectly merged.

Sorry, I'll manually keep an eye on things to fix this up once that
patch gets its real it.

Ciao, Thorsten

BTW, while at it:

#regzbot monitor
https://lore.kernel.org/linux-usb/20211126122340.1193239-2-mathias.nyman@linux.intel.com/
