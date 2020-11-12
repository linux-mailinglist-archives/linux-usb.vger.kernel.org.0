Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5A3C2B03D1
	for <lists+linux-usb@lfdr.de>; Thu, 12 Nov 2020 12:26:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727489AbgKLL06 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 12 Nov 2020 06:26:58 -0500
Received: from cable.insite.cz ([84.242.75.189]:35088 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727234AbgKLL05 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 12 Nov 2020 06:26:57 -0500
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id 20C82A956C327;
        Thu, 12 Nov 2020 12:26:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1605180412; bh=4Qv3VfHguyWB8Fa58L7q9KCQVBYAF3dJToEaqoupNAY=;
        h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
        b=JbAZzMkPPlupGsgQPt8d6zvkOdFcOr+U/AccmRFz60oWODWvFiyiRpgQFBq7WB519
         rmH1f1ndyicEnTKLoPFI5yAAyeTYqS4jN57F5wcTGzaX1c1bEGz0vLG51oDagGk65W
         qujp/Q1TOIE8q7RztEe+T8RTjFwH4CDLMbg4t2+M=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id A4uUwZrHTuAN; Thu, 12 Nov 2020 12:26:52 +0100 (CET)
Received: from [192.168.100.21] (unknown [192.168.100.21])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id ECD81A956C323;
        Thu, 12 Nov 2020 12:26:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1605180411; bh=4Qv3VfHguyWB8Fa58L7q9KCQVBYAF3dJToEaqoupNAY=;
        h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
        b=EOvFxWw0yNjgvef8ohABAyc3Xt3u6W/tdmMCvPGzvkUi88LiS+2MfoMe9/98bS8U4
         w3HPwl0ZKowkOzM9ksypT1hVKdE/FDWfqxU/Ra7zH4LQz+KTJF+0hytAxIszjix66z
         B5GFGX/pOBil4i3iekI4lVt9MrptfZpQqvbU2iBI=
Subject: Re: [PATCH 3/3] usb: gadget: u_audio: add real feedback
 implementation
From:   Pavel Hofman <pavel.hofman@ivitera.com>
To:     Ruslan Bilovol <ruslan.bilovol@gmail.com>, balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, gschmottlach@gmail.com
References: <1604794711-8661-1-git-send-email-ruslan.bilovol@gmail.com>
 <1604794711-8661-4-git-send-email-ruslan.bilovol@gmail.com>
 <cbdd5e54-87e8-98f2-becb-692c125ae456@ivitera.com>
Message-ID: <6e11c4cb-e622-7e86-51ea-72280ff0218c@ivitera.com>
Date:   Thu, 12 Nov 2020 12:26:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <cbdd5e54-87e8-98f2-becb-692c125ae456@ivitera.com>
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Language: cs-CZ
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Dne 09. 11. 20 v 9:24 Pavel Hofman napsal(a):
> Hi Ruslan,
> 
> Dne 08. 11. 20 v 1:18 Ruslan Bilovol napsal(a):
>> This adds interface between userspace and feedback
>> endpoint to report real feedback frequency to the Host.
>>
>> Current implementation adds new userspace interface
>> ALSA mixer control "PCM Feedback Frequency Hz" (similar
>> to aloop driver's "PCM Rate Shift 100000" mixer control)
>>
>> We allow +/-20% deviation of nominal sampling frequency,
>> that usually is more than enough in real-world usecases
>>
>> Usage of this new control is easy to implement in
>> existing userspace tools like alsaloop from alsa-utils.
>>
>> Signed-off-by: Ruslan Bilovol <ruslan.bilovol@gmail.com>
>> ---
>>   drivers/usb/gadget/function/f_uac2.c  |  4 ++
>>   drivers/usb/gadget/function/u_audio.c | 93 +++++++++++++++++++++++++++++++++++
>>   drivers/usb/gadget/function/u_audio.h |  7 +++
>>   3 files changed, 104 insertions(+)
> 
> Thanks a lot for the great implementation. IIUC the control element sets
> integer frequency in Hz. Often the clocks deviate by small fractions of
> Hz. Please have you considered the value to be e.g. in 100th of Hz for
> finer control of the samplerate? Similar to the PCM Rate Shift which has
> a step 100000th of the samplerate.
> 

My stupid, I did not realize that one Hz in the samplerate value is 
basically the same order of magnitude as the 100,000ths in the "PCM Rate 
Shift 100000" mixer control. Sorry for disturbing.

Thanks,

Pavel.
