Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3792A418023
	for <lists+linux-usb@lfdr.de>; Sat, 25 Sep 2021 08:55:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231938AbhIYG5B (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 25 Sep 2021 02:57:01 -0400
Received: from cable.insite.cz ([84.242.75.189]:46513 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229602AbhIYG5A (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 25 Sep 2021 02:57:00 -0400
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id 3ABC2A1A3D401;
        Sat, 25 Sep 2021 08:55:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1632552924; bh=4v3JotMwWjbO9aSMigCV2cWEktIKyNcb/+nrecXOvJE=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=YDACn9gzi3a0yGYU1XuNggqspPd+VBOG3KQXonKcA+bE44n/wiVurtRxiFueS1UAA
         1KLXaYokkGhC7ZwWbfle/Coa6THh/iC/wPngextPEiMGo7mPatWFiG/gJerLUW1A7m
         g7Tq4LZqFB5ZukIe+mX7MNnyuy8uObRH0ejkilpQ=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id E0FxY3JzsqSd; Sat, 25 Sep 2021 08:55:18 +0200 (CEST)
Received: from [192.168.105.22] (ip28.insite.cz [81.0.237.28])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id 2E95BA1A3D400;
        Sat, 25 Sep 2021 08:55:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1632552918; bh=4v3JotMwWjbO9aSMigCV2cWEktIKyNcb/+nrecXOvJE=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=X3oy7QwlP08mBR3a7pnan4cMkVHn4zUgCY9oY2Ij5JcPJfG0IFv2um+Cgv1Rixx05
         6/3VOGygkkcHUgXAPfndRgCpUUDRtxZmZfffS9gI0kz1YASvi5aLUiccVBAGgdcRyy
         zpqEdknpztc5OAs8raiGJJFC4EH6oJf18AE3IaSs=
Subject: Re: [PATCH] usb: gadget: f_uac2: fixed EP-IN wMaxPacketSize
To:     Jack Pham <jackp@codeaurora.org>, Greg KH <greg@kroah.com>
Cc:     linux-usb@vger.kernel.org,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>
References: <20210924080027.5362-1-pavel.hofman@ivitera.com>
 <YU2KXJ/4Q2tq+ANv@kroah.com>
 <5c99651b-a0a2-cb44-e1ad-a79283449ce5@ivitera.com>
 <20210924184659.GA13104@jackp-linux.qualcomm.com>
From:   Pavel Hofman <pavel.hofman@ivitera.com>
Message-ID: <a70511c6-7118-b153-de73-059bb62a3e3d@ivitera.com>
Date:   Sat, 25 Sep 2021 08:55:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210924184659.GA13104@jackp-linux.qualcomm.com>
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Jack,

Dne 24. 09. 21 v 20:46 Jack Pham napsal(a):
> Hi Pavel,
> 
> Thanks for sending out the patch.
> 
> On Fri, Sep 24, 2021 at 10:35:07AM +0200, Pavel Hofman wrote:
>> Hi Greg,
>>
>> Dne 24. 09. 21 v 10:20 Greg KH napsal(a):
>>> On Fri, Sep 24, 2021 at 10:00:27AM +0200, Pavel Hofman wrote:
>>>> Async feedback patches broke enumeration on Windows 10 previously fixed
>>>> by commit 789ea77310f0 ("usb: gadget: f_uac2: always increase endpoint
>>>> max_packet_size by one audio slot").
>>>>
>>>> While the existing calculation for EP OUT capture for async mode yields
>>>> size+1 frame due to uac2_opts->fb_max > 0, playback side lost the +1
>>>> feature.  Therefore the +1 frame addition must be re-introduced for
>>>> playback. Win10 enumerates the device only when both EP IN and EP OUT
>>>> max packet sizes are (at least) +1 frame.
>>>>
>>>> Signed-off-by: Pavel Hofman <pavel.hofman@ivitera.com>
>>>> Tested-by: Henrik Enquist <henrik.enquist@gmail.com>
>>>> Tested-by: Jack Pham <jackp@codeaurora.org>
>>>> ---
>>>>    drivers/usb/gadget/function/f_uac2.c | 14 ++++++++++----
>>>>    1 file changed, 10 insertions(+), 4 deletions(-)
>>>
>>> What commit does this fix?
> 
> IMO it Fixes: e89bb4288378 ("usb: gadget: u_audio: add real feedback
> implementation").
> 
>>> Should it go to stable kernel(s)?
> 
> Yes, but probably just to 5.14 since the commit I pointed out with the
> Fixes tag was introduced in 5.14-rc1 but don't think it was ever
> backported to earlier stable kernels.
> 
>> It's the same effort direction as commit https://kernel.googlesource.com/pub/scm/linux/kernel/git/gregkh/usb/+/f5dfd98a80ff8d50cf4ae2820857d7f5a46cbab9
>> which you added to your usb-linus branch https://kernel.googlesource.com/pub/scm/linux/kernel/git/gregkh/usb/+log/refs/heads/usb-linus/drivers/usb/gadget/function
>> Therefore I would say usb-linus.
>>
>> Please what are your rules for usb-linus and usb-next? There are some
>> different commits in usb-next and usb-linus changing the same file -
>> f_uac2.c . Likely not, but a conflict could potentially occur. I do not know
>> what head to rebase my further patches which also make larger changes to
>> that file.
> 
> Since this is a fix, I'd suggest you base on Greg's usb-linus since
> patches queued there will be going out during the current 5.15-rc cycle.
> 

Thanks for the explanation. I do not have any more small patches fixing 
the Win10 support now. Patches implementing EP-IN async (Playback Pitch 
1000000) and the rebased Julian's multiple samplerates patch will go to 
Greg's usb-next and will be rebased on top of your latest SS patches.

Best regards,

Pavel.
