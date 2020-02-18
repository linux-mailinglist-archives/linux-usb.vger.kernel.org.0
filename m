Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A25B8162E3F
	for <lists+linux-usb@lfdr.de>; Tue, 18 Feb 2020 19:18:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726569AbgBRSRy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Feb 2020 13:17:54 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:38018 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726391AbgBRSRx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Feb 2020 13:17:53 -0500
Received: by mail-lj1-f196.google.com with SMTP id w1so24093622ljh.5
        for <linux-usb@vger.kernel.org>; Tue, 18 Feb 2020 10:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=9cK2bckJ3e3FyI9QlV5IGwg4pLLNKN0sSP7dc2Uyjj0=;
        b=nwCRYQJHU7t81cKYiiHMpauFXZx3PG9b8T241KfEm9dBTZT749hQeOuhmEhjnzY/Ej
         zAZ2wutIR+mBqg4+063b4iCSDCm7FAnd4h1TKDVwCFZxK5HZrF7fRqp7HZjZBWbtghcB
         4caov/rszM98BoUgvCndB4Uv8Ru1LUp6XU7Pi4V/3W3MBlqtP8r1VT7dNsmZ7hMlP6U2
         8keJZPtAZoBK0UpQpJLhMf36WCfFjfbjqFD+5znrse+waUCDhDolsB7106UQtxmzx8nG
         v/7R7WHoAesKHL5xvUhabdajEsNN95kKKIMAUJXJLRqCdylf9b4xm5Mcy/o/RxiWxpd+
         LKLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=9cK2bckJ3e3FyI9QlV5IGwg4pLLNKN0sSP7dc2Uyjj0=;
        b=gHPfABa0yJ046CZxABTB3bnTzPMDftKi7rCb63S1oi04BB7jTDsmy0tZD0kwGs0ehB
         +9QTt3nwvFCGLHGqTNT9t+49Vh95r9+4VXUjWzoHAsXp+zNeH9n2tTiO86gWNcK4L/vv
         d/P/+z0Os/v28UJtyFiy8KYXTnthUZ2+02+Do72bkgLjnx6VVejM1QK7JWkLaBhmbHun
         7ubKHo+s2WG+w5FNvIk0a954ZwxC41L1cVrC9nDfl019YiUq1k/q1OvQQaGKtXpAgLz4
         k7ZsJWNHk2+qN83mwNxcOaqmUEMuN0i2vsTQFwU0VZeorz9QiU2KtAhUnhJWIfQDA0ic
         Vm4A==
X-Gm-Message-State: APjAAAXCVScLiU4fy2OrgQwOV6LsP7amM4s5s2VDrUs2cEgpjmIygOH2
        OOiza5YF6C9+HX2vPwuu3BmcIX9HWLc=
X-Google-Smtp-Source: APXvYqxnuD7KZLVCvcHVWrrXyRLFNs7wg9g/7K39ijr8NAcudaSPUwU3K+i1JhT5ayWKwiblENhIWw==
X-Received: by 2002:a2e:9e43:: with SMTP id g3mr13983565ljk.37.1582049870742;
        Tue, 18 Feb 2020 10:17:50 -0800 (PST)
Received: from wasted.cogentembedded.com ([2a00:1fa0:4291:80f4:9357:4c36:a787:cdd4])
        by smtp.gmail.com with ESMTPSA id e8sm3319754ljb.45.2020.02.18.10.17.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 18 Feb 2020 10:17:49 -0800 (PST)
Subject: Re: [PATCH v1] usb: core: Make use of acpi_evaluate_object() status
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
References: <20200218160954.42815-1-andriy.shevchenko@linux.intel.com>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <511c8750-b188-82a1-e839-6b136e5c727c@cogentembedded.com>
Date:   Tue, 18 Feb 2020 21:17:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20200218160954.42815-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi! :-)

On 02/18/2020 07:09 PM, Andy Shevchenko wrote:

> Compiler is not happy about dangling variable:
> 
> .../core/usb-acpi.c: In function ‘usb_acpi_get_connect_type’:
> .../core/usb-acpi.c:90:14: warning: variable ‘status’ set but not used [-Wunused-but-set-variable]
>    90 |  acpi_status status;
>       |              ^~~~~~
> 
> Make use of it by checking the status and bail out in case of error.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/usb/core/usb-acpi.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/core/usb-acpi.c b/drivers/usb/core/usb-acpi.c
> index f434a2060552..41b91f4c207d 100644
> --- a/drivers/usb/core/usb-acpi.c
> +++ b/drivers/usb/core/usb-acpi.c
[...]
> @@ -98,9 +98,11 @@ static enum usb_port_connect_type usb_acpi_get_connect_type(acpi_handle handle,
>  	 * no connectable, the port would be not used.
>  	 */
>  	status = acpi_evaluate_object(handle, "_UPC", NULL, &buffer);
> +	if (ACPI_FAILURE(status))
> +		goto out;
> +
>  	upc = buffer.pointer;
> -	if (!upc || (upc->type != ACPI_TYPE_PACKAGE)
> -		|| upc->package.count != 4) {
> +	if (!upc || (upc->type != ACPI_TYPE_PACKAGE) || upc->package.count != 4) {
>  		goto out;
>  	}

   I'd drop {} here, while at it.

MBR, Sergei
