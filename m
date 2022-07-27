Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0FCCB581ED2
	for <lists+linux-usb@lfdr.de>; Wed, 27 Jul 2022 06:26:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240232AbiG0E0K (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 27 Jul 2022 00:26:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240218AbiG0E0J (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 27 Jul 2022 00:26:09 -0400
Received: from endrift.com (endrift.com [173.255.198.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9065F3CBC6
        for <linux-usb@vger.kernel.org>; Tue, 26 Jul 2022 21:26:07 -0700 (PDT)
Received: from [192.168.1.141] (c-73-100-220-23.hsd1.ma.comcast.net [73.100.220.23])
        by endrift.com (Postfix) with ESMTPSA id 23775A25D;
        Tue, 26 Jul 2022 21:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=endrift.com; s=2020;
        t=1658895966; bh=aD2MRNZfxiD4qr8jt+a++nysWJD/qF3m/Bjcd1eac+Q=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=vrH0jjkXTFV4v/VaDqW0xf4fl8awfegoOABnciKjb5xGKjx4z1N4CTlj5S8zPwWGq
         HfufjpqIVxdmX0mKsWwE6JcNzHiIKc5wdOkiWU1e4Wt8dDdro5IPJnPiiWTX85q/Tu
         4/gg2vkKZFkSBnbswRUTjNhu+QJ0LzNioWvfhnzuI/KohoQSdlheH8vPlbLn/MNl0O
         UneYw9gh2FRIHJfm9IslskLhuXr6Z3A8MRLmcyw1xt/KvIf4SyUIh8NvuspIGyLn3R
         BD8g7fDnQaxPVi57sRSSnMfhLFFt8hsCWeLP0ljlgBpzeVsCY4GPUzlzdUIOkaQXTG
         JQE6lhSbMpTqA==
Message-ID: <d19bad31-dc18-a7a7-6084-dfab8aeec498@endrift.com>
Date:   Tue, 26 Jul 2022 21:26:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/2] USB: gadget: f_hid: Add Set-Feature report
Content-Language: en-US
To:     Maxim Devaev <mdevaev@gmail.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
References: <20220726005824.2817646-1-vi@endrift.com>
 <20220726005824.2817646-2-vi@endrift.com> <20220726125137.7d3757c7@reki>
From:   Vicki Pfau <vi@endrift.com>
In-Reply-To: <20220726125137.7d3757c7@reki>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 7/26/22 02:51, Maxim Devaev wrote:
> В Mon, 25 Jul 2022 17:58:26 -0700
> Vicki Pfau <vi@endrift.com> пишет:
> 
>> While the HID gadget implementation has been sufficient for devices that only
>> use INTERRUPT transfers, the USB HID standard includes provisions for Set- and
>> Get-Feature report CONTROL transfers that go over endpoint 0. These were
>> previously impossible with the existing implementation, and would either send
>> an empty reply, or stall out.
>>
>> As the feature is a standard part of USB HID, it stands to reason that devices
>> would use it, and that the HID gadget should support it. This patch adds
>> support for host-to-device Set-Feature reports through a new ioctl
>> interface to the hidg class dev nodes.
>>
>> Signed-off-by: Vicki Pfau <vi@endrift.com>
> 
> Won't it break the logic of the existing software that works with /dev/hidgX?
> Will it work if I want my gadget to work the old way?

For existing software to use SET_FEATURE at all it has to use an alternative mode, which seems to have only been added somewhat recently. That mode also appears to preclude use of INTERRUPT transfers at all, unless there's some way to set up two hidg nodes that map to the same interface, with one for INTERRUPT and one for SET_FEATURE. If this breaks that, I suppose that's a regression, but this is meant to augment the original, long-standing mode so you can mix INTERRUPT and SET/GET_FEATURE transfers, as there is no way to do that yet. Honestly, the alternate mode seems more like a workaround, as far as I can tell, and not an ideal implementation. I'm not sure when it was added, but as I was originally authoring this against 5.13 and didn't see it until I went to rebase onto master, it can't have been that long ago. So if it breaks any software (which I don't believe it does), it would only affect very new software.

As I alluded to, I'd thought about perhaps adding a second node per interface so one would act as INTERRUPT transfers and the other as SET/GET_FEATURE transfers, but I already had this code half written and wanted to get feedback first, especially since what I have now works (although it's not well-tested after rebasing).

> It is important that the old behavior is the default without having to use
> the new ioctls. As for these ioctls, since this is an addition to the new API,
> they should be documented. I think it's also worth adding these ioctls
> to the userspace example:
>   - Documentation/usb/gadget_hid.rst
>   - Documentation/usb/gadget-testing.rst

Yup, I should probably do that. Forgot about that before sending the patch, though I'm hoping to be told if my approach was even worthwhile before I write that, but I can work on that soon either way.

> 
> But it seems to me that extending the HID functionality to meet
> the specifications is definitely a good idea :)
