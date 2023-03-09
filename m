Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 024F56B1A64
	for <lists+linux-usb@lfdr.de>; Thu,  9 Mar 2023 05:25:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229904AbjCIEZP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 Mar 2023 23:25:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230007AbjCIEYy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 8 Mar 2023 23:24:54 -0500
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com [IPv6:2607:f8b0:4864:20::829])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 669B28C5BB
        for <linux-usb@vger.kernel.org>; Wed,  8 Mar 2023 20:24:52 -0800 (PST)
Received: by mail-qt1-x829.google.com with SMTP id cf14so782117qtb.10
        for <linux-usb@vger.kernel.org>; Wed, 08 Mar 2023 20:24:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678335891;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fXdmGf6FlEg3kDuhpY71Dxp0y5yrw1Cmmla9QTkThOw=;
        b=lwUKH07cUYKZVvjEez2nxPJYx7nnEp/WFUrU9gKBrc4rkoqgKJkSiwIIZbIO6imnJR
         vIgXSIzGmhPNT1OQLy8A0TqPnZshQjhb2Tn1SLVHKFRUR/vPzXP6uUjRQkjIFKNyuvLr
         Ivk3dK4EUAZYYACq3jAOOtKcR+dldW6PW2INAgg9nZpN5RmJuWvFpxfSJIsA+lzuzHpz
         czQTJVqVUNs3tf/Vy2Zdac1ZT8hv5EsrKNKAiZyRAeH27KVOqM7SctwkJ9HG1PoeTXec
         BF4EuWS0+7131LJqursJhbY9AYDr/2lgcdFSovxx/rE4Y9e8EzTu2OjfzG4vJmtCyaFT
         9ShA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678335891;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fXdmGf6FlEg3kDuhpY71Dxp0y5yrw1Cmmla9QTkThOw=;
        b=vFvkoQYiXZd3zr6aT25nZRZUJmLp8rWpkuoiziedyfp3wX+pL6/il9xMRy+AxnCcfa
         Xu70EAt91QdOgu5pes8xvrBlMfduryaxfuHO/rJj/uIxeYunNddPTRL50oo/HN13l7pL
         W78XkcK6XWds4mx9fP0mLTJ6zlTp9wmQ0mib/R0sV74es/31J8ZHP5YDuV5PeoFIV247
         7NzdgjJ00oYzPXXeu+otkWUf8U7pO/YAvtBWmg3A1Heod5NdPkkBTfMbRQUCRqrunzew
         LQShQD9d25242vTz7g4WJVy82heqLFQ31W3HYlcXwb3WQnirM/600p1qf9Clmi7wDYpx
         I82A==
X-Gm-Message-State: AO0yUKUX8rs+VSmOnZWinVdDWD231zfLPd9nYTMrhkd00ejflE3YyKP3
        nez8PCQOo+HQOIvTtwydV6bUaYXEf94=
X-Google-Smtp-Source: AK7set8hCMCqNczV4Od+2l4XgSvxPZpHegE+xHG4wQfbBy2XKWA9Qq1JrdovIHRxVbixlDYRrsgSgw==
X-Received: by 2002:a05:622a:60c:b0:3bf:c5ab:a0db with SMTP id z12-20020a05622a060c00b003bfc5aba0dbmr38129584qta.41.1678335891496;
        Wed, 08 Mar 2023 20:24:51 -0800 (PST)
Received: from [192.168.1.198] (c-68-42-142-238.hsd1.mi.comcast.net. [68.42.142.238])
        by smtp.gmail.com with ESMTPSA id d25-20020ac84e39000000b003995f6513b9sm12633710qtw.95.2023.03.08.20.24.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Mar 2023 20:24:51 -0800 (PST)
Message-ID: <62cf5f1a-c5a2-2108-5326-ae2b0c8b2264@gmail.com>
Date:   Wed, 8 Mar 2023 23:24:50 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: Question about f_uac1 gadget
To:     Ruslan Bilovol <ruslan.bilovol@gmail.com>
Cc:     linux-usb@vger.kernel.org
References: <4772c6be-7918-9ab0-3dd5-983b293cf89f@gmail.com>
 <CAB=otbTdBPwrot9aigxbOH+GFU=gFgEpr+io7cEv-5P10BSK9w@mail.gmail.com>
Content-Language: en-US
From:   Noah Causin <n0manletter@gmail.com>
In-Reply-To: <CAB=otbTdBPwrot9aigxbOH+GFU=gFgEpr+io7cEv-5P10BSK9w@mail.gmail.com>
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

Hi Ruslan,

I can't seem to get the f_uac1 to work with more than 2 channels. I'm 
able to setup f_uac2 with 8 channels.

I've tried a 5.1 and 7.1 setup (c_chmask=63 or 255, c_srate=44100, 
c_ssize=2) but I get a urb 0 error on the connected Linux laptop and the 
gnome sound-test freezes when testing a channel, no errors on the gadget 
device. My usb controller is a DWC3 on a RockPro64 board.

usb 3-2: USB disconnect, device number 9
usb 3-2: new high-speed USB device number 10 using xhci_hcd
usb 3-2: New USB device found, idVendor=1d6b, idProduct=0104, bcdDevice= 
1.00
usb 3-2: New USB device strings: Mfr=1, Product=2, SerialNumber=3
usb 3-2: Product: audioproduct
usb 3-2: Manufacturer: audiomanufacturer
usb 3-2: SerialNumber: audioserial
usb 3-2: cannot submit urb 0, error -90: internal error

Noah

On 3/6/23 21:41, Ruslan Bilovol wrote:
> On Mon, Mar 6, 2023 at 7:24 PM Noah Causin <n0manletter@gmail.com> wrote:
>>
>> Hi,
>>
>> I was wondering if the f_uac1 gadget supports more than two channels of
>> audio.
> 
> Yes it does, see channel mask configfs configuration options for
> capture/playback
> in the documentation for UAC1 function:
> https://www.kernel.org/doc/Documentation/ABI/testing/configfs-usb-gadget-uac1
> 
> Regards,
> Ruslan
