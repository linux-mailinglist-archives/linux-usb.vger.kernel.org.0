Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02BD131CCE7
	for <lists+linux-usb@lfdr.de>; Tue, 16 Feb 2021 16:25:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229628AbhBPPZA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 16 Feb 2021 10:25:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229916AbhBPPY5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 16 Feb 2021 10:24:57 -0500
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C409C061574
        for <linux-usb@vger.kernel.org>; Tue, 16 Feb 2021 07:24:17 -0800 (PST)
Received: by mail-ot1-x336.google.com with SMTP id v16so923011ote.12
        for <linux-usb@vger.kernel.org>; Tue, 16 Feb 2021 07:24:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GQgze0gzSLrNUNtJ8yF91CHQI87PYIdc5JpUp7/Sh2k=;
        b=jynlTHAujnS8zZn+6VSbT1lrjW2D06ghpvvrtPOGyqK3u3HsfNGobNj4la2WL2G2M9
         aR7RNTELpx5q5bGXJ9t8pB/G6y17kwpFzongifqEtpChF/8ZvLDAtMepA++RNPW8MmpI
         Bgv04wyWwt4XpA7i2eAZRZ4pTp8SNMmUmjUGfG4EuU4GUsA4rH6hbx7RvMSvO4IZoIbY
         qbe0mj4YSf4SpA9qDeqif6/7GzSHYpaKG3gAufw95IRZIi1mkZHUHfw/J+/iqI2hCqUX
         mD4YnFm7AbJGeEON/CztWTI+N7zLToj1Kzo4XDkvYngQ6PXNNrJLT4j5ZKYEfMOdsfIN
         aSoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=GQgze0gzSLrNUNtJ8yF91CHQI87PYIdc5JpUp7/Sh2k=;
        b=KfGk+7pyaCxnyDeDrv86ASxsNEcEW6kVefRdFhDeHkHq8rMyHnA15b/mdQV+DACvma
         ZZDDNk/zFdBqDOB+U5sbLYownn+ok47Dv6UVlt1lvj46qrKG+LFUfuP1X5PeWlYNmDh3
         NndfI47Of2GTn4rCRlgK2iMWEbtBSznzluza3y9BpzxNP+5F1iVP4dmzsNcneyGNCGkK
         CRGAMVvZ4mKefv268sPOU3kZoQ7ID9YVgjqcZiLBrJ5ZUSZYvA2LvH9/SLxT/4i7Ussk
         P/RV+AspmK3dS8G/lUJtI8d8GlvTyXfmsNQIW4GZYZGfDqjmVLo02PsL4xZsN04xqxxH
         E+vA==
X-Gm-Message-State: AOAM530y0bxr0DAokOabWsr/hMGqCmHdiDK255uPQ7PX9A+AYOVu+Shi
        ISUTFWWWqy6J97okzX5f2lE=
X-Google-Smtp-Source: ABdhPJwGqMgCJ0pnhsC7+gaXQ7zfZDTHSAcNWAcHkDYyU1SW4QCgl16VKIw2jffSVTzS3+9A/Guq9w==
X-Received: by 2002:a9d:4506:: with SMTP id w6mr3777995ote.261.1613489056535;
        Tue, 16 Feb 2021 07:24:16 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id g11sm4728604oif.9.2021.02.16.07.24.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Feb 2021 07:24:16 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH 5/6] USB: typec: fusb302: create debugfs subdir for the
 driver
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
References: <20210216144645.3813043-1-gregkh@linuxfoundation.org>
 <20210216144645.3813043-5-gregkh@linuxfoundation.org>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <46f9d74a-85a5-835b-208a-c612e2c56199@roeck-us.net>
Date:   Tue, 16 Feb 2021 07:24:14 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210216144645.3813043-5-gregkh@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2/16/21 6:46 AM, Greg Kroah-Hartman wrote:
> The single debugfs file for this driver really is a log file, so make a
> subdir and call it "log" to make it obvious this is what it is for.
> This makes cleanup simpler as we just remove the whole directory, no
> need to handle individual files anymore.
> 
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Cc: linux-usb@vger.kernel.org
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

I'd probably have explored the possibility to group files like this
under the newly created tcpm debugfs directory, but that is really
a nitpick.

Guenter

> ---
>  drivers/usb/typec/tcpm/fusb302.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fusb302.c
> index ebc46b9f776c..7a2a17866a82 100644
> --- a/drivers/usb/typec/tcpm/fusb302.c
> +++ b/drivers/usb/typec/tcpm/fusb302.c
> @@ -213,8 +213,9 @@ static void fusb302_debugfs_init(struct fusb302_chip *chip)
>  
>  	mutex_init(&chip->logbuffer_lock);
>  	snprintf(name, NAME_MAX, "fusb302-%s", dev_name(chip->dev));
> -	chip->dentry = debugfs_create_file(name, S_IFREG | 0444, usb_debug_root,
> -					   chip, &fusb302_debug_fops);
> +	chip->dentry = debugfs_create_dir(name, usb_debug_root);
> +	debugfs_create_file("log", S_IFREG | 0444, chip->dentry, chip,
> +			    &fusb302_debug_fops);
>  }
>  
>  static void fusb302_debugfs_exit(struct fusb302_chip *chip)
> 

