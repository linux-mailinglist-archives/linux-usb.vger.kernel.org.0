Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0241A60F567
	for <lists+linux-usb@lfdr.de>; Thu, 27 Oct 2022 12:37:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235034AbiJ0Kha (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Oct 2022 06:37:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234898AbiJ0Kh1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 27 Oct 2022 06:37:27 -0400
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [IPv6:2a01:488:42:1000:50ed:8234::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE56E915E2
        for <linux-usb@vger.kernel.org>; Thu, 27 Oct 2022 03:37:25 -0700 (PDT)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
        by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        id 1oo0GH-0007ZP-7c; Thu, 27 Oct 2022 12:37:21 +0200
Message-ID: <f380d104-456b-2c1e-87c4-0afe1868889e@leemhuis.info>
Date:   Thu, 27 Oct 2022 12:37:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [regression] Bug 216426 - USB-C port is incorrectly reporting
 that it's powered when Dell XPS 15-9500 is unplugged #forregzbot
Content-Language: en-US, de-DE
From:   Thorsten Leemhuis <regressions@leemhuis.info>
To:     "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
References: <f28e3bdf-2add-574a-cf0a-5d0253ea708a@leemhuis.info>
 <ead18940-4e8b-f5c1-f1ac-16040b4bcddc@leemhuis.info>
 <c8d18046-0e43-0c2c-6ae6-92fe16163f4e@leemhuis.info>
In-Reply-To: <c8d18046-0e43-0c2c-6ae6-92fe16163f4e@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1666867045;88c2798b;
X-HE-SMSGID: 1oo0GH-0007ZP-7c
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

[Note: this mail is primarily send for documentation purposes and/or for
regzbot, my Linux kernel regression tracking bot. That's why I removed
most or all folks from the list of recipients, but left any that looked
like a mailing lists. These mails usually contain '#forregzbot' in the
subject, to make them easy to spot and filter out.]

On 30.09.22 13:20, Thorsten Leemhuis wrote:
> On 26.09.22 16:25, Thorsten Leemhuis wrote:
>> On 01.09.22 11:07, Thorsten Leemhuis wrote:
>>> https://bugzilla.kernel.org/show_bug.cgi?id=216426
>>>
>>>>  Mattia Orlandi 2022-08-29 17:04:21 UTC
>>>>
>>>> System
>>>> ------
>>>> - Dell XPS 15 9500
>>>> - 5.19.4 kernel
>>>>
>>>> Problem description
>>>> -------------------
>>>> Whenever I plug and then unplug my laptop from AC power using the USB-C port, the system thinks it is still plugged in (i.e., the KDE applet reports "Plugged in but still discharging").
>>>> If I check in Dell's BIOS, it correctly reports when the power supply is plugged/unplugged; `acpi -V` also correctly shows `Adapter 0: off-line`.
>>>>
>>>> On the other hand, `upower -d` incorrectly reports `/org/freedesktop/UPower/devices/line_power_ucsi_source_psy_USBC000o002` as `online: yes`.
>>>> Moreover, `journalctl` reports `ucsi_acpi USBC000:00: ucsi_handle_connector_change: GET_CONNECTOR_STATUS failed (-110)`.
>>>>
>>>> I'm testing the LTS kernel (5.15.63) and the issue does not occur, so I assume it's a regression bug, possibly introduced in kernel 5.18 (I tried downgrading the kernel to version 5.18.16 and the issue was already present).
>>>
>>> See the ticket for more details. Apologies if I forwarded it to the
>>> wrong folks, I cover a lot of ground and thus sometimes get things
>>> wrong. :-/
>>>
>>> BTW, I'd also like to add the report to the list of tracked regressions
>>> to ensure it's doesn't fall through the cracks in the end:
>>>
>>> #regzbot introduced: v5.15..v5.18
>>> https://bugzilla.kernel.org/show_bug.cgi?id=216426
>>> #regzbot ignore-activity
>> #regzbot introduced: f7090e0ef360d674f0
> 
> Looks like nobody yet check if the problem happens with mainline, so
> let's stick to the backport for now:
> 
> #regzbot introduced: 0fbb5ce2f4267

#regzbot invalid: not a regression, likely something related to hardware
or firmware https://bugzilla.kernel.org/show_bug.cgi?id=216426#c22
