Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7FEE44AD898
	for <lists+linux-usb@lfdr.de>; Tue,  8 Feb 2022 14:15:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233419AbiBHNP1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Feb 2022 08:15:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237497AbiBHMOr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Feb 2022 07:14:47 -0500
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [IPv6:2a01:488:42:1000:50ed:8234::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62DA0C03FEC0
        for <linux-usb@vger.kernel.org>; Tue,  8 Feb 2022 04:14:46 -0800 (PST)
Received: from ip4d144895.dynamic.kabel-deutschland.de ([77.20.72.149] helo=[192.168.66.200]); authenticated
        by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        id 1nHPON-00026R-MF; Tue, 08 Feb 2022 13:14:43 +0100
Message-ID: <e4d45921-ebe2-a06a-5f86-eac981d75e8d@leemhuis.info>
Date:   Tue, 8 Feb 2022 13:14:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: Bug 215561 - snd-usb-audio:reset_resume error -22 after suspend
 (fwd from bugzilla)
Content-Language: en-BS
From:   Thorsten Leemhuis <regressions@leemhuis.info>
To:     Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <a8100c3d-007e-3207-7dc1-92849f638d71@leemhuis.info>
Cc:     "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
        alsa-devel@alsa-project.org, linux-usb@vger.kernel.org
In-Reply-To: <a8100c3d-007e-3207-7dc1-92849f638d71@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1644322486;03dea8a9;
X-HE-SMSGID: 1nHPON-00026R-MF
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi, this is your Linux kernel regression tracker speaking.

Top-posting for once, to make this easy accessible to everyone.

Below issue is one of those those reports that seem to get stranded in
bugzilla.kernel.org

Greg, Jaroslav, Takashi, could one of you please take a look? The
reporter submitted it as USB bug, but maybe that wasn't a wise choice.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I'm getting a lot of
reports on my table. I can only look briefly into most of them and lack
knowledge about most of the areas they concern. I thus unfortunately
will sometimes get things wrong or miss something important. I hope
that's not the case here; if you think it is, don't hesitate to tell me
in a public reply, it's in everyone's interest to set the public record
straight.

#regzbot poke

On 03.02.22 15:59, Thorsten Leemhuis wrote:
> Hi, this is your Linux kernel regression tracker speaking.
> 
> There is a regression in bugzilla.kernel.org I'd like to add to the
> tracking:
> 
> #regzbot introduced: v5.15..v5.16
> #regzbot from: antifermion@protonmail.com <antifermion@protonmail.com>
> #regzbot title: snd: usb: snd-usb-audio:reset_resume error -22 after suspen
> #regzbot link: https://bugzilla.kernel.org/show_bug.cgi?id=215561
> 
> Quote:
> 
>> If I use the microphone, then suspend and wake up again, I get the error
>>
>> ```
>> snd-usb-audio 1-5:1.0: reset_resume error -22
>> ```
>>
>> Aftewards, audio stops working completely. Both pipewire and pulseaudio (tried both; not at the same time) freeze.
>>
>> After running
>>
>> ```
>> rmmod -f snd_usb_audio
>> ```
>>
>> and replugging the microphone, audio works again.
>> Here is the relevant log:
>>
>> ```
>> [  157.791937] usbcore: deregistering interface driver snd-usb-audio
>> [  228.517855] usb 1-5: USB disconnect, device number 2
>> [  236.464334] usb 1-5: new high-speed USB device number 3 using xhci_hcd
>> [  236.798863] usb 1-5: New USB device found, idVendor=0d8c, idProduct=0171, bcdDevice= 1.04
>> [  236.798867] usb 1-5: New USB device strings: Mfr=3, Product=1, SerialNumber=0
>> [  236.798869] usb 1-5: Product: USB 2.0 HD Audio
>> [  236.798871] usb 1-5: Manufacturer: C-Media Electronics Inc.
>> [  236.826966] input: C-Media Electronics Inc. USB 2.0 HD Audio Consumer Control as /devices/pci0000:00/0000:00:01.3/0000:02:00.0/usb1/1-5/1-5:1.3/0003:0D8C:0171.000B/input/input40
>> [  236.878380] input: C-Media Electronics Inc. USB 2.0 HD Audio as /devices/pci0000:00/0000:00:01.3/0000:02:00.0/usb1/1-5/1-5:1.3/0003:0D8C:0171.000B/input/input41
>> [  236.878447] hid-generic 0003:0D8C:0171.000B: input,hiddev96,hidraw2: USB HID v1.11 Device [C-Media Electronics Inc. USB 2.0 HD Audio] on usb-0000:02:00.0-5/input3
>> [  242.306593] usbcore: registered new interface driver snd-usb-audio
>>
>> ```
>>
>> I'm running Arch Linux (5.16.4.arch1-1). The linux-lts kernel (5.15.18-1) works fine.
>>
>> Other uses report the same error: https://bbs.archlinux.org/viewtopic.php?id=273469
> 
> Ciao, Thorsten (wearing his 'Linux kernel regression tracker' hat)
> 
> P.S.: As a Linux kernel regression tracker I'm getting a lot of reports
> on my table. I can only look briefly into most of them. Unfortunately
> therefore I sometimes will get things wrong or miss something important.
> I hope that's not the case here; if you think it is, don't hesitate to
> tell me about it in a public reply, that's in everyone's interest.
> 
> BTW, I have no personal interest in this issue, which is tracked using
> regzbot, my Linux kernel regression tracking bot
> (https://linux-regtracking.leemhuis.info/regzbot/). I'm only posting
> this mail to get things rolling again and hence don't need to be CC on
> all further activities wrt to this regression.
> 
> ---
> Additional information about regzbot:
> 
> If you want to know more about regzbot, check out its web-interface, the
> getting start guide, and/or the references documentation:
> 
> https://linux-regtracking.leemhuis.info/regzbot/
> https://gitlab.com/knurd42/regzbot/-/blob/main/docs/getting_started.md
> https://gitlab.com/knurd42/regzbot/-/blob/main/docs/reference.md
> 
> The last two documents will explain how you can interact with regzbot
> yourself if your want to.
> 
> Hint for reporters: when reporting a regression it's in your interest to
> tell #regzbot about it in the report, as that will ensure the regression
> gets on the radar of regzbot and the regression tracker. That's in your
> interest, as they will make sure the report won't fall through the
> cracks unnoticed.
> 
> Hint for developers: you normally don't need to care about regzbot once
> it's involved. Fix the issue as you normally would, just remember to
> include a 'Link:' tag to the report in the commit message, as explained
> in Documentation/process/submitting-patches.rst
> That aspect was recently was made more explicit in commit 1f57bd42b77c:
> https://git.kernel.org/linus/1f57bd42b77c
