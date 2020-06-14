Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFA411F87B8
	for <lists+linux-usb@lfdr.de>; Sun, 14 Jun 2020 10:50:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726851AbgFNIu1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 14 Jun 2020 04:50:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726755AbgFNIu0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 14 Jun 2020 04:50:26 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3130C03E969
        for <linux-usb@vger.kernel.org>; Sun, 14 Jun 2020 01:50:24 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id c21so7777505lfb.3
        for <linux-usb@vger.kernel.org>; Sun, 14 Jun 2020 01:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=zRg9XKIL4vBu4icocKftZKBDvYCe4QXeJ3tHeratzYk=;
        b=UDLnelPfwlf525l+MyBjVDfxPBd2Oe89tkH5Gi/pAQNqFNVnQuBubyBZijjlGBtnJR
         VF2YE93Btypk75ygsyas50iz61OirOjcoNmrpTPjnZ0MVJtzkTrxaUBpjkP0jDxfIP0f
         FfvFr1xZlC1NaIID0JMIoVcAEkUQs0ECam5XakY7UIgiQR9mzYtyFJai1wAXympJNwy7
         G3ca8HzdwHUjS4hXr5ni2T6RNvqznH5tFxR6UhC6b4Lqi/oFnt2MKeSGhAH4j4IVFSGi
         gx+hLFnie7/jlzvJJiG+AaC2+6PDctR7ay0roquujQ8wAsevGKxHtwoc0cAl43JLHEvf
         ZAEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zRg9XKIL4vBu4icocKftZKBDvYCe4QXeJ3tHeratzYk=;
        b=Kr0HBDtyT5KPsvP3Rv/Oa6sTaG1jXStWPrt3U/uypFH5mZocfeRiopFuIs+L+A60T1
         pYbNsx1heo0VGNNR+jpFVqTdzqYqtAuCIFxD075LM8OybqAZC5AMyG7qdhdzR8uvMdYL
         B/F9ucc/U5ghNEMi96p8fDtuDW9pnEDBVFeUcW6VQHk01vXbhOhL74aoid/NQUJyS4kp
         4mZYRrRyyebOxhBxaxzCQWvS6zQ+aiJOSDPyzyFJj0lFIYoXNdTCEXp7Bd/B8nKmy9/T
         8r6r+ujygIyAbRcDMJWZ+sWGN63LtYGiRv1dq5By5dvA5yq7yWMrHgkIT5VBZwzLY1mT
         0zgQ==
X-Gm-Message-State: AOAM533VynGX3xSxOzoA3rn+P0hdquQyOkwK6PfUHzKo+feFEt+SkvXk
        CsaQA5xsevZFan21hZDCqKwjjg==
X-Google-Smtp-Source: ABdhPJy5o7xwjtDRjce0A+7PCgU9ZEZGrjzSHYQmSs2+SswKlfCozNnp/FVZLU2hmh8PR0XP4hmSfA==
X-Received: by 2002:a05:6512:3089:: with SMTP id z9mr601823lfd.83.1592124623089;
        Sun, 14 Jun 2020 01:50:23 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:42e0:5405:a560:8954:33ef:54e2? ([2a00:1fa0:42e0:5405:a560:8954:33ef:54e2])
        by smtp.gmail.com with ESMTPSA id n21sm3166415ljj.97.2020.06.14.01.50.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Jun 2020 01:50:22 -0700 (PDT)
Subject: Re: [PATCH] usb: dwc3: pci: Fix reference count leak in
 dwc3_pci_resume_work
To:     Aditya Pakki <pakki001@umn.edu>
Cc:     kjlu@umn.edu, wu000273@umn.edu, Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200614031525.128556-1-pakki001@umn.edu>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <2e8e923c-3f3d-29ff-6abf-ae333b81bd45@cogentembedded.com>
Date:   Sun, 14 Jun 2020 11:50:18 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200614031525.128556-1-pakki001@umn.edu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello!

On 14.06.2020 6:15, Aditya Pakki wrote:

> dwc3_pci_resume_work() calls pm_runtime_get_sync() that increments
> the reference counter. In case of failure, decrement the reference
> count and return the error.

    In this case you still return nothing.

> 
> Signed-off-by: Aditya Pakki <pakki001@umn.edu>
> ---
>   drivers/usb/dwc3/dwc3-pci.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-pci.c b/drivers/usb/dwc3/dwc3-pci.c
> index b67372737dc9..96c05b121fac 100644
> --- a/drivers/usb/dwc3/dwc3-pci.c
> +++ b/drivers/usb/dwc3/dwc3-pci.c
> @@ -206,8 +206,10 @@ static void dwc3_pci_resume_work(struct work_struct *work)
>   	int ret;
>   
>   	ret = pm_runtime_get_sync(&dwc3->dev);
> -	if (ret)
> +	if (ret) {
> +		pm_runtime_put_sync_autosuspend(&dwc3->dev);
>   		return;
> +	}
>   
>   	pm_runtime_mark_last_busy(&dwc3->dev);
>   	pm_runtime_put_sync_autosuspend(&dwc3->dev);

MBR, Sergei
