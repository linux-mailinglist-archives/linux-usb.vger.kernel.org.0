Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8843F277417
	for <lists+linux-usb@lfdr.de>; Thu, 24 Sep 2020 16:34:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728332AbgIXOeI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 24 Sep 2020 10:34:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728088AbgIXOeD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 24 Sep 2020 10:34:03 -0400
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAE3FC0613CE;
        Thu, 24 Sep 2020 07:34:03 -0700 (PDT)
Received: by mail-oi1-x242.google.com with SMTP id 185so3818813oie.11;
        Thu, 24 Sep 2020 07:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fq0zugItcF1BHyiJdFIvA0GVCu5hDXXnGo1JwlqfSGg=;
        b=Mu5iS2/0yA25dRJ+hSiXFp1spYUCVWRChGOvq0ZDyVdw2zBXq2WEOgY89IvmQv3HCh
         YONAaO9oxQJhopBcThva44JMtywEzVb59OwGMjMM2EjUwS81d7ESQVZpwG0RIYx0294w
         WOPXCZKnULZbzo9X3uYvMBl70H1y9gGKvlW/bj8uT6QQHUqDmvqn8oMhNmcJZvuKkaAk
         tW48ooe45RG4ARae8WQpl9Dxbduo+HncUvIseUD63ABm1BAwgv4t7jwq/SOPES/Yo0yM
         n+jUb+Nz3+6wr2Czqu0VSMZO0Cm16KE/2nIb6wUlFztwIlOZt2S4xHL/dEV3TtBj8+s0
         sIcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=fq0zugItcF1BHyiJdFIvA0GVCu5hDXXnGo1JwlqfSGg=;
        b=psb0FnMtentpE7e48ONCxv0pBIhHhYYbRN0ikruBbDbWWInaO/s3fjYaxVNsC/vxE2
         zXhXxyZVRTqQO5uO5Dmox3raRibE5lhaFeKqMrGdw/B3Pvx7F9gdEGEOpvc5zVCgovkO
         9ATexRjvIdpdcQMe/7xzL0S9yAIB1a0LsgfeOU09Qbdh/y/CeR+f9jZt9NLknOm0RK9u
         ykA/HOcmuZ0mfRQUQi3PrhDWZkpmUakAP6PK6GvaXAGIzT7lXID0sni3ksn9amGHp3iU
         k1Y0l5AMhiB9kFGsYD5kUKzxB8RmwQueBCroC1skVKXxonI/ehJi56DpLD0HiKJT7L71
         XQKA==
X-Gm-Message-State: AOAM530/rlZNWRnmiixSAkrbuMziq2QMHEzarw5PGwYfMTi6TECukXpa
        NvdWsJel2HcHfLtE8HPPFjKpX/AMf34=
X-Google-Smtp-Source: ABdhPJw3yFrHa8qGybEJzkGOucvz9sGZrrMAAPNfMEj4FrmozO0rUHrCqSrK2GQjl/FxbMDo9ElN8w==
X-Received: by 2002:aca:1716:: with SMTP id j22mr2743559oii.44.1600958041613;
        Thu, 24 Sep 2020 07:34:01 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d22sm730454oij.0.2020.09.24.07.34.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2020 07:34:01 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH -next] usb: typec: Remove set but not used variable
To:     Li Heng <liheng40@huawei.com>, heikki.krogerus@linux.intel.com
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1600956767-10427-1-git-send-email-liheng40@huawei.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <fe671faa-9975-be20-22f5-31a97e3c8859@roeck-us.net>
Date:   Thu, 24 Sep 2020 07:33:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1600956767-10427-1-git-send-email-liheng40@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 9/24/20 7:12 AM, Li Heng wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/usb/typec/tcpm/tcpm.c:1620:39: warning:
> ‘tcpm_altmode_ops’ defined but not used [-Wunused-const-variable=]
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Li Heng <liheng40@huawei.com>

I thought there was a patch series underway which started using it,
but maybe my memory defeats me. Either case, it doesn't make much sense
to remove the ops variable without removing the associated functions
as well.

Guenter

> ---
>  drivers/usb/typec/tcpm/tcpm.c | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index 9280654..1542eaa 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -1617,12 +1617,6 @@ static int tcpm_altmode_vdm(struct typec_altmode *altmode,
>  	return 0;
>  }
> 
> -static const struct typec_altmode_ops tcpm_altmode_ops = {
> -	.enter = tcpm_altmode_enter,
> -	.exit = tcpm_altmode_exit,
> -	.vdm = tcpm_altmode_vdm,
> -};
> -
>  /*
>   * PD (data, control) command handling functions
>   */
> --
> 2.7.4
> 


