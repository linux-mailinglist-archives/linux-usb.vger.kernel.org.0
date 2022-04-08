Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 478734F98F7
	for <lists+linux-usb@lfdr.de>; Fri,  8 Apr 2022 17:04:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236526AbiDHPGw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 8 Apr 2022 11:06:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237414AbiDHPGs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 8 Apr 2022 11:06:48 -0400
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com [IPv6:2607:f8b0:4864:20::d35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C56C74664F
        for <linux-usb@vger.kernel.org>; Fri,  8 Apr 2022 08:04:43 -0700 (PDT)
Received: by mail-io1-xd35.google.com with SMTP id p135so5013860iod.2
        for <linux-usb@vger.kernel.org>; Fri, 08 Apr 2022 08:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=HQx5j9inHenkxq2fsrHfyZmOpeUYPmAgtqmMO5rRDBQ=;
        b=AyXzxyVAlVUzz8O+mXXOhJEMeMWCB+gvj1zR332nyBVOyNr9dyUGjQ5pwiNVdmrAhc
         2bcQhjUW/e70zhziiZhNL9ABDyOc10WiTy6tkJL1mYNrsLmUxs7Nnag3i/iRG+96uZd1
         pwzBCHw+zjYEu+vEtMZsWMyrUFuZ5iIsHzTxI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=HQx5j9inHenkxq2fsrHfyZmOpeUYPmAgtqmMO5rRDBQ=;
        b=lQtAVAFLpT4y1byUYTP+jGNZfft4iIeh85VW7xDyFjn4GVSnEsYd9XyS73VWRF1u74
         kraNlI0z7hw4uUBkgWnDpOEqvFOtbsCiLOWH+YwO/gbwPo5pyzSvwrWH7+jaQA15TlIe
         wnhvgGqIn0krU9M54zBOh5vcHyCb2s1dB5dslnZFoJCmqrm/0yGEYIeUDQVtquyB1R3d
         pwxMxdgj5Ng6gxISfTcPcEo7geCCjh5jGuWNE7gPV5uCSKmY6Oc6ESp0TwQ1+55vWno7
         bqyXXTzg5Rcg8uiCpY6AHjKAqnVWHPbp16KK7ns1WcUBNgWi+Fs7Qwxapykb45068xSm
         p/tg==
X-Gm-Message-State: AOAM5323uYeEaL2MKJNgoPvLjBs1qW4UQno+zlMBvPMOC0k+vtN4il1v
        w6b0xbqmdTJDEdxKmClO2c7wsw==
X-Google-Smtp-Source: ABdhPJwLE8eabeRgR4+nqapeuALkUQAjNX4n8w0ZEPjCnxStqPSDDaWWbkowClIt6Cn8yAUUB7iGCA==
X-Received: by 2002:a05:6638:268c:b0:326:1f:81c0 with SMTP id o12-20020a056638268c00b00326001f81c0mr1060386jat.57.1649430282993;
        Fri, 08 Apr 2022 08:04:42 -0700 (PDT)
Received: from [192.168.1.128] ([71.205.29.0])
        by smtp.gmail.com with ESMTPSA id w2-20020a92c882000000b002c81bffee08sm13615889ilo.55.2022.04.08.08.04.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Apr 2022 08:04:42 -0700 (PDT)
Subject: Re: [PATCH v2] usb: usbip: fix a refcount leak in stub_probe()
To:     Hangyu Hua <hbh25y@gmail.com>, valentina.manea.m@gmail.com,
        shuah@kernel.org, gregkh@linuxfoundation.org, khoroshilov@ispras.ru
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20220407022204.10730-1-hbh25y@gmail.com>
 <7c584e2d-1c23-3df9-7e4e-c4d9a9014224@linuxfoundation.org>
 <d40cb8cf-a92d-3f87-3af1-0422f8d8264f@gmail.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <91089407-cc21-ba05-5346-4f546cca7555@linuxfoundation.org>
Date:   Fri, 8 Apr 2022 09:04:42 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <d40cb8cf-a92d-3f87-3af1-0422f8d8264f@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 4/7/22 7:59 PM, Hangyu Hua wrote:
> Hi Shuah,
> 
> I find this by code review. Do i really need to add this to commit log? This look like a little weird.
> 

Great. Good find.

It is important to understand how the problem is found. Please add it
the change log. We usually expect dmesg or such info. that revealed
refcount leak, since this one is found during code review, we would
like to see that information the commit log.

Also please remember to avoid top posting.

> 
> On 2022/4/8 00:31, Shuah Khan wrote:
>> On 4/6/22 8:22 PM, Hangyu Hua wrote:
>>> usb_get_dev() is called in stub_device_alloc(). When stub_probe() fails
>>> after that, usb_put_dev() needs to be called to release the reference.
>>>
>>> Fix this by moving usb_put_dev() to sdev_free error path handling.
>>>
>>> Fixes: 3ff67445750a ("usbip: fix error handling in stub_probe()")
>>> Signed-off-by: Hangyu Hua <hbh25y@gmail.com>
>>> Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>
>>> ---
>>>
>>> v2: add more description of this patch.
>>
>> Still missing details on how this problem was found. Please add them
>> to the commit log.
>>

thanks,
-- Shuah

