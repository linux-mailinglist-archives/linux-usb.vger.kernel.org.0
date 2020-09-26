Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECF9527989A
	for <lists+linux-usb@lfdr.de>; Sat, 26 Sep 2020 12:51:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726309AbgIZKvp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 26 Sep 2020 06:51:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726183AbgIZKvn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 26 Sep 2020 06:51:43 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC2D6C0613D3
        for <linux-usb@vger.kernel.org>; Sat, 26 Sep 2020 03:51:42 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id f1so679267plo.13
        for <linux-usb@vger.kernel.org>; Sat, 26 Sep 2020 03:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Erv0okPrqcm4hiPfazJ3B+MEgGbrmkvfiAwUSBMTHes=;
        b=YfemzFvwe1AUIq1uBazHfToqDWIuf2mqgxJ2LU1hQxwGCiJqts77x+ngut+gKDqhyu
         L0jV/If4cXfKQgI7ofmQQtAASru2NifOZd2OyX48v5BGSlzEhQZc31S2AhbYotm0THAo
         EnrPESbJ1zEL+w9o8+2tkV9jWWrpDUr6/KCW49HHdbIO62g8Ab/dTtniiVi/JUANGaNK
         Lrn+ye0CnzQS7a2YmpA+hU/1/cq5tj4KQ88CaZyfGIx7IDfvnEBB1XzTCVrMXB5aBgGJ
         5Cuqx87fw4us0mVuVmRuuBqnVrp12zGKKKdOgHIcdOKk+It1htLYK11CkzUjZhbgjykB
         FzEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Erv0okPrqcm4hiPfazJ3B+MEgGbrmkvfiAwUSBMTHes=;
        b=CgNFrklduVhxa+msPuU/7WQKL3I91H19ElMWx2QA645EJq/EL10CrdUmoEVfkx8tqO
         +ayGVNHu+Mqh/wJY1D29EA7q/1KAISLqZ6QhQnHidPnWfT10SjYy5v1BcMbtrt69wvC7
         c+v+EsFn25w4deXeybQX4BlT/hn15qwcdRYMnmz4KMMMLOnqqqK42a6AMYTrw44DkmRL
         3Ja98+ikwXuB9qty3YVQtYo+k8Sh/OgtMwTz02BSRfEU/n444S4E3juEjcEJpkAS7vVG
         j4VAHCbbIBLjmG8Mn4ciGtJeL+kjQqrsVIHLKjh0TT0tJsHCxmrVbQXUdmIrkibiuWVP
         BYmg==
X-Gm-Message-State: AOAM533F2VyiJDEXZOE1kQbZdP9YTP2BkpIX7mUUGA3eDwjbZo/cGEp1
        aDpFo62wMUGqis3+iQDRMbWNMA==
X-Google-Smtp-Source: ABdhPJyMU8iWdKoFGvrBKhvoBnMIbxxzkFSzD5yj9YM1Q2QfdUWp4vx7kR8Mt1Q+SkQai4c6OUnaSw==
X-Received: by 2002:a17:90a:9708:: with SMTP id x8mr1666114pjo.213.1601117502248;
        Sat, 26 Sep 2020 03:51:42 -0700 (PDT)
Received: from [192.168.1.134] ([66.219.217.173])
        by smtp.gmail.com with ESMTPSA id w185sm5619297pfc.36.2020.09.26.03.51.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Sep 2020 03:51:41 -0700 (PDT)
Subject: Re: Deadlock under load with Linux 5.9 and other recent kernels
To:     Christian Hewitt <christianshewitt@gmail.com>,
        linux-block@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-amlogic@lists.infradead.org
Cc:     furkan@fkardame.com, Brad Harper <bjharper@gmail.com>
References: <5878AC01-8A1B-4F39-B4BD-BDDEFAECFAA2@gmail.com>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <4a51f6d8-486b-73ee-0585-f2154aa90a83@kernel.dk>
Date:   Sat, 26 Sep 2020 04:51:40 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <5878AC01-8A1B-4F39-B4BD-BDDEFAECFAA2@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 9/26/20 1:55 AM, Christian Hewitt wrote:
> I am using an ARM SBC device with Amlogic S922X chip (Beelink
> GS-King-X, an Android STB) to boot the Kodi mediacentre distro
> LibreELEC (which I work on) although the issue is also reproducible
> with Manjaro and Armbian on the same hardware, and with the GT-King
> and GT-King Pro devices from the same vendor - all three devices are
> using a common dtsi:
> 
> https://github.com/chewitt/linux/blob/amlogic-5.9-integ/arch/arm64/boot/dts/amlogic/meson-g12b-gsking-x.dts
> https://github.com/chewitt/linux/blob/amlogic-5.9-integ/arch/arm64/boot/dts/amlogic/meson-g12b-gtking-pro.dts
> https://github.com/chewitt/linux/blob/amlogic-5.9-integ/arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dts
> https://github.com/chewitt/linux/blob/amlogic-5.9-integ/arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi
> 
> I have schematics for the devices, but can only share those privately
> on request.
> 
> For testing I am booting LibreELEC from SD card. The box has a 4TB
> SATA drive internally connected with a USB > SATA bridge, see dmesg:
> http://ix.io/2yLh and I connect a USB stick with a 4GB ISO file that I
> copy to the internal SATA drive. Within 10-20 seconds of starting the
> copy the box deadlocks needing a hard power cycle to recover. The
> timing of the deadlock is variable but the device _always_ deadlocks.
> Although I am using a simple copy use-case, there are similar reports
> in Armbian forums performing tasks like installs/updates that involve
> I/O loads.
> 
> Following advice in the #linux-amlogic IRC channel I added
> CONFIG_SOFTLOCKUP_DETECTOR and CONFIG_DETECT_HUNG_TASK and was able to
> get output on the HDMI screen (it is not possible to connect to UART
> pins without destroying the box case). If you advance the following
> video frame by frame in VLC you can see the output:
> 
> https://www.dropbox.com/s/klvcizim8cs5lze/lockup_clip.mov?dl=0

Try with this patch:

https://lore.kernel.org/linux-block/20200925191902.543953-1-shakeelb@google.com/

-- 
Jens Axboe

