Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1585F34F3D4
	for <lists+linux-usb@lfdr.de>; Tue, 30 Mar 2021 23:57:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232533AbhC3V5R (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 30 Mar 2021 17:57:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232853AbhC3V5M (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 30 Mar 2021 17:57:12 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9131C061574
        for <linux-usb@vger.kernel.org>; Tue, 30 Mar 2021 14:57:11 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id x21so19912061eds.4
        for <linux-usb@vger.kernel.org>; Tue, 30 Mar 2021 14:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=82nay8yEdvuwrFofKltnfpGYEKBga45rJov9fQTvVQI=;
        b=i6/GuwMwAsHWGfr5jUvezn9D+ykc70UtuKb+QlQM/8NgLSglUrcqPXZAo2qJUhE/et
         MIDWUnCp9pbwxJT2L6U3VZQuZELw6GiNUziTuVIt24rqq8MIxVBY6vAs6sH1rAkKsxU3
         UUBr19ZWocWB2KW+PQHe54ZhS6Qjo3TIwUHbW7hA1ZBXnV5kQjS73PLWnboGEO/55Fb/
         m4krUIzHNC98lr3xxQBhXLGpKz2ju+w4/lj5ZeG4x2hhjV2p/HswmpA8C5R5rYR0vZbu
         q7Mwa0JIvQZZvy3Bs+IhzTxzXYYpjlkFiJTsSX78ZtazkDF1g+7yoCwHElSUpqMw9toH
         x6/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=82nay8yEdvuwrFofKltnfpGYEKBga45rJov9fQTvVQI=;
        b=FLp36MPk4xEoaKKtE0zHcxOQ3xGoJe4zhhE7Lw9Szoim9IISgA6HQo+yWbfj1QWWSP
         1BlfhFwxDcwzSJ27VXomy0Kc6odXrfZHA5d7NUnJ+B7RclJRs0zqgTD4qtfgrwPkdlCN
         +Gzmg10uwGzy6tdprM1eJsiD89M/dtN2fjSF3/8wi7HLhHsYk7v8bZckeOWe30KkZ3x5
         fIZCKsHDs6ovajgOqn78enpL6INdXr9zhAyt1lweOO10TfKkpEy8FXA7vWTJBH3aOgzh
         qVa/M4BY9XgX6CO+xnrE9CqElhRTuiP+dnWpUzKy/vtur02C1q14lrXwrgV06EzoLPWS
         kHNw==
X-Gm-Message-State: AOAM533HBR7rYhRPz/KdjU2h8Pu5H8LpAKcM4Y/EaSHnXQn4kJweHZD/
        OMFVmv44Ax6KHOduWNoUp2l2jDvsNZQjzw==
X-Google-Smtp-Source: ABdhPJx9aEeEYEzaLIWjmNjbsSptVonp0AMBLaJVoJRPctVF9tZ0/a8bBtBMPs56rSxnrCqeej7maw==
X-Received: by 2002:a05:6402:180b:: with SMTP id g11mr35298723edy.195.1617141430464;
        Tue, 30 Mar 2021 14:57:10 -0700 (PDT)
Received: from ?IPv6:2001:981:6fec:1:9e42:5683:e7bc:2765? ([2001:981:6fec:1:9e42:5683:e7bc:2765])
        by smtp.gmail.com with ESMTPSA id m14sm203174edr.13.2021.03.30.14.57.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Mar 2021 14:57:10 -0700 (PDT)
Subject: Re: USB network gadget / DWC3 issue
From:   Ferry Toth <fntoth@gmail.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        USB <linux-usb@vger.kernel.org>
References: <CAHp75VeERhaPGAZc0HVs4fcDKXs+THc=_LFq_iEhWAR8vvURjw@mail.gmail.com>
 <87pmzgk44r.fsf@kernel.org> <b4763ebe-c0ff-2d24-5385-1a1587603280@gmail.com>
Message-ID: <1f8ed83c-b2e5-327c-30da-56865e2b956b@gmail.com>
Date:   Tue, 30 Mar 2021 23:57:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <b4763ebe-c0ff-2d24-5385-1a1587603280@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi

Op 30-03-2021 om 22:26 schreef Ferry Toth:
> Hi,
>
> Op 30-03-2021 om 18:17 schreef Felipe Balbi:
>> Hi,
>>
>> Andy Shevchenko <andy.shevchenko@gmail.com> writes:
>>> Hi!
>>>
>>> I have a platform with DWC3 in Dual Role mode. Currently I'm
>>> experimenting on v5.12-rc5 with a few patches (mostly configuration)
>>> applied [1]. I'm using Debian Unstable on the host machine and
>>> BuildRoot with the above mentioned kernel on the target.
>>>
>>> **So, scenario 0:
>>> 1. Run iperf3 -s on target
>>> 2. Run iperf3 -c ... -t 0 on the host
>>> 3.  0.00-10.36  sec   237 MBytes   192 Mbits/sec                  
>>> receiver
>>>
>>> **Scenario 1:
>>> 1. Now, detach USB cable, wait for several seconds, attach it back,
>>> repeat above:
>>> 0.00-9.94   sec   209 MBytes   176 Mbits/sec receiver
>>>
>>> Note the bandwidth drop (177 vs. 192).
>>>
>>> (Repeating scenario 1 will give now the same result)
>>>
>>> **Scenario 2.
>>> 1. Detach USB cable, attach a device, for example USB stick,
>>> 2. See it being enumerated and detach it.
>>> 3. Attach cable from host
>>> 4 .   0.00-19.36  sec   315 MBytes   136 Mbits/sec                  
>>> receiver
>>>
>>> Note even more bandwidth drop!
>>>
>>> (Repeating scenario 1 keeps the same lower bandwidth)
>>>
>>> NOTE, sometimes on this scenario after several seconds the target
>>> simply reboots (w/o any logs [from kernel] printed)!
>>>
>>> So, any pointers on how to debug and what can be a smoking gun here?
>>>
>>> Ferry reported this in [2]. There are different kernel versions and
>>> tools to establish the connection (like connman vs. none in my case).
>>>
>>> [1]: https://github.com/andy-shev/linux/
>>> [2]: https://github.com/andy-shev/linux/issues/31
>> dwc3 tracepoints should give some initial hints. Look at packets sizes
>> and period of transmission. From dwc3 side, I can't think of anything we
>> would do to throttle the transmission, but tracepoints should tell a
>> clearer story.
>>
> My testing (but yes, with difference kernel and network managed by 
> connman) shows:
>
> 1) on cold boot eem network gadget works fine
>
> 2) after unplug or warm reboot (which is also an unplug) it's broken, 
> speed is lost (|12.0 Mbits/sec from 200Mb/s normally)|, packets lost, 
> no configuration received from dhcp, occasional reboot, only way to 
> fix is cold boot
>
> 3) if before unplug `connmanctl disable gadget`, on replugging and 
> enabling it works fine
>
> My theory is that some HW register is disturbed on a surprise unplug, 
> but not reset on plug or warm boot. But on cold boot is cleared. Maybe 
> that can help to narrow down tracepoints?
>
I captured a plug after warm and after cold boot. This includes network 
setup (dhcp). You can find it in [2] or directly link here: 
https://github.com/andy-shev/linux/files/6232410/boot.zip
