Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2939353131
	for <lists+linux-usb@lfdr.de>; Sat,  3 Apr 2021 00:41:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231577AbhDBWlE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 2 Apr 2021 18:41:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231160AbhDBWlE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 2 Apr 2021 18:41:04 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B2CAC0613E6
        for <linux-usb@vger.kernel.org>; Fri,  2 Apr 2021 15:41:02 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id l4so9073697ejc.10
        for <linux-usb@vger.kernel.org>; Fri, 02 Apr 2021 15:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Lj8fVi5iueqZ15AvYjD181iX94MjZOWsJFmcEA8mxqU=;
        b=hbd1GOglkDgkIZfpA0Wn0c7TwgnEVFGJUFXUXtFuFUpEPfZlMVr4xFgsSPExtA2/7V
         JJOZywcE9WFUMUbAMbCbqzKFGJjeVTBBZjEPJccrVmUh1CYHPaEn8xujxug/mpvMW0Lk
         coJj4xdQNZVyxnAWrRAJulvcYOLIL8w2n249z+QsL9mnGUoeLoPq7qiVCWE4wqsYjKna
         f5kG1oAUgwEESp7l84+5CQVlA3pKiAHf+Y9r3J70uNfSfCYRgOMQy83Poo6wpZ62rLpK
         pM8sqc2LukOLzdc2Iiuqs0V+PHILRw/Lswp2yicCJL76T3NtfbQp6wBWNQ2xPExCaBhZ
         dBkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Lj8fVi5iueqZ15AvYjD181iX94MjZOWsJFmcEA8mxqU=;
        b=HXfDme+WwgoAeDc2QdW6n87IkrOPsZKhjDKa7TbmbPCzesJOdJ7r/9hdJyE8r5OcW+
         cOy2wSVs1ql5slC7Tx0tiDAnuaGPtQzKTxfkncO/n65b9QHa0Cu538q7zzTmgAtzdln+
         Ak/fv09DZ29fCg9FwJiJdllgrMGG4Z2xrV4/JmTz96n55NZZU57ahBv0xu1ps9Jex4uu
         A4nwnNiJqIqZICFMW5CswmVdCGDRRNx/EV4mpLQrPgSbB2Jkc19IigRKeRnl9ByDjVS0
         DKX7+FwjsUCriwUUagFiKzODCTyD9vvpe1OCS8CCzKxgQBaV6A0TGZmwWLUT1C7JHJND
         rnFg==
X-Gm-Message-State: AOAM533bRNnSyH/KA0pgxj8MTD++wsdo1GmXCUlykcKvQ0UThD1ZeVAy
        D/GGOYnHLG3kxDpMDEZ2oSZI4dvD6pjScQ==
X-Google-Smtp-Source: ABdhPJyKAdNacnXXwJsI8+Q299r6+T9n8wrhrkb7RPq8v5dev2CvGg0mdYTVhwrPxyDodnibv8tMnw==
X-Received: by 2002:a17:906:5450:: with SMTP id d16mr16279500ejp.274.1617403260882;
        Fri, 02 Apr 2021 15:41:00 -0700 (PDT)
Received: from ?IPv6:2001:981:6fec:1:9f6c:d096:1803:82e7? ([2001:981:6fec:1:9f6c:d096:1803:82e7])
        by smtp.gmail.com with ESMTPSA id v8sm6068545edc.30.2021.04.02.15.40.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Apr 2021 15:41:00 -0700 (PDT)
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
From:   Ferry Toth <fntoth@gmail.com>
Message-ID: <ff57b956-a777-3dd6-80ca-4e9afd33ab96@gmail.com>
Date:   Sat, 3 Apr 2021 00:40:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <797f97b8-6558-35c4-2dc5-9deacdf0ba4d@synopsys.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

Op 02-04-2021 om 22:16 schreef Thinh Nguyen:
> Ferry Toth wrote:
>> Hi
>>
>> Op 30-03-2021 om 23:57 schreef Ferry Toth:
>>> Hi
>>>
>>> Op 30-03-2021 om 22:26 schreef Ferry Toth:
>>>> Hi,
>>>>
>>>> Op 30-03-2021 om 18:17 schreef Felipe Balbi:
>>>>> Hi,
>>>>>
>>>>> Andy Shevchenko <andy.shevchenko@gmail.com> writes:
>>>>>> Hi!
>>>>>>
>>>>>> I have a platform with DWC3 in Dual Role mode. Currently I'm
>>>>>> experimenting on v5.12-rc5 with a few patches (mostly configuration)
>>>>>> applied [1]. I'm using Debian Unstable on the host machine and
>>>>>> BuildRoot with the above mentioned kernel on the target.
>>>>>>
>>>>>> **So, scenario 0:
>>>>>> 1. Run iperf3 -s on target
>>>>>> 2. Run iperf3 -c ... -t 0 on the host
>>>>>> 3.  0.00-10.36  sec   237 MBytes   192 Mbits/sec
>>>>>> receiver
>>>>>>
>>>>>> **Scenario 1:
>>>>>> 1. Now, detach USB cable, wait for several seconds, attach it back,
>>>>>> repeat above:
>>>>>> 0.00-9.94   sec   209 MBytes   176 Mbits/sec receiver
>>>>>>
>>>>>> Note the bandwidth drop (177 vs. 192).
>>>>>>
>>>>>> (Repeating scenario 1 will give now the same result)
>>>>>>
>>>>>> **Scenario 2.
>>>>>> 1. Detach USB cable, attach a device, for example USB stick,
>>>>>> 2. See it being enumerated and detach it.
>>>>>> 3. Attach cable from host
>>>>>> 4 .   0.00-19.36  sec   315 MBytes   136 Mbits/sec
>>>>>> receiver
>>>>>>
>>>>>> Note even more bandwidth drop!
>>>>>>
>>>>>> (Repeating scenario 1 keeps the same lower bandwidth)
>>>>>>
>>>>>> NOTE, sometimes on this scenario after several seconds the target
>>>>>> simply reboots (w/o any logs [from kernel] printed)!
>>>>>>
>>>>>> So, any pointers on how to debug and what can be a smoking gun here?
>>>>>>
>>>>>> Ferry reported this in [2]. There are different kernel versions and
>>>>>> tools to establish the connection (like connman vs. none in my case).
>>>>>>
>>>>>> [1]:
>>>>>> https://urldefense.com/v3/__https://github.com/andy-shev/linux/__;!!A4F2R9G_pg!KpQnudHIK6XgK6HbPaqtbVgipDmkNBWewo-euAIuBlGdtSiaQiJ8jLn9OoMEppG6qq-d$
>>>>>> [2]:
>>>>>> https://urldefense.com/v3/__https://github.com/andy-shev/linux/issues/31__;!!A4F2R9G_pg!KpQnudHIK6XgK6HbPaqtbVgipDmkNBWewo-euAIuBlGdtSiaQiJ8jLn9OoMEptMCrp-F$
>>>>>
>>>>> dwc3 tracepoints should give some initial hints. Look at packets sizes
>>>>> and period of transmission. From dwc3 side, I can't think of
>>>>> anything we
>>>>> would do to throttle the transmission, but tracepoints should tell a
>>>>> clearer story.
>>>>>
>>>> My testing (but yes, with difference kernel and network managed by
>>>> connman) shows:
>>>>
>>>> 1) on cold boot eem network gadget works fine
>>>>
>>>> 2) after unplug or warm reboot (which is also an unplug) it's broken,
>>>> speed is lost (|12.0 Mbits/sec from 200Mb/s normally)|, packets lost,
>>>> no configuration received from dhcp, occasional reboot, only way to
>>>> fix is cold boot
>>>>
>>>> 3) if before unplug `connmanctl disable gadget`, on replugging and
>>>> enabling it works fine
>>>>
>>>> My theory is that some HW register is disturbed on a surprise unplug,
>>>> but not reset on plug or warm boot. But on cold boot is cleared.
>>>> Maybe that can help to narrow down tracepoints?
>>>>
>>> I captured a plug after warm and after cold boot. This includes
>>> network setup (dhcp). You can find it in [2] or directly link here:
>>> https://urldefense.com/v3/__https://github.com/andy-shev/linux/files/6232410/boot.zip__;!!A4F2R9G_pg!KpQnudHIK6XgK6HbPaqtbVgipDmkNBWewo-euAIuBlGdtSiaQiJ8jLn9OoMEpjhhrwa-$
>>
>>
>> While the above traces in boot.zip allow compare which regs not
>> correctly initialized on warm boot, I have now captured traces of
>> unplug/plug.
>>
>> Here kernel is 5.10.27 (LTS), cold booted with USB cable plugged and the
>> eem gadget network setup (dhcp). Then trace unplug. Then trace plug.
>>
>> After plug the eem connection is again broken.
>>
>> This might allow figuring out what goes wrong on unplug. Traces here:
>> https://urldefense.com/v3/__https://github.com/andy-shev/linux/files/6250924/plug-unplug.zip__;!!A4F2R9G_pg!KpQnudHIK6XgK6HbPaqtbVgipDmkNBWewo-euAIuBlGdtSiaQiJ8jLn9OoMEpgii82NS$
>> **
>>
> 
> Hi,
> 
> Were you able to narrow down the issue to only DWC3 device? (i.e. you
> tested with different hosts and different device controllers to confirm
> this)

I haven't tried with other devices. I have been forced to replace my 
host mobo and nothing changed. But I didn't pay attention to the 
particular host controller.

> Did you see this issue previously? If not, is it possible to do git
> bisection?

This is with Intel Edison where main line usb gadget support appeared 
around 4.19 iirc. I believed the problem appeared between 5.4 and 5.7 
and tried to bisect but failed.

I realize only now that I failed because:
1) 5.4 already has this issue as I recently retested
2) I didn't use a reproducible criterion. After warm reboot the eem 
gadget fails, but you can flip the host/gadget switch back and forth and 
have the illusion that the connection restored.

The scenario described here is reproducible: leaving the switch in 
gadget mode eem works after cold boot only. And it likely breaks on unplug.

A 2nd hint is that disabling gadget (I used `connmanctl disable gadget` 
but I believe that has the same effect as `iw link set dev usb0 down`) 
before unplug prevents messing up the driver, so you can replug and 
enable again.

> BR,
> Thinh
> 

