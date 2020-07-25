Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8ECE822D82C
	for <lists+linux-usb@lfdr.de>; Sat, 25 Jul 2020 16:37:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727036AbgGYOh4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 25 Jul 2020 10:37:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726944AbgGYOhz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 25 Jul 2020 10:37:55 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9853C08C5C0
        for <linux-usb@vger.kernel.org>; Sat, 25 Jul 2020 07:37:53 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id l6so5989823plt.7
        for <linux-usb@vger.kernel.org>; Sat, 25 Jul 2020 07:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KTRErV5RqdYNqfF0IK8gkfKX4UmiqHblsetSQIxgRqM=;
        b=TEJEVkZWB1ITqWtYLYNezovnOP8K5Tg1+nc9aCOPlzAAzhOFJ/Pmck0ikrC2RDTHdF
         Pbli+NvyU4zExnx8xC2dtTYTjoSMJovVhawgonke7VYmx2QhjuXcBAhM+1rI04zU3Chc
         iSOKJ8aM8Q2X8auGJ7yd8ljeb7kvnE5HrJV3sZGu1msw6KGX6AotlEYzqd5+eGXs472d
         pZ+itm4nJ4sODLY4xl7wB6W+M3dUrck62FbPiPdlEmnZNxbWhlnvxz8/p90Zi+DFI6FD
         28W0avVdRjV9vtmWMO0+XYYlC6AkMSTyxNuwj/UULHz4HMd7VJaMHJNmuPPIOlf5RkxC
         BiMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=KTRErV5RqdYNqfF0IK8gkfKX4UmiqHblsetSQIxgRqM=;
        b=i0OfppZVNK/N5lyQzEmQd4R6OvS6F+IwhqpKkdTVP4VDBpCLhY3RCvKWzEfj6EvOgG
         TpGDX8axqCgfMjo6D1gf3+JrQgHw8uBVsY3M+Vk+myLVkVoF3XdEXNtCkiPJ0mTIlzo2
         TySJT8+wWGlqLFEwBqxN5K+Z04L5bWQfPCUGh6xuVOgoLvGDv+dVLJb0I0ne73ZLaRRF
         dW6ams4ZzjBKWUWv6XIYYhsZYjMZb8LmHjXR/5yzG2gG0VjxKZvYfEEwvXuMMgh6mT/Q
         XR3Exu2u0tJg/OLxFDYTtajipCWA3VEO/2mT2muHQ5+iSifHhrgRpySVKS0zhrpaR0Nh
         E3YQ==
X-Gm-Message-State: AOAM530TXKa86TxJwzZ7HqHgnz9brsE97YtxqoEk0AzngF5F5V5FpEiH
        JNxG1dr1C15sdqJ+rIwYliRBy76c
X-Google-Smtp-Source: ABdhPJziDq7Kh1dDy5s5PW17hfe+T14I75omOkKH1zsAOGKUhrF3L7DQ3UwSdQ6gqZWPtygH4mEnvg==
X-Received: by 2002:a17:90a:ce96:: with SMTP id g22mr10418362pju.9.1595687873052;
        Sat, 25 Jul 2020 07:37:53 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r185sm9075424pfr.8.2020.07.25.07.37.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Jul 2020 07:37:52 -0700 (PDT)
Subject: Re: [PATCH v2 2/6] usb: typec: tcpm: Add tcpm_queue_vdm_unlocked()
 helper
To:     Hans de Goede <hdegoede@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     linux-usb@vger.kernel.org
References: <20200724174702.61754-1-hdegoede@redhat.com>
 <20200724174702.61754-2-hdegoede@redhat.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <1e91918e-accc-532a-d44a-681a9374f92b@roeck-us.net>
Date:   Sat, 25 Jul 2020 07:37:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200724174702.61754-2-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 7/24/20 10:46 AM, Hans de Goede wrote:
> Various callers (all the typec_altmode_ops) take the port-lock just for
> the tcpm_queue_vdm() call.
> 
> Add a new tcpm_queue_vdm_unlocked() helper which takes the lock, so that
> its callers don't have to do this themselves.
> 
> This is a preparation patch for fixing an AB BA lock inversion between
> the tcpm code and some altmode drivers.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> Changes in v2:
> - Name the new helper tcpm_queue_vdm_unlocked() instead of renaming the
>   original function to this
> ---
>  drivers/usb/typec/tcpm/tcpm.c | 25 +++++++++++++------------
>  1 file changed, 13 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index fc6455a29c74..862c474b3ebd 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -961,6 +961,8 @@ static void tcpm_queue_message(struct tcpm_port *port,
>  static void tcpm_queue_vdm(struct tcpm_port *port, const u32 header,
>  			   const u32 *data, int cnt)
>  {
> +	WARN_ON(!mutex_is_locked(&port->lock));
> +
>  	port->vdo_count = cnt + 1;
>  	port->vdo_data[0] = header;
>  	memcpy(&port->vdo_data[1], data, sizeof(u32) * cnt);
> @@ -971,6 +973,14 @@ static void tcpm_queue_vdm(struct tcpm_port *port, const u32 header,
>  	mod_delayed_work(port->wq, &port->vdm_state_machine, 0);
>  }
>  
> +static void tcpm_queue_vdm_unlocked(struct tcpm_port *port, const u32 header,
> +				    const u32 *data, int cnt)
> +{
> +	mutex_lock(&port->lock);
> +	tcpm_queue_vdm(port, header, data, cnt);
> +	mutex_unlock(&port->lock);
> +}
> +
>  static void svdm_consume_identity(struct tcpm_port *port, const __le32 *payload,
>  				  int cnt)
>  {
> @@ -1506,13 +1516,10 @@ static int tcpm_altmode_enter(struct typec_altmode *altmode, u32 *vdo)
>  	struct tcpm_port *port = typec_altmode_get_drvdata(altmode);
>  	u32 header;
>  
> -	mutex_lock(&port->lock);
>  	header = VDO(altmode->svid, vdo ? 2 : 1, CMD_ENTER_MODE);
>  	header |= VDO_OPOS(altmode->mode);
>  
> -	tcpm_queue_vdm(port, header, vdo, vdo ? 1 : 0);
> -	mutex_unlock(&port->lock);
> -
> +	tcpm_queue_vdm_unlocked(port, header, vdo, vdo ? 1 : 0);
>  	return 0;
>  }
>  
> @@ -1521,13 +1528,10 @@ static int tcpm_altmode_exit(struct typec_altmode *altmode)
>  	struct tcpm_port *port = typec_altmode_get_drvdata(altmode);
>  	u32 header;
>  
> -	mutex_lock(&port->lock);
>  	header = VDO(altmode->svid, 1, CMD_EXIT_MODE);
>  	header |= VDO_OPOS(altmode->mode);
>  
> -	tcpm_queue_vdm(port, header, NULL, 0);
> -	mutex_unlock(&port->lock);
> -
> +	tcpm_queue_vdm_unlocked(port, header, NULL, 0);
>  	return 0;
>  }
>  
> @@ -1536,10 +1540,7 @@ static int tcpm_altmode_vdm(struct typec_altmode *altmode,
>  {
>  	struct tcpm_port *port = typec_altmode_get_drvdata(altmode);
>  
> -	mutex_lock(&port->lock);
> -	tcpm_queue_vdm(port, header, data, count - 1);
> -	mutex_unlock(&port->lock);
> -
> +	tcpm_queue_vdm_unlocked(port, header, data, count - 1);
>  	return 0;
>  }
>  
> 

