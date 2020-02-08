Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 98F071563C8
	for <lists+linux-usb@lfdr.de>; Sat,  8 Feb 2020 11:21:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727222AbgBHKVD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 8 Feb 2020 05:21:03 -0500
Received: from cable.insite.cz ([84.242.75.189]:47662 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726889AbgBHKVD (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 8 Feb 2020 05:21:03 -0500
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id 43959A1A40B08;
        Sat,  8 Feb 2020 11:21:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1581157260; bh=lGOZnzW3Wo2Ap2FlGGvWwisbJ0iBnQz3wh4HcBRZ4pc=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=a+DfYbbrk19MW0+luSqZE7rtn/h1U3QuhPacCm3HLb6jKkCFrR0RzJwNAAGbdp9FV
         jci/S2O7tbVM00vYBurNDIxtdi3+kEsPw1bmuExCBNDt9xAtGHEdrPAjkK3FdnKMRU
         4ODzafTqkbpJY+kPXX9aZAiufBMq8ikLQJbPo8t4=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 7Jl1WYilMH84; Sat,  8 Feb 2020 11:20:55 +0100 (CET)
Received: from [192.168.105.151] (ip28.insite.cz [81.0.237.28])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id D28FBA1A40B05;
        Sat,  8 Feb 2020 11:20:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1581157254; bh=lGOZnzW3Wo2Ap2FlGGvWwisbJ0iBnQz3wh4HcBRZ4pc=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=dyvou3XWKcejPNVfz32Jl3AWyPuOKnbYkhs+Jnr74F3PKXKCm18RwFzhtIvJ42U1f
         D2Uoc45q9BsXGRCIHKH3dktVd7Ulmb59WJZ/bZXJMH9JsN/AEbN3xPefvvHUj5uAIZ
         /jUWIFpiYI9/X+Q3Mn8Ivck5PqCMLQ4TODwSZ5ZU=
Subject: Re: USB: UAC2: Custom bInterval values
To:     Peter Chen <hzpeterchen@gmail.com>
Cc:     USB list <linux-usb@vger.kernel.org>
References: <d8d929f3-9479-85fe-915e-ef1f1386bf6d@ivitera.com>
 <CAL411-rxfwOGXNbuhCkXPAsQZYquPc2wxkx7Gf+enn3BKv=kYg@mail.gmail.com>
From:   Pavel Hofman <pavel.hofman@ivitera.com>
Message-ID: <1bb4e001-25b3-5118-89f1-b7d7c23f1dd9@ivitera.com>
Date:   Sat, 8 Feb 2020 11:20:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAL411-rxfwOGXNbuhCkXPAsQZYquPc2wxkx7Gf+enn3BKv=kYg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Dne 24. 12. 19 v 4:16 Peter Chen napsal(a):
> On Sat, Dec 21, 2019 at 4:35 PM Pavel Hofman <pavel.hofman@ivitera.com> wrote:
>>
>> Hi,
>>
>> I would like to add support for custom EP IN and EP OUT bInterval values
>> in f_uac2.c, to allow fine-tuning the gadget for higher samplerates.
>>
>> For now the easiest way to me seems to add the params to uac2_opts and
>> add module params to  g_audio module (to the existing params p_chmask,
>> p_srate, etc.). Please will such change be accepted to upstream?
>>
> 
> I think you could add this support for uac2_opts first, the configfs
> is the suggested
> way to support gadget now.

My long-term plan is adding proper support for standard selection of
required audio stream params (samplerate, channel count, sample
bitwidth) by UAC2 client, offered from a list configured for the
g_audio/uac2 modules. This configuration should be via configfs then. In
the meantime I would really want to just add the bInterval to the
existing params. Since they are closely related and dependent, they
should all be configured in the same way, IMO.

Thanks,

Pavel.
