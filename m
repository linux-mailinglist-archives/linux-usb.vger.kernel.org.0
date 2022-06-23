Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7949A5575FE
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jun 2022 10:55:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230375AbiFWIzW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Jun 2022 04:55:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230377AbiFWIzU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 23 Jun 2022 04:55:20 -0400
Received: from mail.gtsys.com.hk (tunnel316222-pt.tunnel.tserv25.sin1.ipv6.he.net [IPv6:2001:470:35:5f1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E906D3584F
        for <linux-usb@vger.kernel.org>; Thu, 23 Jun 2022 01:55:18 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by mail.gtsys.com.hk (Postfix) with ESMTP id 0E76522A1D8C;
        Thu, 23 Jun 2022 16:55:17 +0800 (HKT)
X-Virus-Scanned: Debian amavisd-new at gtsys.com.hk
Received: from mail.gtsys.com.hk ([127.0.0.1])
        by localhost (mail.gtsys.com.hk [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 79tsTAa_0P1P; Thu, 23 Jun 2022 16:55:16 +0800 (HKT)
Received: from s01.gtsys.com.hk (unknown [10.128.4.2])
        by mail.gtsys.com.hk (Postfix) with ESMTP id DED6722A0306;
        Thu, 23 Jun 2022 16:55:16 +0800 (HKT)
Received: from [10.128.1.32] (unknown [182.239.122.235])
        by s01.gtsys.com.hk (Postfix) with ESMTPSA id A1D15C03CEC;
        Thu, 23 Jun 2022 16:55:16 +0800 (HKT)
Subject: Re: serial: usb: cdc-acm: OMRON B5L ToF, device probe failed
From:   Chris Ruehl <chris.ruehl@gtsys.com.hk>
To:     Oliver Neukum <oneukum@suse.com>,
        "michael.lee@omron.com" <michael.lee@omron.com>,
        Lars Melin <larsm17@gmail.com>,
        USB list <linux-usb@vger.kernel.org>
References: <85ebf554-effd-c89e-6eb8-c149442b931c@gtsys.com.hk>
 <fc9986a6-0b11-d949-2196-1ad35d3f4d98@gtsys.com.hk>
 <1af7ff05-8558-9162-a0cd-ac140ddaf2e1@gmail.com>
 <cbcc2071-5b56-025e-cae6-5af0210e2363@gtsys.com.hk>
 <OSZP286MB1776CCBCBFE38B25C7DB9978E1B39@OSZP286MB1776.JPNP286.PROD.OUTLOOK.COM>
 <40395457-0927-c169-7d9f-47d1912e2c39@suse.com>
 <f3aaf9e8-07c7-2c50-48c3-723c51f9445a@gtsys.com.hk>
 <dc9f9c31-b72d-0895-544a-13764538d991@suse.com>
 <3194ea30-34da-3d34-6d4a-08dc7c8d683a@gtsys.com.hk>
Message-ID: <4f4977bf-6096-592c-9c06-44aacb82ccd7@gtsys.com.hk>
Date:   Thu, 23 Jun 2022 16:55:14 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <3194ea30-34da-3d34-6d4a-08dc7c8d683a@gtsys.com.hk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 23/6/2022 4:44 pm, Chris Ruehl wrote:
>
> On 23/6/2022 4:28 pm, Oliver Neukum wrote:
>>
>> On 23.06.22 04:26, Chris Ruehl wrote:
>>
>> Hi,
>>
>>> thanks for that patch, I can confirm it works for me. I have the ToF up
>>> and running at B921600 8N1.
>>> But I would wait, not apply to the kernel, because I noticed that the
>>> team from OMRON is working
>>> on the CDC implantation.
>>> So this patch is only a workaround for the moment.
>>>
>> if you absolutely want it to be driven from CDC-ACM, try this
>> new attached patch.
>> In your original patch you used NO_UNION_NORMAL. That will allow
>> a device to work without a union descriptor but with the normal
>> two interfaces. This devices has what in terms of ACM is a collapsed
>> interface without a union descriptor.
>> The driver provides for that but then it checks for the exact
>> number of required endpoints, which is three. Your device has
>> four endpoints.
>> The patch ignores a fourth endpoint.
>>
>>     Regards
>>         Oliver
>
> Oliver,
>
> I give this patch a try and report how it works.
>
> Thanks
> Chris
>
Apply the patch ,
still no /dev/ttyACM0 comes up.

Thanks for your effort.
Chris
