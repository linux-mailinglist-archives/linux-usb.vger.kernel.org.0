Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FB98416DFC
	for <lists+linux-usb@lfdr.de>; Fri, 24 Sep 2021 10:38:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244714AbhIXIhF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Sep 2021 04:37:05 -0400
Received: from cable.insite.cz ([84.242.75.189]:55426 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244640AbhIXIg7 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 24 Sep 2021 04:36:59 -0400
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id DA652A1A3D401;
        Fri, 24 Sep 2021 10:35:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1632472517; bh=lvZnpfWC8usU/bo0m+tM8RpmNRYpppbmXZLe8xcB1AM=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=dmByYXL4NfVL9kssPkHX+Qcm6zcfYQ9CGKmm08KECo/oiYU6aCFoQGvuIgrFx6D1d
         MYsFFNaSK3/wS8EpiPK9LpwcCYJL7IJg6suiz2ijWrWZ0367wp4wTPAHUxt3JnWC3r
         txSqFVCi7XeO+KTIZ8NN62M3ppGJzZBymv6gpA9w=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 6TP5DphcPBq1; Fri, 24 Sep 2021 10:35:12 +0200 (CEST)
Received: from [192.168.105.22] (ip28.insite.cz [81.0.237.28])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id 2C94CA1A3D400;
        Fri, 24 Sep 2021 10:35:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1632472512; bh=lvZnpfWC8usU/bo0m+tM8RpmNRYpppbmXZLe8xcB1AM=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=g5JStdN6PBlhjJt47bN1B99aSkBfxzvY24bQQNKRJejb4it2IRNyPM6CpIPNv21Yh
         XdHaFWIcm+t+KfeRc02JiqG0MOiBAq9knyC8NYsxibC1J3R+0SmDUwWn1XMsQFTbDU
         YNPosvMyAa50P3BQwGLVJTpNf/L6fawI2wfuHM8Q=
Subject: Re: [PATCH] usb: gadget: f_uac2: fixed EP-IN wMaxPacketSize
To:     Greg KH <greg@kroah.com>
Cc:     linux-usb@vger.kernel.org,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Jack Pham <jackp@codeaurora.org>
References: <20210924080027.5362-1-pavel.hofman@ivitera.com>
 <YU2KXJ/4Q2tq+ANv@kroah.com>
From:   Pavel Hofman <pavel.hofman@ivitera.com>
Message-ID: <5c99651b-a0a2-cb44-e1ad-a79283449ce5@ivitera.com>
Date:   Fri, 24 Sep 2021 10:35:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YU2KXJ/4Q2tq+ANv@kroah.com>
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

Dne 24. 09. 21 v 10:20 Greg KH napsal(a):
> On Fri, Sep 24, 2021 at 10:00:27AM +0200, Pavel Hofman wrote:
>> Async feedback patches broke enumeration on Windows 10 previously fixed
>> by commit 789ea77310f0 ("usb: gadget: f_uac2: always increase endpoint
>> max_packet_size by one audio slot").
>>
>> While the existing calculation for EP OUT capture for async mode yields
>> size+1 frame due to uac2_opts->fb_max > 0, playback side lost the +1
>> feature.  Therefore the +1 frame addition must be re-introduced for
>> playback. Win10 enumerates the device only when both EP IN and EP OUT
>> max packet sizes are (at least) +1 frame.
>>
>> Signed-off-by: Pavel Hofman <pavel.hofman@ivitera.com>
>> Tested-by: Henrik Enquist <henrik.enquist@gmail.com>
>> Tested-by: Jack Pham <jackp@codeaurora.org>
>> ---
>>   drivers/usb/gadget/function/f_uac2.c | 14 ++++++++++----
>>   1 file changed, 10 insertions(+), 4 deletions(-)
> 
> What commit does this fix?
> 
> Should it go to stable kernel(s)?

It's the same effort direction as commit 
https://kernel.googlesource.com/pub/scm/linux/kernel/git/gregkh/usb/+/f5dfd98a80ff8d50cf4ae2820857d7f5a46cbab9 
which you added to your usb-linus branch 
https://kernel.googlesource.com/pub/scm/linux/kernel/git/gregkh/usb/+log/refs/heads/usb-linus/drivers/usb/gadget/function 
Therefore I would say usb-linus.

Please what are your rules for usb-linus and usb-next? There are some 
different commits in usb-next and usb-linus changing the same file - 
f_uac2.c . Likely not, but a conflict could potentially occur. I do not 
know what head to rebase my further patches which also make larger 
changes to that file.

Thanks a lot for explanation,

Pavel.
