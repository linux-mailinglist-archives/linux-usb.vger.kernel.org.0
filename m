Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99B6B221160
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jul 2020 17:44:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725897AbgGOPl7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Jul 2020 11:41:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725835AbgGOPl7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Jul 2020 11:41:59 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DBA7C061755
        for <linux-usb@vger.kernel.org>; Wed, 15 Jul 2020 08:41:59 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id u5so2257083pfn.7
        for <linux-usb@vger.kernel.org>; Wed, 15 Jul 2020 08:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wD7tZ2lSyIBz5jxaaroQoUuog5r0OiipbLhEVu2J7Tc=;
        b=fVZsiwMrn/OLdypR5y7gJECCukxjcwpcKpurMdk/N5oEJoJY83pJHyFbHpAK0Iy/9A
         zUHtGlQRiZe9YtH+ngGK9zVE6riSMJtZpkVoeSRNFgXIf/p0I+vFnPrrgpUfuD3pXj8M
         1YszaqwpNNzfnjYGDArlGoPEhf8FoU2RdB+cyFBbY6WMLm4tHAk3pxfsJWSb20j0s8xv
         EGfVHJDxT6eYnTCVm2/eTvD6WRBXY2Kt93mBd+f5ZSLNjIEk5s8YyMb6HSWntbJAjtMJ
         gskmrPt//9v3ajdC0AOMDKfX3xgVvYREJmQ3MLtUaXcF8E7Zy/RG+8ezIZPGfBJ7igRy
         1Qcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=wD7tZ2lSyIBz5jxaaroQoUuog5r0OiipbLhEVu2J7Tc=;
        b=JVNHZDXII8wjI0tbZDzJned7751TnZUrMG4OV96r/Wa8eAQ0I9mNG+iIvD6LOedXHy
         tM/iKzNeYn9u1ZVddlk/oec0IlrydRy76yhpFOAsbxgd4fj68F9QTzwHgW0ErqaO3ew3
         Or5QMB5G4rxU2/hw/nH57owiosme0XanNBQgY2RGm8rJKRNkLFoEkztM3BIpmm7SCcwM
         4qLjf5GxGDyvPil/sC31lwVxCjDbnpC5acpt6hG6tvdWx9fSPIDe1AzrKoOVmXU2iALP
         36XcqQLxNP5SgJku9g4HYexnvMb1mjmpoKGKf7+VnFibENlAmy+95JAbryYtvfZ3+gDW
         sCdA==
X-Gm-Message-State: AOAM530mhKA1jhJOGx27FLM3t0iFMTPfvP9zJaEDCOM0gMRwSKTpaRil
        G1YAJpHT/yFrefwvhMV2V7kCjx0X
X-Google-Smtp-Source: ABdhPJzjETrm4SsFs1wchT7WMQ6a3MYlacT2BAJvb/zsfD1LybSMKHsN2THkhsIogT7VzTHk8Uy4DQ==
X-Received: by 2002:aa7:9906:: with SMTP id z6mr9585478pff.60.1594827718459;
        Wed, 15 Jul 2020 08:41:58 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f131sm2488108pgc.14.2020.07.15.08.41.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2020 08:41:57 -0700 (PDT)
Subject: Re: [PATCH 2/6] usb: typec: tcpm: Move locking into tcpm_queue_vdm()
To:     Hans de Goede <hdegoede@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     linux-usb@vger.kernel.org
References: <20200715132301.99816-1-hdegoede@redhat.com>
 <20200715132301.99816-3-hdegoede@redhat.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <edd1ea84-679e-0e7b-f615-c9cd8c58bcdc@roeck-us.net>
Date:   Wed, 15 Jul 2020 08:41:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200715132301.99816-3-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 7/15/20 6:22 AM, Hans de Goede wrote:
> Various callers (all the typec_altmode_ops) take the port-lock just for
> the tcpm_queue_vdm() call.
> 
> Rename the raw (unlocked) tcpm_queue_vdm() call to
> tcpm_queue_vdm_unlocked() and add a new tcpm_queue_vdm() helper which takes
> the lock, so that its callers don't have to do this themselves.
> 
> This is a preparation patch for fixing an AB BA lock inversion between the
> tcpm code and some altmode drivers.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/usb/typec/tcpm/tcpm.c | 27 ++++++++++++++-------------
>  1 file changed, 14 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index fc6455a29c74..30e997d6ea1e 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -958,9 +958,11 @@ static void tcpm_queue_message(struct tcpm_port *port,
>  /*
>   * VDM/VDO handling functions
>   */
> -static void tcpm_queue_vdm(struct tcpm_port *port, const u32 header,
> -			   const u32 *data, int cnt)
> +static void tcpm_queue_vdm_unlocked(struct tcpm_port *port, const u32 header,
> +				    const u32 *data, int cnt)

The new function name is misleading. I think tcpm_queue_vdm_locked()
would be a much better name. Alternatively, consider keeping tcpm_queue_vdm()
as is and add tcpm_queue_vdm_unlocked().

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
> +static void tcpm_queue_vdm(struct tcpm_port *port, const u32 header,
> +			   const u32 *data, int cnt)
> +{
> +	mutex_lock(&port->lock);
> +	tcpm_queue_vdm_unlocked(port, header, data, cnt);
> +	mutex_unlock(&port->lock);
> +}
> +
>  static void svdm_consume_identity(struct tcpm_port *port, const __le32 *payload,
>  				  int cnt)
>  {
> @@ -1249,7 +1259,7 @@ static void tcpm_handle_vdm_request(struct tcpm_port *port,
>  		rlen = tcpm_pd_svdm(port, payload, cnt, response);
>  
>  	if (rlen > 0)
> -		tcpm_queue_vdm(port, response[0], &response[1], rlen - 1);
> +		tcpm_queue_vdm_unlocked(port, response[0], &response[1], rlen - 1);
>  }
>  
>  static void tcpm_send_vdm(struct tcpm_port *port, u32 vid, int cmd,
> @@ -1263,7 +1273,7 @@ static void tcpm_send_vdm(struct tcpm_port *port, u32 vid, int cmd,
>  	/* set VDM header with VID & CMD */
>  	header = VDO(vid, ((vid & USB_SID_PD) == USB_SID_PD) ?
>  			1 : (PD_VDO_CMD(cmd) <= CMD_ATTENTION), cmd);
> -	tcpm_queue_vdm(port, header, data, count);
> +	tcpm_queue_vdm_unlocked(port, header, data, count);
>  }
>  
>  static unsigned int vdm_ready_timeout(u32 vdm_hdr)
> @@ -1506,13 +1516,10 @@ static int tcpm_altmode_enter(struct typec_altmode *altmode, u32 *vdo)
>  	struct tcpm_port *port = typec_altmode_get_drvdata(altmode);
>  	u32 header;
>  
> -	mutex_lock(&port->lock);
>  	header = VDO(altmode->svid, vdo ? 2 : 1, CMD_ENTER_MODE);
>  	header |= VDO_OPOS(altmode->mode);
>  
>  	tcpm_queue_vdm(port, header, vdo, vdo ? 1 : 0);
> -	mutex_unlock(&port->lock);
> -
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
>  	tcpm_queue_vdm(port, header, NULL, 0);
> -	mutex_unlock(&port->lock);
> -
>  	return 0;
>  }
>  
> @@ -1536,10 +1540,7 @@ static int tcpm_altmode_vdm(struct typec_altmode *altmode,
>  {
>  	struct tcpm_port *port = typec_altmode_get_drvdata(altmode);
>  
> -	mutex_lock(&port->lock);
>  	tcpm_queue_vdm(port, header, data, count - 1);
> -	mutex_unlock(&port->lock);
> -
>  	return 0;
>  }
>  
> 

