Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C3DCF14850A
	for <lists+linux-usb@lfdr.de>; Fri, 24 Jan 2020 13:16:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730379AbgAXMQp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Jan 2020 07:16:45 -0500
Received: from cable.insite.cz ([84.242.75.189]:54102 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730275AbgAXMQp (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 24 Jan 2020 07:16:45 -0500
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id CEB85A1A40B07;
        Fri, 24 Jan 2020 13:16:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1579868201; bh=L01J8jxK50mtP80y/7F4UYp0RJAINpEbN3MrdXYjrSo=;
        h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
        b=j2MhxV65Rw/6S5DLR0IgT+LQsh+I9P89s+Spwv72hZmyK+ejxjVyWpadQZ+3E2q5m
         7bjTohw77WTzOwr3zO8xR/QJoAzEVth8LI840+Af03vt4yVseyGADaWDbJfIt42ZUN
         OKTiuR9AEz+9G6SDfYufRxOnwifA6kY64hBeL5qs=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id wB9GSccwqEa3; Fri, 24 Jan 2020 13:16:41 +0100 (CET)
Received: from [192.168.100.32] (unknown [192.168.100.32])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id A6C85A1A40B02;
        Fri, 24 Jan 2020 13:16:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1579868201; bh=L01J8jxK50mtP80y/7F4UYp0RJAINpEbN3MrdXYjrSo=;
        h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
        b=j2MhxV65Rw/6S5DLR0IgT+LQsh+I9P89s+Spwv72hZmyK+ejxjVyWpadQZ+3E2q5m
         7bjTohw77WTzOwr3zO8xR/QJoAzEVth8LI840+Af03vt4yVseyGADaWDbJfIt42ZUN
         OKTiuR9AEz+9G6SDfYufRxOnwifA6kY64hBeL5qs=
Subject: Re: [PATCH] usb: gadget: u_audio: Fix high-speed max packet size
From:   Pavel Hofman <pavel.hofman@ivitera.com>
To:     John Keeping <john@metanate.com>
Cc:     linux-usb@vger.kernel.org, Felipe Balbi <balbi@kernel.org>
References: <4f2df2bc-e208-fffb-48e2-3e14cd093103@ivitera.com>
 <60bf144a-2039-8832-b6f1-f972de6a6846@ivitera.com>
 <cfcef91b-799e-7d02-4a4c-26ee95e85ff7@ivitera.com>
 <20200114200450.064cd521.john@metanate.com>
 <24f0935d-16a7-4301-78f4-fa459e356ca9@ivitera.com>
 <20200117104022.5bb769f2.john@metanate.com>
 <495ccd06-9059-2249-ce70-aa9647609319@ivitera.com>
Message-ID: <9607a759-c08c-97bd-a0a7-f506ca64435f@ivitera.com>
Date:   Fri, 24 Jan 2020 13:16:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <495ccd06-9059-2249-ce70-aa9647609319@ivitera.com>
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Dne 19. 01. 20 v 15:53 Pavel Hofman napsal(a):
> 
> Dne 17. 01. 20 v 11:40 John Keeping napsal(a):
>> On Thu, 16 Jan 2020 16:39:50 +0100
>> Pavel Hofman <pavel.hofman@ivitera.com> wrote:
>>
>>>> I've taken a look at this and the patch below fixes it in my simple
>>>> testing.  But note that this doesn't adjust the PCM's min_period_bytes
>>>> which will be necessary if you want to minimize latency with an 
>>>> adjusted
>>>> high-speed bInterval setting.
>>>
>>> Please can I ask you to submit your patch? IMO your perhaps slightly
>>> suboptimal solution is much better than the current broken version.
>>
>> Yes, the patch is definitely an improvement.  I thought it would be
>> picked up from the earlier mail, but I think Patchwork requires the
>> subject to match, so I'm including it again here.
>>
>> Are you able to provide a Tested-by for this change?
> 
> 
> Testing looks OK, thanks a lot!
> 
> Tested-by: Pavel Hofman  <pavel.hofman@ivitera.com>
> 

Please may I ask for finishing the patch submittal procedure, when it is 
already prepared and useful?

Thanks a lot,

Pavel.
