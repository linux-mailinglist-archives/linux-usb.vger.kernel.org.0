Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CDA94368DE
	for <lists+linux-usb@lfdr.de>; Thu, 21 Oct 2021 19:16:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232137AbhJURTA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 21 Oct 2021 13:19:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229567AbhJURS7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 21 Oct 2021 13:18:59 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4884EC061764;
        Thu, 21 Oct 2021 10:16:43 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id 145so1172220ljj.1;
        Thu, 21 Oct 2021 10:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=pL6FutmKQRRgfjSTZSCCJbdmC4nC81cDtLeVacDNGBo=;
        b=DadjUeOrEEqFWPVTkzVrBRzJsM+VDYy48UgyWn+TcocappFVn+iY9IK10qCip65knA
         w5A42GGpumWoFK34VAaiGBfyKdNZCr/PZ4DdkmO0Mo0lky1hwv58K2AhRTcgc9bCoYNc
         we44CAqO+YDwunMVKorw1WG2frgQ5PZZjbDd2goxh4cy4+03RgwtR/k9xB9m5ISMj57S
         57d4+Hpnozp2PpS/H7oxE4eBMJWntHWK8MPmf7qvYWhjgfTX8RKP+jWrono/0EHtQXa4
         ugmTQHaNhetqCtAOh8ovLd+FxfHZ74+7SxN+CUI8SRk/uKWM6uvNhulgbU5Cin4eZ2rO
         uolA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=pL6FutmKQRRgfjSTZSCCJbdmC4nC81cDtLeVacDNGBo=;
        b=3KooicdZ3LCW5D803DohyJYzk7wnpCtgzCwsdTlv2UDmDkisAcoOEOY6NzNLkrV4K6
         OV28nbqvyc/aVmE5VWcHFm227JpM1yQ27IFCDRVY8gA6+GG4l0BOHANeHndidUQ67OdQ
         Z0zAOaB0B1KLMxdsejMzbyuQz6k0GNStqRDZkYUBIR9iGe1mJAf7k3lNDy8CJrZeG832
         4ocORd/t/0X1ebY9RueuRRxm3qUebRRmJgQEBfe5QpDrD8+21PjPzh0T51w2wcHxKsmK
         S+uRg5Ht2E5O3Gozhh6bOCvvAJ3QR7arz5mH+fceQHpyw6QDGfLd9Le2pnvUppPnV8pH
         PqUA==
X-Gm-Message-State: AOAM532SPaOUeA8FRRmbuy5wBn4ihrpCfr4W9CE1hy0psMy4f++w51M9
        XGdI7DQCDLF1UeeQj8m3t0JL1XGISE8=
X-Google-Smtp-Source: ABdhPJzwS1pa+uFmMchmjJekSDhTIHjdQK9Bj8nC9P1B3IZedtMMpjxk7pVBZHTR4Jl2ey3A5XIPbQ==
X-Received: by 2002:a2e:a5c9:: with SMTP id n9mr7209164ljp.512.1634836601485;
        Thu, 21 Oct 2021 10:16:41 -0700 (PDT)
Received: from [192.168.2.145] (46-138-115-62.dynamic.spd-mgts.ru. [46.138.115.62])
        by smtp.googlemail.com with ESMTPSA id k24sm505111lfe.76.2021.10.21.10.16.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Oct 2021 10:16:41 -0700 (PDT)
Subject: Re: [PATCH v1] usb: xhci: tegra: Check padctrl interrupt presence in
 device tree
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        JC Kuo <jckuo@nvidia.com>, Nicolas Chauvet <kwizart@gmail.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
References: <20211021115501.14932-1-digetx@gmail.com>
 <YXFyu+Q5ifG8Au9w@orome.fritz.box>
 <5f122caa-c810-534d-b2a1-53edef313ff0@gmail.com>
 <32694811-8768-8e77-f188-4ed1a1fb93da@gmail.com>
 <20211021152028.GB1161262@rowland.harvard.edu>
 <82a02e70-33bc-7faf-e085-a25884e48844@gmail.com>
Message-ID: <44567c4f-0f0f-6995-b48f-c427cedb6755@gmail.com>
Date:   Thu, 21 Oct 2021 20:16:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <82a02e70-33bc-7faf-e085-a25884e48844@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

21.10.2021 20:13, Dmitry Osipenko пишет:
> 21.10.2021 18:20, Alan Stern пишет:
>> On Thu, Oct 21, 2021 at 06:08:41PM +0300, Dmitry Osipenko wrote:
>>> 21.10.2021 17:57, Dmitry Osipenko пишет:
>>>> It might be wrong to disable device_may_wakeup() because it will change
>>>> the system suspend-resume behaviour, i.e. you won't be able to resume by
>>>> USB event, see [1].
>>>>
>>>> [1]
>>>> https://elixir.bootlin.com/linux/v5.15-rc6/source/drivers/usb/host/xhci-tegra.c#L1962
>>>>
>>>> Although, I'm not sure whether this is a correct behaviour to start
>>>> with. Previously, before the offending commit, device_wakeup was never
>>>> enabled for tegra-xusb. Commit message doesn't explain why wakeup is now
>>>> enabled unconditionally, wakeup checks aren't needed at all then. This
>>>> makes no sense, please check it with JC Kuo.
>>>
>>> Although, wakeup could be disabled via sysfs, so it makes sense. Still
>>> it's not clear whether it's a correct behaviour to enable wakeup during
>>> system suspend by default. If it wakes machine from suspend when USB
>>> device is plugged/unplugged, then it's a wrong behaviour.
>>
>> It depends on the details of how the device works.  In most cases we do 
>> want to enable wakeup by default for host controller devices.  The 
>> reason is simple enough: If some USB device attached to the HC is 
>> enabled for wakeup and sends a wakeup request, we don't want the request 
>> to get lost because the HC isn't allowed to forward the request on to 
>> the CPU.
>>
>> But we do not want to enable wakeup for root hubs.  In particular, we 
>> don't want to wake up a suspended system merely because a USB device has 
>> been plugged or unplugged.
>>
>> Clearly this arrangement depends on the hardware making a distinction 
>> between wakeup requests originating from the root hub and those simply 
>> passing through the HC.
> 
> Should USB keyboard be able to wake up every HC or it's a
> machine-specific feature?

I mean whether key press should wake up HC if wake-up is enabled for the
keyboard device.

> I'm asking because wakeup works on a typical
> Intel hardware, but doesn't work on older Tegra SoCs that use Chipidea
> controller. It's not obvious to me whether this is something that
> firmware handles for Intel or it's broken on Tegra. Could you please
> clarify? If it should work for every HC, then I may try to take a closer
> look.
> 

