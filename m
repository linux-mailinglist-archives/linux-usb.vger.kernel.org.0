Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 860AF65AEBB
	for <lists+linux-usb@lfdr.de>; Mon,  2 Jan 2023 10:36:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231454AbjABJga (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 2 Jan 2023 04:36:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230196AbjABJg2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 2 Jan 2023 04:36:28 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3024E1EC
        for <linux-usb@vger.kernel.org>; Mon,  2 Jan 2023 01:36:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672652187; x=1704188187;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=T+dNBr0eV/oqBUZZEUcCvp4Ld8O+HsMcrBTJYEk4dPE=;
  b=IUJ5t9XyTuMd6RLj+p1qr9nwyI7us2Sls3w+I2u2yTDRewWZ0A3dGJYF
   LOJcPoWAZKrX9Z7PxUZNBj+lo49jIwRrs2NwIq7aurQpF2jUPAlnTNBzZ
   cvqK60ubf66I9dYROY/KkPWgKIC+TbFiec0mGM3cHrYZMUfQxKdCLR2Yn
   QLK8sw/P0dWzPp1ww/YZn3EnoVyMWMaSjCZZu64W0PuCj8T6Qw0laUF+i
   Pc5WmPNJugYtyH958OGhd1YlH32L+STVc7GZn+zpMuIjw0mp6/QnDWQmN
   3AaaoQyn5zDfaUapppxaL+4BvOkDpYjRt37VW8JpTdn+zWySIB5ds/6iB
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10577"; a="323450268"
X-IronPort-AV: E=Sophos;i="5.96,293,1665471600"; 
   d="scan'208";a="323450268"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2023 01:36:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10577"; a="796826719"
X-IronPort-AV: E=Sophos;i="5.96,293,1665471600"; 
   d="scan'208";a="796826719"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 02 Jan 2023 01:36:23 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 02 Jan 2023 11:36:23 +0200
Date:   Mon, 2 Jan 2023 11:36:23 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Xu Yang <xu.yang_2@nxp.com>
Cc:     linux@roeck-us.net, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, linux-imx@nxp.com, jun.li@nxp.com
Subject: Re: [PATCH v2] usb: typec: tcpci: Request IRQ with IRQF_SHARED
Message-ID: <Y7Kll6U34rEwH/f4@kuha.fi.intel.com>
References: <20221214022334.2520677-1-xu.yang_2@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221214022334.2520677-1-xu.yang_2@nxp.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Dec 14, 2022 at 10:23:34AM +0800, Xu Yang wrote:
> Under resource constraints, this interrupt may use other interrupt line
> or this interrupt line may be shared with other devices as long as they
> meet the sharing requirements. Besides, This irq flag will not cause other
> side effect if tcpci driver is the only user.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
> Changes since v1:
> - return IRQ_NONE if the interrupt doesn't belong to this device
> ---
>  drivers/usb/typec/tcpm/tcpci.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
> index fe781a38dc82..c7796511695d 100644
> --- a/drivers/usb/typec/tcpm/tcpci.c
> +++ b/drivers/usb/typec/tcpm/tcpci.c
> @@ -33,6 +33,7 @@ struct tcpci {
>  	struct tcpm_port *port;
>  
>  	struct regmap *regmap;
> +	unsigned int alert_mask;
>  
>  	bool controls_vbus;
>  
> @@ -632,6 +633,9 @@ static int tcpci_init(struct tcpc_dev *tcpc)
>  		if (ret < 0)
>  			return ret;
>  	}
> +
> +	tcpci->alert_mask = reg;
> +
>  	return tcpci_write16(tcpci, TCPC_ALERT_MASK, reg);
>  }
>  
> @@ -715,7 +719,7 @@ irqreturn_t tcpci_irq(struct tcpci *tcpci)
>  	else if (status & TCPC_ALERT_TX_FAILED)
>  		tcpm_pd_transmit_complete(tcpci->port, TCPC_TX_FAILED);
>  
> -	return IRQ_HANDLED;
> +	return IRQ_RETVAL(status & tcpci->alert_mask);
>  }
>  EXPORT_SYMBOL_GPL(tcpci_irq);
>  
> @@ -838,7 +842,7 @@ static int tcpci_probe(struct i2c_client *client)
>  
>  	err = devm_request_threaded_irq(&client->dev, client->irq, NULL,
>  					_tcpci_irq,
> -					IRQF_ONESHOT | IRQF_TRIGGER_LOW,
> +					IRQF_SHARED | IRQF_ONESHOT | IRQF_TRIGGER_LOW,
>  					dev_name(&client->dev), chip);
>  	if (err < 0) {
>  		tcpci_unregister_port(chip->tcpci);
> -- 
> 2.34.1

thanks,

-- 
heikki
