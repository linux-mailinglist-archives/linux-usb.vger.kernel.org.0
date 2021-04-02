Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E7D1352F8A
	for <lists+linux-usb@lfdr.de>; Fri,  2 Apr 2021 21:12:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231443AbhDBTMz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 2 Apr 2021 15:12:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229553AbhDBTMy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 2 Apr 2021 15:12:54 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59950C0613E6
        for <linux-usb@vger.kernel.org>; Fri,  2 Apr 2021 12:12:53 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id u21so8575442ejo.13
        for <linux-usb@vger.kernel.org>; Fri, 02 Apr 2021 12:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=gdQwIrYhoQkM0qvn68ou5CBCiZekFDE2rVRnG7h8mkM=;
        b=jy5q/qgVcpnwxtEd0ZTXaAMcrvZUxjx3RyOE0rEheIVU1gFQpUdtNs7OlEsX2IoQ2/
         80zhf1BsSNUMSF+6B7FywM/CxPNb8mUuTxnSzIyVl/NdPM/zE9n1vRr1mgrA1uuF9NeM
         p8V824fTRxvQydDLoQGhEF+RFkLO0EWH3k9DvRk4eEqbaKHbXzbYNIfVcYr9s1UJSvZd
         ASlYNA27RNsJ5sJI1dM8ZdqDwsqkrDwGlwtL9xhsV8CQW9wV4voGYgLMzDcBzTIs+p2y
         HND5lnGk6C/xep2JOEV1/9cmycu9yueoi0tutQOmMT8foss8EDWMYl6HibZjU+Ncp8KL
         wEow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=gdQwIrYhoQkM0qvn68ou5CBCiZekFDE2rVRnG7h8mkM=;
        b=OQjPi7sWVZuH+eT3DUHrZISSJLSe3X2KJMHvAUPDcapHurneG+eU71CFDWyA7jLcv4
         Zj390DlbTOYEW6xw+iT/sKL1Iw0X9MWleUf4iimswut7TVYpx3/oytosfNTMd8AHsKQr
         TW3MKxU0bZ9ZMirif6SSF42LigrHr25FJRzLUivYXXWNJF0WQtxnea+tNSWJs2C2uDOa
         lCcay3GAYRcJTYa5KzZZ/6Uy6loAbB6NoUl1o/PVyukTIHIwEAu123Wlp1DoayKIZxgz
         w7X43YUbEL1bzrcssBSj49D0udwvOzqgCwWUvA1pLblbTF9kDUwNJWt2oNUtkjB1w5fd
         kJSw==
X-Gm-Message-State: AOAM531NEoiQ89tfUQT/wDuU3Zkkd6uZnX7xpGD5Y0fbK4XLErDjoHto
        e9nMDc3uD5HVliw4TfxnPhVpf+K3Vfs9Ig==
X-Google-Smtp-Source: ABdhPJy8qc8hk7nlLPpE4IfhtevXOyA9oJ9VUw+utEzzI87sclgmuxHLbPrgkddlvyDhZSP0Yo0mZw==
X-Received: by 2002:a17:906:9515:: with SMTP id u21mr15889498ejx.86.1617390771973;
        Fri, 02 Apr 2021 12:12:51 -0700 (PDT)
Received: from ?IPv6:2001:981:6fec:1:5782:2bd2:7d2a:96f6? ([2001:981:6fec:1:5782:2bd2:7d2a:96f6])
        by smtp.gmail.com with ESMTPSA id e16sm5688832edu.94.2021.04.02.12.12.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Apr 2021 12:12:51 -0700 (PDT)
Subject: Re: USB network gadget / DWC3 issue
From:   Ferry Toth <fntoth@gmail.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        USB <linux-usb@vger.kernel.org>
References: <CAHp75VeERhaPGAZc0HVs4fcDKXs+THc=_LFq_iEhWAR8vvURjw@mail.gmail.com>
 <87pmzgk44r.fsf@kernel.org> <b4763ebe-c0ff-2d24-5385-1a1587603280@gmail.com>
 <1f8ed83c-b2e5-327c-30da-56865e2b956b@gmail.com>
Message-ID: <fd8d9a8a-8f57-6559-2053-4607b9da13ab@gmail.com>
Date:   Fri, 2 Apr 2021 21:12:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1f8ed83c-b2e5-327c-30da-56865e2b956b@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi

Op 30-03-2021 om 23:57 schreef Ferry Toth:
> Hi
>
> Op 30-03-2021 om 22:26 schreef Ferry Toth:
>> Hi,
>>
>> Op 30-03-2021 om 18:17 schreef Felipe Balbi:
>>> Hi,
>>>
>>> Andy Shevchenko <andy.shevchenko@gmail.com> writes:
>>>> Hi!
>>>>
>>>> I have a platform with DWC3 in Dual Role mode. Currently I'm
>>>> experimenting on v5.12-rc5 with a few patches (mostly configuration)
>>>> applied [1]. I'm using Debian Unstable on the host machine and
>>>> BuildRoot with the above mentioned kernel on the target.
>>>>
>>>> **So, scenario 0:
>>>> 1. Run iperf3 -s on target
>>>> 2. Run iperf3 -c ... -t 0 on the host
>>>> 3.  0.00-10.36  sec   237 MBytes   192 Mbits/sec                  
>>>> receiver
>>>>
>>>> **Scenario 1:
>>>> 1. Now, detach USB cable, wait for several seconds, attach it back,
>>>> repeat above:
>>>> 0.00-9.94   sec   209 MBytes   176 Mbits/sec receiver
>>>>
>>>> Note the bandwidth drop (177 vs. 192).
>>>>
>>>> (Repeating scenario 1 will give now the same result)
>>>>
>>>> **Scenario 2.
>>>> 1. Detach USB cable, attach a device, for example USB stick,
>>>> 2. See it being enumerated and detach it.
>>>> 3. Attach cable from host
>>>> 4 .   0.00-19.36  sec   315 MBytes   136 Mbits/sec                  
>>>> receiver
>>>>
>>>> Note even more bandwidth drop!
>>>>
>>>> (Repeating scenario 1 keeps the same lower bandwidth)
>>>>
>>>> NOTE, sometimes on this scenario after several seconds the target
>>>> simply reboots (w/o any logs [from kernel] printed)!
>>>>
>>>> So, any pointers on how to debug and what can be a smoking gun here?
>>>>
>>>> Ferry reported this in [2]. There are different kernel versions and
>>>> tools to establish the connection (like connman vs. none in my case).
>>>>
>>>> [1]: https://github.com/andy-shev/linux/
>>>> [2]: https://github.com/andy-shev/linux/issues/31
>>> dwc3 tracepoints should give some initial hints. Look at packets sizes
>>> and period of transmission. From dwc3 side, I can't think of 
>>> anything we
>>> would do to throttle the transmission, but tracepoints should tell a
>>> clearer story.
>>>
>> My testing (but yes, with difference kernel and network managed by 
>> connman) shows:
>>
>> 1) on cold boot eem network gadget works fine
>>
>> 2) after unplug or warm reboot (which is also an unplug) it's broken, 
>> speed is lost (|12.0 Mbits/sec from 200Mb/s normally)|, packets lost, 
>> no configuration received from dhcp, occasional reboot, only way to 
>> fix is cold boot
>>
>> 3) if before unplug `connmanctl disable gadget`, on replugging and 
>> enabling it works fine
>>
>> My theory is that some HW register is disturbed on a surprise unplug, 
>> but not reset on plug or warm boot. But on cold boot is cleared. 
>> Maybe that can help to narrow down tracepoints?
>>
> I captured a plug after warm and after cold boot. This includes 
> network setup (dhcp). You can find it in [2] or directly link here: 
> https://github.com/andy-shev/linux/files/6232410/boot.zip

While the above traces in boot.zip allow compare which regs not 
correctly initialized on warm boot, I have now captured traces of 
unplug/plug.

Here kernel is 5.10.27 (LTS), cold booted with USB cable plugged and the 
eem gadget network setup (dhcp). Then trace unplug. Then trace plug.

After plug the eem connection is again broken.

This might allow figuring out what goes wrong on unplug. Traces here: 
https://github.com/andy-shev/linux/files/6250924/plug-unplug.zip
**

