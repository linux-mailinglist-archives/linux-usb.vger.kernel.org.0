Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1FE25AA86D
	for <lists+linux-usb@lfdr.de>; Fri,  2 Sep 2022 09:01:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234650AbiIBHBP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 2 Sep 2022 03:01:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234495AbiIBHBN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 2 Sep 2022 03:01:13 -0400
X-Greylist: delayed 1822 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 02 Sep 2022 00:01:09 PDT
Received: from mail-m964.mail.126.com (mail-m964.mail.126.com [123.126.96.4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A648EAC253
        for <linux-usb@vger.kernel.org>; Fri,  2 Sep 2022 00:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=Message-ID:Date:From:MIME-Version:Subject; bh=NxpLC
        jVaDr0bSOlI0jjJCyEdsZruRdWOhxTjNts6PDw=; b=lDcEy69LUJdfv0f+fFGC+
        UOyQ2ggVELPQ+k7FpbrTKdKZQAV2PuPqminr/E8vftqdnKIFHFsvaYaJnO2pLztG
        U6j+spP1kiyiaKMg++tTMCaYxGKhY8XpwGtwnO4aJkcefnUsq61TXEVkQcmvgTKe
        M0l18XWOsx9vTbItyYIMPE=
Received: from localhost.localdomain (unknown [112.64.161.44])
        by smtp9 (Coremail) with SMTP id NeRpCgBHbxYFoxFjh+0iAw--.47228S2;
        Fri, 02 Sep 2022 14:30:30 +0800 (CST)
Message-ID: <6311A323.40100@126.com>
Date:   Fri, 02 Sep 2022 14:30:59 +0800
From:   nana <zhongling0719@126.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To:     gregkh <gregkh@linuxfoundation.org>
CC:     zenghongling <zenghongling@kylinos.cn>,
        stern <stern@rowland.harvard.edu>,
        linux-usb <linux-usb@vger.kernel.org>,
        usb-storage <usb-storage@lists.one-eyed-alien.net>
Subject: Re: [PATCH v4] uas: add no-uas quirk for Thinkplus and Hiksemi usb-storage
References: <1662015653-12976-1-git-send-email-zenghongling@kylinos.cn> <YxBvNEn0jEEd0lXV@kroah.com> <2022090120371974113815@126.com> <YxCtyOUkRlIqcC4d@kroah.com> <2022090121570194160929@126.com> <YxDCdQ885wdyr8wG@kroah.com>
In-Reply-To: <YxDCdQ885wdyr8wG@kroah.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: NeRpCgBHbxYFoxFjh+0iAw--.47228S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Cr17uw4xXw18WFWUJry5Arb_yoW8Gr4xpF
        92q3Z3GF4DtF18JFsrAr1Iva18X395tr929ryrWw42ya1aqF90vrZ2g398u3W5GrykGw4U
        Krn8Jry8Gw4DXaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UGjgxUUUUU=
X-Originating-IP: [112.64.161.44]
X-CM-SenderInfo: x2kr0wpolqwiqxrzqiyswou0bp/1tbiYAZw0FpEI2ddwQAAsA
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Sorry,replay again

a)These disks have a broken uas implementation, the tag field of the 
status iu-s is not set properly,
so we need to fall-back to usb-storage for these.

b).I found this patch . The causes of errors are similar.
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=v4.9.326&id=3ba5d3a2cf40c4ebdc1f702af3b5dea405a6a11e

c) not to express clearly, the driver cause hang on by copy big files or 
stress read/write.


在 2022年09月01日 22:32, gregkh 写道:
> A: http://en.wikipedia.org/wiki/Top_post
> Q: Were do I find info about this thing called top-posting?
> A: Because it messes up the order in which people normally read text.
> Q: Why is top-posting such a bad thing?
> A: Top-posting.
> Q: What is the most annoying thing in e-mail?
>
> A: No.
> Q: Should I include quotations after my reply?
>
> http://daringfireball.net/2007/07/on_top
>
> On Thu, Sep 01, 2022 at 09:58:03PM +0800, zhongling0719@126.com wrote:
>> Some UASP capable USB-to-SATA bridge controllers are not compatible,this problem has always existed.
> What problem is this exactly?  Why is this failing on only Linux?
>
>> you can refer to other auther submit the similar patch.
> What other author and other patch?
>
>>   this patch is fixed no speed,not slow speed.
> I do not understand, sorry.
>
> thanks,
>
> greg k-h

