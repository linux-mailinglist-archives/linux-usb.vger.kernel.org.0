Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E7B2642A24
	for <lists+linux-usb@lfdr.de>; Mon,  5 Dec 2022 15:13:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230110AbiLEONw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 5 Dec 2022 09:13:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229891AbiLEONv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 5 Dec 2022 09:13:51 -0500
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AE53DF09
        for <linux-usb@vger.kernel.org>; Mon,  5 Dec 2022 06:13:50 -0800 (PST)
Received: from [192.168.0.192] (unknown [194.146.248.75])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: andrzej.p)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 23F2666015ED;
        Mon,  5 Dec 2022 14:13:49 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1670249629;
        bh=zp7DG5UJrird9J6DPA51606zkqnrXw1r0rIsx5Jxwq0=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=DfvS1tkxPLE2xY9cO29Bu776NOKATqXUDV/GnTdivlpL9ZJCW1VVDC4HtnhP+U6Hk
         p+TBLILoaoKiOU8C+gF9GIrugySQRepJS+jwKg5zidR4NYv+JgbLfS0FItuCc5zzIa
         xhJr36tqyYj5osuMudk+Ym6ksAI/WH4/tkFLKfiWIpaEQZimsXsFE6McQQuKM5GnoL
         HbfkNj+Qya8NFFO08altjSRNOR85V37JBtTQtvHImxY4ZuCv01QjQwAbDpH8UlNDzU
         r2T13OECFBjYT79UBxLabArpGpdz3CqLSn5lA+APu58ucxJDXYX7jL2j94vXFR5jKf
         VpCwwL4kQWNCw==
Message-ID: <5a44f991-fd77-09bf-658b-398d5545297a@collabora.com>
Date:   Mon, 5 Dec 2022 15:13:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC] Unify messaging in gadget functions
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
References: <266f2df3-75cf-5dcf-1e59-8a8da5dd001e@collabora.com>
 <Y43iISitEERfteOt@kroah.com>
Content-Language: en-US
From:   Andrzej Pietrasiewicz <andrzej.p@collabora.com>
In-Reply-To: <Y43iISitEERfteOt@kroah.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

W dniu 5.12.2022 o 13:20, Greg KH pisze:
> On Mon, Dec 05, 2022 at 01:14:21PM +0100, Andrzej Pietrasiewicz wrote:
>> Hi All,
>>
>> include/linux/usb/composite.h contains:
>>
>> /* messaging utils */
>> #define DBG(d, fmt, args...) \
>> 	dev_dbg(&(d)->gadget->dev , fmt , ## args)
>> #define VDBG(d, fmt, args...) \
>> 	dev_vdbg(&(d)->gadget->dev , fmt , ## args)
>> #define ERROR(d, fmt, args...) \
>> 	dev_err(&(d)->gadget->dev , fmt , ## args)
>> #define WARNING(d, fmt, args...) \
>> 	dev_warn(&(d)->gadget->dev , fmt , ## args)
>> #define INFO(d, fmt, args...) \
>> 	dev_info(&(d)->gadget->dev , fmt , ## args)
>>
>> Gadget functions do use these, but not consistently:

<snip>

>> Questions:
>>
>> 1) Should we make them use the messaging utils consitently?
> 
> Yes, converting to use the dev_*() calls is good to do.

Heh, I sent this RFC to prevent learning the hard way (by actually creating
incorrect patches), that we want to be consistent, but using dev_*() calls
rather than composite.h utils. That's ok.

Which brings an interesting question: should the ultimate goal be to remove the
messaging utils altogether from composite.h? It _seems_ their purpose is mainly
to wrap dereferencing a pointer two pointers away: &(d)->gadget->dev to make
invocations shorter. With the default of 100 columns in checkpatch nowadays it
is maybe a less important goal? Or maybe we should prevent such long
dereferencing by introducing helper variables just like below in
u_audio_start_capture()?

> 
>> 2) How consistent should we become, given that some functions in the relevant
>> files, for example u_audio_start_capture(), sometimes (but not always) have:
>>
>> 	struct usb_gadget *gadget = audio_dev->gadget;
>> 	struct device *dev = &gadget->dev;
>>
>> and then they use dev_dbg(dev, ....);
> 
> dev_dbg() is fine, what's worng with that?

Nothing? If making messaging consistent meant using the utils from composite.h,
then in this particular case we would unnecessarily go through & -> -> each
time, which is described in the following paragraph, which is avoided by using
the local variable "dev". Given that the preferred way to unify messaging
is using dev_*() calls, my question 2 becomes irrelevant.

Andrzej

> 
>> If we were to use DBG(audio_dev, ....); instead, then we effectively get
>> dev_dbg(&audio_dev->gadget->dev, ....); after macro expansion, which means two
>> pointer dereferences and taking an address of the result (I'm wondering how
>> smart the compiler can get if such a pattern repeats several times in a
>> function).
> 
> The compiler can get very smart, but this isn't really an issue overall
> as USB drivers are very slow due to slow hardware.
> 
>> 3) Maybe the amount of various messages is too large in the first place
>> and should be reduced before any unifications?
> 
> Possibly, many might be able to be removed, look and see!
