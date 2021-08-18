Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B86F3F0C15
	for <lists+linux-usb@lfdr.de>; Wed, 18 Aug 2021 21:49:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232827AbhHRTuM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 18 Aug 2021 15:50:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233607AbhHRTsz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 18 Aug 2021 15:48:55 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91687C06179A
        for <linux-usb@vger.kernel.org>; Wed, 18 Aug 2021 12:48:20 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id n12so4894631edx.8
        for <linux-usb@vger.kernel.org>; Wed, 18 Aug 2021 12:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=YlQT9pMWLEF2BTP39gjto5NYaCtiAPqSe5c09vXRaXA=;
        b=Cl+34KnbnGCLpTIstjVk9FdlKK/7DB34RPKlvr8r0Vk/UF26CBIT3hHzlpVbyN7lx7
         GmTSz6RhbwyRWyAYxwFHu3SBTiQYj4m/LOhQ8J6wqshxbyEpxwztC0QtbvuzXP0gOsnF
         Y6dV7eaE0CMLyT/g3pjbdCiY6v+zttyA4bKdVX8pOLsSMpkQ4/E8o45baFA4Bf5N7uec
         14vddSy11f5566ZP3g8gmMcnb1VrHl+HK9aAjxldae2DYHhJWjn6+N2sdmslxn0YVDU9
         hvxJ9rbiKZ+rJ7MnmOXK3AcrFFyvv8LNDerSoPoOFQ/CHG0ygnbf6jtaXMhFKh7VBFbs
         kkGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=YlQT9pMWLEF2BTP39gjto5NYaCtiAPqSe5c09vXRaXA=;
        b=ak5VKtgnDrL7xzlKDEhy2DBzDso/XOGTNzBoRqirYD9m+9M3xft7CqtBbMu2aUcaom
         9FXvV2WzPOr7jMOv95Lb0Xu+ZJktaw6wPrNmxcLvVWP6GqiMCJXfFLb8pVdSPOngwOp7
         0dwUA8YXXlPPdXhC7/KF9c5YUbWOCjeFKzxFS4s/WPiNYj4mVQneF8I3VL7sjRLvO2wX
         ecghdD2uHwaEIG54Wy5hdM89H2gLV2wlfWnmm1MU3oO0cS0IFl9GZIizGdaJEsM6kUua
         qAmiQZMj3GDPW5b3tbS4ARf3oWxd2L0rYA0TVstiruF5B5pZu+/bHNwAE5eUAj5fSBsF
         4XkQ==
X-Gm-Message-State: AOAM530Y/QhzGBPwYoaX2LUZ86Tx7/oYKouENamXPw634LF+/osdzCCc
        apxwSzVmZWxfHWebY3w9TWw=
X-Google-Smtp-Source: ABdhPJyvaGNyCR8Yfrsy3bAGxKfxarMEkzIwc1K3ciGfuNpmixF7GYEr414I2bwMmOZ2GbbuybGwVg==
X-Received: by 2002:a50:9b03:: with SMTP id o3mr11669870edi.203.1629316099198;
        Wed, 18 Aug 2021 12:48:19 -0700 (PDT)
Received: from ?IPv6:2001:981:6fec:1:ee14:4fd1:fa5a:b7f6? ([2001:981:6fec:1:ee14:4fd1:fa5a:b7f6])
        by smtp.gmail.com with ESMTPSA id u20sm298878ejz.87.2021.08.18.12.48.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Aug 2021 12:48:18 -0700 (PDT)
Subject: Re: [RFT][PATCH] usb: dwc3: Decouple USB 2.0 L1 & L2 events
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jack Pham <jackp@codeaurora.org>
Cc:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        John Stultz <john.stultz@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        Ray Chi <raychi@google.com>, Ferry Toth <ftoth@exalondelft.nl>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Li Jun <jun.li@nxp.com>, Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, Wesley Cheng <wcheng@codeaurora.org>
References: <20210812082635.12924-1-jackp@codeaurora.org>
 <20210818012859.GB30805@jackp-linux.qualcomm.com>
 <YRzT4y87Nt8ICFJ/@smile.fi.intel.com>
From:   Ferry Toth <fntoth@gmail.com>
Message-ID: <de4c1fd9-7d2d-1038-8b8f-856e9dfd88cd@gmail.com>
Date:   Wed, 18 Aug 2021 21:48:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YRzT4y87Nt8ICFJ/@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Op 18-08-2021 om 11:33 schreef Andy Shevchenko:
> On Tue, Aug 17, 2021 at 06:28:59PM -0700, Jack Pham wrote:
>> On Thu, Aug 12, 2021 at 01:26:35AM -0700, Jack Pham wrote:
>>> On DWC_usb3 revisions 3.00a and newer (including DWC_usb31 and
>>> DWC_usb32) the GUCTL1 register gained the DEV_DECOUPLE_L1L2_EVT
>>> field (bit 31) which when enabled allows the controller in device
>>> mode to treat USB 2.0 L1 LPM & L2 events separately.
>>>
>>> After commit d1d90dd27254 ("usb: dwc3: gadget: Enable suspend
>>> events") the controller will now receive events (and therefore
>>> interrupts) for every state change when entering/exiting either
>>> L1 or L2 states.  Since L1 is handled entirely by the hardware
>>> and requires no software intervention, there is no need to even
>>> enable these events and unnecessarily notify the gadget driver.
>>> Enable the aforementioned bit to help reduce the overall interrupt
>>> count for these L1 events that don't need to be handled while
>>> retaining the events for full L2 suspend/wakeup.
>>
>> Hi folks in To:
>>
>> I'd like to request if any of you could help test this patch on your
>> boards to help make sure it doesn't cause any regressions since I know
>> some of the recent dwc3 patches from Qualcomm have been found to break
>> other devices :(. So I'm hoping to avoid that even for a patch as
>> small as this.
>>
>> Hoping this could be tried out on boards/SoCs such as db845c, hikey960,
>> Exynos, the Intel "lakes", etc.  Ideally this needs validation with a
>> high-speed connection to a USB 3.x host, which increases the chances
>> that USB 2.0 Link Power Management is supported.

Merrifield: We currently have 
PROPERTY_ENTRY_BOOL("snps,usb2-gadget-lpm-disable")

Should I retest with this reverted?

>> The overall goal of this patch is to eliminate events generated for
>> L1 entry/exit, so we should see a slight reduction in interrupt counts
>> when checking `grep dwc3 /proc/interrupts` for comparable traffic.

I didn't compare interrupts

> Unfortunately I'm quite busy lately with more important stuff and I dunno if I
> will be able to test this in reasonable time. So, if Ferry volunteers, then we
> can cover Intel Merrifield platform as well.
> 

Performance unchanged, no regressions found.
Tested-by: Ferry Toth <fntoth@gmail.com> # for Merrifield
