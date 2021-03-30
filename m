Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55D5C34F21B
	for <lists+linux-usb@lfdr.de>; Tue, 30 Mar 2021 22:27:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229734AbhC3U02 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 30 Mar 2021 16:26:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229940AbhC3U0M (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 30 Mar 2021 16:26:12 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CDBDC061574
        for <linux-usb@vger.kernel.org>; Tue, 30 Mar 2021 13:26:12 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id u9so26706394ejj.7
        for <linux-usb@vger.kernel.org>; Tue, 30 Mar 2021 13:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=xS7/7ZQdyrLKvxLKppBZmy7OhXhB13Qpvah0Cs+pCn0=;
        b=DZVJjT+p52Xo+0+h0JprqLTiUMq6xtUtmxwm1DMx2T3FodNsZ8Bf/DXPLvjb5tp0ib
         wIrVmpFCPmEYSYnMU9OxoQFFrFIWPGHpJWOr2DlOO+H6pMJAXuV0cQHAwTAoGsGujmN4
         M96vj71lFeqcmPXsCEn15fSXmm7QTuWbBgkDsr+UxO8yYnBCwmg05dAQj+lfOrRSud84
         dSazpFIdFfv0uGkdg5NUpMD2Wl/QKNAg6puU4RxfzA60hopx/n1wvCpkR/6KHiFShGUU
         ec86lNNfppbE9ZnLplKWda0wO/45Up9+KIi3ISpAnwa7v/4mql/24VdrTsTOYW+0QZ4o
         MZKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=xS7/7ZQdyrLKvxLKppBZmy7OhXhB13Qpvah0Cs+pCn0=;
        b=BL6fD0x8t/fe3mWNQqgop+RqZwrNNhv1/PCi5F5gYkqwXUQtPra2/eECxblIVONn4T
         iZcryRaDR1GSPyCrE+O63xn55vJ0K+XwqX4LbyqDvnNbA84DXW33zBOxvvB0EkM7u5D0
         08TyU1nTmkgmz/XIFPuaEHRcjb7LBkaKzTxK63oXfKWW6iwYPNUcJSir+h5I/KufjkX9
         vPbWiVZYcPrOs4rVv3brldIXLKz5NqgIVvJVviHR9u6TxzB9D1BKrbhyOBqtTC+bLN5B
         XGCaoYtW3Si9ik/6sj2rI2VgFMtVzGlcJiv8WkNEbZ2EHa7BR7b1B0O+lTzY4z5WZLvP
         65jw==
X-Gm-Message-State: AOAM530cvaGRpp9ItJBOvViXnb+2oN9+uE+KzpRJ2cMar0cfLcQk+goU
        0xPye4cG/NckgPofdoafeSQ3pASs9aRD2Q==
X-Google-Smtp-Source: ABdhPJypIEHhpSc5w2bzOpP0gxFsEpafgFcsngn5Hp0utd/gmD43/Afk1gtTU57jSqhOj43O0nhIjw==
X-Received: by 2002:a17:906:3388:: with SMTP id v8mr35644913eja.278.1617135970867;
        Tue, 30 Mar 2021 13:26:10 -0700 (PDT)
Received: from ?IPv6:2001:981:6fec:1:d92a:1507:d2ab:1417? ([2001:981:6fec:1:d92a:1507:d2ab:1417])
        by smtp.gmail.com with ESMTPSA id c17sm83980edw.32.2021.03.30.13.26.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Mar 2021 13:26:10 -0700 (PDT)
Subject: Re: USB network gadget / DWC3 issue
To:     Felipe Balbi <balbi@kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        USB <linux-usb@vger.kernel.org>
References: <CAHp75VeERhaPGAZc0HVs4fcDKXs+THc=_LFq_iEhWAR8vvURjw@mail.gmail.com>
 <87pmzgk44r.fsf@kernel.org>
From:   Ferry Toth <fntoth@gmail.com>
Message-ID: <b4763ebe-c0ff-2d24-5385-1a1587603280@gmail.com>
Date:   Tue, 30 Mar 2021 22:26:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <87pmzgk44r.fsf@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

Op 30-03-2021 om 18:17 schreef Felipe Balbi:
> Hi,
>
> Andy Shevchenko <andy.shevchenko@gmail.com> writes:
>> Hi!
>>
>> I have a platform with DWC3 in Dual Role mode. Currently I'm
>> experimenting on v5.12-rc5 with a few patches (mostly configuration)
>> applied [1]. I'm using Debian Unstable on the host machine and
>> BuildRoot with the above mentioned kernel on the target.
>>
>> **So, scenario 0:
>> 1. Run iperf3 -s on target
>> 2. Run iperf3 -c ... -t 0 on the host
>> 3.  0.00-10.36  sec   237 MBytes   192 Mbits/sec                  receiver
>>
>> **Scenario 1:
>> 1. Now, detach USB cable, wait for several seconds, attach it back,
>> repeat above:
>> 0.00-9.94   sec   209 MBytes   176 Mbits/sec                  receiver
>>
>> Note the bandwidth drop (177 vs. 192).
>>
>> (Repeating scenario 1 will give now the same result)
>>
>> **Scenario 2.
>> 1. Detach USB cable, attach a device, for example USB stick,
>> 2. See it being enumerated and detach it.
>> 3. Attach cable from host
>> 4 .   0.00-19.36  sec   315 MBytes   136 Mbits/sec                  receiver
>>
>> Note even more bandwidth drop!
>>
>> (Repeating scenario 1 keeps the same lower bandwidth)
>>
>> NOTE, sometimes on this scenario after several seconds the target
>> simply reboots (w/o any logs [from kernel] printed)!
>>
>> So, any pointers on how to debug and what can be a smoking gun here?
>>
>> Ferry reported this in [2]. There are different kernel versions and
>> tools to establish the connection (like connman vs. none in my case).
>>
>> [1]: https://github.com/andy-shev/linux/
>> [2]: https://github.com/andy-shev/linux/issues/31
> dwc3 tracepoints should give some initial hints. Look at packets sizes
> and period of transmission. From dwc3 side, I can't think of anything we
> would do to throttle the transmission, but tracepoints should tell a
> clearer story.
>
My testing (but yes, with difference kernel and network managed by 
connman) shows:

1) on cold boot eem network gadget works fine

2) after unplug or warm reboot (which is also an unplug) it's broken, 
speed is lost (|12.0 Mbits/sec from 200Mb/s normally)|, packets lost, no 
configuration received from dhcp, occasional reboot, only way to fix is 
cold boot

3) if before unplug `connmanctl disable gadget`, on replugging and 
enabling it works fine

My theory is that some HW register is disturbed on a surprise unplug, 
but not reset on plug or warm boot. But on cold boot is cleared. Maybe 
that can help to narrow down tracepoints?

