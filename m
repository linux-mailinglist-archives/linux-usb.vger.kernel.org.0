Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EC2148C7C4
	for <lists+linux-usb@lfdr.de>; Wed, 12 Jan 2022 17:00:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354887AbiALQAk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Jan 2022 11:00:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243611AbiALQAi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 12 Jan 2022 11:00:38 -0500
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0485C06173F
        for <linux-usb@vger.kernel.org>; Wed, 12 Jan 2022 08:00:37 -0800 (PST)
Received: by mail-ot1-x331.google.com with SMTP id h20-20020a9d6f94000000b0059100e01744so3028130otq.4
        for <linux-usb@vger.kernel.org>; Wed, 12 Jan 2022 08:00:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=+VpQUriFLzw4q5uRjYZngK/VxtrTJXV1FXPcVYxOgBI=;
        b=hSzytLqkxJ/8K8M9SiQ4AF7K6bo5gswaZuHTWkt3Vg3fa8Hn4IEWYiCMc+HPHvjUGS
         dntTL38EUFQsP9Oy2po4v8tFGXAhPJNRayaKM90+dadYJnPPYKpviEXJhPyAbrxksSDI
         SP5W17PeEYXrtgpLdy0y0N9NsNdoEwrxlaKdK94ISBnwjftbNF5HTi1/hNY885whzYCk
         oaUqvinYgZp44MzvH7CZ+mdwvzHyQW2TZHVOOkkzUUTm6nR734SkXHUGPXka3h950XO8
         eJ76XX3Z0oMzgTDKUgRTEv3bguqZLk80m+8NEfjzNM8O2SoSqJhGX8s1LTENEWOGxqUu
         59/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=+VpQUriFLzw4q5uRjYZngK/VxtrTJXV1FXPcVYxOgBI=;
        b=nIFmBIq9Sm80tr8Cvtp19K5yfJ49IL5LPBw7Rhe1Stuski0EGPWUhSoaPHTaxcbCie
         jobUSQw8BaiEZG4Odg9tKJ7Yi8ubLvlZmMoRXTaqFv0LQB0wiPGjqiGxlVSDwHkKtYUn
         U6qKSGQENOTOOBCU/UV6MFGZEIwlEE6PQp5Q1VIsYUuF791560/E9M8P9a+tydzWnGlR
         X5EG83hOiRPXbVbJzIgrfUVBH6kAVegdUx/iUa8irRix9ZnUE6hO8f7UBPxxeEjgKWPL
         gzGx4q516rFUGJN00E/rTgjnuBeuSbms5R2dICCnzTQpwODqs2hK8cVnrk7Tj95SBB9w
         cKKw==
X-Gm-Message-State: AOAM530I2KlxYEZDZWOiiRshjeLXg7z+mJqgdi0p4WY4HWYOJxDJm5PS
        9L9S6q2MmfBzA0jS98GlTKveDTF6p9c=
X-Google-Smtp-Source: ABdhPJzySMtXHnFWXYwY9JVcWLUj3/ZL2u87+CnyXy50SOtNSafrqattnTbpMsgLIiYaudvgCpbaqA==
X-Received: by 2002:a05:6830:2b0f:: with SMTP id l15mr344356otv.42.1642003237204;
        Wed, 12 Jan 2022 08:00:37 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id n8sm41906oos.44.2022.01.12.08.00.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jan 2022 08:00:36 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 12 Jan 2022 08:00:35 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Xu Yang <xu.yang_2@nxp.com>
Cc:     heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, jun.li@nxp.com, linux-imx@nxp.com
Subject: Re: [PATCH v2] usb: typec: tcpci: don't touch CC line if it's Vconn
 source
Message-ID: <20220112160035.GB386615@roeck-us.net>
References: <20220112094116.616272-1-xu.yang_2@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220112094116.616272-1-xu.yang_2@nxp.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jan 12, 2022 at 05:41:16PM +0800, Xu Yang wrote:
> With the AMS and Collision Avoidance, tcpm often needs to change the CC's
> termination. When one CC line is souring Vconn, if we still change its

s/souring/sourcing/

> termination, the voltage of the another CC line is likely to be fluctuant
> and unstable.
> 
> Therefore, we should verify whether a CC line is soucing Vconn before

s/soucing/sourcing/

> changing its termination. And only changing the termination that is
> not a Vconn line. This can be done by reading the VCONN Present bit of

... and only change ...

maybe to make it a full sentence.

> POWER_ STATUS register. To determinate the polarity, we can read the

determine

> Plug Orientation bit of TCPC_CONTROL register. Since only if Plug
> Orientation is set, Vconn can be sourced.

Maybe something like

Vconn can only be be sourced if Plug Orientation is set.

> 
> Fixes: 0908c5aca31e ("usb: typec: tcpm: AMS and Collision Avoidance")
> cc: <stable@vger.kernel.org>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> 
> ---
> v2: changed subject line
> ---
>  drivers/usb/typec/tcpm/tcpci.c | 27 +++++++++++++++++++++++++++
>  drivers/usb/typec/tcpm/tcpci.h |  1 +
>  2 files changed, 28 insertions(+)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
> index 35a1307349a2..0bf4cbfaa21c 100644
> --- a/drivers/usb/typec/tcpm/tcpci.c
> +++ b/drivers/usb/typec/tcpm/tcpci.c
> @@ -75,9 +75,26 @@ static int tcpci_write16(struct tcpci *tcpci, unsigned int reg, u16 val)
>  static int tcpci_set_cc(struct tcpc_dev *tcpc, enum typec_cc_status cc)
>  {
>  	struct tcpci *tcpci = tcpc_to_tcpci(tcpc);
> +	bool vconn_pres = false;
> +	enum typec_cc_polarity polarity = TYPEC_POLARITY_CC1;
>  	unsigned int reg;
>  	int ret;
>  
> +	ret = regmap_read(tcpci->regmap, TCPC_POWER_STATUS, &reg);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (reg & TCPC_POWER_STATUS_VCONN_PRES) {
> +		vconn_pres = true;

How about
	vconn_pres = !!(reg & TCPC_POWER_STATUS_VCONN_PRES);

	if (vconn_pres) {
...

> +
> +		ret = regmap_read(tcpci->regmap, TCPC_TCPC_CTRL, &reg);
> +		if (ret < 0)
> +			return ret;
> +
> +		if (reg & TCPC_TCPC_CTRL_ORIENTATION)
> +			polarity = TYPEC_POLARITY_CC2;
> +	}
> +
>  	switch (cc) {
>  	case TYPEC_CC_RA:
>  		reg = (TCPC_ROLE_CTRL_CC_RA << TCPC_ROLE_CTRL_CC1_SHIFT) |
> @@ -112,6 +129,16 @@ static int tcpci_set_cc(struct tcpc_dev *tcpc, enum typec_cc_status cc)
>  		break;
>  	}
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
>  	ret = regmap_write(tcpci->regmap, TCPC_ROLE_CTRL, reg);
>  	if (ret < 0)
>  		return ret;
> diff --git a/drivers/usb/typec/tcpm/tcpci.h b/drivers/usb/typec/tcpm/tcpci.h
> index 2be7a77d400e..b2edd45f13c6 100644
> --- a/drivers/usb/typec/tcpm/tcpci.h
> +++ b/drivers/usb/typec/tcpm/tcpci.h
> @@ -98,6 +98,7 @@
>  #define TCPC_POWER_STATUS_SOURCING_VBUS	BIT(4)
>  #define TCPC_POWER_STATUS_VBUS_DET	BIT(3)
>  #define TCPC_POWER_STATUS_VBUS_PRES	BIT(2)
> +#define TCPC_POWER_STATUS_VCONN_PRES	BIT(1)
>  #define TCPC_POWER_STATUS_SINKING_VBUS	BIT(0)
>  
>  #define TCPC_FAULT_STATUS		0x1f
> -- 
> 2.25.1
> 
