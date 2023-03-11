Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 755656B5864
	for <lists+linux-usb@lfdr.de>; Sat, 11 Mar 2023 06:09:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229589AbjCKFJi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 11 Mar 2023 00:09:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229530AbjCKFJh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 11 Mar 2023 00:09:37 -0500
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFE5412B030
        for <linux-usb@vger.kernel.org>; Fri, 10 Mar 2023 21:09:35 -0800 (PST)
Received: by mail-qt1-x836.google.com with SMTP id h19so8091096qtk.7
        for <linux-usb@vger.kernel.org>; Fri, 10 Mar 2023 21:09:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678511375;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5JFbdd73AQ+d3Qv1qP/L0pzv1gzZmW56o0TeN5MvTN8=;
        b=RYUTnqEM7SdXHRI7iQY2maXjn9fW0qXKn+XHh7ma5s3Uw0EI19kMehXmOI7MqKelaP
         Ou6NjbUwdN+iocHfYWomHzWGMhMZ3elmj1pui/T0ad0hZZRwDqeIVDFTJ7LPQatcK0CZ
         G7Fhv+G2MAtw7M9/NMJJC8p7pVyMQUGgRBGPGN3HpYcsPkkOFQBh2Db7rwR+QnnuytuT
         P+IslFgVL+U1qnAm15S3MpZT7INPYMux/sfFKHodKP3gkbv4nThjL0iCB4Go+cy8vXFX
         PYl+JzSfU3SZOXDpQNKLhm5Jd1ztddtbw6/LRg7WXyucoU7ejjnQGo/IK4pn9lMqw3yQ
         sH7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678511375;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5JFbdd73AQ+d3Qv1qP/L0pzv1gzZmW56o0TeN5MvTN8=;
        b=TWEdCSsJiwKBrT+eifLBLiXSzOJSaEj6ovHrR41E0DjbK3vr5Y9SryU8wy83JqsGDO
         F/XuJOGxIBo0NbfDUdkxWAxAegnc6p8hZdaGR0/l1HLryAfFgg03/89X3mB0SYJAFTHw
         1PmdPiUxDeMzOFrmRd/sxFbdXcvz8/62MRwh9Y+nd7h0p0VtX6MVqUa7NUCDsP4K+rWs
         p3ZCHTT2U7zoQjkKtrNTOuow4Pw1FyXIEFdOVVz/KDixAsyxwwE+sjmBI4UBLgeLdeKx
         tgEaEta2Z5nzY2cpyGTTtjJmpjDGq5TmbKI7yOF06FznIQ5gJeGlOW14zNyNB5JFSdVM
         +fIA==
X-Gm-Message-State: AO0yUKW3zdptLzTfy2yhLGdGIlMbGTtpbscONLvRaauVRKewhlIQvemq
        nCKFNGXxF4DYttQyDLyIdXVuWtf8YbM=
X-Google-Smtp-Source: AK7set/xcbY1Hd40aEvuItfA45BgtkLo/6ox8BvYNVnv+OON4Btky10DdgQBfxnUOWsl9getuMjXtw==
X-Received: by 2002:a05:622a:508:b0:3bf:bbd3:1f11 with SMTP id l8-20020a05622a050800b003bfbbd31f11mr45134308qtx.21.1678511374846;
        Fri, 10 Mar 2023 21:09:34 -0800 (PST)
Received: from [192.168.1.198] (c-68-42-142-238.hsd1.mi.comcast.net. [68.42.142.238])
        by smtp.gmail.com with ESMTPSA id n17-20020a05620a223100b00706b09b16fasm1198290qkh.11.2023.03.10.21.09.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Mar 2023 21:09:34 -0800 (PST)
Message-ID: <64ac46a0-bf58-ce87-86f3-bcfe559f6817@gmail.com>
Date:   Sat, 11 Mar 2023 00:09:33 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: Question about f_uac1 gadget
To:     Ruslan Bilovol <ruslan.bilovol@gmail.com>
Cc:     linux-usb@vger.kernel.org
References: <4772c6be-7918-9ab0-3dd5-983b293cf89f@gmail.com>
 <CAB=otbTdBPwrot9aigxbOH+GFU=gFgEpr+io7cEv-5P10BSK9w@mail.gmail.com>
 <62cf5f1a-c5a2-2108-5326-ae2b0c8b2264@gmail.com>
 <CAB=otbQ+2d4EOg=deUUbwwAF7aJcPuMYyFSLKnfO_7-JurO-fg@mail.gmail.com>
Content-Language: en-US
From:   Noah Causin <n0manletter@gmail.com>
In-Reply-To: <CAB=otbQ+2d4EOg=deUUbwwAF7aJcPuMYyFSLKnfO_7-JurO-fg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The laptop has kernel 6.1.14 (Fedora 37)

I looked into the error message and found a patch description saying 
that the error: (cannot submit urb 0, error -90: internal error) can 
happen when a audio device's channel number does not match its data 
endpoint, leading to failure at the host driver.

https://github.com/DerRomtester/android_kernel_oneplus_msm8974/commit/2ef9cf0c9181e9472fa0be7885541e91189ecd5d

It seems like the f_uac1 gadget might not be syncing the channel number 
value with the data endpoint.

Noah

On 3/10/23 01:51, Ruslan Bilovol wrote:
> On Wed, Mar 8, 2023 at 11:24 PM Noah Causin <n0manletter@gmail.com> wrote:
>>
>> Hi Ruslan,
>>
>> I can't seem to get the f_uac1 to work with more than 2 channels. I'm
>> able to setup f_uac2 with 8 channels.
>>
>> I've tried a 5.1 and 7.1 setup (c_chmask=63 or 255, c_srate=44100,
>> c_ssize=2) but I get a urb 0 error on the connected Linux laptop and the
>> gnome sound-test freezes when testing a channel, no errors on the gadget
>> device. My usb controller is a DWC3 on a RockPro64 board.
>>
>> usb 3-2: USB disconnect, device number 9
>> usb 3-2: new high-speed USB device number 10 using xhci_hcd
>> usb 3-2: New USB device found, idVendor=1d6b, idProduct=0104, bcdDevice=
>> 1.00
>> usb 3-2: New USB device strings: Mfr=1, Product=2, SerialNumber=3
>> usb 3-2: Product: audioproduct
>> usb 3-2: Manufacturer: audiomanufacturer
>> usb 3-2: SerialNumber: audioserial
>> usb 3-2: cannot submit urb 0, error -90: internal error
> 
> Hmmm.. I also can reproduce this issue, it seems that's some bug in the
> host USB audio driver. At least I see that it tries to send packets with size
> bigger than the endpoint's max packet size.
> 
> I reproduced it on my Debian laptop with (kernel v6.1) and can't reproduce
> on older Ubuntu with kernel v5.4.
> 
> BTW Noah what is the kernel version on your laptop where you see
> this issue?
> 
> Thanks,
> Ruslan
