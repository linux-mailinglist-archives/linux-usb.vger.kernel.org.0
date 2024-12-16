Return-Path: <linux-usb+bounces-18537-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A58299F3960
	for <lists+linux-usb@lfdr.de>; Mon, 16 Dec 2024 19:55:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C1A277A22F4
	for <lists+linux-usb@lfdr.de>; Mon, 16 Dec 2024 18:55:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A1A620767A;
	Mon, 16 Dec 2024 18:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="zJ5koQAh"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA1920766A
	for <linux-usb@vger.kernel.org>; Mon, 16 Dec 2024 18:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734375349; cv=none; b=f319b4BkCiefXup1BmBgpmlZAapm0PvN1Dbf/cpjpwg6bXiGEuoW+6UTjsWZXQUbxDcKpUkr+AlgZ3Q/TQQZaWiU2QbFrY2ztuDLJyy+XXSCVkHD66jq5S9wzZCJ3W8o9C/W/5jklf8ldXpxHpzraqrP+gnywq44QToeVf6l1Bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734375349; c=relaxed/simple;
	bh=ERIAC8idtjIYcLgUAsu/wcyfxe/kfDQ5Zs7429lX/lU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lcwXrzWjKWh982VfkW5jpaOpBnq/T1nflOXkAANr4yNVs5AABHyXkDLz1XgBcVvz5vJWZOPh6wFDYBSk91T5GGQWJsaBnufKQyynpcHr9MAPC9UkBpAyPoTdUGsyA7Zq2A+4MQ9sseCvRNejx/pbKsZATFr27PNhOcgaIV7kT+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=zJ5koQAh; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 3680B224F5;
	Mon, 16 Dec 2024 19:55:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1734375344;
	bh=4ESmruV4i0A6zi2wUf0QJ3jRzh4EKC20/EhLK+rR84Q=; h=From:To:Subject;
	b=zJ5koQAhEazjWZg2fxzNIVEsz2WgSXx838aLGogD8am4pc1UDu+M2xKDmoCtMk/JI
	 QMOBjF6ONCLM3qDpEnB3aLO+a9yrlyduixtFboJMr2v7asSkjuqNY6opoPWk7Vt0nI
	 AW8LN5hyzqUHv6eixSja0baudF9EvtNP+V7pTQbE3BLI30KvVoSwzqAzRh8OGAT185
	 1P9oagfNXYOjTYt4JospoK85fsvNwiLfwTHR/uBSTRLrNGEAsQRdhRrcpJpUQXS+mF
	 wn0wp2b4N6zeQQdF3tPObw3XO8R1Hu01i5y46t7um72GuYNhSGxcuzNwpATkXOaYOP
	 j7ALJnbhLR2CA==
Date: Mon, 16 Dec 2024 19:55:40 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
	andre.draszik@linaro.org, rdbabiera@google.com,
	m.felsch@pengutronix.de, dan.carpenter@linaro.org,
	emanuele.ghidoli@toradex.com, parth.pancholi@toradex.com,
	francesco.dolcini@toradex.com, u.kleine-koenig@baylibre.com,
	linux-usb@vger.kernel.org, imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v2 2/2] usb: typec: tcpci: write ALERT_MASK after
 devm_request_threaded_irq()
Message-ID: <20241216185540.GA53932@francesco-nb>
References: <20241212122409.1420962-1-xu.yang_2@nxp.com>
 <20241212122409.1420962-2-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241212122409.1420962-2-xu.yang_2@nxp.com>

On Thu, Dec 12, 2024 at 08:24:09PM +0800, Xu Yang wrote:
> With edge irq support, the ALERT event may be missed currently. The reason
> is that ALERT_MASK register is written before devm_request_threaded_irq().
> If ALERT event happens in this time gap, it will be missed and ALERT line
> will not recover to high level. However, we can't meet this issue with
> level irq. To avoid the issue, this will add a flag set_alert_mask. So
> ALERT_MASK can be written after devm_request_threaded_irq() is called. The
> behavior of tcpm_init() keeps unchanged.
> 
> Fixes: 77e85107a771 ("usb: typec: tcpci: support edge irq")
> Cc: stable@vger.kernel.org
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

I wonder if this should be squashed together with the first commit,
given you re-introduce an issue with the previous commit.

 
> 
> ---
> Changes in v2:
>  - new patch
> ---
>  drivers/usb/typec/tcpm/tcpci.c | 22 +++++++++++++++++-----
>  1 file changed, 17 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
> index db42f4bf3632..836f6d54d267 100644
> --- a/drivers/usb/typec/tcpm/tcpci.c
> +++ b/drivers/usb/typec/tcpm/tcpci.c
> @@ -37,6 +37,7 @@ struct tcpci {
>  	unsigned int alert_mask;
>  
>  	bool controls_vbus;
> +	bool set_alert_mask;
>  
>  	struct tcpc_dev tcpc;
>  	struct tcpci_data *data;
> @@ -700,7 +701,10 @@ static int tcpci_init(struct tcpc_dev *tcpc)
>  
>  	tcpci->alert_mask = reg;
>  
> -	return tcpci_write16(tcpci, TCPC_ALERT_MASK, reg);
> +	if (tcpci->set_alert_mask)
> +		ret = tcpci_write16(tcpci, TCPC_ALERT_MASK, reg);
> +
> +	return ret;
>  }
>  
>  irqreturn_t tcpci_irq(struct tcpci *tcpci)
> @@ -931,12 +935,20 @@ static int tcpci_probe(struct i2c_client *client)
>  					_tcpci_irq,
>  					IRQF_SHARED | IRQF_ONESHOT,
>  					dev_name(&client->dev), chip);
> -	if (err < 0) {
> -		tcpci_unregister_port(chip->tcpci);
> -		return err;
> -	}
> +	if (err < 0)
> +		goto unregister_port;
>  
> +	/* Enable the interrupt on chip at last */
> +	err = tcpci_write16(chip->tcpci, TCPC_ALERT_MASK, chip->tcpci->alert_mask);
what's the content of alert_mask here? 

I am not fully understanding why this flag is needed, can't we just ensure
that within probe the alert mask is set to 0, after probe return with
success we have the interrupt handler enabled and we can just write the
alert mask unconditionally.

Or I am just misunderstanding all of it?

If you disable the interrupt in the porbe

Francesco


