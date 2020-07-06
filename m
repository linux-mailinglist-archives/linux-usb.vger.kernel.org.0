Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D518B215900
	for <lists+linux-usb@lfdr.de>; Mon,  6 Jul 2020 16:01:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729308AbgGFOBH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Jul 2020 10:01:07 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:53541 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728940AbgGFOBD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Jul 2020 10:01:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1594044060;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=plR445Drk3eeFEnzym0LmKRY+r16mbP2yKRnTLNcumQ=;
        b=eyOmmyVVSqZQ3btGRHGkKYEr7d1xTaGPYqoC9w13l5x7vE+1ZrzdtSph9QOETrbNOavBto
        p4V6qghd+Bmi0qIjj+hFS53Bs2O+6Ukh8BHuwOSEy0OU7/EcC32Kk+nUbE1O7QE0sxVBbH
        bU09ygUaK9E/BaV7dlSp1Mm/gUx/8q8=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-jI-ZgKsHNlSUM7R25pNKcQ-1; Mon, 06 Jul 2020 10:00:58 -0400
X-MC-Unique: jI-ZgKsHNlSUM7R25pNKcQ-1
Received: by mail-ej1-f69.google.com with SMTP id op28so34277142ejb.15
        for <linux-usb@vger.kernel.org>; Mon, 06 Jul 2020 07:00:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=plR445Drk3eeFEnzym0LmKRY+r16mbP2yKRnTLNcumQ=;
        b=S8IObjZZubDOl4MFszIEg6YbFN+YEFk6zV42Pb8nf3J5HvlkwLmcXGeWRtyLtVBeBZ
         ucYT7wK2xkV2ulu/qTBxFn0TMQ+abEn3c63LIw0E0wYmlYJWA2AJE6Q9vihJNS1Yqz+K
         Omb5zDQn9bv8CA2brKusvT5Trr6G1AiWxRHeS0LjSahevMqfruNfzMe3Z7dATLp7jA3Z
         /++75gVTURnkL6gl0DqdDyIB8a3RG8KNHkqs2yji7e+ASKRKAT7IL6PfVE3O/cehEVbd
         cidBjQB2HcC6gB9csiGEtzDis2yt1AdV542A1DyT2KS7w88EMBm5+CtD6Bna1VpStP6c
         UXiA==
X-Gm-Message-State: AOAM533NsVSQ8i0xUqR7EenPdeYjGshW0dYroSpmFZAyghDhUXRIXlED
        +NxUdIQ51WkQxTk7TakvfmVUAw8SoAPRlEvfQ8QuR3lInZ9x+fNiXNXWcm5+TJs+WtnfOIvexeV
        DmRbqNPevMCfo29FrYU7E
X-Received: by 2002:a05:6402:202e:: with SMTP id ay14mr55866492edb.233.1594044057682;
        Mon, 06 Jul 2020 07:00:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwokWAQDe0bD6JJ8Z9MjAp3h3YbM7dv+sokIOUz5rBXKpDFtUHf2aONLLEEwiCQIl5my75xOA==
X-Received: by 2002:a05:6402:202e:: with SMTP id ay14mr55866456edb.233.1594044057460;
        Mon, 06 Jul 2020 07:00:57 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id mf24sm16808096ejb.58.2020.07.06.07.00.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2020 07:00:56 -0700 (PDT)
Subject: Re: [PATCH 08/32] usb: typec: tcpm: tcpm: Remove dangling unused
 'struct tcpm_altmode_ops'
To:     Lee Jones <lee.jones@linaro.org>, gregkh@linuxfoundation.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
References: <20200706133341.476881-1-lee.jones@linaro.org>
 <20200706133341.476881-9-lee.jones@linaro.org>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <ca14707c-7d40-07ac-da1d-ca27a2e93dcd@redhat.com>
Date:   Mon, 6 Jul 2020 16:00:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200706133341.476881-9-lee.jones@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 7/6/20 3:33 PM, Lee Jones wrote:
> Looks as though a079973f462a3 ("usb: typec: tcpm: Remove tcpc_config
> configuration mechanism") pulled out the only use of 'tcpm_altmode_ops'
> last year.  No need to keep it around.
> 
> Fixes the following W=1 kernel build warning(s):
> 
>   drivers/usb/typec/tcpm/tcpm.c:1551:39: warning: ‘tcpm_altmode_ops’ defined but not used [-Wunused-const-variable=]
>   1551 | static const struct typec_altmode_ops tcpm_altmode_ops = {
>   | ^~~~~~~~~~~~~~~~
> 
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

This is necessary for adding Display port over Type-C support
on devices using the tcpm code, rather then firmware, to do
the Type-C alt-mode negotiation.

I have a local patch in my tree which adds support for this.

But Heikki did not like my approach, so that patch
(which needs the bits you are removing) never landed
upstream:

https://patchwork.kernel.org/patch/11199517/

Which is somewhat old now.

Heikki said he would look into an approach to this more to
his liking. Heikki an progress on this area?

Regards,

Hans



> ---
>   drivers/usb/typec/tcpm/tcpm.c | 51 -----------------------------------
>   1 file changed, 51 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index 82b19ebd7838e..d6913eb0ea54d 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -1503,57 +1503,6 @@ static int tcpm_validate_caps(struct tcpm_port *port, const u32 *pdo,
>   	return 0;
>   }
>   
> -static int tcpm_altmode_enter(struct typec_altmode *altmode, u32 *vdo)
> -{
> -	struct tcpm_port *port = typec_altmode_get_drvdata(altmode);
> -	u32 header;
> -
> -	mutex_lock(&port->lock);
> -	header = VDO(altmode->svid, vdo ? 2 : 1, CMD_ENTER_MODE);
> -	header |= VDO_OPOS(altmode->mode);
> -
> -	tcpm_queue_vdm(port, header, vdo, vdo ? 1 : 0);
> -	mod_delayed_work(port->wq, &port->vdm_state_machine, 0);
> -	mutex_unlock(&port->lock);
> -
> -	return 0;
> -}
> -
> -static int tcpm_altmode_exit(struct typec_altmode *altmode)
> -{
> -	struct tcpm_port *port = typec_altmode_get_drvdata(altmode);
> -	u32 header;
> -
> -	mutex_lock(&port->lock);
> -	header = VDO(altmode->svid, 1, CMD_EXIT_MODE);
> -	header |= VDO_OPOS(altmode->mode);
> -
> -	tcpm_queue_vdm(port, header, NULL, 0);
> -	mod_delayed_work(port->wq, &port->vdm_state_machine, 0);
> -	mutex_unlock(&port->lock);
> -
> -	return 0;
> -}
> -
> -static int tcpm_altmode_vdm(struct typec_altmode *altmode,
> -			    u32 header, const u32 *data, int count)
> -{
> -	struct tcpm_port *port = typec_altmode_get_drvdata(altmode);
> -
> -	mutex_lock(&port->lock);
> -	tcpm_queue_vdm(port, header, data, count - 1);
> -	mod_delayed_work(port->wq, &port->vdm_state_machine, 0);
> -	mutex_unlock(&port->lock);
> -
> -	return 0;
> -}
> -
> -static const struct typec_altmode_ops tcpm_altmode_ops = {
> -	.enter = tcpm_altmode_enter,
> -	.exit = tcpm_altmode_exit,
> -	.vdm = tcpm_altmode_vdm,
> -};
> -
>   /*
>    * PD (data, control) command handling functions
>    */
> 

