Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A904A78A941
	for <lists+linux-usb@lfdr.de>; Mon, 28 Aug 2023 11:50:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229706AbjH1JuQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 28 Aug 2023 05:50:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229662AbjH1Jtq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 28 Aug 2023 05:49:46 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FFE9110
        for <linux-usb@vger.kernel.org>; Mon, 28 Aug 2023 02:49:44 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B21CA615F5
        for <linux-usb@vger.kernel.org>; Mon, 28 Aug 2023 09:49:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B689FC433C7;
        Mon, 28 Aug 2023 09:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1693216183;
        bh=FuKGPnMAWiCKYE9ZEhaoZ0kJwJY6jX+Fo5H3mfPal3M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nIQR6LPZLQIeqeKDplC5JSrruHbzBRo+LdKNHwX7lRxZR3boOynmBic9nm2imoUwi
         BlouP8h1Je/C6fmj1M0BZ48/qyKG/QITfAoRAz6V6K5IG7ZP+jC4LyQ4uzAbsUBQkK
         sjHiS3DvX2IX5qA4rtNSceFWFfJFiCuDY4oTRs+s=
Date:   Mon, 28 Aug 2023 11:49:35 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Xu Yang <xu.yang_2@nxp.com>
Cc:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        linux-usb@vger.kernel.org, jun.li@nxp.com
Subject: Re: [PATCH 1/2] usb: typec: tcpci: add check code for
 tcpci/regmap_read/write()
Message-ID: <2023082803-stylus-turbine-cb47@gregkh>
References: <20230828093035.1556639-1-xu.yang_2@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230828093035.1556639-1-xu.yang_2@nxp.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Aug 28, 2023 at 05:30:34PM +0800, Xu Yang wrote:
> The return value from tcpci/regmap_read/write() must be checked to get
> rid of the bad influence of other modules.

What do you mean by "other modules" here?

> This will add check code for
> all of the rest read/write() callbacks and will show error when failed
> to get ALERT register.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  drivers/usb/typec/tcpm/tcpci.c | 36 +++++++++++++++++++++++++---------
>  1 file changed, 27 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
> index 0ee3e6e29bb1..698d00b7fce9 100644
> --- a/drivers/usb/typec/tcpm/tcpci.c
> +++ b/drivers/usb/typec/tcpm/tcpci.c
> @@ -657,21 +657,30 @@ irqreturn_t tcpci_irq(struct tcpci *tcpci)
>  	int ret;
>  	unsigned int raw;
>  
> -	tcpci_read16(tcpci, TCPC_ALERT, &status);
> +	ret = tcpci_read16(tcpci, TCPC_ALERT, &status);
> +	if (ret < 0) {
> +		dev_err(tcpci->dev, "ALERT read failed\n");

You are printing something in an irq handler, are you sure you want to
do that?  What happens if this is very noisy?

> +		return ret;
> +	}
>  
>  	/*
>  	 * Clear alert status for everything except RX_STATUS, which shouldn't
>  	 * be cleared until we have successfully retrieved message.
>  	 */
> -	if (status & ~TCPC_ALERT_RX_STATUS)
> -		tcpci_write16(tcpci, TCPC_ALERT,
> +	if (status & ~TCPC_ALERT_RX_STATUS) {
> +		ret = tcpci_write16(tcpci, TCPC_ALERT,
>  			      status & ~TCPC_ALERT_RX_STATUS);
> +		if (ret < 0)
> +			return ret;
> +	}
>  
>  	if (status & TCPC_ALERT_CC_STATUS)
>  		tcpm_cc_change(tcpci->port);
>  
>  	if (status & TCPC_ALERT_POWER_STATUS) {
> -		regmap_read(tcpci->regmap, TCPC_POWER_STATUS_MASK, &raw);
> +		ret = regmap_read(tcpci->regmap, TCPC_POWER_STATUS_MASK, &raw);
> +		if (ret < 0)
> +			return ret;
>  		/*
>  		 * If power status mask has been reset, then the TCPC
>  		 * has reset.
> @@ -687,7 +696,9 @@ irqreturn_t tcpci_irq(struct tcpci *tcpci)
>  		unsigned int cnt, payload_cnt;
>  		u16 header;
>  
> -		regmap_read(tcpci->regmap, TCPC_RX_BYTE_CNT, &cnt);
> +		ret = regmap_read(tcpci->regmap, TCPC_RX_BYTE_CNT, &cnt);
> +		if (ret < 0)
> +			return ret;
>  		/*
>  		 * 'cnt' corresponds to READABLE_BYTE_COUNT in section 4.4.14
>  		 * of the TCPCI spec [Rev 2.0 Ver 1.0 October 2017] and is
> @@ -699,18 +710,25 @@ irqreturn_t tcpci_irq(struct tcpci *tcpci)
>  		else
>  			payload_cnt = 0;
>  
> -		tcpci_read16(tcpci, TCPC_RX_HDR, &header);
> +		ret = tcpci_read16(tcpci, TCPC_RX_HDR, &header);
> +		if (ret < 0)
> +			return ret;
>  		msg.header = cpu_to_le16(header);
>  
>  		if (WARN_ON(payload_cnt > sizeof(msg.payload)))
>  			payload_cnt = sizeof(msg.payload);
>  
> -		if (payload_cnt > 0)
> -			regmap_raw_read(tcpci->regmap, TCPC_RX_DATA,
> +		if (payload_cnt > 0) {
> +			ret = regmap_raw_read(tcpci->regmap, TCPC_RX_DATA,
>  					&msg.payload, payload_cnt);
> +			if (ret < 0)
> +				return ret;
> +		}
>  
>  		/* Read complete, clear RX status alert bit */
> -		tcpci_write16(tcpci, TCPC_ALERT, TCPC_ALERT_RX_STATUS);
> +		ret = tcpci_write16(tcpci, TCPC_ALERT, TCPC_ALERT_RX_STATUS);
> +		if (ret < 0)
> +			return ret;

For all of these, if an error happens, you are not able to unwind from
the previous actions that the irq handler took.

Are you sure this is ok?  How was this tested?

thanks,

greg k-h
