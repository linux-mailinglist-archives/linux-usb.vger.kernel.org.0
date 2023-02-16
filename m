Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D80DF699D43
	for <lists+linux-usb@lfdr.de>; Thu, 16 Feb 2023 20:59:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229651AbjBPT7M (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Feb 2023 14:59:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229592AbjBPT7M (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 Feb 2023 14:59:12 -0500
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com [IPv6:2001:4860:4864:20::34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2311550340
        for <linux-usb@vger.kernel.org>; Thu, 16 Feb 2023 11:59:10 -0800 (PST)
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-16aa71c1600so3851308fac.11
        for <linux-usb@vger.kernel.org>; Thu, 16 Feb 2023 11:59:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=iGmbpFV2raGtE0p8UpJeXtUdoU+TvGGNAVmpXYiFVPA=;
        b=nrSRF1TSLsr0oUPHTuYer+zxIEODDW8lhUmXxEUTOaT7eQGpUxR83A0OLLZVanGtmb
         vXX7CRk+w8fEQ0HX0jfXgciFlkVFQKoFMeO/DKqdIAHwXYIe0JEcgDUgH2rZUGW3+5Ue
         PSHurv/dT6EPDPmiuVTBaqG1nAadq+8kJUb3ProhVKpk2LbQU7UeqcfjlRnPIsiLJmzz
         dshTgqvBSty+VQZxRSvFybWHUrCTxJBQdcJ3hwxaE1hIdZWo3iKR8VW2WQtHa3koYjv9
         1Oz1Kz2o5XI3rwDjaHN2VO2D8l+85Xq8ZjQ36BmCqGkU1CwkjFgET7V2ERP+8lIdx8LG
         cWBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iGmbpFV2raGtE0p8UpJeXtUdoU+TvGGNAVmpXYiFVPA=;
        b=Sc/NSAurwlDfcXrwNgpRok1Qumjv2CnJcSHZilABR2oWsoTkPyJEWShMXCI/Ta/0dJ
         R33989Nb5sOuTmkDmZl1vcvtxXzh9cLNNekRaNtKmeh6JkAsaCs1PQfCUQ1OVBao3Ed3
         L0TgD6/keMXAdmLVA8hSp3ZBhPzsQ3i6jCGL6HITUSKT2vErwwiIi22xw3gNWqCNrlir
         tLTQT9rHveLumvaDPl/z3O87nKDscVXKuJhJTRHDFkUFk+vTN0FWV70YRjAiwUGrDgoK
         2gNmoiitkBFze+szrPNmCSc5fwMGt94lnTLEjSxMNU50d+QK8xd2Bul3JOJ0nQnFHvFQ
         xX5w==
X-Gm-Message-State: AO0yUKV6j3urg/ELDrANb+tYj7jj4TcfQ72luZdtZdyYG9QVO+7IKmaK
        fjGQZMShjEx5qQRhpOq1W7g=
X-Google-Smtp-Source: AK7set/U12rMSFnmfbFaz583HouqUrJPhxGyeuRPnLye02B25csNHliEMXJsFQgn46/+s7QdQduFpg==
X-Received: by 2002:a05:6870:e248:b0:16a:c24a:338f with SMTP id d8-20020a056870e24800b0016ac24a338fmr4050213oac.37.1676577550311;
        Thu, 16 Feb 2023 11:59:10 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id y1-20020a056870e50100b0016e5ad3e892sm921181oag.14.2023.02.16.11.59.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Feb 2023 11:59:09 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <c4881c85-28d7-5ae6-f71a-0e7f4c1ad3f5@roeck-us.net>
Date:   Thu, 16 Feb 2023 11:59:07 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v4] usb: typec: tcpm: fix create duplicate
 source-capabilities file
Content-Language: en-US
To:     Xu Yang <xu.yang_2@nxp.com>, heikki.krogerus@linux.intel.com
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-imx@nxp.com, jun.li@nxp.com
References: <20230215054951.238394-1-xu.yang_2@nxp.com>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20230215054951.238394-1-xu.yang_2@nxp.com>
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

On 2/14/23 21:49, Xu Yang wrote:
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
> changelogs:
> v2: unregister existing capabilities on specific cases
> v3: add changelog and modify commit message
> v4: reset port->partner_source_caps to NULL
> ---
>   drivers/usb/typec/tcpm/tcpm.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index a0d943d78580..7f39cb9b3429 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -4570,6 +4570,9 @@ static void run_state_machine(struct tcpm_port *port)
>   	case SOFT_RESET:
>   		port->message_id = 0;
>   		port->rx_msgid = -1;
> +		/* remove existing capabilities */
> +		usb_power_delivery_unregister_capabilities(port->partner_source_caps);
> +		port->partner_source_caps = NULL;
>   		tcpm_pd_send_control(port, PD_CTRL_ACCEPT);
>   		tcpm_ams_finish(port);
>   		if (port->pwr_role == TYPEC_SOURCE) {
> @@ -4589,6 +4592,9 @@ static void run_state_machine(struct tcpm_port *port)
>   	case SOFT_RESET_SEND:
>   		port->message_id = 0;
>   		port->rx_msgid = -1;
> +		/* remove existing capabilities */
> +		usb_power_delivery_unregister_capabilities(port->partner_source_caps);
> +		port->partner_source_caps = NULL;
>   		if (tcpm_pd_send_control(port, PD_CTRL_SOFT_RESET))
>   			tcpm_set_state_cond(port, hard_reset_state(port), 0);
>   		else
> @@ -4718,6 +4724,9 @@ static void run_state_machine(struct tcpm_port *port)
>   		tcpm_set_state(port, SNK_STARTUP, 0);
>   		break;
>   	case PR_SWAP_SNK_SRC_SINK_OFF:
> +		/* will be source, remove existing capabilities */
> +		usb_power_delivery_unregister_capabilities(port->partner_source_caps);
> +		port->partner_source_caps = NULL;
>   		/*
>   		 * Prevent vbus discharge circuit from turning on during PR_SWAP
>   		 * as this is not a disconnect.

