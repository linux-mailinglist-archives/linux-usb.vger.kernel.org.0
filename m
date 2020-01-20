Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E88701422FE
	for <lists+linux-usb@lfdr.de>; Mon, 20 Jan 2020 07:06:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725876AbgATGGd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Jan 2020 01:06:33 -0500
Received: from mail-yb1-f196.google.com ([209.85.219.196]:34823 "EHLO
        mail-yb1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725783AbgATGGc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 20 Jan 2020 01:06:32 -0500
Received: by mail-yb1-f196.google.com with SMTP id q190so9217623ybq.2
        for <linux-usb@vger.kernel.org>; Sun, 19 Jan 2020 22:06:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=g71/5x333t9KgJLDCkLobY5dQE0duYMA8A6P3m5ADqA=;
        b=NG22P92TDwk2MBF9hnsmsq7ahG301EGzbUKqoHEgUMrxWTdLIWpUGlB/Tes0gJUDsB
         MmYoBmmHdDIr0mgTM4kv0RELLx8oQ+hg41NANtaV1UQnOLfCR5SqTau06LEMpcyFZIDM
         UNZHvUJtYEnkFEUw2Juhih348dAzeVIwuQXTss9JISU8Zzs6CfcZyAE1DyY9ajWoayVw
         PBXFk3AzY7W3LdwpI0xp5XaYSqlo0okvo69CSaHHVs9DGPgE32XBWvK1dtvLzvm+1vl+
         5lUYV+3c3IQsbNor+OmYXlQlRCrKMu1ai+50sHg3KDIKGcFgygnx/nf1s2LFSyaEW1i4
         cpxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=g71/5x333t9KgJLDCkLobY5dQE0duYMA8A6P3m5ADqA=;
        b=UfddkKYLOP4TxM60xkqNbsGgfltyR66WHS9zc800nKF/Qj59hXB7sZwuv2+gYHkpkn
         Tk6IimkqsXYQF6MsiET0tW9r4LOu/s5A+zggaCJqSIwC7XKJC9FGR7dqmSBJtS+kI9HG
         Zp/4Avjh5Ilf5vhbtLAZ7euxec8oMfXXkinih1qbbYEK30RjcRp2U/JOvsFTUuw/5c8C
         7Yb5Zqgn+vKecaOTtmiAGvTH5LtqnCw2uTwix++es7RViWKfYEtdre6+dcaaCTkh3p8N
         8PK3/96aKTob0pMotSNqm5tzY61RfLWc43UUUGmurEmHl79j2xnAnL0oasohiopgjCQq
         nBDw==
X-Gm-Message-State: APjAAAWMxveK/1A9IKo0Gl7ZMbmWIXdBlY8ueetx3AJytECRzU0ScyMe
        b7Ql78IYE80RyUnkdDUuzzw=
X-Google-Smtp-Source: APXvYqz3BB9Ug0S4mZ1cV8zncQlCTXEyH/ih83qWOdZR9TAKOC4Q8gVbKj3B0hZ4eWCVVHBjlIVJ8g==
X-Received: by 2002:a5b:144:: with SMTP id c4mr36822934ybp.371.1579500391797;
        Sun, 19 Jan 2020 22:06:31 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id o69sm15280004ywd.38.2020.01.19.22.06.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Jan 2020 22:06:30 -0800 (PST)
Subject: Re: [PATCH v2] usb: typec: tcpci: mask event interrupts when remove
 driver
To:     Jun Li <jun.li@nxp.com>,
        "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>
Cc:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
References: <1579499461-13076-1-git-send-email-jun.li@nxp.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <833f7fe4-37f1-5a8e-755c-4f92c467098b@roeck-us.net>
Date:   Sun, 19 Jan 2020 22:06:29 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <1579499461-13076-1-git-send-email-jun.li@nxp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 1/19/20 9:55 PM, Jun Li wrote:
> This is to prevent any possible events generated while unregister
> tpcm port.
> 
> Fixes: 74e656d6b0551 ("staging: typec: Type-C Port Controller Interface driver (tcpci)")
> Signed-off-by: Li Jun <jun.li@nxp.com>
> ---
>   drivers/usb/typec/tcpm/tcpci.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
> index c1f7073..fb9f2c1 100644
> --- a/drivers/usb/typec/tcpm/tcpci.c
> +++ b/drivers/usb/typec/tcpm/tcpci.c
> @@ -581,6 +581,12 @@ static int tcpci_probe(struct i2c_client *client,
>   static int tcpci_remove(struct i2c_client *client)
>   {
>   	struct tcpci_chip *chip = i2c_get_clientdata(client);
> +	int err;
> +
> +	/* Disable chip interrupts before unregistger port */

s/unregistger/unregistering/

Sorry, I should have noticed before.

> +	err = tcpci_write16(chip->tcpci, TCPC_ALERT_MASK, 0);
> +	if (err < 0)
> +		return err;
>   
>   	tcpci_unregister_port(chip->tcpci);
>   
> 

