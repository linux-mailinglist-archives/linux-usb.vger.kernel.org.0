Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 573946082EA
	for <lists+linux-usb@lfdr.de>; Sat, 22 Oct 2022 02:37:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229911AbiJVAhc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 21 Oct 2022 20:37:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229849AbiJVAhb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 21 Oct 2022 20:37:31 -0400
X-Greylist: delayed 542 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 21 Oct 2022 17:37:30 PDT
Received: from endrift.com (endrift.com [173.255.198.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10FE92B4EAD
        for <linux-usb@vger.kernel.org>; Fri, 21 Oct 2022 17:37:29 -0700 (PDT)
Received: from [192.168.0.22] (unknown [50.47.218.115])
        by endrift.com (Postfix) with ESMTPSA id 693A4A1DA;
        Fri, 21 Oct 2022 17:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=endrift.com; s=2020;
        t=1666398506; bh=7SnCmcvQV9ddlUXIlxLAZQSw0CcxzcTiyH/wZW/xTag=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=Quv1sQQ6Ga9nikI/XnLmAuqMTtBPg2AUaiVc3mpKynsffdYOFxHT44Qbhe9KPM1mG
         VBHBo+k1O2LVVPDdf2Qfy7C8y0PO8S3RwN+NaT0d9tOtd5dr0PGAaTFlysHYJB1C9j
         gvzm7qtk6QqvKFZhYrhCVtXRAGRa+4ATOIeyuG64+jVK9nJFANivcpVlhCR2fPfHJb
         2mdYldwH0WLghzMd8XRtv1GkofemRSwvU/EsXuK+b6AVtivvd2Cm6A1P75GusG8r1K
         YwHovQ9U7GobsYYdqo6a0KNAOh2mfdQ5/qIl8pZNMXBGA4wkGO2nBcOfpWv7ygHHSB
         aayfyRoWCC6Qw==
Message-ID: <e382f055-7ea2-0f93-d48c-8a3795b5c05a@endrift.com>
Date:   Fri, 21 Oct 2022 17:28:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 2/2] USB: gadget: f_hid: Add Set-Feature report
Content-Language: en-US
To:     Maxim Devaev <mdevaev@gmail.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
References: <20220726005824.2817646-1-vi@endrift.com>
 <20220726005824.2817646-2-vi@endrift.com> <20220726125137.7d3757c7@reki>
 <d19bad31-dc18-a7a7-6084-dfab8aeec498@endrift.com>
 <20220728115950.4c1707a9@reki>
 <9ad81143-0876-e6d7-2fc1-95dd82abe4a7@endrift.com>
 <20220731111421.3f69e963@reki>
 <99fa8804-eb1a-5bf5-3cc3-29a7e8be5822@endrift.com>
 <20220913130625.60f06590@reki>
From:   Vicki Pfau <vi@endrift.com>
In-Reply-To: <20220913130625.60f06590@reki>
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



On 9/13/22 03:06, Maxim Devaev wrote:
> В Thu, 8 Sep 2022 16:57:36 -0700
> Vicki Pfau <vi@endrift.com> пишет:
> 
>> Hi,
>>
>> On 7/31/22 01:14, Maxim Devaev wrote:
>>> В Thu, 28 Jul 2022 11:11:31 -0700
>>> Vicki Pfau <vi@endrift.com> пишет:
>>>   
>>>> On 7/28/22 01:59, Maxim Devaev wrote:  
>>>>> В Tue, 26 Jul 2022 21:26:05 -0700
>>>>> Vicki Pfau <vi@endrift.com> пишет:
>>>>>     
>>>>>> On 7/26/22 02:51, Maxim Devaev wrote:    
>>>>>>> В Mon, 25 Jul 2022 17:58:26 -0700
>>>>>>> Vicki Pfau <vi@endrift.com> пишет:
>>>>>>>       
>>>>>>>> While the HID gadget implementation has been sufficient for devices that only
>>>>>>>> use INTERRUPT transfers, the USB HID standard includes provisions for Set- and
>>>>>>>> Get-Feature report CONTROL transfers that go over endpoint 0. These were
>>>>>>>> previously impossible with the existing implementation, and would either send
>>>>>>>> an empty reply, or stall out.
>>>>>>>>
>>>>>>>> As the feature is a standard part of USB HID, it stands to reason that devices
>>>>>>>> would use it, and that the HID gadget should support it. This patch adds
>>>>>>>> support for host-to-device Set-Feature reports through a new ioctl
>>>>>>>> interface to the hidg class dev nodes.
>>>>>>>>
>>>>>>>> Signed-off-by: Vicki Pfau <vi@endrift.com>      
>>>>>>>
>>>>>>> Won't it break the logic of the existing software that works with /dev/hidgX?
>>>>>>> Will it work if I want my gadget to work the old way?      
>>>>>>
>>>>>> For existing software to use SET_FEATURE at all it has to use an alternative mode, which seems to have only been added somewhat recently. That mode also appears to preclude use of INTERRUPT transfers at all, unless there's some way to set up two hidg nodes that map to the same interface, with one for INTERRUPT and one for SET_FEATURE. If this breaks that, I suppose that's a regression, but this is meant to augment the original, long-standing mode so you can mix INTERRUPT and SET/GET_FEATURE transfers, as there is no way to do that yet. Honestly, the alternate mode seems more like a workaround, as far as I can tell, and not an ideal implementation. I'm not sure when it was added, but as I was originally authoring this against 5.13 and didn't see it until I went to rebase onto master, it can't have been that long ago. So if it breaks any software (which I don't believe it does), it would only affect very new software.
>>>>>>
>>>>>> As I alluded to, I'd thought about perhaps adding a second node per interface so one would act as INTERRUPT transfers and the other as SET/GET_FEATURE transfers, but I already had this code half written and wanted to get feedback first, especially since what I have now works (although it's not well-tested after rebasing).    
>>>>>
>>>>> I'm a little confused here about what you call an alternative mode.
>>>>> Are we talking about use_out_ep=1 (default behavior with INTERRUPT)
>>>>> or use_out_ep=0 (SETUP/SET_REPORT)? The last mode was added by me
>>>>> to ensure strict compatibility with Apple UEFI and strange BIOS,
>>>>> and this mode is actually actively used. It is important to me
>>>>> that it is not broken, but unfortunately I cannot test your patch
>>>>> on my kernel, as I temporarily do not have access to testing equipment.    
>>>>
>>>> use_out_ep=0 is the alternate mode I was talking about. It didn't exist in 5.13, so as I said I wasn't aware of it until I rebased. As the device I'm using is still stuck on that old kernel (for now) and I don't know if I have any USB gadget capable devices on new kernels, I was unable to test it, and would very much like to make sure it doesn't regress before a patch is merged. I wasn't intending to break it, but I figured I'd get feedback I'd need to change before this was merged so if you could test it to ensure it doesn't regress any behavior that would be much appreciated and help me out. I will probably wait until then before submitting a v2.  
>>>
>>> I will get access to the USB analyzer and test environment in about a month,
>>> if that suits you. You can write directly to my email after a month,
>>> I will help you with testing.  
>>
>> I wanted to check the status of this. We're in the middle of rebasing onto a newer kernel, so I might be able to test it myself soon. What software are you using?
> 
> I'm using PiKVM on Raspberry Pi 4 (https://github.com/pikvm/pikvm) but for generic testing you need to make
> the usual ways of using gadget work in both modes: https://www.isticktoit.net/?p=1383
> Unfortunately, I'm still away and I can't use my equipment :/

I finally got a chance to test on 6.0, and I can confirm that it doesn't break use_out_ep=1 style read/write. You mention PiKVM, which I can test (I have a Pi 4 and bought the PiKVM v3 kit when it was on Kickstarter), but given that the lowest version of Linux it supports predates use_out_ep=0 style, I wasn't sure if that was sufficient to make sure I didn't break it. I'll prepare a v2 as soon as I can confirm how to test use_out_ep=0 style.
