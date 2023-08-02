Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 07B9676CF4F
	for <lists+linux-usb@lfdr.de>; Wed,  2 Aug 2023 15:58:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234512AbjHBN6A (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Aug 2023 09:58:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234509AbjHBN5w (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 2 Aug 2023 09:57:52 -0400
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com [IPv6:2607:f8b0:4864:20::d36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9384B2101
        for <linux-usb@vger.kernel.org>; Wed,  2 Aug 2023 06:57:51 -0700 (PDT)
Received: by mail-io1-xd36.google.com with SMTP id ca18e2360f4ac-790b95beeedso82517439f.0
        for <linux-usb@vger.kernel.org>; Wed, 02 Aug 2023 06:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690984671; x=1691589471;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=VKbqMXLKKXNpH8fQsyhuKq6zIQy3jNDRCBAR4n87W4I=;
        b=EzVUA909uxcEE3Ut2z+x1DepQOoU+ud+WeQlEB1rkxFdZSN6/inxSIEvvHGRYMMmix
         sAqESN13WI9647WLWSqOGAjPzeb1c8yaxLRwDpYBPVkD6dqCOF7jTQBTR4BcAFGweBcj
         mHb+nd4jANFVj61VHXTzOoCOBLZHc49L1iFBf6J5jgmHq0Jxp5xzWbmCnT3Exr9+hWMN
         SHDsqVPUR20EaN8MMB5/Fm+TP+CsjdY2HjWrsFxSvbMrgctLaDLpD8fsnfomW9yGiTn4
         srCMT8ECb2+XGP2XgQYpapKBryZyy9Git0tVOapYO7FdwMG+Htcdgau3wgeTIB+7pJCU
         YVJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690984671; x=1691589471;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VKbqMXLKKXNpH8fQsyhuKq6zIQy3jNDRCBAR4n87W4I=;
        b=GlPWF7/6IKV4aig9zEX19jSCs3T7dQccDSR0leaHkop/ZIu/VJ0yBnq7xmodk2LTaJ
         luLSU2z2yMPad+i6dCK3KNS5JWV0HeNdWHRzLoWa62xIGcVNTic6SlUhxuu3xcIh68fI
         81DtncKaXFdYbnH9d06DHT/hAAobza5G53iWniedTxk45SUkb/gw5VnD1yDYIkh0q0wC
         IopGSWsAmy44XPhpFkQ6B+YmFVrsoBBttvdoMX4pcAszfsiXH5RHPNMznyFApLiM53Yy
         GoQGboo1wmocIa3BV7Pw9Yy0WtkHnaB3n+DRi45eq3OSG0Ovhxbw/WBDBEWRlUZaiYRV
         3GaQ==
X-Gm-Message-State: ABy/qLaccwrcwad5RUmbJbF3DMaCOyO9zHUhDSQznC2/yQeOk0Fs8Lhw
        HH8EqtKmBFkaJv9XTaMwlCk=
X-Google-Smtp-Source: APBJJlHQdjWSA0YudGlTFDzBqWVQhEVfqljZRADxdTe+X+7bYxGGSPTe1LmDq8B0IXckRGDviu6KmA==
X-Received: by 2002:a05:6e02:1a24:b0:349:1a2:f695 with SMTP id g4-20020a056e021a2400b0034901a2f695mr16435860ile.31.1690984670763;
        Wed, 02 Aug 2023 06:57:50 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id o10-20020a92d38a000000b00345aaa564a6sm4455811ilo.44.2023.08.02.06.57.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Aug 2023 06:57:50 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <f178fed7-2580-6565-0497-eb6483a50258@roeck-us.net>
Date:   Wed, 2 Aug 2023 06:57:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2] usb: typec: tcpm: not sink vbus if operational current
 is 0mA
Content-Language: en-US
To:     Xu Yang <xu.yang_2@nxp.com>, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, jun.li@nxp.com
References: <20230801070110.1653394-1-xu.yang_2@nxp.com>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20230801070110.1653394-1-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 8/1/23 00:01, Xu Yang wrote:
> PD3.0 Spec 6.4.1.3.1 said:
> For a Sink requiring no power from the Source, the Voltage (B19-10)
> shall be set to 5V and the Operational Current Shall be set to 0mA.
> 
> Therefore, we can keep sink path closed if the operational current of
> the first fixed PDO is 0mA.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> 
> ---
> Changes in v2:
>    - also call tcpm_set_charge() when charge is false as suggested from
>      Heikki and Guenter.
> ---
>   drivers/usb/typec/tcpm/tcpm.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index 829d75ebab42..d999e6984fea 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -4301,7 +4301,9 @@ static void run_state_machine(struct tcpm_port *port)
>   			if (port->slow_charger_loop && (current_lim > PD_P_SNK_STDBY_MW / 5))
>   				current_lim = PD_P_SNK_STDBY_MW / 5;
>   			tcpm_set_current_limit(port, current_lim, 5000);
> -			tcpm_set_charge(port, true);
> +			/* Not sink vbus if operational current is 0mA */
> +			tcpm_set_charge(port, !!pdo_max_current(port->snk_pdo[0]));
> +
>   			if (!port->pd_supported)
>   				tcpm_set_state(port, SNK_READY, 0);
>   			else
> @@ -4582,7 +4584,8 @@ static void run_state_machine(struct tcpm_port *port)
>   			tcpm_set_current_limit(port,
>   					       tcpm_get_current_limit(port),
>   					       5000);
> -			tcpm_set_charge(port, true);
> +			/* Not sink vbus if operational current is 0mA */
> +			tcpm_set_charge(port, !!pdo_max_current(port->snk_pdo[0]));
>   		}
>   		if (port->ams == HARD_RESET)
>   			tcpm_ams_finish(port);

