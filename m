Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E840B552FF8
	for <lists+linux-usb@lfdr.de>; Tue, 21 Jun 2022 12:44:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242697AbiFUKor (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 Jun 2022 06:44:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233059AbiFUKoq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 21 Jun 2022 06:44:46 -0400
Received: from mail.gtsys.com.hk (tunnel316222-pt.tunnel.tserv25.sin1.ipv6.he.net [IPv6:2001:470:35:5f1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3F33167F9
        for <linux-usb@vger.kernel.org>; Tue, 21 Jun 2022 03:44:44 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by mail.gtsys.com.hk (Postfix) with ESMTP id 5F72F22A031F;
        Tue, 21 Jun 2022 18:44:42 +0800 (HKT)
X-Virus-Scanned: Debian amavisd-new at gtsys.com.hk
Received: from mail.gtsys.com.hk ([127.0.0.1])
        by localhost (mail.gtsys.com.hk [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id ByjaDvIWOk5n; Tue, 21 Jun 2022 18:44:42 +0800 (HKT)
Received: from s01.gtsys.com.hk (unknown [10.128.4.2])
        by mail.gtsys.com.hk (Postfix) with ESMTP id 404ED229C1B1;
        Tue, 21 Jun 2022 18:44:42 +0800 (HKT)
Received: from [10.128.1.32] (unknown [124.217.189.234])
        by s01.gtsys.com.hk (Postfix) with ESMTPSA id E2075C01B49;
        Tue, 21 Jun 2022 18:44:41 +0800 (HKT)
Subject: Re: serial: usb: cdc-acm: OMRON B5L ToF, device probe failed
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
From:   Chris Ruehl <chris.ruehl@gtsys.com.hk>
Message-ID: <dcd72fdd-2280-b876-053e-887429ad82e8@gtsys.com.hk>
Date:   Tue, 21 Jun 2022 18:44:40 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <40395457-0927-c169-7d9f-47d1912e2c39@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Oliver,

Thanks for the patch, I will apply it and give a feedback.

-chris

On 21/6/2022 6:09 pm, Oliver Neukum wrote:
>
> On 21.06.22 02:38, michael.lee@omron.com wrote:
>> Dear Chris,
>>
>> The below is the reply from Japan.
>>
>> Dose they do the below commnad after connect B5L to USB?
>>
>> sudo modprobe usbserial vendor=0x0590 product=0x00ca
>> sudo chmod o+wr /dev/ttyUSB0
>>
>> For linux environment ,this commnad is needed to connect B5L to USB.
>> We preapre the below sh file with c++ sample codes.
>> connect_tof.sh
>> https://github.com/omron-devhub/b5l_TOFsensor_Sample_cpp
>>
> Hi,
>
> this is not nice. But in any case this thing is not an ACM
> device. This patch should remove it from the driver it is
> abusing to where it belongs. Could you please test it?
>
> 	Regards
> 		Oliver

-- 
GTSYS Limited RFID Technology
9/F, Unit E, R07, Kwai Shing Industrial Building Phase 2,
42-46 Tai Lin Pai Road, Kwai Chung, N.T., Hong Kong
Tel (852) 9079 9521

Disclaimer: https://www.gtsys.com.hk/email/classified.html

