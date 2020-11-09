Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F0242AB27B
	for <lists+linux-usb@lfdr.de>; Mon,  9 Nov 2020 09:34:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729803AbgKIIef (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 Nov 2020 03:34:35 -0500
Received: from cable.insite.cz ([84.242.75.189]:48918 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729792AbgKIIef (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 9 Nov 2020 03:34:35 -0500
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id 0736FA90DCE80;
        Mon,  9 Nov 2020 09:25:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1604910324; bh=u1nkS075iAxLIJRcs/5oI+9c9rU2RB93VPHrMf6HZyw=;
        h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
        b=rG99vLyLsO0t6r21ZMciYmr92fbwP/q2NUP5wMCOgtsJeTJUnb8wH6rwcosA20+UO
         7A5JLYlq5/t1MaZVqoOC1pnmU0jFGvPZ728jl2v0hcfSoiuycKXMx6YqoB9s4I/sPB
         GxC0UxujBF2fXKIDd0KMaFeFqh9Kms9NW45cbtO8=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id liUcheaYA8EX; Mon,  9 Nov 2020 09:25:18 +0100 (CET)
Received: from [192.168.105.22] (ip28.insite.cz [81.0.237.28])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id 8B9C6A93253BE;
        Mon,  9 Nov 2020 09:25:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1604910318; bh=u1nkS075iAxLIJRcs/5oI+9c9rU2RB93VPHrMf6HZyw=;
        h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
        b=fhU9pH/g/zeUULHu261lkzpcL4bDNIIn9sqzlJU5L1Ibr4VSIsuwUtQPoTS6QtjUI
         e5HdEfWpIezY3IExGJUjVyk4fkPOI5J9eGLiDxtN5bVSECG8xvewrLcIH4/T5kmRKX
         RQJIbko8Io7AJk9AnTJhzME7HUWJ6rItFj13M8vY=
Subject: Re: [PATCH 3/3] usb: gadget: u_audio: add real feedback
 implementation
From:   Pavel Hofman <pavel.hofman@ivitera.com>
To:     Ruslan Bilovol <ruslan.bilovol@gmail.com>, balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, gschmottlach@gmail.com
References: <1604794711-8661-1-git-send-email-ruslan.bilovol@gmail.com>
 <1604794711-8661-4-git-send-email-ruslan.bilovol@gmail.com>
 <cbdd5e54-87e8-98f2-becb-692c125ae456@ivitera.com>
Message-ID: <8d1cdd61-c856-d1a4-9540-3bf567cba920@ivitera.com>
Date:   Mon, 9 Nov 2020 09:25:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <cbdd5e54-87e8-98f2-becb-692c125ae456@ivitera.com>
Content-Type: text/plain; charset=iso-8859-2
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Ruslan, please excuse my stupid error, I really apologize...

Dne 09. 11. 20 v 9:24 Pavel Hofman napsal(a):
> Hi Bilovol,
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
>>  drivers/usb/gadget/function/f_uac2.c  |  4 ++
>>  drivers/usb/gadget/function/u_audio.c | 93 +++++++++++++++++++++++++++++++++++
>>  drivers/usb/gadget/function/u_audio.h |  7 +++
>>  3 files changed, 104 insertions(+)
> 
> Thanks a lot for the great implementation. IIUC the control element sets
> integer frequency in Hz. Often the clocks deviate by small fractions of
> Hz. Please have you considered the value to be e.g. in 100th of Hz for
> finer control of the samplerate? Similar to the PCM Rate Shift which has
> a step 100000th of the samplerate.
> 
> Thanks a lot.
> 
> Best regards,
> 
> Pavel.
> 
