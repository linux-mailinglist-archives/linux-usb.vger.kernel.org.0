Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C2EE4D0193
	for <lists+linux-usb@lfdr.de>; Mon,  7 Mar 2022 15:38:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239250AbiCGOjg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Mar 2022 09:39:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234931AbiCGOjg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 7 Mar 2022 09:39:36 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9796F1A837
        for <linux-usb@vger.kernel.org>; Mon,  7 Mar 2022 06:38:41 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id q20so6976177wmq.1
        for <linux-usb@vger.kernel.org>; Mon, 07 Mar 2022 06:38:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=v3UOotaIp5+XFJ6OHydA31Bl377Jgq60AAs2gzkXJNQ=;
        b=aR4ecCag9VoaN2I4hKVurgrB08K3f3gc2pv9zZ6Mddi7OsygHWbFj+U5u7BLfIMFbI
         30mh34Gqlt5ytRTy9OIUuyjF+LDVh5WU6yiNusdXzf8TwaMZmXIBEN4iRFkCP+wZhVVQ
         JYyFrfsgE4+VNrXCWLJ31Ea7CzfA5gx1Vu4Ainx7nwOIovKxaZY7sR17MSYozAl5NhtJ
         mCi5EVF8B97AV3FoSgOWfPHxoIbixfb4B8XEiDiUx9x89DeebT0YtwZIpoNKLS9Lx9IA
         1efihs9T/RaHmi56i5cGfIAtre4zjVA8gMdFewLhnVDXt0yLVAbNDjg7K+KNZtRdYxZJ
         EQdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=v3UOotaIp5+XFJ6OHydA31Bl377Jgq60AAs2gzkXJNQ=;
        b=DkBIqvlooBkUq1eJStz733msH6mqaEGhbX8dcnsEFTlIvYtABThu144Quo950Xpw4J
         6oZDQSgoemTf28HirscmuSdkbgOeCKrmFVtuiY2t2fgGurnIzE85+tRC6/LnM4//SHDZ
         dPKWupfOHzC2pK/UdVMCk6OcZeRbe8JxQBjG0Ai9h9lWU4aqsHGTiB7zPJBNebRqUa+V
         dhQKOY7ldGh1+MMP/4wOKNrkRhM+BTyqk5FZx1uEtlhMVlQ4q2KkL5sngQK+jB7tOcCH
         g4m3d3OEZbcY62zb94y1AKICZYHJtlIu8oO5CcWhf/qskTvOD7b+rCaKuT1QmR2fnIkc
         YVNQ==
X-Gm-Message-State: AOAM531yL10RWSAI2rktcjPZQUq3dB6jN/D1tF5nuX4TnQQew+m+rETJ
        2WogstrMkUrOMU8XiSKzCxQ=
X-Google-Smtp-Source: ABdhPJwUpcw4cK5FyZA3NZIO8MU4wZBA8iUvVmCVx3z+anWOZ4Yajvaq5LHXHoEPkhUnMv7QVUiJVQ==
X-Received: by 2002:a05:600c:1e02:b0:389:9e5f:59df with SMTP id ay2-20020a05600c1e0200b003899e5f59dfmr6736792wmb.92.1646663920066;
        Mon, 07 Mar 2022 06:38:40 -0800 (PST)
Received: from [147.251.233.41] (dhcp-233-041.eduroam.muni.cz. [147.251.233.41])
        by smtp.gmail.com with ESMTPSA id u18-20020adfdd52000000b001f04e9f215fsm11179347wrm.53.2022.03.07.06.38.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Mar 2022 06:38:39 -0800 (PST)
Message-ID: <04428d68-256f-559b-6f1c-9397b7a43bfc@gmail.com>
Date:   Mon, 7 Mar 2022 15:38:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: Another PL2303
Content-Language: en-US
To:     johan@kernel.org
Cc:     linux-usb@vger.kernel.org
References: <165de6a0-43e9-092c-2916-66b115c7fbf4@gmail.com>
 <YiYWrhe4w5iC/Hm0@hovoldconsulting.com>
From:   =?UTF-8?B?TWF0ecOhxaEgS3JvdXBh?= <kroupa.matyas@gmail.com>
In-Reply-To: <YiYWrhe4w5iC/Hm0@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Yes, it is PL2023GS. I wasn't able to read it but now that I know what 
to look for, I can confirm it.

Matyáš

Dne 07. 03. 22 v 15:29 Johan Hovold napsal(a):
> On Sun, Mar 06, 2022 at 05:52:58PM +0100, Matyáš Kroupa wrote:
>> Hi,
>>
>> I recently bought a serial console adapter with PL2303. After a quick
>> search I discovered that there have been problems with different
>> versions of this chip so I include some info about mine.
> Thanks for the report and for including all the necessary details.
>
>> dmesg:
>>
>> [172076.820388] usb 3-2.2: new full-speed USB device number 11 using
>> xhci_hcd
>> [172076.960358] usb 3-2.2: New USB device found, idVendor=067b,
>> idProduct=23f3, bcdDevice= 6.05
> Based on the (default) product id this should be a PL2303GS. Are you
> able to confirm that by looking at markings on the chip too?
>
> Either way, I just posted a patch that adds this bcdDevice to the
> driver.
>
> Johan
