Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8BE41141E9F
	for <lists+linux-usb@lfdr.de>; Sun, 19 Jan 2020 15:53:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727022AbgASOxn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 19 Jan 2020 09:53:43 -0500
Received: from cable.insite.cz ([84.242.75.189]:36604 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726778AbgASOxn (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 19 Jan 2020 09:53:43 -0500
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id 9227EA1A40B10;
        Sun, 19 Jan 2020 15:53:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1579445619; bh=mCv85dR/pt7vmGEHzTW93IBcePCyWvclCADZaGfBAZs=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=EOfaJPRFW91fv25MVejFuv2gf5MbKbJPEunMSIMEEUb8DqF5m3uVNzXc5dk1RzqYx
         MCoqcITUNYBWHiGQ0hPq+rAIMuAitYuM1tBpy0ykwCSjn8VLASuui32SPm2zLPy3IH
         WhAmGTmCgmGisRLFTgowQWlt2yOJk3wnZ9GCbeV4=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id udjzAKw8bDtw; Sun, 19 Jan 2020 15:53:34 +0100 (CET)
Received: from [192.168.105.151] (ip28.insite.cz [81.0.237.28])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id 78FD4A1A40B09;
        Sun, 19 Jan 2020 15:53:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1579445613; bh=mCv85dR/pt7vmGEHzTW93IBcePCyWvclCADZaGfBAZs=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=f864In09RgqbtC30oSBUfPMFNYejTBNLTaxRJWy7RVBddpnV5Vjxtp849i8hC4GYq
         Jb+70A+FF+KiZd3xYBdScZPy4ObwdCwDBANNEQMLqCRwFzlhyqWfnov25a0cwq532K
         p3Og+m1c48wjwAbUxDhLJrWcZa8KOy24Oxnaor2Y=
Subject: Re: [PATCH] usb: gadget: u_audio: Fix high-speed max packet size
To:     John Keeping <john@metanate.com>
Cc:     linux-usb@vger.kernel.org, Felipe Balbi <balbi@kernel.org>
References: <4f2df2bc-e208-fffb-48e2-3e14cd093103@ivitera.com>
 <60bf144a-2039-8832-b6f1-f972de6a6846@ivitera.com>
 <cfcef91b-799e-7d02-4a4c-26ee95e85ff7@ivitera.com>
 <20200114200450.064cd521.john@metanate.com>
 <24f0935d-16a7-4301-78f4-fa459e356ca9@ivitera.com>
 <20200117104022.5bb769f2.john@metanate.com>
From:   Pavel Hofman <pavel.hofman@ivitera.com>
Message-ID: <495ccd06-9059-2249-ce70-aa9647609319@ivitera.com>
Date:   Sun, 19 Jan 2020 15:53:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200117104022.5bb769f2.john@metanate.com>
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Dne 17. 01. 20 v 11:40 John Keeping napsal(a):
> On Thu, 16 Jan 2020 16:39:50 +0100
> Pavel Hofman <pavel.hofman@ivitera.com> wrote:
> 
>>> I've taken a look at this and the patch below fixes it in my simple
>>> testing.  But note that this doesn't adjust the PCM's min_period_bytes
>>> which will be necessary if you want to minimize latency with an adjusted
>>> high-speed bInterval setting.
>>>    
>>
>> Please can I ask you to submit your patch? IMO your perhaps slightly
>> suboptimal solution is much better than the current broken version.
> 
> Yes, the patch is definitely an improvement.  I thought it would be
> picked up from the earlier mail, but I think Patchwork requires the
> subject to match, so I'm including it again here.
> 
> Are you able to provide a Tested-by for this change?


Testing looks OK, thanks a lot!

Tested-by: Pavel Hofman  <pavel.hofman@ivitera.com>

