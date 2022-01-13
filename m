Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED96A48D9DF
	for <lists+linux-usb@lfdr.de>; Thu, 13 Jan 2022 15:43:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234001AbiAMOnv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 Jan 2022 09:43:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233723AbiAMOnu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 13 Jan 2022 09:43:50 -0500
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 643CBC06161C
        for <linux-usb@vger.kernel.org>; Thu, 13 Jan 2022 06:43:50 -0800 (PST)
Received: by mail-oi1-x22d.google.com with SMTP id r131so7967990oig.1
        for <linux-usb@vger.kernel.org>; Thu, 13 Jan 2022 06:43:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=v1GOuGGL6yyzN42ZGgCTjE68g43hUGEmURWXzZXx8rI=;
        b=BdeVcLscFKGu5dC8djWC2lL4G1/61TCZUVB/YN6jQyrRVbs3n/naYaEyAj/T8UOCJd
         tO5PF7y48X/BSGy6t5lngLIytZhwSb+7yDy+65hGxFBjkw3y4YkBBp+3ehj0uUt3Pej3
         ojjJEcirbV4y33wyboamwazarQThLBGPRQyvBdL+wXoFb6D0WeuRZ4XKJONhnfB1+WJ0
         o72UURyPKEfUSE+szd7XDhQCkHQZCCySQie1U/KzEWG6Gcq0WNfpfuHkRBj5o9RxCljV
         DfimNYgO87MC+oZQAY/cDnJBdRWQNvkvxLKzgGm+uNW0tym6yY7vMg2SstA9CypTETPP
         O4Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=v1GOuGGL6yyzN42ZGgCTjE68g43hUGEmURWXzZXx8rI=;
        b=QaaAQkUU8/c5L5L3orU1jhBqRTvX4Hik9iIl3OmY/oaPPUcxvKDL7jKQ/AhP0es7d/
         oTPWELahsoWBbqKPg91FVe35dANaUxd7xuW0I7YUMI1nPlWhQofYHUyaDDrRz2ifNyBn
         bgXlgz52RP+CID3aJLqiQRQmkIXiocR0AiprpcNTfQxTOb0qezPREjSwfVQPld8qeGy+
         0b6mMI/dn6cQAelYxwlQTrxmLTVR9kbxP1p1/plMFU9PQtL9hoyIz8GqkSsHCh/O3hKb
         NPzrmXnGq+OtRNWku7d670OQaQdonJLlFwUQtXOL+WsqKvIMlx/e4L0QQMMG8FqQDGPQ
         mYsQ==
X-Gm-Message-State: AOAM533pkkIuLlJi6Dn0ZTVgqW59wWv7SPuPOxBjJkU0/dh6n3zh8VAI
        6HcNufOJFWuZ4P/+S/cSmrc=
X-Google-Smtp-Source: ABdhPJwEUihc8fPRH3gWwyG9sVRwacqkEtfnJ/y2eyZvQ+/wzdXqfpvKfGsLuGdPjwSeSitwhhIfhw==
X-Received: by 2002:a54:458d:: with SMTP id z13mr3324666oib.85.1642085029751;
        Thu, 13 Jan 2022 06:43:49 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k101sm530960otk.60.2022.01.13.06.43.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jan 2022 06:43:48 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH v3] usb: typec: tcpci: don't touch CC line if it's Vconn
 source
To:     Xu Yang <xu.yang_2@nxp.com>, heikki.krogerus@linux.intel.com
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        jun.li@nxp.com, linux-imx@nxp.com
References: <20220113092943.752372-1-xu.yang_2@nxp.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <e27acbdb-c6e5-3090-57d4-b3750a47f0e5@roeck-us.net>
Date:   Thu, 13 Jan 2022 06:43:46 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220113092943.752372-1-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 1/13/22 1:29 AM, Xu Yang wrote:
> With the AMS and Collision Avoidance, tcpm often needs to change the CC's
> termination. When one CC line is sourcing Vconn, if we still change its
> termination, the voltage of the another CC line is likely to be fluctuant
> and unstable.
> 
> Therefore, we should verify whether a CC line is sourcing Vconn before
> changing its termination and only change the termination that is not
> a Vconn line. This can be done by reading the Vconn Present bit of
> POWER_ STATUS register. To determine the polarity, we can read the
> Plug Orientation bit of TCPC_CONTROL register. Since Vconn can only be
> sourced if Plug Orientation is set.
> 
> Fixes: 0908c5aca31e ("usb: typec: tcpm: AMS and Collision Avoidance")
> cc: <stable@vger.kernel.org>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> 
> ---
> v2: changed subject line
> v3: optimized the commit message and code according to Guenter's suggestions
> ---
>   drivers/usb/typec/tcpm/tcpci.c | 26 ++++++++++++++++++++++++++
>   drivers/usb/typec/tcpm/tcpci.h |  1 +
>   2 files changed, 27 insertions(+)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
> index 35a1307349a2..e07d26a3cd8e 100644
> --- a/drivers/usb/typec/tcpm/tcpci.c
> +++ b/drivers/usb/typec/tcpm/tcpci.c
> @@ -75,9 +75,25 @@ static int tcpci_write16(struct tcpci *tcpci, unsigned int reg, u16 val)
>   static int tcpci_set_cc(struct tcpc_dev *tcpc, enum typec_cc_status cc)
>   {
>   	struct tcpci *tcpci = tcpc_to_tcpci(tcpc);
> +	bool vconn_pres;
> +	enum typec_cc_polarity polarity = TYPEC_POLARITY_CC1;
>   	unsigned int reg;
>   	int ret;
>   
> +	ret = regmap_read(tcpci->regmap, TCPC_POWER_STATUS, &reg);
> +	if (ret < 0)
> +		return ret;
> +
> +	vconn_pres = !!(reg & TCPC_POWER_STATUS_VCONN_PRES);
> +	if (vconn_pres) {
> +		ret = regmap_read(tcpci->regmap, TCPC_TCPC_CTRL, &reg);
> +		if (ret < 0)
> +			return ret;
> +
> +		if (reg & TCPC_TCPC_CTRL_ORIENTATION)
> +			polarity = TYPEC_POLARITY_CC2;
> +	}
> +
>   	switch (cc) {
>   	case TYPEC_CC_RA:
>   		reg = (TCPC_ROLE_CTRL_CC_RA << TCPC_ROLE_CTRL_CC1_SHIFT) |
> @@ -112,6 +128,16 @@ static int tcpci_set_cc(struct tcpc_dev *tcpc, enum typec_cc_status cc)
>   		break;
>   	}
>   
> +	if (vconn_pres) {
> +		if (polarity == TYPEC_POLARITY_CC2) {
> +			reg &= ~(TCPC_ROLE_CTRL_CC1_MASK << TCPC_ROLE_CTRL_CC1_SHIFT);
> +			reg |= (TCPC_ROLE_CTRL_CC_OPEN << TCPC_ROLE_CTRL_CC1_SHIFT);
> +		} else {
> +			reg &= ~(TCPC_ROLE_CTRL_CC2_MASK << TCPC_ROLE_CTRL_CC2_SHIFT);
> +			reg |= (TCPC_ROLE_CTRL_CC_OPEN << TCPC_ROLE_CTRL_CC2_SHIFT);
> +		}
> +	}
> +
>   	ret = regmap_write(tcpci->regmap, TCPC_ROLE_CTRL, reg);
>   	if (ret < 0)
>   		return ret;
> diff --git a/drivers/usb/typec/tcpm/tcpci.h b/drivers/usb/typec/tcpm/tcpci.h
> index 2be7a77d400e..b2edd45f13c6 100644
> --- a/drivers/usb/typec/tcpm/tcpci.h
> +++ b/drivers/usb/typec/tcpm/tcpci.h
> @@ -98,6 +98,7 @@
>   #define TCPC_POWER_STATUS_SOURCING_VBUS	BIT(4)
>   #define TCPC_POWER_STATUS_VBUS_DET	BIT(3)
>   #define TCPC_POWER_STATUS_VBUS_PRES	BIT(2)
> +#define TCPC_POWER_STATUS_VCONN_PRES	BIT(1)
>   #define TCPC_POWER_STATUS_SINKING_VBUS	BIT(0)
>   
>   #define TCPC_FAULT_STATUS		0x1f
> 

