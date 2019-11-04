Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61008EE2C6
	for <lists+linux-usb@lfdr.de>; Mon,  4 Nov 2019 15:42:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728416AbfKDOmc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 4 Nov 2019 09:42:32 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:41667 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727861AbfKDOmc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 4 Nov 2019 09:42:32 -0500
Received: by mail-pg1-f194.google.com with SMTP id l3so11422668pgr.8
        for <linux-usb@vger.kernel.org>; Mon, 04 Nov 2019 06:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Qn51P5wpYDAffBks8TMUHdfXzv7eu7B8SHdzIP7zvus=;
        b=TK2wMaSarkYFnOi2fhTIIVVN3X8MhvBGYSvN84Z14qdKPc4Frby3PRdg4dW0lZBEoU
         CNdqfUMUpDNURLp4RObbXx0LevWqjxf6E414jEytAmoaqxgMkB16PNg1L27FahBM/GcN
         Ou0WrKTWQ+w9NEZqhJLTjizT/9LSc9Ol09cNtI+FzUfzszDQqpyOaryS4bV9+yWcj6H+
         YjXw4+wKW0wWfHQYnppYFWr9jnpQV3lDurLcEnT4XjqE6YESswbuPSCB0P7EkI73M5XO
         ZtkeKDUQq+QO/G6LWdM9rZ58Z0y1Gf53qEiuhHJPOpH2xHFz7d/lbWX7/Cs0QxkXXME+
         oTmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Qn51P5wpYDAffBks8TMUHdfXzv7eu7B8SHdzIP7zvus=;
        b=SRpVjMvH1IswwZasDs3J+8ia5nyrZ1VoamE47nEidOysBmxZqM+BZu5OhI8vhQ+e/E
         CaVQ8tf6xVzkKIGriMO5r0T1FbuQIk4H3kN12bLGmppodxv4x2M4JBj2HyKpo19cl+MP
         XP/jSWVcwDjxxBlQLpfEbUqrYYY14AsYl0T9I40J/LGx6TqnBZQ+5iSofybXLAjQkPSP
         JABrXuzLjV7wqLNOAZ8v39HpsNR0gAN9+2FYkyeT4+DcvaKqSP6EXMeASVqaM+FcQVVE
         Vq2ME+ZhEWsTEQbzOCH5egfs48f9Uu+7q1y2Ql+ele436tgObBc1CaM/x4AXfAcuGqUc
         lhgA==
X-Gm-Message-State: APjAAAV7R/bi4jTyMiWQ8t09OzpeIFcflPjTz3lNbBq9jIdALm3P5mpC
        dNdPYg4BVDSiSTtVKd5EtPBsjVv2
X-Google-Smtp-Source: APXvYqxrB2rXgxENVUab+u07UOt44v9ScainhtsALwX2/LV4R4e062PASuCcF6Gu54IJjKIe+7L0nQ==
X-Received: by 2002:a63:4c4:: with SMTP id 187mr30722762pge.425.1572878551648;
        Mon, 04 Nov 2019 06:42:31 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z14sm14657587pfq.66.2019.11.04.06.42.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 04 Nov 2019 06:42:31 -0800 (PST)
Subject: Re: [PATCH v4 18/18] usb: typec: ucsi: Optimise ucsi_unregister()
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Ajay Gupta <ajayg@nvidia.com>, linux-usb@vger.kernel.org
References: <20191104142435.29960-1-heikki.krogerus@linux.intel.com>
 <20191104142435.29960-19-heikki.krogerus@linux.intel.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <6e652896-e379-711c-0fa1-4935dbcf3bc1@roeck-us.net>
Date:   Mon, 4 Nov 2019 06:42:30 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191104142435.29960-19-heikki.krogerus@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 11/4/19 6:24 AM, Heikki Krogerus wrote:
> There is no need to reset the PPM when the interface is
> unregistered. Quietly silencing the notifications and then
> unregistering everything is enough. This speeds up
> ucsi_unregister() a lot.
> 
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Tested-by: Ajay Gupta <ajayg@nvidia.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/usb/typec/ucsi/ucsi.c | 9 +++------
>   1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index 772f55c92ba3..4459bc68aa33 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -1045,15 +1045,14 @@ EXPORT_SYMBOL_GPL(ucsi_register);
>    */
>   void ucsi_unregister(struct ucsi *ucsi)
>   {
> -	u64 command;
> +	u64 cmd = UCSI_SET_NOTIFICATION_ENABLE;
>   	int i;
>   
>   	/* Make sure that we are not in the middle of driver initialization */
>   	cancel_work_sync(&ucsi->work);
>   
> -	/* Disable everything except command complete notification */
> -	command = UCSI_SET_NOTIFICATION_ENABLE | UCSI_ENABLE_NTFY_CMD_COMPLETE;
> -	ucsi_send_command(ucsi, command, NULL, 0);
> +	/* Disable notifications */
> +	ucsi->ops->async_write(ucsi, UCSI_CONTROL, &cmd, sizeof(cmd));
>   
>   	for (i = 0; i < ucsi->cap.num_connectors; i++) {
>   		cancel_work_sync(&ucsi->connector[i].work);
> @@ -1063,8 +1062,6 @@ void ucsi_unregister(struct ucsi *ucsi)
>   		typec_unregister_port(ucsi->connector[i].port);
>   	}
>   
> -	ucsi_reset_ppm(ucsi);
> -
>   	kfree(ucsi->connector);
>   }
>   EXPORT_SYMBOL_GPL(ucsi_unregister);
> 

