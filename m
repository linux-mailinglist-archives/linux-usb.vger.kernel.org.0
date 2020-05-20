Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66C831DB24A
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2020 13:52:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726548AbgETLwA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 20 May 2020 07:52:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726525AbgETLv7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 20 May 2020 07:51:59 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94AA0C061A0E
        for <linux-usb@vger.kernel.org>; Wed, 20 May 2020 04:51:59 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id k13so2853323wrx.3
        for <linux-usb@vger.kernel.org>; Wed, 20 May 2020 04:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=6WFKYei2D2I3XV2nDc1dBY3x3KmmRVxinljmw0uB3X0=;
        b=andjSPxgvS19d9gpJMpkyStQZGqf7dpyLLQ/gSafIYnWYv175QIJ3MhOUy3QUR5Pr0
         t1OQD2Lja1pJBW0f1C+0+G+J0fRfte1BnmvWqdJ7iMcPSRQriOT8j1p3GzVSrSk2aIGs
         fS/a8YbPzkYJysNGm7tJKUW/yrHtkGqCgf2dg09rbDFbb7q9v+rRwhiDL+Ydxa33uRCc
         3TqPeNPqL9k/uQ40rT8AC79mis/rM9Evi6UHLilFOQ5tiOAwfqkBATAFGFKPaR0GtjCV
         Nw4DyTh7sv0L9f7wkH+ki67hAYLrkvhleC+B6diPn1THSLkJGxDV1iiQutXEPRf7feC5
         0ImQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6WFKYei2D2I3XV2nDc1dBY3x3KmmRVxinljmw0uB3X0=;
        b=euOZwpn2MaYwzac/kdQnWUJd3JB3itG3tEon9gg/x/Mn7Pj5KGwwcb0BDS79A58d+I
         efjks4iywVh6w/YWp8rQDTTE1FPBJ063HQbHxb+7vRERxe8UdVEelBYAl1Pg7+1b67jL
         JptCven4oJrF5wIrlH47Ip5uIwvNT4eKvdZkGQmJ1s0G5qE3e9tGhZOeI6Z9pCDOe8V4
         MrsbrG6chSHcz2rhMe3GNR6+tB4DhFj1P953LL575XsWijXG9GhrncYGRgaRvI5aF3go
         adWUC1ELMdVSjKXaL+4RlGd5XzRHJ8Ebeih5zG47fZ4YnNoMGKpnijjaH1KwvvavQPbC
         hTnw==
X-Gm-Message-State: AOAM531uwomoUe9ecqiRq1FZJiPTJFUQayw9pYT4U7Z/MAWJUS/qaWBk
        NaSUpojgFFbnsihZq5SIIdjjdg==
X-Google-Smtp-Source: ABdhPJwul9CX57Ny0SFgC9MewkWtdAa9s53enzC6/YZCtjZL4iNVe/vUK1ylx2xnwOst+lhiqtyIqw==
X-Received: by 2002:adf:f512:: with SMTP id q18mr4211916wro.38.1589975518308;
        Wed, 20 May 2020 04:51:58 -0700 (PDT)
Received: from [192.168.0.38] ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id t14sm1996476wrb.56.2020.05.20.04.51.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2020 04:51:57 -0700 (PDT)
Subject: Re: [PATCH] usb: typec: Ensure USB_ROLE_SWITCH is a dependency for
 tps6598x
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org
References: <20200520100526.2729-1-bryan.odonoghue@linaro.org>
 <20200520103542.GF1298122@kuha.fi.intel.com>
 <c1b5a729-6b2a-9c91-6ed0-94ffbc529fcd@linaro.org>
 <4f5aaa11-194f-24ad-bd8a-ce510b2bce94@linaro.org>
 <49a6693e-ed9e-2de6-1dea-ba24b8a3ff4d@linaro.org>
Message-ID: <8000f5b7-7652-4a31-6ec2-ac680c830823@linaro.org>
Date:   Wed, 20 May 2020 12:52:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <49a6693e-ed9e-2de6-1dea-ba24b8a3ff4d@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20/05/2020 12:22, Bryan O'Donoghue wrote:
> On 20/05/2020 12:13, Bryan O'Donoghue wrote:
>> On 20/05/2020 12:08, Bryan O'Donoghue wrote:
>>> On 20/05/2020 11:35, Heikki Krogerus wrote:
>>>> On Wed, May 20, 2020 at 11:05:26AM +0100, Bryan O'Donoghue wrote:
>>>>> When I switched on USB role switching for the tps6598x I completely 
>>>>> forgot
>>>>> to add the Kconfig dependency.
>>>>>
>>>>> This patch ensures the dependency is there to prevent compilation 
>>>>> error
>>>>> when role-switching is off.
>>>>
>>>> There are stubs for the those functions, so there should not be any
>>>> compilation errors.
>>>>
>>>
>>> That's what I initially thought too, then I saw this.
>>>
>>> git show da4b5d18dd949abdda7c8ea76c9483b5edd49616
>>>
>>> but looking at role.h
>>>
>>> #if IS_ENABLED(CONFIG_USB_ROLE_SWITCH)
>>>
>>> int usb_role_switch_set_role(struct usb_role_switch *sw, enum 
>>> usb_role role);
>>>
>>> #else
>>>
>>> static inline int usb_role_switch_set_role(struct usb_role_switch *sw,
>>>                  enum usb_role role)
>>> {
>>>          return 0;
>>> }
>>>
>>> #endif
>>>
>>> That should work.
>>>
>>> Hmm, let me see if I can figure this out...
>>
>> Well if I do this
>>
>> diff --git a/drivers/usb/chipidea/Kconfig b/drivers/usb/chipidea/Kconfig
>> index d53db520e209..636a5428b47e 100644
>> --- a/drivers/usb/chipidea/Kconfig
>> +++ b/drivers/usb/chipidea/Kconfig
>> @@ -6,7 +6,6 @@ config USB_CHIPIDEA
>>          select EXTCON
>>          select RESET_CONTROLLER
>>          select USB_ULPI_BUS
>> -       select USB_ROLE_SWITCH
>>
>> my build does this
> 
> ah ha - look at what role switch is defaulting to
> 
> CONFIG_USB_ROLE_SWITCH=m
> 
> So anything linked into the kernel image will not resolve those symbols

So it should be "select USB_ROLE_SWITCH" not "depends on USB_ROLE_SWITCH"

grep -r "USB_ROLE_SWITCH" * | grep depend
drivers/usb/typec/Kconfig:	depends on USB_ROLE_SWITCH

grep -r "USB_ROLE_SWITCH" * | grep select
drivers/extcon/Kconfig:	select USB_ROLE_SWITCH
drivers/usb/dwc3/Kconfig:	select USB_ROLE_SWITCH
drivers/usb/cdns3/Kconfig:	select USB_ROLE_SWITCH
drivers/usb/gadget/udc/Kconfig:	select USB_ROLE_SWITCH
drivers/usb/mtu3/Kconfig:	select USB_ROLE_SWITCH
drivers/usb/musb/Kconfig:	select USB_ROLE_SWITCH
drivers/usb/musb/Kconfig:	select USB_ROLE_SWITCH
drivers/usb/typec/tcpm/Kconfig:	select USB_ROLE_SWITCH
drivers/usb/typec/Kconfig:	select USB_ROLE_SWITCH
drivers/usb/typec/mux/Kconfig:	select USB_ROLE_SWITCH
drivers/usb/common/Kconfig:	select USB_ROLE_SWITCH
