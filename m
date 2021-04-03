Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCD033533B1
	for <lists+linux-usb@lfdr.de>; Sat,  3 Apr 2021 13:25:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236586AbhDCLZg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 3 Apr 2021 07:25:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236484AbhDCLZf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 3 Apr 2021 07:25:35 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2250CC0613E6
        for <linux-usb@vger.kernel.org>; Sat,  3 Apr 2021 04:25:31 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id o19so7794021edc.3
        for <linux-usb@vger.kernel.org>; Sat, 03 Apr 2021 04:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=NW0Kb6xoyGB7CU5JuG/6bAP0I75k++8A4gV5roCOciE=;
        b=t6eN8SJXNfc1p4xJcxG0WiTmxKWN81Q3sS156jThB1fOdCaVfkrPxdh9O6DCOu1Ezb
         9sv5994O+a3Pn9XS34IpVcxs1Ne9SlbpJs+8uirZly1W4tdIbTWy37pG/+EiYvxH1uNa
         gNWmMcoUZncMhORnuzerYbcYoRhx9jWzkwpuDnJ4xDtOAwAC/CrYxWkmH89AIB7o5dga
         gQFZuhVmD46Ub22CdTH9fD1nvu49i390hqq9MkGFUuxKncrMGyS3Mzmb0WbTFqfOBcUJ
         /Eo42+n/i9hgZW75TlX1TmoeLhPycYHywIAPMQEQXPP5lOPEaoVkIpGaPnGYggHAJFTo
         0C7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=NW0Kb6xoyGB7CU5JuG/6bAP0I75k++8A4gV5roCOciE=;
        b=ZVMIQH0nS3wzjhTekUIKjdJNa768PG1j4IGpWz6WXQ9V0AO6I+18ZZRnZ5az1zfXay
         btmvw4F28nk6/+8jeuEAOVKmCfptZSnsns//ScUghMWV/G8hVO9P7oKDbw7wC0029dqc
         MhxGIkBQxpibHVLH3iPEPzVWsA/dTQus134LWgxWrwrLsP8VWcRuoba7zOmSpQKy4lXa
         fyStEmoOeQldFEWUJCRiiFsgTA1ANk7bRFhhsYeTkA29KvIU6Z//NT+gsIvb3R8HX0vq
         U0MCPPW1h9pSxu0hp09GrQvs/OQHh2zYmoig6B0PBfpDBNv1S0v1rYg9IXFTfpEP+V2X
         1o7Q==
X-Gm-Message-State: AOAM532iS2v6JQ54gUOoe0zWMkSzcxEJJwoco5Sb2JFDwWatWz/ve6ke
        gHphVfZKM+CJW/YGCkhpjHTEg3U+6biVgQ==
X-Google-Smtp-Source: ABdhPJyVmXI13PcKN/MAUFv/QSrexBxIUnIaa19yxn+IMkRbNESUHRn8anGJ+PvKmxKaCkUmXyJx1A==
X-Received: by 2002:a05:6402:1004:: with SMTP id c4mr20758220edu.364.1617449128926;
        Sat, 03 Apr 2021 04:25:28 -0700 (PDT)
Received: from ?IPv6:2001:981:6fec:1:d04d:c759:3c14:7d0f? ([2001:981:6fec:1:d04d:c759:3c14:7d0f])
        by smtp.gmail.com with ESMTPSA id wr20sm5337614ejb.111.2021.04.03.04.25.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Apr 2021 04:25:28 -0700 (PDT)
Subject: Re: USB network gadget / DWC3 issue
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Felipe Balbi <balbi@kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        USB <linux-usb@vger.kernel.org>
References: <CAHp75VeERhaPGAZc0HVs4fcDKXs+THc=_LFq_iEhWAR8vvURjw@mail.gmail.com>
 <87pmzgk44r.fsf@kernel.org> <b4763ebe-c0ff-2d24-5385-1a1587603280@gmail.com>
 <1f8ed83c-b2e5-327c-30da-56865e2b956b@gmail.com>
 <fd8d9a8a-8f57-6559-2053-4607b9da13ab@gmail.com>
 <797f97b8-6558-35c4-2dc5-9deacdf0ba4d@synopsys.com>
 <ff57b956-a777-3dd6-80ca-4e9afd33ab96@gmail.com>
 <6b3a28eb-7809-d319-d58d-520c1c7fa5d2@synopsys.com>
From:   Ferry Toth <fntoth@gmail.com>
Message-ID: <4a0869c9-6b71-5acd-e670-e4c06b44d62d@gmail.com>
Date:   Sat, 3 Apr 2021 13:25:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <6b3a28eb-7809-d319-d58d-520c1c7fa5d2@synopsys.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

Op 03-04-2021 om 04:02 schreef Thinh Nguyen:
> Ferry Toth wrote:
>> Hi,
>>
>> Op 02-04-2021 om 22:16 schreef Thinh Nguyen:
>>> Ferry Toth wrote:
>>>> Hi
>>>>
>>>> Op 30-03-2021 om 23:57 schreef Ferry Toth:
>>>>> Hi
>>>>>
>>>>> Op 30-03-2021 om 22:26 schreef Ferry Toth:
>>>>>> Hi,
>>>>>>
>>>>>> Op 30-03-2021 om 18:17 schreef Felipe Balbi:
>>>>>>> Hi,
>>>>>>>
>>>>>>> Andy Shevchenko <andy.shevchenko@gmail.com> writes:
>>>>>>>> Hi!
>>>>>>>>
>>>>>>>> I have a platform with DWC3 in Dual Role mode. Currently I'm
>>>>>>>> experimenting on v5.12-rc5 with a few patches (mostly configuration)
>>>>>>>> applied [1]. I'm using Debian Unstable on the host machine and
>>>>>>>> BuildRoot with the above mentioned kernel on the target.
>>>>>>>>
>>>>>>>> **So, scenario 0:
>>>>>>>> 1. Run iperf3 -s on target
>>>>>>>> 2. Run iperf3 -c ... -t 0 on the host
>>>>>>>> 3.  0.00-10.36  sec   237 MBytes   192 Mbits/sec
>>>>>>>> receiver
>>>>>>>>
>>>>>>>> **Scenario 1:
>>>>>>>> 1. Now, detach USB cable, wait for several seconds, attach it back,
>>>>>>>> repeat above:
>>>>>>>> 0.00-9.94   sec   209 MBytes   176 Mbits/sec receiver
>>>>>>>>
>>>>>>>> Note the bandwidth drop (177 vs. 192).
>>>>>>>>
>>>>>>>> (Repeating scenario 1 will give now the same result)
>>>>>>>>
>>>>>>>> **Scenario 2.
>>>>>>>> 1. Detach USB cable, attach a device, for example USB stick,
>>>>>>>> 2. See it being enumerated and detach it.
>>>>>>>> 3. Attach cable from host
>>>>>>>> 4 .   0.00-19.36  sec   315 MBytes   136 Mbits/sec
>>>>>>>> receiver
>>>>>>>>
>>>>>>>> Note even more bandwidth drop!
>>>>>>>>
>>>>>>>> (Repeating scenario 1 keeps the same lower bandwidth)
>>>>>>>>
>>>>>>>> NOTE, sometimes on this scenario after several seconds the target
>>>>>>>> simply reboots (w/o any logs [from kernel] printed)!
>>>>>>>>
>>>>>>>> So, any pointers on how to debug and what can be a smoking gun here?
>>>>>>>>
>>>>>>>> Ferry reported this in [2]. There are different kernel versions and
>>>>>>>> tools to establish the connection (like connman vs. none in my
>>>>>>>> case).
>>>>>>>>
>>>>>>>> [1]:
>>>>>>>> https://urldefense.com/v3/__https://github.com/andy-shev/linux/__;!!A4F2R9G_pg!KpQnudHIK6XgK6HbPaqtbVgipDmkNBWewo-euAIuBlGdtSiaQiJ8jLn9OoMEppG6qq-d$
>>>>>>>>
>>>>>>>> [2]:
>>>>>>>> https://urldefense.com/v3/__https://github.com/andy-shev/linux/issues/31__;!!A4F2R9G_pg!KpQnudHIK6XgK6HbPaqtbVgipDmkNBWewo-euAIuBlGdtSiaQiJ8jLn9OoMEptMCrp-F$
>>>>>>>>
>>>>>>> dwc3 tracepoints should give some initial hints. Look at packets
>>>>>>> sizes
>>>>>>> and period of transmission. From dwc3 side, I can't think of
>>>>>>> anything we
>>>>>>> would do to throttle the transmission, but tracepoints should tell a
>>>>>>> clearer story.
>>>>>>>
>>>>>> My testing (but yes, with difference kernel and network managed by
>>>>>> connman) shows:
>>>>>>
>>>>>> 1) on cold boot eem network gadget works fine
>>>>>>
>>>>>> 2) after unplug or warm reboot (which is also an unplug) it's broken,
>>>>>> speed is lost (|12.0 Mbits/sec from 200Mb/s normally)|, packets lost,
>>>>>> no configuration received from dhcp, occasional reboot, only way to
>>>>>> fix is cold boot
>>>>>>
>>>>>> 3) if before unplug `connmanctl disable gadget`, on replugging and
>>>>>> enabling it works fine
>>>>>>
>>>>>> My theory is that some HW register is disturbed on a surprise unplug,
>>>>>> but not reset on plug or warm boot. But on cold boot is cleared.
>>>>>> Maybe that can help to narrow down tracepoints?
>>>>>>
>>>>> I captured a plug after warm and after cold boot. This includes
>>>>> network setup (dhcp). You can find it in [2] or directly link here:
>>>>> https://urldefense.com/v3/__https://github.com/andy-shev/linux/files/6232410/boot.zip
>>>>>
>>>>
>>>> While the above traces in boot.zip allow compare which regs not
>>>> correctly initialized on warm boot, I have now captured traces of
>>>> unplug/plug.
>>>>
>>>> Here kernel is 5.10.27 (LTS), cold booted with USB cable plugged and the
>>>> eem gadget network setup (dhcp). Then trace unplug. Then trace plug.
>>>>
>>>> After plug the eem connection is again broken.
>>>>
>>>> This might allow figuring out what goes wrong on unplug. Traces here:
>>>> https://urldefense.com/v3/__https://github.com/andy-shev/linux/files/6250924/plug-unplug.zip
>>>>
>>>> **
>>>>
>>> Hi,
>>>
>>> Were you able to narrow down the issue to only DWC3 device? (i.e. you
>>> tested with different hosts and different device controllers to confirm
>>> this)
>> I haven't tried with other devices. I have been forced to replace my
>> host mobo and nothing changed. But I didn't pay attention to the
>> particular host controller.
>>
> It'd be better if we can narrow down the culprit as this seems to me
> like a synchronization issue at the upper layer between the host and device.
>
>>> Did you see this issue previously? If not, is it possible to do git
>>> bisection?
>> This is with Intel Edison where main line usb gadget support appeared
>> around 4.19 iirc. I believed the problem appeared between 5.4 and 5.7
>> and tried to bisect but failed.
>>
>> I realize only now that I failed because:
>> 1) 5.4 already has this issue as I recently retested
> I'm confused, why do you believe the problem is between 5.4 and 5.7 if
> 5.4 already has this issue? So when did you start seeing this problem?

Because at the time of 5.4 I didn't notice the issue as I normally did 
cold boots due to other problems on warm boot (i.e. sdhc inaccessible).

I never new that on a cold boot it works. Even during bisecting I didn't 
know until the end, and then I found 5.4 has the same problem as all the 
later kernels (tested up to 5.11)

> Also, these kernel versions are really old, there's been a lot of
> updates/fixes to dwc3 since then. Can we run tests on the latest kernel?

I have tested 5.10.27, 5.11.0 and 5.11.4-rt11.

But of course I am completely prepared to run Andy's latest (v5.12-rc5) 
on the device.

>> 2) I didn't use a reproducible criterion. After warm reboot the eem
>> gadget fails, but you can flip the host/gadget switch back and forth and
>> have the illusion that the connection restored.
>>
>> The scenario described here is reproducible: leaving the switch in
>> gadget mode eem works after cold boot only. And it likely breaks on unplug.
>>
>> A 2nd hint is that disabling gadget (I used `connmanctl disable gadget`
>> but I believe that has the same effect as `iw link set dev usb0 down`)
>> before unplug prevents messing up the driver, so you can replug and
>> enable again.
> These data points are good. However, we'd need to know where to look
> first. The issue isn't obvious from the DWC3 controller or the DWC3 driver.
>
> Can you check a few things:
> 1) Any error/timeout messages from the host's dmesg? Or device side?

I'll add log from the host side.

For now I only see (on a warm plug):

kernel: usb 1-11: can't set config #1, error -110

> 2) What kernel version is your host using? Can you use the latest for
> both host and device?

The host is ubuntu's amd64 5.8.0-48-generic.

I will test with v5.12-rc5  from ubuntu kernel ppa on the host. And 
Andy's latest (v5.12-rc5) on the device.

I am expecting results this evening.

> 3) Snapshot of dwc3 tracepoints of active transfers between the normal
> vs throttled of the latest kernel

I don't know if the problem I see is really throttling.

I can trace an active transfer, but that does actually throttle from 
200Mb/s down to 139MB/s and produces a trace of 53MB. (2x1sec of iperf3).

> BR,
> Thinh
