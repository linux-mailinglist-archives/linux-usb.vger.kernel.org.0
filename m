Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0389E6275B1
	for <lists+linux-usb@lfdr.de>; Mon, 14 Nov 2022 06:56:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235656AbiKNF4v (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 14 Nov 2022 00:56:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233166AbiKNF4u (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 14 Nov 2022 00:56:50 -0500
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2F691742D
        for <linux-usb@vger.kernel.org>; Sun, 13 Nov 2022 21:56:49 -0800 (PST)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
        by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        id 1ouSSd-0000XQ-Dd; Mon, 14 Nov 2022 06:56:47 +0100
Message-ID: <f941605e-a8ae-84d5-3306-ad74086b828e@leemhuis.info>
Date:   Mon, 14 Nov 2022 06:56:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH 2/2] extcon: usbc-tusb320: Add USB TYPE-C support
 #forregzbot
Content-Language: en-US, de-DE
From:   Thorsten Leemhuis <regressions@leemhuis.info>
To:     linux-usb@vger.kernel.org
Cc:     regressions@lists.linux.dev, Peter Rosin <peda@axentia.se>
References: <fd0f2d56-495e-6fdd-d1e8-ff40b558101e@axentia.se>
 <0d7b7d44-e2b9-9ea8-86b2-cf0f4b53eedd@leemhuis.info>
In-Reply-To: <0d7b7d44-e2b9-9ea8-86b2-cf0f4b53eedd@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1668405409;ce919f67;
X-HE-SMSGID: 1ouSSd-0000XQ-Dd
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 13.11.22 18:38, Thorsten Leemhuis wrote:
> [Note: this mail is primarily send for documentation purposes and/or for
> regzbot, my Linux kernel regression tracking bot. That's why I removed
> most or all folks from the list of recipients, but left any that looked
> like a mailing lists. These mails usually contain '#forregzbot' in the
> subject, to make them easy to spot and filter out.]

>> I'm very sad to report that this patch has caused a severe
>> regression for our devices. They can no longer be powered by simply
>> sticking a USB cable into their USB ports (they keep resetting
>> when the tusb320 driver probes), and they reset (and keep resetting)
>> if a USB cable is connected while the device is powered by other
>> means.
>>
>> We have no connector node nor any typec-power-opmode property
>> in the device tree, so the mere touching of the new registers
>> happening in this patch is enough to cause the resets.
>>
>> The devices were fine before this patch, and reverting on top
>> of a recent linus master (4bbf3422df78, from 11/11) makes the
>> problem go away.
>
>> regzbot: introduced bf7571c00dca
> 
> Peter, many thx for getting regzbot in the loop, there was a small typo,
> let me take care of that:
> 
> #regzbot ^introduced bf7571c00dca
> #regzbot title usb: devices are not powered anymore and sometimes reset

#regzbot fixed-by 341fd15e2e18c24d5c738496cfc3d7a272241201
