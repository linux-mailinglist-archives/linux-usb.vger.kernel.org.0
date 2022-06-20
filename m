Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5BE28550EF7
	for <lists+linux-usb@lfdr.de>; Mon, 20 Jun 2022 05:35:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237328AbiFTDfN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 19 Jun 2022 23:35:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233337AbiFTDfM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 19 Jun 2022 23:35:12 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9829D65AC
        for <linux-usb@vger.kernel.org>; Sun, 19 Jun 2022 20:35:11 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id g10-20020a17090a708a00b001ea8aadd42bso9071142pjk.0
        for <linux-usb@vger.kernel.org>; Sun, 19 Jun 2022 20:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=HBKCnWGgvx4EXSdPDEwOtS+D/mfr/MiYz3vmeid9RmE=;
        b=M7dnv3VCx00AuXM+TX9LCs6K5pq4muuWVcIs+pxG6WbNa04PZo7vJY67jtOrcuAuTK
         lrwZWawCUTaV9OJBvAh9j7goAw/KIqUY7jsV59zpHa1uJC9rbLr2ic3pS32EO+guo6ug
         fwSuF67TgDVPmfp8uy79fB6tH8UDPw4AvA9TmOhzIEuDP0aB9Uzf4K3LJznEG9jsTh9m
         wbXPypR/yNL5Uh1U90WSjiZ2ubBXWrRHTpc14NyzMiC3guFv0+KPkb/8LuiCZpRC7gn6
         UtHIiEqHEF6fPkVWT9wPOy8DXQd/A3kea0ziN9LtTa+CxD+fwVRwG7a+/ne1J2c1u192
         mbLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=HBKCnWGgvx4EXSdPDEwOtS+D/mfr/MiYz3vmeid9RmE=;
        b=p1YOYMrKyzEi0ZCBU9ecrItinPT2BBKlKrtpjlSDkQtGuwXiYUYTnNok4HQEiDHnHr
         E63xwXNnXy7nv+7vo31NNPwBxgau/MKVft2wkQ+EQ4wLnaH2o6onAeHO5jESeiESaRGb
         eJfnPNSkQGdSzQsOvh+59eZyd5XREWF2AX8Mi4NfJmguwdIGd4xzA5QyhxyrRnJaBuZN
         kiTju5cFMeEm7j8PPuvHpWp5tIdqMyCKJ9Z7T7n/ybf8sciDAywEUxfQ6Sc0/lEfUAZ7
         Xxr3InJVyFGw3ajdIIt4//k/YQWz/3NdvBti42uMFhm/gDAfid5/GDgq+HJ/piVd9eAN
         eS/Q==
X-Gm-Message-State: AJIora9EeCtBS+Ojq07O/jO7T3xHC8HrTSt0m0Y9G3t8CFXtWAvyq9FV
        BA9OL57FPuF+nGELRsghut9accvWIw0=
X-Google-Smtp-Source: AGRyM1uhFOPLD4Ng7yV/nDuVQ/zIisB88YUOBZ4EVJHk2vjhHwXoFlqGBGKqcYgJjZU+TcIsq10Hag==
X-Received: by 2002:a17:90b:4ccf:b0:1ea:264c:7c0c with SMTP id nd15-20020a17090b4ccf00b001ea264c7c0cmr35295323pjb.176.1655696111053;
        Sun, 19 Jun 2022 20:35:11 -0700 (PDT)
Received: from [192.168.1.5] ([159.192.164.164])
        by smtp.googlemail.com with ESMTPSA id n23-20020a637217000000b003f66a518e48sm7965975pgc.86.2022.06.19.20.35.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Jun 2022 20:35:10 -0700 (PDT)
Message-ID: <1af7ff05-8558-9162-a0cd-ac140ddaf2e1@gmail.com>
Date:   Mon, 20 Jun 2022 10:35:07 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: serial: usb: cdc-acm: OMRON B5L ToF, device probe failed
Content-Language: en-US
To:     Chris Ruehl <chris.ruehl@gtsys.com.hk>,
        USB list <linux-usb@vger.kernel.org>
Cc:     Oliver Neukum <oneukum@suse.com>
References: <85ebf554-effd-c89e-6eb8-c149442b931c@gtsys.com.hk>
 <fc9986a6-0b11-d949-2196-1ad35d3f4d98@gtsys.com.hk>
From:   Lars Melin <larsm17@gmail.com>
In-Reply-To: <fc9986a6-0b11-d949-2196-1ad35d3f4d98@gtsys.com.hk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 6/20/2022 09:44, Chris Ruehl wrote:
> Enabled the debugfs and checked /sys/kernel/debug/usb/devices for the B5L
> 
> T:  Bus=02 Lev=03 Prnt=04 Port=01 Cnt=01 Dev#= 17 Spd=480  MxCh= 0
> D:  Ver= 2.00 Cls=02(comm.) Sub=02 Prot=00 MxPS=64 #Cfgs=  1
> P:  Vendor=0590 ProdID=00ca Rev= 2.00
> S:  Manufacturer=OMRON Corporation
> S:  Product=OMRON B5L-001011
> S:  SerialNumber=010000319A1
> C:* #Ifs= 1 Cfg#= 1 Atr=80 MxPwr=  4mA
> I:* If#= 0 Alt= 0 #EPs= 4 Cls=02(comm.) Sub=02 Prot=00 Driver=(none)
> E:  Ad=01(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=82(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=03(O) Atr=03(Int.) MxPS=  64 Ivl=4096ms
> E:  Ad=84(I) Atr=03(Int.) MxPS=  64 Ivl=4096ms
> 
> Driver is not assigned.


There is nothing CDC-ACM in that interface except for the interface 
attributes, the interface lacks everything else needed for it to be CDC-ACM.
Check if Omron has an updated firmware fixing the problems or if they 
have their own proprietary driver for the device.


/Lars
