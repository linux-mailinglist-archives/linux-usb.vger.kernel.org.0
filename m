Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B1FF019139B
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2020 15:50:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728065AbgCXOuP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 24 Mar 2020 10:50:15 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:33169 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727453AbgCXOuM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 24 Mar 2020 10:50:12 -0400
Received: by mail-lj1-f193.google.com with SMTP id f20so3020765ljm.0
        for <linux-usb@vger.kernel.org>; Tue, 24 Mar 2020 07:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=46/qQ50l1vh+J9wzA3xpUZxvvo8d7tioQFsg4+TJ/o8=;
        b=bvYpkG8m/ns3rG4ZA+zT/M4MjsHPmDeoGGnpZ5cpYzMvSfGA4iOGMFepedJZweWbNe
         2iyBmESEUeF6IAQJfDmsoYgZ5UsV0INu6mmp3Yare9tsponpOhbkMHgg+tPLmXvgBtpe
         8jeYLQx+pLubdj8l4AUXte+u0jX5TjBmNmpw79Qd/FNhuoQS4mUrMfs6399CzGjQNsxt
         +cIiJC7mz00fj6BWt/lAM9WLf99bZ7mzCNNef1hULoqwBw6HjopoNZdlf8423OjoRHx+
         34/AGy3xW1NxXaHFhRAmQu0tBqSNYOitMsFSXZBpS8G4+ZNExQxXFjHa75IYB247HWho
         VgYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=46/qQ50l1vh+J9wzA3xpUZxvvo8d7tioQFsg4+TJ/o8=;
        b=luojmlicYDSA2/cPQ4/LuE7Wxxk2Mvjr496jaUkfTEmJmL0pbeMU6W/b9mC6589TXJ
         T3+2OMOsOU7Trasde/5YWmTyEojWdAsRzSqPHZl60BWzGu/I9ftqUgioRl4ldXjW26sM
         YtWvdL9v7sh0Z/2bxwALX2MXeXgiarO5r6SWjU55Osid5CZpAOy4KXiAIpX8Y7SngT/C
         hMIJv7tm20eLolc+VajotEoRHr63chP6kmUhMcXqgKMahTzbMycwKp+1ErBPpiGrsUVN
         qXu/pmjdGQz5R2yMCFVE/5+p8Owhvlt0UQSxCsOyQ9hetNHjQIGtVbZCLWg4itDp1zBn
         2ABg==
X-Gm-Message-State: ANhLgQ2WT5T/RIrDgtZkyjQo7HnmBpyg3P0lQ/FfFgAW5faSNxoryby7
        bFNpcug5uXkzvjw7fnnQ6rEgoA==
X-Google-Smtp-Source: ADFU+vsduWqt1Gs363mlpwe4KUHBbe4xPS+tER4rFbeA45hsI3KGrYgm1BWdEuzCSeE6tQZKCp8hmQ==
X-Received: by 2002:a2e:9f07:: with SMTP id u7mr11833365ljk.115.1585061409797;
        Tue, 24 Mar 2020 07:50:09 -0700 (PDT)
Received: from wasted.cogentembedded.com ([2a00:1fa0:42d3:3567:1f77:9f32:8c0:b337])
        by smtp.gmail.com with ESMTPSA id x11sm1431543ljm.7.2020.03.24.07.50.08
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Mar 2020 07:50:09 -0700 (PDT)
Subject: Re: [PATCH v2]usb: gadget: bcm63xx_udc:remove redundant variable
 assignment
To:     Tang Bin <tangbin@cmss.chinamobile.com>, cernekee@gmail.com,
        balbi@kernel.org, gregkh@linuxfoundation.org
Cc:     f.fainelli@gmail.com, bcm-kernel-feedback-list@broadcom.com,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20200324132029.16296-1-tangbin@cmss.chinamobile.com>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <a0afd44f-177d-ad21-02b5-93b15b29399e@cogentembedded.com>
Date:   Tue, 24 Mar 2020 17:50:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20200324132029.16296-1-tangbin@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello!

On 03/24/2020 04:20 PM, Tang Bin wrote:

> --v1------------------------------------
> In this function, the variable 'rc' is assigned after this place,
> so the definition is invalid.
> 
> --v2------------------------------------
> In this function, the variable 'rc' will be assigned by the function
> 'usb_add_gadget_udc()',so the assignment here is redundant,we should
> remove it.
> 
> Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>

   NAK.

> ---
>  drivers/usb/gadget/udc/bcm63xx_udc.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/usb/gadget/udc/bcm63xx_udc.c b/drivers/usb/gadget/udc/bcm63xx_udc.c
> index 54501814d..a7afa8c35 100644
> --- a/drivers/usb/gadget/udc/bcm63xx_udc.c
> +++ b/drivers/usb/gadget/udc/bcm63xx_udc.c
> @@ -2321,8 +2321,6 @@ static int bcm63xx_udc_probe(struct platform_device *pdev)
>  	if (rc)
>  		return rc;
>  
> -	rc = -ENXIO;
> -
>  	/* IRQ resource #0: control interrupt (VBUS, speed, etc.) */
>  	irq = platform_get_irq(pdev, 0);
>  	if (irq < 0)

   This *if* branch goes to the 'out_uninit' label which uses 'rc' (and it should
be negative).
   In principle, if you change 'rc' to 'irq' below, this patch would be sane.
It's not as is.

MBR, Sergei
