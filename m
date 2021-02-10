Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E6B7316E3D
	for <lists+linux-usb@lfdr.de>; Wed, 10 Feb 2021 19:15:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233527AbhBJSOq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 10 Feb 2021 13:14:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233545AbhBJSMc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 10 Feb 2021 13:12:32 -0500
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com [IPv6:2607:f8b0:4864:20::d31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62390C061756
        for <linux-usb@vger.kernel.org>; Wed, 10 Feb 2021 10:11:52 -0800 (PST)
Received: by mail-io1-xd31.google.com with SMTP id s24so2881007iob.6
        for <linux-usb@vger.kernel.org>; Wed, 10 Feb 2021 10:11:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=q4mUa7k5MLEJr5RJa0R4jnsvw+Ac9MUmELVVT4WwOSQ=;
        b=Lysg3WfI6NNP28jF+vNLnR8yCJw9p0REJLFVbVzp0wUrAll/8Jl0n+a5EM1PErXBf5
         j5Z6oSnv546UVwfNdT1PGpmmluHoL10HvKJYoXJGQrADS+la6CMcZMmcxCIvNAu9O7Nw
         lHS0Mz5RipXkJuYojf452sqMzBgbqio9eMFis=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=q4mUa7k5MLEJr5RJa0R4jnsvw+Ac9MUmELVVT4WwOSQ=;
        b=F8UGgf4M7+Z+LNJXDLp1j8LG8hEyaMxjUu3paLQte5RQH/MoNO/Dz5sBOvMTjapH2e
         Auzzk+MNAZQbdlv4YDniPgquoz/5HJaERegFRvWCxWxNwV434rxzDsX/8k6LPlT/JVC3
         ctZjOQ/Ca6pI6zTq9MhIQZWylCNPPAoEcvyNV4fV7m+Hy5Hmxysyj777LNGabl55EdRb
         bmXsFDompWZksd8YA+zVVDZwf0u35WPmhd5GA139nnjbLAHHasysfKUuEvisEwqthZHc
         qKumu5BNKRBVhKZCaG9v6amtm9pLF0cGCV5nMj5xGlPLzbIvqLgsT3Vfwak2DzHwMfeH
         2mCg==
X-Gm-Message-State: AOAM5300nQaNCk8rKUI1D7rdLR8kd71BnCYKIeb7fbDUYaqWBPmESuIh
        IiEI41vIoK090fdiuHiE3xVivg==
X-Google-Smtp-Source: ABdhPJztrKXzzER4bktr+C2ysd8blOry5LkVOT2urldPVKqMQUvVfTuVOXiULo5SeRNEUuM3/2m3Kg==
X-Received: by 2002:a05:6638:d8a:: with SMTP id l10mr4665562jaj.2.1612980711890;
        Wed, 10 Feb 2021 10:11:51 -0800 (PST)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id 4sm1380767ilj.22.2021.02.10.10.11.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Feb 2021 10:11:31 -0800 (PST)
Subject: Re: [PATCH] usb: usbip: fix error handling of kthread_get_run()
To:     Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>,
        Shuah Khan <skhan@linuxfoundation.org>
Cc:     Hillf Danton <hdanton@sina.com>, linux-usb@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>
References: <000000000000414db905b6e9bae8@google.com>
 <20210205135707.4574-1-penguin-kernel@I-love.SAKURA.ne.jp>
 <6b2b9f7c-a412-0f52-3373-bc58d1e95ad9@linuxfoundation.org>
 <ee936421-66ea-c6a7-fa1e-d4077ab28ed0@i-love.sakura.ne.jp>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <1f4b36a1-460e-1154-b46c-32ba72b88205@linuxfoundation.org>
Date:   Wed, 10 Feb 2021 11:11:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <ee936421-66ea-c6a7-fa1e-d4077ab28ed0@i-love.sakura.ne.jp>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2/5/21 6:08 PM, Tetsuo Handa wrote:
> On 2021/02/06 1:27, Shuah Khan wrote:
>> Good find. For this fix to be complete, you will have to add checks
>> for kthread_get_run() NULL return in attach_store() and
>> usbip_sockfd_store() routines in stub_dev.c and vudc_sysfs.c
> 
> Initially I thought that the cleaner fix is to get kthread_create() out of kthread_get_run()
> ( the drivers/usb/usbip/vhci_sysfs.c portion in
> https://syzkaller.appspot.com/x/patch.diff?x=16c3c090d00000 ) so that we can undo
> kthread_create() via kthread_stop(). But I found that such fix makes little sense because
> it is possible that SIGKILL is delivered between vhci_rx_loop() and vhci_tx_loop() have
> started and before leaving attach_store().
> 
> Since the code prior to "staging/usbip: convert to kthread" was already capable of surviving
> such race condition, this patch should be already good enough for sending to stable kernels.
> Of course, since kthread_create() may return -ENOMEM without being SIGKILLed, we could update
> attach_store() to report kthread_get_run() failure to the caller, but that will be a separate
> patch. This patch alone avoids the crash although there is a hung task problem similar to
> https://syzkaller.appspot.com/bug?id=5677eeeb83e5d47ef2b04e9bd68f5ff4c7e572ab remains
> ( https://syzkaller.appspot.com/text?tag=CrashReport&x=17aa3f78d00000 ). The cause of hung
> task is currently unknown; maybe too much printk() messages.
> 

I would like to see to see a complete fix. This patch changes
kthread_get_run() to return NULL. Without adding handling for
NULL in the callers of kthread_get_run(), we will start seeing
problems.

Does this patch fix the problem syzbot found?

thanks,
-- Shuah
