Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79E062798C5
	for <lists+linux-usb@lfdr.de>; Sat, 26 Sep 2020 14:14:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726409AbgIZMN6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 26 Sep 2020 08:13:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726183AbgIZMN6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 26 Sep 2020 08:13:58 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83D99C0613CE
        for <linux-usb@vger.kernel.org>; Sat, 26 Sep 2020 05:13:58 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id u24so4640692pgi.1
        for <linux-usb@vger.kernel.org>; Sat, 26 Sep 2020 05:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=aRXjYNPvAllPLssAHFUtgdpWvskcOPt9BvCCI5W6OtA=;
        b=Ka2QDCWgyF4jROThlTol1M5vTtwbiqi4LO/EVRotYTxBJa1C/tMH8FdKgjnEYC19zJ
         G6Fx8w4z8QsN8X5o+1dH9EBvmmyIp0x+a7fGR/nOq5xiHvAXu/WaLZo0CxlaGHiE4E3r
         Rqkd/xhG8bTMonE93mkRb42DKW+oVBqOjERjHngcdE0HaNRTGl8fG+6G7FhUrwbiQKvV
         NlODNQS2WyXJLCeBr9jGQfjcBSVss6VcJQpijYByZENLads2kYZtRrdWIt5pVg4PKFqn
         OFl9vdvRFBhCnIqHeLvk30bHRYawE+Hh6RdtqgK+ubwKeIY6cVwLZ0/wo0IWrMIXJFQA
         ewJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=aRXjYNPvAllPLssAHFUtgdpWvskcOPt9BvCCI5W6OtA=;
        b=MxuABUqfpWHLWvtdlB5oKjGE3xdzkNWaSQ9xwPcg+ut8A/Yfbj0s5eKdDmnN2k2iZD
         Q5aangbZv0tEHsEL8iNYvwDk4O1gai8mrX16Us/RYvNH9MXyxqVlGoR00Q2XoCuYDL9C
         LuA/60pIiI3RPPSA8ABNIJkIgAAkayUe0a5BNdMOvarrHRYRRJgVkYXwFN2lZe2rpKVF
         C+x4EJeyIu1niuBWV/3+00LBDrzuJDbjuw6EgBIJ+HIE+3uS0UCgQ8C2jne8xfv8K2I3
         hfx7tS8dSM0CC7+2puN+JcQMhoz5OILaJ14MC002/IbYYOUWViTVhkgDmlTT39qGqBWi
         vFug==
X-Gm-Message-State: AOAM530UnUJW4E/3GZJ0Z2FEQMy6BHk6NnX6pESiTSc092IQllUPUbsc
        Fbp7+ooOkenlYwoezczQOrdY6w==
X-Google-Smtp-Source: ABdhPJzBir37uzxTY1+XemYaduPLOJdPSP7mTT1f5/5h2CUIjJ+5isOPmF/PCvy93XO0y3tSQ9AT0w==
X-Received: by 2002:a63:4945:: with SMTP id y5mr2532416pgk.181.1601122437798;
        Sat, 26 Sep 2020 05:13:57 -0700 (PDT)
Received: from [192.168.1.134] ([66.219.217.173])
        by smtp.gmail.com with ESMTPSA id i62sm5571842pfe.140.2020.09.26.05.13.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Sep 2020 05:13:57 -0700 (PDT)
Subject: Re: Deadlock under load with Linux 5.9 and other recent kernels
To:     Christian Hewitt <christianshewitt@gmail.com>
Cc:     linux-block@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-amlogic@lists.infradead.org, furkan@fkardame.com,
        Brad Harper <bjharper@gmail.com>
References: <5878AC01-8A1B-4F39-B4BD-BDDEFAECFAA2@gmail.com>
 <4a51f6d8-486b-73ee-0585-f2154aa90a83@kernel.dk>
 <EE8C801E-0AD8-43E2-9C65-92CD512904BE@gmail.com>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <c431ae48-6913-acc0-dc0a-b52065e9eaed@kernel.dk>
Date:   Sat, 26 Sep 2020 06:13:56 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <EE8C801E-0AD8-43E2-9C65-92CD512904BE@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 9/26/20 5:55 AM, Christian Hewitt wrote:
>>
>> On 26 Sep 2020, at 2:51 pm, Jens Axboe <axboe@kernel.dk> wrote:
>>
>> On 9/26/20 1:55 AM, Christian Hewitt wrote:
>>> I am using an ARM SBC device with Amlogic S922X chip (Beelink
>>> GS-King-X, an Android STB) to boot the Kodi mediacentre distro
>>> LibreELEC (which I work on) although the issue is also reproducible
>>> with Manjaro and Armbian on the same hardware, and with the GT-King
>>> and GT-King Pro devices from the same vendor - all three devices are
>>> using a common dtsi:
>>>
>>> https://github.com/chewitt/linux/blob/amlogic-5.9-integ/arch/arm64/boot/dts/amlogic/meson-g12b-gsking-x.dts
>>> https://github.com/chewitt/linux/blob/amlogic-5.9-integ/arch/arm64/boot/dts/amlogic/meson-g12b-gtking-pro.dts
>>> https://github.com/chewitt/linux/blob/amlogic-5.9-integ/arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dts
>>> https://github.com/chewitt/linux/blob/amlogic-5.9-integ/arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi
>>>
>>> I have schematics for the devices, but can only share those privately
>>> on request.
>>>
>>> For testing I am booting LibreELEC from SD card. The box has a 4TB
>>> SATA drive internally connected with a USB > SATA bridge, see dmesg:
>>> http://ix.io/2yLh and I connect a USB stick with a 4GB ISO file that I
>>> copy to the internal SATA drive. Within 10-20 seconds of starting the
>>> copy the box deadlocks needing a hard power cycle to recover. The
>>> timing of the deadlock is variable but the device _always_ deadlocks.
>>> Although I am using a simple copy use-case, there are similar reports
>>> in Armbian forums performing tasks like installs/updates that involve
>>> I/O loads.
>>>
>>> Following advice in the #linux-amlogic IRC channel I added
>>> CONFIG_SOFTLOCKUP_DETECTOR and CONFIG_DETECT_HUNG_TASK and was able to
>>> get output on the HDMI screen (it is not possible to connect to UART
>>> pins without destroying the box case). If you advance the following
>>> video frame by frame in VLC you can see the output:
>>>
>>> https://www.dropbox.com/s/klvcizim8cs5lze/lockup_clip.mov?dl=0
>>
>> Try with this patch:
>>
>> https://lore.kernel.org/linux-block/20200925191902.543953-1-shakeelb@google.com/
> 
> It still locks up approx. 25 seconds into the copy operation. Here’s the output in video again (a little blurry):
> 
> https://www.dropbox.com/s/3j2czaq509arg6g/lockup_clip2.mov?dl=0

Can you try and set CONFIG_SLUB in your .config instead of CONFIG_SLAB?

Also, just take a picture, should be easier to get readable than a video.
And the static trace is all that is needed.

-- 
Jens Axboe

