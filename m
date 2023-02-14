Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 116536962EC
	for <lists+linux-usb@lfdr.de>; Tue, 14 Feb 2023 13:00:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230492AbjBNMAr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 Feb 2023 07:00:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229795AbjBNMAp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 14 Feb 2023 07:00:45 -0500
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FC98D4
        for <linux-usb@vger.kernel.org>; Tue, 14 Feb 2023 04:00:44 -0800 (PST)
Received: by mail-oi1-x22b.google.com with SMTP id r28so12797842oiw.3
        for <linux-usb@vger.kernel.org>; Tue, 14 Feb 2023 04:00:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=4Q6ijjjqQ/8KLYcHIg4JS5UgP386nLcTgdCPgSQV5L8=;
        b=gGTkLJTCR2pK3FH+CbjD30vCvGpKoJiWIH6rn5sNi0+8nkBSVLL0gvB3LedGw45Qow
         DoLAKgF5hvyB5tZRo9JOB0Sznl6NU9Rl52DxukWt6YGNO1ny6LBO6smo7tItTlMgI37I
         XaQ3ZBjoAGREFxYTFbimmxoniEfqIEwj0mFsb7zWPZz4aiRhys3syak+B5O4sXY0i4PK
         kIssRkkVLBFOpBcNnncHy4luJFogG1BUNFp57R2KgnaBI8GOJdXqKTmMm5dJgnWLO63A
         M96KsBMy/Ncf20+wpAEe0uYs/phBHYjT7AVg5YdUbRzZM/0uI3SyVnt2vHdOWvOkxDjn
         zwhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Q6ijjjqQ/8KLYcHIg4JS5UgP386nLcTgdCPgSQV5L8=;
        b=cWC6D9M/5bwzn9VSBXjRWAfLdkn71wJVpe8r203+ENrtY7Ley8L9De4nfKesvwQtWJ
         gfJZ2XqSTm0FPasyv/2Mo4ck4MaOAPAsJiV6XTNWckeaRDfASP5z7Lk6CV2VeWpp0BZv
         dKbt1pXq+FoYhhNSi4ZCFIrD+1kLut5WQw+/l5PFCA5JD1U3XKg4Qyhm1f8hIbgMxnSz
         PqD8DC58nJQczol1hwbBJlkcHckh7gFyFCoaZAKTv4L4BEaSUt9k2AHpLCiNjFKvnaYT
         K+Wh6RLimDVfm+lpl7ZuDld/nUg39aGSSpmIqFVhzPaa5VaXfJvDdw2g7tKHqGJmkQ+c
         9PCQ==
X-Gm-Message-State: AO0yUKWbA9K4wcn+M81yIJBQNWq0XTb81cxPAoVbuERHb3moAGBXLTXm
        Fm7Vv8w3cTOigwcyNApSWm0=
X-Google-Smtp-Source: AK7set+NocQirBnrujf1tTBTFoYquTWTzYAiv+dftcjwaWj6QaezaxSN4aqu7L+BsyICVrYlQ2pZ3g==
X-Received: by 2002:a05:6808:2992:b0:378:2df5:49f5 with SMTP id ex18-20020a056808299200b003782df549f5mr1064832oib.2.1676376043855;
        Tue, 14 Feb 2023 04:00:43 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id v84-20020acade57000000b003458d346a60sm6061763oig.25.2023.02.14.04.00.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Feb 2023 04:00:43 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <a9a3b3b3-64c2-8ee6-ceda-0dd78b94b07e@roeck-us.net>
Date:   Tue, 14 Feb 2023 04:00:41 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3] usb: typec: tcpm: fix create duplicate
 source/sink-capabilities file
Content-Language: en-US
To:     Xu Yang <xu.yang_2@nxp.com>, heikki.krogerus@linux.intel.com
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-imx@nxp.com, jun.li@nxp.com
References: <20230214065635.972698-1-xu.yang_2@nxp.com>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20230214065635.972698-1-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2/13/23 22:56, Xu Yang wrote:
> The kernel will dump in the below cases:
> sysfs: cannot create duplicate filename
> '/devices/virtual/usb_power_delivery/pd1/source-capabilities'
> 
> 1. After soft reset has completed, an Explicit Contract negotiation occurs.
> The sink device will receive source capabilitys again. This will cause
> a duplicate source-capabilities file be created.
> 2. Power swap twice on a device that is initailly sink role.
> 
> This will unregister existing capabilities when above cases occurs.
> 
> Fixes: 8203d26905ee ("usb: typec: tcpm: Register USB Power Delivery Capabilities")
> cc: <stable@vger.kernel.org>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> 
> ---
> v2: unregister existing capabilities on specific cases
> v3: add changelog and modify commit message
> ---
>   drivers/usb/typec/tcpm/tcpm.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index a0d943d78580..7d8c53d96c3b 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -4570,6 +4570,8 @@ static void run_state_machine(struct tcpm_port *port)
>   	case SOFT_RESET:
>   		port->message_id = 0;
>   		port->rx_msgid = -1;
> +		/* remove existing capabilities */
> +		usb_power_delivery_unregister_capabilities(port->partner_source_caps);
>   		tcpm_pd_send_control(port, PD_CTRL_ACCEPT);
>   		tcpm_ams_finish(port);
>   		if (port->pwr_role == TYPEC_SOURCE) {
> @@ -4589,6 +4591,8 @@ static void run_state_machine(struct tcpm_port *port)
>   	case SOFT_RESET_SEND:
>   		port->message_id = 0;
>   		port->rx_msgid = -1;
> +		/* remove existing capabilities */
> +		usb_power_delivery_unregister_capabilities(port->partner_source_caps);
>   		if (tcpm_pd_send_control(port, PD_CTRL_SOFT_RESET))
>   			tcpm_set_state_cond(port, hard_reset_state(port), 0);
>   		else
> @@ -4718,6 +4722,8 @@ static void run_state_machine(struct tcpm_port *port)
>   		tcpm_set_state(port, SNK_STARTUP, 0);
>   		break;
>   	case PR_SWAP_SNK_SRC_SINK_OFF:
> +		/* will be source, remove existing capabilities */
> +		usb_power_delivery_unregister_capabilities(port->partner_source_caps);
>   		/*
>   		 * Prevent vbus discharge circuit from turning on during PR_SWAP
>   		 * as this is not a disconnect.

