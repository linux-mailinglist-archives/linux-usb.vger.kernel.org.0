Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D6F0F6B044A
	for <lists+linux-usb@lfdr.de>; Wed,  8 Mar 2023 11:29:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230474AbjCHK32 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 Mar 2023 05:29:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231193AbjCHK3N (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 8 Mar 2023 05:29:13 -0500
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1C7F4DE1C
        for <linux-usb@vger.kernel.org>; Wed,  8 Mar 2023 02:28:41 -0800 (PST)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
        by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        id 1pZqT9-0006JI-Kr; Wed, 08 Mar 2023 10:52:23 +0100
Message-ID: <815cfb23-5696-01ca-697b-023c1425dec0@leemhuis.info>
Date:   Wed, 8 Mar 2023 10:52:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: USB regression in kernel 6.2.2
Content-Language: en-US, de-DE
To:     Brian Morrison <bdm@fenrir.org.uk>, mathias.nyman@intel.com
Cc:     linux-usb@vger.kernel.org,
        Linux kernel regressions list <regressions@lists.linux.dev>
References: <20230307132120.5897c5af@deangelis.fenrir.org.uk>
From:   "Linux regression tracking #adding (Thorsten Leemhuis)" 
        <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <20230307132120.5897c5af@deangelis.fenrir.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1678271322;ee252d82;
X-HE-SMSGID: 1pZqT9-0006JI-Kr
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

[CCing the regression list, as it should be in the loop for regressions:
https://docs.kernel.org/admin-guide/reporting-regressions.html]

[TLDR: I'm adding this report to the list of tracked Linux kernel
regressions; the text you find below is based on a few templates
paragraphs you might have encountered already in similar form.
See link in footer if these mails annoy you.]

On 07.03.23 14:21, Brian Morrison wrote:
> Hello Mathias (sorry you're getting this twice).
> 
> Re-send after linux-usb list rejection (too big).
> 
> Hans de Goede replied to my Fedora kernel bug here:
> 
> https://bugzilla.redhat.com/show_bug.cgi?id=2175534
> 
> suggesting that I contact you about it and Cc: the linux-usb list.
> 
> Starting with kernel-6.2.2-300 on Fedora x86_64 (the first 6.2 kernel on
> Fedora 37) I am seeing problems with USB devices on a Renesas
> ROM-based USB PCI card which works normally with kernel-6.1.15-200 and
> earlier 6.x kernels, essentially the USB 2.0 device tree on this card's
> bus is not being enumerated with the result that my /dev/ttyUSB*
> devices are no longer present (these are Silicon Labs CP210x UARTS with
> TI PCM290x devices behind them).
> 
> I have attached the lsusb -t output for the working and broken cases, I
> don't know where the problem lies but I suspect it's not udev because
> the configuration is unchanged, it seems to be in the kernel usb code.
> 
> There are further attachments in the bug referred to above, I don't
> know if they help but you can look there if the lsusb output is
> insufficient, I can point out that lsmod does show the cp210x module is
> loaded which may provide a clue about where things are failing.
> 
> Thanks for reading this, I look forward to hearing your suggestions.

Thanks for the report. To be sure the issue doesn't fall through the
cracks unnoticed, I'm adding it to regzbot, the Linux kernel regression
tracking bot:

#regzbot ^introduced v6.1..v6.2
#regzbot title usb: USB 2.0 device tree not enumerated on Renesas
ROM-based USB PCI card
#regzbot ignore-activity

This isn't a regression? This issue or a fix for it are already
discussed somewhere else? It was fixed already? You want to clarify when
the regression started to happen? Or point out I got the title or
something else totally wrong? Then just reply and tell me -- ideally
while also telling regzbot about it, as explained by the page listed in
the footer of this mail.

Developers: When fixing the issue, remember to add 'Link:' tags pointing
to the report (the parent of this mail). See page linked in footer for
details.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.
