Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F2CE311431
	for <lists+linux-usb@lfdr.de>; Fri,  5 Feb 2021 23:06:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232010AbhBEWBd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 5 Feb 2021 17:01:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232848AbhBEO5n (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 5 Feb 2021 09:57:43 -0500
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com [IPv6:2607:f8b0:4864:20::d2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C65AEC0613D6
        for <linux-usb@vger.kernel.org>; Fri,  5 Feb 2021 08:27:58 -0800 (PST)
Received: by mail-io1-xd2e.google.com with SMTP id n2so7683284iom.7
        for <linux-usb@vger.kernel.org>; Fri, 05 Feb 2021 08:27:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=SObCFvJWvT4UVqb+E58Op6zrc9dB+bI5wGYOJnbuJAQ=;
        b=GdVqplaWe9OEABeTa2ii+Zhl7ZyCnwPpuQYBMqDzt8Ln/ydNfp4R9TtJk3NwVIBq1/
         rnHj6ngrIOBDs7vAE8r5XtlVWwfGlRluPQoybrDQqWQ2HD1nSuyJfPFvOPYQfN+fmJzl
         Kkx30Kr6qCxkY4nxGy/A9iSVTbs6y38hgRCGc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=SObCFvJWvT4UVqb+E58Op6zrc9dB+bI5wGYOJnbuJAQ=;
        b=r/MS/RL6FmZEo6zUhnWRiIhsTCVP/XaONcbUWyULnsl7QpCNs0MzWfzBsNiLrrz5PS
         90yR6Ljp8MO0ODK0N7PhgJdPqqoY7Z7PAwrEiGqAPWgvq9ovJ4T8GeUT3SRChAVWp6Yr
         TkYWZAfHReF8aGwSRIkEHttBGzdbRLJD8tvTjvcuqHb9kVAWtKUBa7rQi3MsjkS7QbCS
         eNsNzEaAmAfaKLHy2bIpgUXX9VSWs6cy8YfKw1KdBl5EYpzk/NeSmk9mU/af490+6Nh8
         TZ7OPcIJc3I6fnKgSVqJLVssPNLJZqht8vwO/nqt1h5gVHyRAFORf76+S7yZMfxBNXkV
         LslA==
X-Gm-Message-State: AOAM5319VQ77dwg1fenhS8kG1lf7hGR6B3MHOVwf1QhSbp7I1WT4FTzK
        sSvy0vtPMsCdK6QSGolNGuQ77gD7fgUgAg==
X-Google-Smtp-Source: ABdhPJxUISzDJiX0t3XkrjdflCUoB1xV1sF6KR7E/6Wjl3Cq8hJy+4GC06pQadudwpBhnkKt46BBOg==
X-Received: by 2002:a05:6602:1243:: with SMTP id o3mr4808294iou.47.1612542478263;
        Fri, 05 Feb 2021 08:27:58 -0800 (PST)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id f15sm4353737ilj.23.2021.02.05.08.27.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Feb 2021 08:27:57 -0800 (PST)
Subject: Re: [PATCH] usb: usbip: fix error handling of kthread_get_run()
To:     Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>
Cc:     Hillf Danton <hdanton@sina.com>, linux-usb@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>,
        Shuah Khan <skhan@linuxfoundation.org>
References: <000000000000414db905b6e9bae8@google.com>
 <20210205135707.4574-1-penguin-kernel@I-love.SAKURA.ne.jp>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <6b2b9f7c-a412-0f52-3373-bc58d1e95ad9@linuxfoundation.org>
Date:   Fri, 5 Feb 2021 09:27:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210205135707.4574-1-penguin-kernel@I-love.SAKURA.ne.jp>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2/5/21 6:57 AM, Tetsuo Handa wrote:
> syzbot is reporting a crash at vhci_shutdown_connection() [1]. It turned
> out that it was not a NULL pointer dereference but an ERR_PTR(-EINTR)
> pointer dereference, for kthread_create() became killable due to
> commit 786235eeba0e1e85 ("kthread: make kthread_create() killable").
> 
> When SIGKILLed while attach_store() is calling kthread_get_run(),
> ERR_PTR(-EINTR) is stored into vdev->ud.tcp_{rx,tx}, and then
> kthread_stop_put() is called on vdev->ud.tcp_{rx,tx} from
> vhci_shutdown_connection() because vdev->ud.tcp_{rx,tx} != NULL.
> 
> Prior to commit 9720b4bc76a83807 ("staging/usbip: convert to kthread"),
> "current" pointer is assigned to vdev->ud.tcp_{rx,tx} by usbip_thread()
> kernel thread, and hence vdev->ud.tcp_{rx,tx} != NULL meant a valid task
> pointer. Therefore, we should make kthread_get_run() return NULL when
> kthread_create() failed.
> 
> [1] https://syzkaller.appspot.com/bug?id=c21c07f3d51769405e8efc027bdb927515dcc7d6
> 
> Reported-by: syzbot <syzbot+a93fba6d384346a761e3@syzkaller.appspotmail.com>
> Reported-by: syzbot <syzbot+bf1a360e305ee719e364@syzkaller.appspotmail.com>
> Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
> Fixes: 9720b4bc76a83807 ("staging/usbip: convert to kthread")
> Cc: Arnd Bergmann <arnd@arndb.de>
> ---
>   drivers/usb/usbip/usbip_common.h | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/usb/usbip/usbip_common.h b/drivers/usb/usbip/usbip_common.h
> index 8be857a4fa13..a7c68097aa1d 100644
> --- a/drivers/usb/usbip/usbip_common.h
> +++ b/drivers/usb/usbip/usbip_common.h
> @@ -286,6 +286,8 @@ struct usbip_device {
>   	if (!IS_ERR(__k)) {						   \
>   		get_task_struct(__k);					   \
>   		wake_up_process(__k);					   \
> +	} else {							   \
> +		__k = NULL;						   \
>   	}								   \
>   	__k;								   \
>   })
> 

Good find. For this fix to be complete, you will have to add checks
for kthread_get_run() NULL return in attach_store() and
usbip_sockfd_store() routines in stub_dev.c and vudc_sysfs.c

thanks,
-- Shuah
