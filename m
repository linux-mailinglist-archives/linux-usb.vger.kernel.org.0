Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16971141EB0
	for <lists+linux-usb@lfdr.de>; Sun, 19 Jan 2020 16:03:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726956AbgASPDG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 19 Jan 2020 10:03:06 -0500
Received: from mail-yw1-f68.google.com ([209.85.161.68]:37368 "EHLO
        mail-yw1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726778AbgASPDF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 19 Jan 2020 10:03:05 -0500
Received: by mail-yw1-f68.google.com with SMTP id z7so16745651ywd.4
        for <linux-usb@vger.kernel.org>; Sun, 19 Jan 2020 07:03:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=hQsb5MOVL1Q351uMByRAfrGcuMxI6oUNk3uA80cVGl8=;
        b=Itu+uE87gckRbjMPZbFbYkn2AZq2SlWIiaOUn0ikv79KL13GR1ogLn0Get1+wmDpx2
         bGzvaRyVIwXJTO+q+YUGzkYRMoJMWlx/k3WXlpn00TLFGqSS9m4135rp4PczTSVmnuut
         AT8fg7A96d/PqQyzySmdvuXKmHI+WjLZVaB2jCGIFPapjf0q3IOk2Npsbz3k7TEmooBb
         1rUKEgLJYXyB++QwG4udIzL/tYBsYlX12AsNmgoXRehwsdKlyS9T5Yyn+7OwOfXLBIE3
         OP64Pf8LPm3K9OOHhbBS+0x11blmE7bMkuSDhfvxPl6v73R5IkrXveeb+po1qx2HUwC6
         Cxsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hQsb5MOVL1Q351uMByRAfrGcuMxI6oUNk3uA80cVGl8=;
        b=m02muUyfkYfH0dDKjdyqyjk/TYooUoC9CoVMVCC/pNIahGv4vyJa3QKPIFH3FHywjO
         TeLCsZ9m6O9fBCxw5WxZ75W9nYf/FwgWa4o8JT/LayScTiyauwWCeokYEY9auCjmCGBR
         lCXzqd48JD25cpq85pMpZAE3NZeT6mfsQAz3KV4XPVB0zUfGkR4Nil6EMDrIBbh6Ctat
         eRw+FDsYMmbLxmwOgVez0jZwo3ymawHE6tFpGWf1NUXiQfE9Gke216rKwvuwrPwlP1pD
         bZqZkt0B58/voExHOnyh/NyOAeq4JF9qed+Jw+Kj5FfeOiDN9mvdYXpnronsZLtHYqDR
         LS6Q==
X-Gm-Message-State: APjAAAUiantmRrLBkmVsmTF9JIjwLawu1zo3Ci9F4b46kQQj+g/65ZO5
        Qft3kKlOb86HmvlQPMbjY1c2EU1W
X-Google-Smtp-Source: APXvYqwo+cPejp90pqCua6VpbfxM2tvkE/g2GlYgmInWsKsMazxeRWoIu4kKYQXRjdTyJVvl7N2KYQ==
X-Received: by 2002:a0d:c3c2:: with SMTP id f185mr36288610ywd.21.1579446184886;
        Sun, 19 Jan 2020 07:03:04 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s130sm14231126ywg.11.2020.01.19.07.03.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Jan 2020 07:03:03 -0800 (PST)
Subject: Re: [PATCH] usb: typec: tcpci: mask event interrupts when remove
 driver
To:     Jun Li <jun.li@nxp.com>,
        "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>
Cc:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
References: <1579431309-10265-1-git-send-email-jun.li@nxp.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <6eca1c7d-71c9-6b55-3f14-e9d984f6fca9@roeck-us.net>
Date:   Sun, 19 Jan 2020 07:03:01 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <1579431309-10265-1-git-send-email-jun.li@nxp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 1/19/20 2:59 AM, Jun Li wrote:
> This is to prevent any possible events generated while unregister
> tpcm port.
> 
> Signed-off-by: Li Jun <jun.li@nxp.com>

Fixes: 74e656d6b0551 ("staging: typec: Type-C Port Controller Interface driver (tcpci)")

> ---
>   drivers/usb/typec/tcpm/tcpci.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
> index c1f7073..3b42ef8 100644
> --- a/drivers/usb/typec/tcpm/tcpci.c
> +++ b/drivers/usb/typec/tcpm/tcpci.c
> @@ -581,6 +581,14 @@ static int tcpci_probe(struct i2c_client *client,
>   static int tcpci_remove(struct i2c_client *client)
>   {
>   	struct tcpci_chip *chip = i2c_get_clientdata(client);
> +	u16 val = 0;
> +	int err;
> +
> +	/* Disable chip interrupts before unregistger port */
> +	err = regmap_raw_write(chip->data.regmap, TCPC_ALERT_MASK, &val,
> +			       sizeof(u16));

I would suggest

	err = tcpci_write16(chip, TCPC_ALERT_MASK, 0);

Guenter

> +	if (err < 0)
> +		return err;
>   
>   	tcpci_unregister_port(chip->tcpci);
>   
> 

