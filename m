Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE0DE1BF5C4
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2020 12:42:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726743AbgD3KmY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 30 Apr 2020 06:42:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726127AbgD3KmY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 30 Apr 2020 06:42:24 -0400
Received: from smtp.domeneshop.no (smtp.domeneshop.no [IPv6:2a01:5b40:0:3005::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FB77C035494
        for <linux-usb@vger.kernel.org>; Thu, 30 Apr 2020 03:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
        ; s=ds201912; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=nQammwL/KER+BZcG7PHhZvvr0kyfo7A035lR1ln3CZM=; b=cMcywDi5TEcehrwg96yR6INmiN
        4qNQtzWXcIjVtFTwFidVlu8gRz2/8IwEfMyJWMzV1gI7zuPmyIWjPxJqRWaFK7slGQuizGVcS9Inb
        mpKtgiGV8YWvgE6/Zq+3mi9JmCo69qj7VIVulxKLcuJQ8cadnh0GdgP9M6UILdCC1AhV6lx3ljiUI
        IO/kdRmYuZsS3qfts312A5ncHv2/6kTGmQPWboX6VXAfTrZkjrS7FvbcKKOOE0msTBvJvPxspjCjs
        TVA10Iu6GYt1WSh9cIBf7VA/OPc7tGcHFo/ij5uM7RU+Yan69FQf2zbuJ8QkpeQGv1FVDjrkkS2F+
        LVwyT/dA==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:61204 helo=[192.168.10.61])
        by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <noralf@tronnes.org>)
        id 1jU6e6-0000yj-J5; Thu, 30 Apr 2020 12:42:22 +0200
Subject: Re: [PATCH 01/10] backlight: Add backlight_device_get_by_name()
To:     Lee Jones <lee.jones@linaro.org>
Cc:     dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>
References: <20200429124830.27475-1-noralf@tronnes.org>
 <20200429124830.27475-2-noralf@tronnes.org> <20200430083219.GC3118@dell>
 <0fbc4eb5-cb39-5974-85bb-9f13278ecab4@tronnes.org>
 <20200430101529.GB298816@dell>
From:   =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <a1ac82de-c303-be00-70ae-7ae26eb39c82@tronnes.org>
Date:   Thu, 30 Apr 2020 12:42:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200430101529.GB298816@dell>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



Den 30.04.2020 12.15, skrev Lee Jones:
> On Thu, 30 Apr 2020, Noralf Trønnes wrote:
> 
>>
>>
>> Den 30.04.2020 10.32, skrev Lee Jones:
>>> On Wed, 29 Apr 2020, Noralf Trønnes wrote:
>>>
>>>> Add a way to lookup a backlight device based on its name.
>>>> Will be used by a USB display gadget getting the name from configfs.
>>>>
>>>> Cc: Lee Jones <lee.jones@linaro.org>
>>>> Cc: Daniel Thompson <daniel.thompson@linaro.org>
>>>> Cc: Jingoo Han <jingoohan1@gmail.com>
>>>> Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
>>>> ---
>>>>  drivers/video/backlight/backlight.c | 21 +++++++++++++++++++++
>>>>  include/linux/backlight.h           |  1 +
>>>>  2 files changed, 22 insertions(+)
>>>
>>> Once reviewed, can this patch be applied on its own?
>>>
>>
>> If you can apply it for 5.8, then we're good. DRM has cutoff at -rc5 and
>> the driver won't be ready for that. This patch has this dependency
>> chain: usb -> drm -> backlight. So if you can apply it for 5.8, things
>> gets easier.
>>
>>> My guess is that it can't, as the other patches in this set depend on
>>> it, right?  If this assumption is true, you need to send me the rest
>>> of the set.
>>>
>>> FYI: It's normally better to send the whole set to everyone, as it
>>> provides visibility on current review (or lack there of) status of the
>>> other patches and allows each of the maintainers to discuss possible
>>> merge strategies.
>>
>> dri-devel is the ML for backlight so I assumed you got the full set.
> 
> dri-devel isn't the ML for Backlight.  It's an interested party.

Oh, I thought it was strange, but kernel development has all kinds of
things that seems strange to me, so I just went with it.

> 
> I certainly have no intention of subscribing to it.
> 
>> I have had trouble in the past with my email provider dropping parts of
>> a series when I had to many recipients.
> 
> Without visibility into the other patches in the set, things become
> more difficult.  Maybe use a different/better email provider.
> 

Yeah, you need to have context, I have resent the series to you, Daniel
and Jingoo.

Noralf.
