Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C3D617B48D
	for <lists+linux-usb@lfdr.de>; Fri,  6 Mar 2020 03:38:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726359AbgCFCiK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 5 Mar 2020 21:38:10 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:40975 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726243AbgCFCiK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 5 Mar 2020 21:38:10 -0500
Received: by mail-lj1-f195.google.com with SMTP id u26so555059ljd.8;
        Thu, 05 Mar 2020 18:38:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=5Ejb77/kP5rR3dsUOvDq7/6r0U9sIU+p/nh5COpXS+k=;
        b=BuJDGvzCS+D3+OyFf2cVEPHPQCAGNNUH//LGJtmJL3/FvbKUDox1LzmgYXZYQUm9a0
         g2nIiboyTuIcOJFa1LBAeJIT1XieHWh2Mmzi8Whci9eZTb/3QuGOJFVQuPgrhQzkdq3i
         T3BlJQSZ6KqxUL79IbGIzfeLIk2stWNLK4fC+YLI7gzI+3Rdxy08WND+En0JNDumi37B
         DizUTChuoh89XVaYFX93bONulvLh2eK7mnIGT+SphhFsUAQNn/wwfprXRRHc0njaEwR2
         WW49SHV7+p4MpAjHMxza0zd1UCPJjXfgE/Er8G2tg0HuQwogM8UZnoqcOd1N5uT8j7ya
         eg7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5Ejb77/kP5rR3dsUOvDq7/6r0U9sIU+p/nh5COpXS+k=;
        b=hCNKjtdKf2hU2aOLyYTXcwMF1Plt1s4EJ6FG1OEed/qu09d0cSdbonDG0JeppYbVIz
         iYZPam+f3eG5o2Gtn7KZrFVFVABvQgkT+vlCAMvp+ov8Sy1Zi4nSeDTXZIJ1D70XlosE
         CHTbStcDXf2Y2HXFxuqXxrW0dgo3siJo2htE0JX+IqUEAd7a18nUaHojntLfSaNYu6hv
         zlX9zB2oESIAPKGVVIG0z6C1TWzd0Rm/YLMwnxC63KFQyB0LOAPvckWWrmr7+lMH5MCm
         idefYeDSSxjESV8r38Pbg/c5pWI8zcxNds7F21xD3qEu2mSCiyppV+eh+qoXp0N70m3v
         bmoQ==
X-Gm-Message-State: ANhLgQ1zpQocJe9f8v1gfSnu4dSJ4S3haU6x2IphtsxKZJ69NbA16oV7
        CPobP0R3gXjQA/GVmYLzo+RhFudm
X-Google-Smtp-Source: ADFU+vv6duXD3049KQLQOtCZFQOAephwq4mnYr+djiK5IEmglZtjTQyB6WBS8QrdFEtkt4WX08Lt4Q==
X-Received: by 2002:a2e:8893:: with SMTP id k19mr638026lji.55.1583462287683;
        Thu, 05 Mar 2020 18:38:07 -0800 (PST)
Received: from [192.168.2.145] (94-29-39-224.dynamic.spd-mgts.ru. [94.29.39.224])
        by smtp.googlemail.com with ESMTPSA id z18sm11984983ljm.15.2020.03.05.18.38.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2020 18:38:07 -0800 (PST)
Subject: Re: usb: chipidea: udc: BUG: sleeping function called from invalid
 context
To:     Peter Chen <peter.chen@nxp.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <bfa5b2f7-cf52-0055-ffb2-2cb8278a1181@gmail.com>
 <20200305021226.GA12837@b29397-desktop>
 <7a142dd4-9ae8-2560-e5be-25648f88a864@gmail.com>
 <20200306015344.GA29800@b29397-desktop>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <a000d34c-acae-18e7-f690-0cb3deb85d31@gmail.com>
Date:   Fri, 6 Mar 2020 05:38:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200306015344.GA29800@b29397-desktop>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

06.03.2020 04:53, Peter Chen пишет:
> On 20-03-05 23:53:46, Dmitry Osipenko wrote:
>> 05.03.2020 05:12, Peter Chen пишет:
>>> On 20-03-04 19:10:08, Dmitry Osipenko wrote:
>>>> Hello,
>>>>
>>>> I was trying out today's linux-next-20200304 and noticed this splat in KMSG:
>>>>
>> ...
>>>> I haven't tried to figure out what change causes this problem, it didn't
>>>> happen using next-20200218. Please take a look, thanks in advance.
>>>
>>> Dmitry, thanks for reporting. I haven't met that issue, it maybe I
>>> enable runtime pm, but you have not? So I don't trigger
>>> "dev->power.runtime_status != RPM_ACTIVE" condition below
>>>
>>> 	might_sleep_if(!(rpmflags & RPM_ASYNC) && !dev->power.irq_safe &&
>>> 			dev->power.runtime_status != RPM_ACTIVE);
>>
>> The runtime PM always presents on Tegra, do you have
>> CONFIG_DEBUG_ATOMIC_SLEEP=y in the kernel's config?
>>
> 
> No, the reason should be "dev->power.runtime_status != RPM_ACTIVE", your
> ci device's runtime may not be active at that time, if I move the spinlock
> above pm_runtime_get_sync at ci_hdrc_gadget_connect, I could reproduce it
> too.
> 
> I enabled CONFIG_DEBUG_ATOMIC_SLEEP, but can't reproduce the dump
> without above changes.

It happened using a setup where UDC is set to a hardcoded USBNET
peripheral-mode, the splat happened as soon as UDC is probed and cable
is plugged.

I'm not sure whether RPM needs to be explicitly enabled for the CI
device by the tegra_udc_driver. If yes, then indeed Tegra's CI driver
doesn't support RPM and it should be in a disabled state.
