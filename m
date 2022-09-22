Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B5E1C5E5D3E
	for <lists+linux-usb@lfdr.de>; Thu, 22 Sep 2022 10:17:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229871AbiIVIRd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 22 Sep 2022 04:17:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229783AbiIVIRb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 22 Sep 2022 04:17:31 -0400
Received: from mail-m965.mail.126.com (mail-m965.mail.126.com [123.126.96.5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 7552BB2D94
        for <linux-usb@vger.kernel.org>; Thu, 22 Sep 2022 01:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=Subject:From:Message-ID:Date:MIME-Version; bh=aRf3X
        aBI1jvjfdcwrh10B93n0fQglwRTb5QMTnPwdmo=; b=DsUgft0NOo4ElYVutrHn7
        XgNaHzjPr165CRyra/5oMZIeAiv2ZHN2SjEgwQY0CqPkOayY7K/pRlE9MLv5fz2z
        wLZz9Z1T5Fxa9pHtTxbWbgRMBGOctvXTs+skqZjwL0ZRDTzo5rMgA1EZaASOpFto
        uPYXvfilg2GJhM42+cMQvQ=
Received: from [172.25.120.16] (unknown [112.64.161.44])
        by smtp10 (Coremail) with SMTP id NuRpCgAnl+8PGixjgrJzCQ--.43544S2;
        Thu, 22 Sep 2022 16:17:20 +0800 (CST)
Subject: Re: [PATCH v6 2/3] usb-storage: Add Hiksemi USB3-FW to IGNORE_UAS
To:     Alan Stern <stern@rowland.harvard.edu>
References: <1663210188-5485-1-git-send-email-zenghongling@kylinos.cn>
 <YyN9u7EaXIKgLUmO@rowland.harvard.edu>
 <2fcdca5a-2deb-66ca-fd1d-c3ba719b19af@126.com>
 <YySwhOccJFjfx/Tu@rowland.harvard.edu>
Cc:     gregkh@linuxfoundation.org,
        USB mailing list <linux-usb@vger.kernel.org>
From:   nana <zhongling0719@126.com>
Message-ID: <fbeffee7-3ac5-4798-14b0-724e0ed01947@126.com>
Date:   Thu, 22 Sep 2022 16:17:41 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <YySwhOccJFjfx/Tu@rowland.harvard.edu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: NuRpCgAnl+8PGixjgrJzCQ--.43544S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Kw1rZFWfWF1kKw13KFW5GFg_yoW8Gw4xpF
        Z3tasI9F4DtrySvF47t34IgF1jq3s5t3yrJwsrtr18WFZ0vr95KF1agr1xu398Wa43Jr1j
        y3y8tw15WrWDtFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UBBTOUUUUU=
X-Originating-IP: [112.64.161.44]
X-CM-SenderInfo: x2kr0wpolqwiqxrzqiyswou0bp/1tbiYBqA0FpEJABYRwABsO
X-Spam-Status: No, score=-3.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi

    >Is there any way for you to tell which protocol Windows uses

(usb-storage or UAS)?

I checked that the device manager was not load the uas driver, And this 
lower write speed for win10 doesn't seem to use uas protocol for this 
device.

    if you have questions for [PATCH v7 3/3], I can continue to 
investigate thinkplus(0x17ef, 0x3899) and first submit patch v7 1/3 and 
patch v7 2/3.
    you have anything unclear ,can ask me or advise me？

Thanks!

在 2022年09月17日 01:21, Alan Stern 写道:
> On Fri, Sep 16, 2022 at 02:55:55PM +0800, nana wrote:
>> Hi:
>>
>>      ok,I have upated to v7.
>>
>>      Sorry , The information in the previous answers about thinkplus(0x17ef,
>> 0x3899) comes from the tester, which is somewhat confused.
>>
>>      I just get the device from other department and the detailed test data
>> are as follows:
>>
>>
>> Test the thinkplus(0x17ef, 0x3899) speed by gnome-disk-utility tool.
>>
>> linux(load uas)：                 linux(not load uas):
>>
>> read： 394.2 MB/s                read:  382.2 MB/s
>>
>>
>> write:  377.4 MB/s                 write:  347.8 MB/s
>>
>>
>> ---------------------
>>
>> win10(lower than linux,but more stable):
>>
>> read : 388.1 MB/s
>>
>> write: 320   MB/s
>>
>>
>> The main performance differences is write speed.but load uas can cause error
>> after long run, not good compatible with uas, So two bosses can
>> consideration for the third patch is it feasible.
> Is there any way for you to tell which protocol Windows uses
> (usb-storage or UAS)?
>
> Alan Stern
>

