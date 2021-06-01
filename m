Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46445397AE7
	for <lists+linux-usb@lfdr.de>; Tue,  1 Jun 2021 22:00:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234656AbhFAUCc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Jun 2021 16:02:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233853AbhFAUCb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 1 Jun 2021 16:02:31 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06E22C061574
        for <linux-usb@vger.kernel.org>; Tue,  1 Jun 2021 13:00:48 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id dj8so35980edb.6
        for <linux-usb@vger.kernel.org>; Tue, 01 Jun 2021 13:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=6nQzKtf5vOVPl0D22yTHeKbY1k4vu2qtSPxLg0aTXwc=;
        b=n23WhuVsfyUrH3HCEIbYLFNB2ZIhnKNvOuOEtCKmQECqOtekot7dtEoZMqebNmO2Gz
         bcG87p1VcXjWiVuJLdpg9FRn/IxYNsfJW0CxwmO6ngksFu92x9k+1PbHp+s51lvNW5kb
         ogpCRLGh1cyCkzLrr2Aw2oVv9gAoDKksE8LvkTYZmnuvLccgSGvRuWq2miVeaeZhovRd
         b/HTYzH33gO3sNSIEl9qmgWZGHPQ5nNxyHQEuQKQfG/ZV8LyLKMxNclXca9/3O57bfh3
         +MoM/XJUjr0nZi5CcYLAWfDTSOToYCL3wfWg+WVf5hplZwGH8PmhIW/YLNbTfaJnNfoF
         Marw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=6nQzKtf5vOVPl0D22yTHeKbY1k4vu2qtSPxLg0aTXwc=;
        b=QUlPoxkWV6YmQnJwBp0T5SAr5ePeSqqJB3cUBDZQv8hbsO15DoSIQhD/g7C7VfTgrq
         IoXyG/j8gA+YLcihxHjEhcwVi9XwllSb8pd/nLs9opFc6iHv1w4ZFqMDbIJ8Wz6x5t9v
         Hbxqd2MlmGr3r+/ov8WNp6cKrzJJ6wJNd0iPvvnwour2DReML9bjKiG3OQV6zD3w3F87
         W0Zlq3AHbg38buU5LxGCcjFlGHaBfTgnxi/E3/82ka0oiTqltiUsTkXaf8n5LoUFnde2
         qrOXC4HLdMocTp62YLWjIDphArc/3pvDuRWRTYm+LsSGu+9YFomrGgBf5neiuAIcEfun
         1yDA==
X-Gm-Message-State: AOAM5326EqlJwC/LqDjtuTeyoyklcDURt6+0GABcPld1cDfRPcmZk/hx
        hsVJ9CJtPQh0+1UQtYYUY7A=
X-Google-Smtp-Source: ABdhPJxd/+FKX2EXyscW6Jl6OgmQYYph4A+tDy0eOiqsoNzLFXYhOIvOdHyiL2Vr8rav+h0hr9wbIw==
X-Received: by 2002:a05:6402:34cb:: with SMTP id w11mr11845589edc.299.1622577647476;
        Tue, 01 Jun 2021 13:00:47 -0700 (PDT)
Received: from ?IPv6:2001:981:6fec:1:5fc5:5b18:b64:a93a? ([2001:981:6fec:1:5fc5:5b18:b64:a93a])
        by smtp.gmail.com with ESMTPSA id o21sm7549723ejh.57.2021.06.01.13.00.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jun 2021 13:00:46 -0700 (PDT)
Subject: Re: v5.13-rc3 --> v5.13-rc4 DWC3 breakage
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Felipe Balbi <balbi@kernel.org>,
        USB <linux-usb@vger.kernel.org>,
        Wesley Cheng <wcheng@codeaurora.org>
References: <CAHp75Vc1BHSOfzUg2a1EEV_hNQK_MNNnVKA4wG_tWAWgTmnE9w@mail.gmail.com>
 <YLT3lHWFimB3GiHy@kroah.com>
 <CAHp75Vdjrj6=8thopwD7OPb-gxyVZx895Vd66mLSA4-BggdcWg@mail.gmail.com>
 <CAHp75Vc93a67fVqApGZ9qWy9d0yfasrO3S9-Ns7GqdSZSROuEQ@mail.gmail.com>
 <CAHp75VfJidDcBROMH6iQucZ5WkEgQ6mmbcL3qow1uHnwh2xDeg@mail.gmail.com>
From:   Ferry Toth <fntoth@gmail.com>
Message-ID: <4eed81f9-9f4e-44d3-15ff-62dfc94d669f@gmail.com>
Date:   Tue, 1 Jun 2021 22:00:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAHp75VfJidDcBROMH6iQucZ5WkEgQ6mmbcL3qow1uHnwh2xDeg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi

Op 01-06-2021 om 19:31 schreef Andy Shevchenko:
> On Mon, May 31, 2021 at 11:22 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
>> On Mon, May 31, 2021 at 6:45 PM Andy Shevchenko
>> <andy.shevchenko@gmail.com> wrote:
>>> On Mon, May 31, 2021 at 5:49 PM Greg Kroah-Hartman
>>> <gregkh@linuxfoundation.org> wrote:
>>>> On Mon, May 31, 2021 at 05:33:02PM +0300, Andy Shevchenko wrote:
>>>>> Hi!
>>>>>
>>>>> The only patch that made v5.13-rc4 effectively broke USB on Intel Merrifield.
>>>>>
>>>>> My reproducer:
>>>>>   1. Boot with switch in gadget mode
>>>>>   2. Enable USB ethernet
>>>>>   3. Switch to host
>>>>>   4. wait a bit for device enumeration, etc
>>>>>   5. Switch back
>>>>>   6. No gadget mode, kernel RCU stall detected (USB become unusable, so
>>>>> does the system)
>>>>>
>>>>> [  115.792620] rcu: INFO: rcu_sched self-detected stall on CPU
>>>>> [  115.798410] rcu:     0-....: (24089 ticks this GP)
>>>>> idle=886/1/0x4000000000000000 softirq=3796/3797 fqs=5240
>>>>> [  115.808333]  (t=21000 jiffies g=6505 q=12158)
>>>>> [  115.812847] NMI backtrace for cpu 0
>>>>> [  115.816472] CPU: 0 PID: 23 Comm: kworker/0:1 Not tainted 5.13.0-rc4+ #213
>>>>> ...
>>>>>
>>>>> [  115.977913]  add_dma_entry+0xd4/0x1d0
>>>>> [  115.981760]  dma_map_page_attrs+0xd8/0x220
>>>>> [  115.986063]  usb_hcd_map_urb_for_dma+0x3b6/0x4f0
>>>>> [  115.990895]  usb_hcd_submit_urb+0x98/0xbf0
>>>>> [  115.995263]  dln2_rx+0x1ae/0x280 [dln2]
>>>>> ...
>>>>>
>>>>> 100% Reproducibility, revert of the 25dda9fc56bd ("usb: dwc3: gadget:
>>>>> Properly track pending and queued SG") fixes the issue.
>>>>>
>>>>> Please, fix it properly or revert. Thanks!
>>>> Care to send the revert?
>>> Sure, But I want to give Thinh a chance to react to this, maybe it
>>> would be a better idea.
>>> Let's say if nothing happens I will send it on Wednesday.
>> Please, hold on, I have to perform additional testing (something odd
>> is going on on my side).

Hi Andy I tested my 5.13-rc4 which has only 2 dwc3 related patches on 
top: the good old "REVERTME: usb: dwc3: gadget: skip endpoints 
ep[18]{in,out}" and "extcon: intel-mrfld: Sync hardware and software 
state on init" (will hopefully go in 5.14).

I did not reproduce stalls or oopses.

Dwc3 host/gadget seems to be working nicely now and switching back and 
forth without issues in my case (after considerable help from Thinh 
earlier).

> It appears that the reported patch has nothing to do with the issue.
> It "luckily" helped, but under more tests I managed to dive as deep as
> v5.11 and got the same issue. I will continue investigating and will
> inform / send patch / etc when I find more robust reproducer. Anyway
> it's not the reported patch for sure, sorry for the noise.
>
> (It seems I'm looking in a wrong corner< I have some ideas, but it
> requires time to check)
>
I'd be happy to apply additional patches to see if those trigger the 
issue if you have suggestions.

In the meanwhile I'll be testing 5.13-rc's just in case.

