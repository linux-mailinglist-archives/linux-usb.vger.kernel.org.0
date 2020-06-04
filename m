Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AD071EE2D5
	for <lists+linux-usb@lfdr.de>; Thu,  4 Jun 2020 12:53:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726310AbgFDKxW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 4 Jun 2020 06:53:22 -0400
Received: from mga02.intel.com ([134.134.136.20]:37010 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726265AbgFDKxU (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 4 Jun 2020 06:53:20 -0400
IronPort-SDR: PRyYfumNlauixBodAww7Q6i1sF/lBDOMQ4QJ01BLdRFLjfaX05WZt7WfbmMwETNpYKou0aQ/x8
 DNe31+uNIrpQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2020 03:53:19 -0700
IronPort-SDR: pasHbYU16YyWK7ESIYja2hJHOc1ue8FySN33Cec8RsnBE0AE1Pf2dvzNK9EmFFcEjFbG4Wla3Q
 Jir/aqQMG4pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,472,1583222400"; 
   d="scan'208";a="378378945"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 04 Jun 2020 03:53:16 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 04 Jun 2020 13:53:15 +0300
Date:   Thu, 4 Jun 2020 13:53:15 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     jun.li@nxp.com
Cc:     linux@roeck-us.net, john.stultz@linaro.org,
        gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2] usb: typec: tcpci_rt1711h: avoid screaming irq
 causing boot hangs
Message-ID: <20200604105315.GJ961311@kuha.fi.intel.com>
References: <20200603010251.38273-1-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200603010251.38273-1-jun.li@nxp.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jun 03, 2020 at 09:02:51AM +0800, jun.li@nxp.com wrote:
> From: Li Jun <jun.li@nxp.com>
> 
> John reported screaming irq caused by rt1711h when system boot[1],
> this is because irq request is done before tcpci_register_port(),
> so the chip->tcpci has not been setup, irq handler is entered but
> can't do anything, this patch is to address this by moving the irq
> request after tcpci_register_port().
> 
> [1] https://lore.kernel.org/linux-usb/20200530040157.31038-1-john.stultz@linaro.org
> 
> Fixes: ce08eaeb6388 ("staging: typec: rt1711h typec chip driver")
> Cc: John Stultz <john.stultz@linaro.org>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Li Jun <jun.li@nxp.com>

No Cc: <stable@vger.kernel.org> ? In any case, FWIW:

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
> changes for v2:
> - Add fix tag.
> - Use lore.kernel.org link.
> - Add Guenter's R-b tag.
> 
>  drivers/usb/typec/tcpm/tcpci_rt1711h.c | 31 ++++++++++---------------------
>  1 file changed, 10 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpci_rt1711h.c b/drivers/usb/typec/tcpm/tcpci_rt1711h.c
> index 0173890..b56a088 100644
> --- a/drivers/usb/typec/tcpm/tcpci_rt1711h.c
> +++ b/drivers/usb/typec/tcpm/tcpci_rt1711h.c
> @@ -179,26 +179,6 @@ static irqreturn_t rt1711h_irq(int irq, void *dev_id)
>  	return tcpci_irq(chip->tcpci);
>  }
>  
> -static int rt1711h_init_alert(struct rt1711h_chip *chip,
> -			      struct i2c_client *client)
> -{
> -	int ret;
> -
> -	/* Disable chip interrupts before requesting irq */
> -	ret = rt1711h_write16(chip, TCPC_ALERT_MASK, 0);
> -	if (ret < 0)
> -		return ret;
> -
> -	ret = devm_request_threaded_irq(chip->dev, client->irq, NULL,
> -					rt1711h_irq,
> -					IRQF_ONESHOT | IRQF_TRIGGER_LOW,
> -					dev_name(chip->dev), chip);
> -	if (ret < 0)
> -		return ret;
> -	enable_irq_wake(client->irq);
> -	return 0;
> -}
> -
>  static int rt1711h_sw_reset(struct rt1711h_chip *chip)
>  {
>  	int ret;
> @@ -260,7 +240,8 @@ static int rt1711h_probe(struct i2c_client *client,
>  	if (ret < 0)
>  		return ret;
>  
> -	ret = rt1711h_init_alert(chip, client);
> +	/* Disable chip interrupts before requesting irq */
> +	ret = rt1711h_write16(chip, TCPC_ALERT_MASK, 0);
>  	if (ret < 0)
>  		return ret;
>  
> @@ -271,6 +252,14 @@ static int rt1711h_probe(struct i2c_client *client,
>  	if (IS_ERR_OR_NULL(chip->tcpci))
>  		return PTR_ERR(chip->tcpci);
>  
> +	ret = devm_request_threaded_irq(chip->dev, client->irq, NULL,
> +					rt1711h_irq,
> +					IRQF_ONESHOT | IRQF_TRIGGER_LOW,
> +					dev_name(chip->dev), chip);
> +	if (ret < 0)
> +		return ret;
> +	enable_irq_wake(client->irq);
> +
>  	return 0;
>  }

thanks,

-- 
heikki
