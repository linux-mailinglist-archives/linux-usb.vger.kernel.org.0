Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8FACD1697ED
	for <lists+linux-usb@lfdr.de>; Sun, 23 Feb 2020 14:45:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726490AbgBWNpO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 23 Feb 2020 08:45:14 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:43050 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726208AbgBWNpO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 23 Feb 2020 08:45:14 -0500
Received: by mail-pl1-f195.google.com with SMTP id p11so2862703plq.10
        for <linux-usb@vger.kernel.org>; Sun, 23 Feb 2020 05:45:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=LkBcusp0K1+kbxFwysWwqTv6d10vigfbNEEutpsd+eU=;
        b=JRrsQoyLE1tNN2adHFzeg3FkMSI/fKFaXaC45IH0in8OGY6nDrnUiU/IBaqSseLXGU
         T6QvpohJxnsduPTYwaopmAQQAgqdAnqtAZ4vcqb7Wjt+ap0SLRtCgWTqz7dZvwbFvLzl
         Bh3g7PDmlcEWK/G3wZUeIkGLkvvTOtuaH/OPjsW+qU81HKTusHlm/VYQ85UVmiDw6Mky
         wJDXOZSfVCykFB4G3cN6kapmIKbeWDC+t0ubFjYRCF5keTIaapCtuoly0Z7QhrBg3rdQ
         hojv19cmz4LILB7cE5Y6JX0ZLaGIBaBUbmpuNfO52ysJZi4vyc9yROTrtzxsKv8XZNIs
         h9SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LkBcusp0K1+kbxFwysWwqTv6d10vigfbNEEutpsd+eU=;
        b=LWwIODi6U995YNYyyO1uOiRWTvVyEAb/K7eboEdVt3EC+ghG+HQfKyFq1ye6Tk0SjL
         A64WExDl1J6ie6tfFY/VT/cnumIu4HlcoJRVJJe8wmJrPLZ8IgytgCjqh1wITwHK/jvW
         okCPJGX6PcUmaaE29dMdr6ZCEdobYr2Nb6Q+XWbzVA6G3BR8BHMBtY9xPpvdwMnlStPL
         BL/dsXqOK+GRqTDvg+LoC3RP6fNxaRyn43A8yKBfMXGCyu5LHTljAKPNY9NsU9+ka9JW
         um9NhbeerEyII/vc/jlOVCnp/wBFOa+I9kjR6Rh4V46tMFzTXkc9aj0TBiBwu8F5miZk
         uDsg==
X-Gm-Message-State: APjAAAVrlzC11BsWehpBbOf5WDkCbvqYz8fA5l759qnbUqTcOq/M52QH
        L4+fdzl0JtFYlQYzR08+lN8=
X-Google-Smtp-Source: APXvYqy0sW90nxVxwnxhknZJwujbxZlriAGUdz2liM+BHJQ+Myu4zQz67BOyGtRB9UuhUr0Q9pEMfQ==
X-Received: by 2002:a17:902:7e4b:: with SMTP id a11mr45411367pln.61.1582465513738;
        Sun, 23 Feb 2020 05:45:13 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id i27sm8959072pgn.76.2020.02.23.05.45.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Feb 2020 05:45:12 -0800 (PST)
Subject: Re: [PATCH] usb: dwc2: extend treatment for incomplete transfer
To:     =?UTF-8?B?QW50dGkgU2VwcMOkbMOk?= <a.seppala@gmail.com>
Cc:     Boris ARZUR <boris@konbu.org>, linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Minas Harutyunyan <hminas@synopsys.com>,
        William Wu <william.wu@rock-chips.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Douglas Anderson <dianders@chromium.org>
References: <20200210213906.GA24079@roeck-us.net>
 <20200211054953.GA2401@tungsten> <20200211161522.GA1894@roeck-us.net>
 <20200215053647.GA10345@tungsten> <20200219211056.GA829@roeck-us.net>
 <CAKv9HNZx_YTC1QEyT-T2_BuXnnju+9czKx-JJjduk9TjUSjS7A@mail.gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <587c8fd7-6a31-098e-7fcb-815208f602bc@roeck-us.net>
Date:   Sun, 23 Feb 2020 05:45:11 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAKv9HNZx_YTC1QEyT-T2_BuXnnju+9czKx-JJjduk9TjUSjS7A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2/23/20 3:00 AM, Antti Seppälä wrote:
> Hi Guenter,
> 
> On Wed, 19 Feb 2020 at 23:11, Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> Yes, those patches didn't address the core problem. Can you test with the
>> attached two patches ?
>>
>> Thanks,
>> Guenter
> 
> I took a look at your patch (usb: dwc2: Simplify DMA alignment code)
> and I don't believe it is correct.
> 
> The patch re-introduces the dma_aligned_buffer struct and takes some
> care to align the beginning of the struct to dma cache lines. However
> we should be aligning the data[0] pointer inside the struct instead.
> With the code in the patch data[0] gets pushed to be at an offset from
> the alignment by kmalloc_ptr and old_xfer_buffer pointers. In other
> words data[0] is now not aligned to dma cache boundaries.
> 

I thought so too initially. However,

temp = PTR_ALIGN(kmalloc_ptr + 1, TEGRA_USB_DMA_ALIGN) - 1;

aligns the structure pointer such that its _end_ is DMA-aligned,
which is ->data[0].

Just to be sure, I'll add some debug code warning me if data[0] is
not DMA aligned.

> Reviewing the code got me thinking that what if we stopped playing
> with the alignment hacks altogether and hit the issue with a heavier
> hammer instead? Attached you can find a new patch that introduces a
> list to keep track of the allocations. The code then looks up the
> entry from the list when it is time to restore the original pointer.
> This way the allocations for the aligned dma area and the original
> pointer are separate and no corruptions should occur.
> 
> Thoughts, comments? I should note that the patch has received only
> light testing and not very thorough thinking. I can prepare a proper
> patch to be sent inline if the idea seems worth exploring further.
> 

