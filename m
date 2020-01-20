Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2FA19142422
	for <lists+linux-usb@lfdr.de>; Mon, 20 Jan 2020 08:18:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726039AbgATHSn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Jan 2020 02:18:43 -0500
Received: from mail-yb1-f194.google.com ([209.85.219.194]:42851 "EHLO
        mail-yb1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725851AbgATHSm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 20 Jan 2020 02:18:42 -0500
Received: by mail-yb1-f194.google.com with SMTP id c8so8689371ybk.9
        for <linux-usb@vger.kernel.org>; Sun, 19 Jan 2020 23:18:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=lT1XghwsD+MfOJCSi4oSW+xikztevVFIRSEq3T3SBF8=;
        b=R6t7vXLK5L67+rsklotJLkePzcuUYeIADtVN/PR+HvNEeAkHVLhf8se76JEKKAl1gV
         m86QL4P2E/uA+m6H1TwQ/cU2U7DsYTrwrKXA2z8uoyEPtIY7vYGbR8n5PwfmUJ21X8FM
         5Iz0WQ3UYQZqY0XV9i0dMDKgC3+mIulWOj6kGYMhJfZ4lWcethuxUhBOeUgIR4JcoHDo
         jSVgtaBWX547AAg19wfvu+fc8bmaGnRniSOknpZKYqI87nQItcQS08rfjcOfYfYn64Wt
         yh9MmwXXRfP3q/urm3d7/m2oYjPxDBjmhOYw/rmToBX15XSyy5SDWB97RmYR8pp9wG/I
         /ixw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=lT1XghwsD+MfOJCSi4oSW+xikztevVFIRSEq3T3SBF8=;
        b=M/rmFTIKJomRYSOIrWBQFd8vaVxr4hANrg1B41Ennx5m8kFaJgG0IJ73C1WsP44faa
         L9T6nD2+13BykN49nG33fW2AVUMUINpaxNFVfS2M4F7mESFeUHS5WNEoK7QgGY/KwIMm
         BNhPVPicsWfiEsOA2aC2c/B5uQsRKO/wITQCsF1Cck3hczYO+u9niBnggvjyH3yycfoV
         FIQWyOWCRJ4cLAVMGJOmQufYJKzbNX/XXRfIPY853QRYBbcZZJltYOWqAm/7+MtnGaJu
         djg3d/M1YdVQMPz+zzN2tAMvCm8NBwYXeTiK4YtrJDz7XuUuKBtFOfzEWY4g7HNPYYGG
         HnDw==
X-Gm-Message-State: APjAAAUZj5t9iCcPeHY4Ilu88cChQ2c1lfzv2z/qdsm05RUdM8qmplUp
        dp3jBUfZdbOwHKB4uh043SGdgDOJ
X-Google-Smtp-Source: APXvYqx9VzFf18Mv0LnSv5dJXIUxBI9H5v47IxUKrC+uesM1zOPRajv6ZXTEgUqLi4cYokpL/t2Ymg==
X-Received: by 2002:a25:ca51:: with SMTP id a78mr36775498ybg.42.1579504721938;
        Sun, 19 Jan 2020 23:18:41 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e63sm14774598ywd.64.2020.01.19.23.18.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Jan 2020 23:18:40 -0800 (PST)
Subject: Re: [PATCH v3] usb: typec: tcpci: mask event interrupts when remove
 driver
To:     Jun Li <jun.li@nxp.com>,
        "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>
Cc:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
References: <1579502333-4145-1-git-send-email-jun.li@nxp.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <0502090c-a4b3-82ed-c2f2-3eba60186525@roeck-us.net>
Date:   Sun, 19 Jan 2020 23:18:38 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <1579502333-4145-1-git-send-email-jun.li@nxp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 1/19/20 10:43 PM, Jun Li wrote:
> This is to prevent any possible events generated while unregister
> tpcm port.
> 
> Fixes: 74e656d6b0551 ("staging: typec: Type-C Port Controller Interface driver (tcpci)")
> Signed-off-by: Li Jun <jun.li@nxp.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/usb/typec/tcpm/tcpci.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
> index c1f7073..dfae41f 100644
> --- a/drivers/usb/typec/tcpm/tcpci.c
> +++ b/drivers/usb/typec/tcpm/tcpci.c
> @@ -581,6 +581,12 @@ static int tcpci_probe(struct i2c_client *client,
>   static int tcpci_remove(struct i2c_client *client)
>   {
>   	struct tcpci_chip *chip = i2c_get_clientdata(client);
> +	int err;
> +
> +	/* Disable chip interrupts before unregistering port */
> +	err = tcpci_write16(chip->tcpci, TCPC_ALERT_MASK, 0);
> +	if (err < 0)
> +		return err;
>   
>   	tcpci_unregister_port(chip->tcpci);
>   
> 

