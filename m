Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7CF41EBD3F
	for <lists+linux-usb@lfdr.de>; Tue,  2 Jun 2020 15:43:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726320AbgFBNno (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 2 Jun 2020 09:43:44 -0400
Received: from mga02.intel.com ([134.134.136.20]:36619 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725919AbgFBNno (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 2 Jun 2020 09:43:44 -0400
IronPort-SDR: IfhlpGvhdDBhCu4lea/LHJXOO2YmVVQvSFjZ7qAab0DgN2zszeYQXGHewpd0uXCeXbxupwAv69
 oKiEGhWZTYFg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2020 06:43:43 -0700
IronPort-SDR: WU1+rl1Ht8NH5f0hkX5GKtFOPIDn44g2inqwfiNxrQHOsz6J0FxxidpWoPXS21OFS+GefrprEV
 1JDiHJ16nf8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,464,1583222400"; 
   d="scan'208";a="377752764"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 02 Jun 2020 06:43:40 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 02 Jun 2020 16:43:39 +0300
Date:   Tue, 2 Jun 2020 16:43:39 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     jun.li@nxp.com
Cc:     linux@roeck-us.net, john.stultz@linaro.org,
        gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: typec: tcpci_rt1711h: avoid screaming irq causing
 boot hangs
Message-ID: <20200602134339.GB961311@kuha.fi.intel.com>
References: <20200602071208.12120-1-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200602071208.12120-1-jun.li@nxp.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jun 02, 2020 at 03:12:08PM +0800, jun.li@nxp.com wrote:
> From: Li Jun <jun.li@nxp.com>
> 
> John reported screaming irq caused by rt1711h when system boot[1],
> this is because irq request is done before tcpci_register_port(),
> so the chip->tcpci has not been setup, irq handler is entered but
> can't do anything, this patch is to address this by moving the irq
> request after tcpci_register_port().
> 
> [1] https://lkml.org/lkml/2020/5/30/1
> 
> Cc: John Stultz <john.stultz@linaro.org>
> Signed-off-by: Li Jun <jun.li@nxp.com>

Shouldn't this be marked as a fix?

> ---
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
