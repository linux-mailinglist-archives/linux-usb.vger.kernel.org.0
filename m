Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A82D1423914
	for <lists+linux-usb@lfdr.de>; Wed,  6 Oct 2021 09:40:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233968AbhJFHmu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 6 Oct 2021 03:42:50 -0400
Received: from cable.insite.cz ([84.242.75.189]:45898 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230013AbhJFHmt (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 6 Oct 2021 03:42:49 -0400
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id F14B4A1A3D403;
        Wed,  6 Oct 2021 09:40:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1633506056; bh=cbDJWzS5oZ0T9WTVbupLKxSkKlGcf0ER1ckC+cN19/0=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=lKEPT4lKAWqnl9DInpzfVGoTlAhv2DnCgu9sWLoY8zzTTkDOTHb25ACHz/NT/V3GF
         QoYvoa/PDpA2gQLYUP4FLZllmXQHbXoO8DrkYKKjQxSb/EQKtMBOoOYJru/6eLCKlI
         FZzcaDRdcWgpnG+dikCEngLx3peB6ljWCYwgbGdU=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id BbouwaIoX8mH; Wed,  6 Oct 2021 09:40:51 +0200 (CEST)
Received: from [192.168.105.22] (ip28.insite.cz [81.0.237.28])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id 9624CA1A3D402;
        Wed,  6 Oct 2021 09:40:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1633506051; bh=cbDJWzS5oZ0T9WTVbupLKxSkKlGcf0ER1ckC+cN19/0=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=I+POk7iPSiMPChn38mrzTrwnCBqzATzmZa/QwPjEgHQX8TY3YnDG3LpaK6E9+CSeI
         /LCreeypnMdnMXwbYUOQMqs7xwLavyfiAV4u5fuPCMujICtETMyGKgH2Uu6YwTijIP
         lVODIyWxqyH8VvzQ+AHNoSjC0dPcPSUkkDNfEzyA=
Subject: Re: [PATCH] usb: gadget: u_audio.c: Adding Playback Pitch ctl for
 sync playback
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
References: <20210925143003.12476-1-pavel.hofman@ivitera.com>
 <YVw3e1zOS2QvKiM0@kroah.com>
 <cbd8d9cc-df7b-1990-4ff4-8f2b2a30f846@ivitera.com>
 <YV1RazARcBrgv5bJ@kroah.com>
From:   Pavel Hofman <pavel.hofman@ivitera.com>
Message-ID: <37a0e221-6332-86a4-fade-60a6225d5bc5@ivitera.com>
Date:   Wed, 6 Oct 2021 09:40:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YV1RazARcBrgv5bJ@kroah.com>
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



Dne 06. 10. 21 v 9:34 Greg KH napsal(a):
> On Wed, Oct 06, 2021 at 08:43:08AM +0200, Pavel Hofman wrote:
>>
>> Dne 05. 10. 21 v 13:31 Greg KH napsal(a):
>>> On Sat, Sep 25, 2021 at 04:30:03PM +0200, Pavel Hofman wrote:
>>>> EP IN is hard-coded as ASYNC both in f_uac1 and f_uac2 but u_audio sends
>>>> steady number of audio frames in each USB packet, without any control.
>>>>
>>>> This patch adds 'Playback Pitch 1000000' ctl analogous to the existing
>>>> 'Capture Pitch 1000000' ctl. The calculation of playback req->length in
>>>> u_audio_iso_complete respects the Playback Pitch ctl value to 1ppm now.
>>>>
>>>> Max. value for Playback Pitch is configured by the existing parameter
>>>> uac2_opts->fb_max, used also for the Capture Pitch.
>>>>
>>>> Since the EP IN packet size can be increased by uac2_opts->fb_max now,
>>>> maxPacketSize for the playback direction is calculated by the same
>>>> algorithm as for the async capture direction in
>>>> f_uac2.c:set_ep_max_packet_size.
>>>>
>>>> Signed-off-by: Pavel Hofman <pavel.hofman@ivitera.com>
>>>> ---
>>>>    drivers/usb/gadget/function/f_uac2.c  |  5 +-
>>>>    drivers/usb/gadget/function/u_audio.c | 93 ++++++++++++++++++++-------
>>>>    2 files changed, 74 insertions(+), 24 deletions(-)
>>>
>>> Does not apply to my tree, what kernel release / branch did you make
>>> this against?
>>>
>>
>> Greg, the patch requires patch 0560c9c ("usb: gadget: f_uac2: fixed EP-IN
>> wMaxPacketSize") which I sent prior to this one (not as a patch series, this
>> patch was not ready at that time). You applied 0560c9c to your usb-linus
>> yesterday, hence this patch applies cleanly to usb-linus now.
>>
>> Your branch usb-next does not have 0560c9c yet, therefore the patch fails.
>> But both patches apply cleanly to usb-next as a series, tested just now.
>>
>> This patch ("usb: gadget: u_audio.c: Adding Playback Pitch ctl for sync
>> playback") is not a bugfix and can wait in usb-next.
>>
>> That goes back to my question of what are the rules for the two of your
>> branches. What if a new patch requires patches from both usb-linus (bugfix)
>> and usb-next (new features)?
> 
> I have 2 branches (well 3) in my tree:
> 	master - tracks Linus's tree
> 	usb-linus - patches to go to Linus for "this" release
> 	usb-next - patches to go to Linus for the "next" release
> 
> 
> So bugfixes go into usb-linus, and new features go into usb-next.
> 
> After the patches in usb-linus get merged into Linus, I merge that
> branch (well Linus's -rc release) into the usb-next branch so that
> dependencies can get resolved and bugfixes show up for testing.

Greg, thanks for the explanation. Very useful.

> 
> or tell me and I will wait until that happens myself.

Is there a standardized way for that, e.g. somewhere in the PATCH mail 
message?

Thanks a lot,

Pavel.


