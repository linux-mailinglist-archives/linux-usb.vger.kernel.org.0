Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC1CC379D22
	for <lists+linux-usb@lfdr.de>; Tue, 11 May 2021 04:44:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230433AbhEKCp4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 May 2021 22:45:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230488AbhEKCps (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 10 May 2021 22:45:48 -0400
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23848C061761
        for <linux-usb@vger.kernel.org>; Mon, 10 May 2021 19:44:42 -0700 (PDT)
Received: by mail-oi1-x234.google.com with SMTP id d21so17683684oic.11
        for <linux-usb@vger.kernel.org>; Mon, 10 May 2021 19:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=yVcee8/ZNeyqcLu4LVNC3zNYKNvADyt07vtW62y9BG4=;
        b=kZA4USN8vMSsa5e7llOdCEKTe6WRw9PKPxcRbBi8wn4dFTtXwCSCIpDfKGgni+gsri
         OI9NxWR/tXQm8ULQjAy7ZhPIanFw9jjeisII4ShrA2I0fSUjnwJrvoSoeFVRvhTQ1KvK
         qwoKzrfZewh3YVtv1EbivJpwbDhx1UzfQAQBWBMGF1rIqr6lmhkQH9yR2+IThEOqMfXc
         XPEaNTItZGJAgo913plr4y8HMRs25mvLqr4RFSmNrDp2hnC2sTnYWLjnr4A5zoRP0may
         Igxv8jC/aSxFnwEMYztyEkqDjKDRDJ9EZleVmKvjWzL18XXbitpGYFAZS6/1iNkWqss+
         EKlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=yVcee8/ZNeyqcLu4LVNC3zNYKNvADyt07vtW62y9BG4=;
        b=iS+vPL21U1hJ1tEKTBjPzY6xYpynubNXWFi71coulhQk75pad2AVHg0jCirBcMTfc6
         CAZw7g4YcRul0YDK6xBrXQutYg/khBmHozdPKUB/ZTPmGKfN6/1NoIZhrEOh/ESmmE/Y
         pEurLlh/phgaO51LpTtKt5JhRNXgUFjZPt8Ni6SlHcdDLGtgcO7+GXZW2hlQDuP3q4Z6
         KNLEUk6eigutS5srCdB3kAiQDnZJOwrsBeXI2Gemqy5e3ZeRldpssFwvkWkDxmGEa0LL
         gxFY020R+eG96kXGgMGX4CyH4bchpGCDmDvvOn9AYl2MnhI9gPZZ9lh8YJC/wy6x/RM7
         qvuA==
X-Gm-Message-State: AOAM531TGn64SgxorXZaRZbJyBpgHZSvDpLLontirwUNLneSIOcHiSab
        Kgrfmh63M+wjgAOVaseLvk7HGlpCj7A=
X-Google-Smtp-Source: ABdhPJwtshw06ZJIz9n5xs1kOBPwvLcdXiM7NYy2BTxWllrr77w9IFh0Rs3UURsz6U1nhkpMiryuTA==
X-Received: by 2002:aca:a9c4:: with SMTP id s187mr20541112oie.47.1620701081318;
        Mon, 10 May 2021 19:44:41 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c7sm2422608ots.50.2021.05.10.19.44.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 May 2021 19:44:40 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH 1/2] usb: typec: tcpm: Call init callback only when
 provided
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org
References: <20210511022224.1309077-1-bryan.odonoghue@linaro.org>
 <20210511022224.1309077-2-bryan.odonoghue@linaro.org>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <f112c2b4-343a-f8a0-c00e-f020f34611dc@roeck-us.net>
Date:   Mon, 10 May 2021 19:44:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210511022224.1309077-2-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 5/10/21 7:22 PM, Bryan O'Donoghue wrote:
> The tcpc_dev structure lists a number of callbacks as required when
> implementing a TCPM driver. tcpc_dev->init() is not listed as required.
> 
> Currently tcpc_dev->init() is called irrespective of whether or not the
> callback is set. Let's conditionally call init() as with other non-required
> callbacks such as get_current_limit() or set_current_limit().
> 
> Fixes: f0690a25a140b ("staging: typec: USB Type-C Port Manager (tcpm)")
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Are we going to see a driver with no init function ?
If not, I would suggest to make the call officially mandatory.

Guenter

> ---
>   drivers/usb/typec/tcpm/tcpm.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index c4fdc00a3bc8..355067e6d420 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -5657,7 +5657,8 @@ static void tcpm_init(struct tcpm_port *port)
>   {
>   	enum typec_cc_status cc1, cc2;
>   
> -	port->tcpc->init(port->tcpc);
> +	if (port->tcpc->init)
> +		port->tcpc->init(port->tcpc);
>   
>   	tcpm_reset_port(port);
>   
> 

