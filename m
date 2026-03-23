Return-Path: <linux-usb+bounces-35319-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8PgzLnIMwWngQAQAu9opvQ
	(envelope-from <linux-usb+bounces-35319-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 23 Mar 2026 10:48:34 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 243C82EF527
	for <lists+linux-usb@lfdr.de>; Mon, 23 Mar 2026 10:48:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 331E0300DE22
	for <lists+linux-usb@lfdr.de>; Mon, 23 Mar 2026 09:43:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2747A386C3D;
	Mon, 23 Mar 2026 09:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k5HwNrpZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A9E3859CE;
	Mon, 23 Mar 2026 09:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774259008; cv=none; b=FH3mGoN5n4KxcTKzGFGeQFwYPlgYPTkWVqF1/SSRXO+97NfbyRLPTdHifYXKQ54L7HPKp5yEcXv4eXZy+odQRI9F8X4t/7G/zNCdj042PicfMwH2tuZegOGtjmTTYmExEz85XG1xvBinyobSKJtAZl7MRyhYKtKqTMWmBc4FRiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774259008; c=relaxed/simple;
	bh=TI5JFDwjWcEkHz2N++OnVaBuk+jQNncRJqQUQmXcqVo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lrQxQLXbCMK1ql56fI4ftObfizoLpeux2ti1hgiOCzzdikZUS3ew7u3w+GeefrZ2LclHyw4i/EWNm6V+w8IRQEjVFEY5hpvt4wnUcT6n+I23KRnrMXAV8aZW1+4PyZJUhYoTx+cc1cQ1km/Qcbs7FGBp6G3q7/VmSdLhsNJTdn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k5HwNrpZ; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774259007; x=1805795007;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TI5JFDwjWcEkHz2N++OnVaBuk+jQNncRJqQUQmXcqVo=;
  b=k5HwNrpZfK9w5af1VnFaVZ3S6EKBitnSBtVAzwOaJlqJYmr5qQWvz4s7
   hjQNjFdonVa1thrbNbQFv2pL+JhFWx7haBhZ1Fnk+LJRqKbI/o6Gv4u7g
   H0c9OJ8YCO50zdmbIodvbrFVwW12BDUlkWUE2lfhE7n7T+khHJkb8RA/p
   1KDjnkOfsbMoSA0OmuhJ9c9yQQkS/mb1VTW4PJPsEyCeSjSEIln/uv+Dz
   QfoBMKWFuR24ZAZOWmODgk3jzpZd/oA1BXAFLREFDXZnsYKEJyciAlANF
   6DkJT4Eo77zPecA3xobIUZ5j/fJWC4rkRTiMrG2shdETAnGSGM9/WIZ2N
   Q==;
X-CSE-ConnectionGUID: 6kY63thhQsi3N0fYDTiyjg==
X-CSE-MsgGUID: QnQdDRlvS7+i/aueawURhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="75373521"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="75373521"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 02:43:27 -0700
X-CSE-ConnectionGUID: wg8KxA7KSA6blYJhL6H3mA==
X-CSE-MsgGUID: ulTJ0Fo1Q76uF1CaBru1aA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="254449660"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa002.jf.intel.com with ESMTP; 23 Mar 2026 02:43:23 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 3133295; Mon, 23 Mar 2026 10:43:22 +0100 (CET)
Date: Mon, 23 Mar 2026 11:42:34 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Li Jun <jun.li@nxp.com>,
	Badhri Jagan Sridharan <badhri@google.com>,
	linux-usb@vger.kernel.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] usb: typec: tcpci: support setting orientation
 via GPIO
Message-ID: <acELCgSYi48Pc0tj@kuha>
References: <20260319-support-setting-orientation-use-gpio-v4-0-ab6dfa8610c2@nxp.com>
 <20260319-support-setting-orientation-use-gpio-v4-2-ab6dfa8610c2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260319-support-setting-orientation-use-gpio-v4-2-ab6dfa8610c2@nxp.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35319-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[heikki.krogerus@linux.intel.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nxp.com:email]
X-Rspamd-Queue-Id: 243C82EF527
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 19, 2026 at 05:48:49PM +0800, Xu Yang wrote:
> If the chip indicates its "Connection Orientation" standard output control
> in STANDARD_OUTPUT_CAPABILITIES register, it can do the thing by
> programming CONFIG_STANDARD_OUTPUT register. Due to the optional feature,
> the chip which not present this capability currently doesn't have a way to
> correctly set the data path. This add the support to set orientation via
> a simple GPIO.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
> Changes in v4:
>  - simplify gpiod_set_value_cansleep()
> Changes in v3:
>  - use "err = !!orient_gpio"
> Changes in v2:
>  - return early in tcpci_set_orientation() if using gpio method
> ---
>  drivers/usb/typec/tcpm/tcpci.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
> index 8b7e6eb92ca2..0148b8f50412 100644
> --- a/drivers/usb/typec/tcpm/tcpci.c
> +++ b/drivers/usb/typec/tcpm/tcpci.c
> @@ -7,6 +7,7 @@
>  
>  #include <linux/bitfield.h>
>  #include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/i2c.h>
> @@ -42,6 +43,7 @@ struct tcpci {
>  
>  	struct tcpc_dev tcpc;
>  	struct tcpci_data *data;
> +	struct gpio_desc *orientation_gpio;
>  };
>  
>  struct tcpci_chip {
> @@ -316,6 +318,10 @@ static int tcpci_set_orientation(struct tcpc_dev *tcpc,
>  	struct tcpci *tcpci = tcpc_to_tcpci(tcpc);
>  	unsigned int reg;
>  
> +	if (tcpci->orientation_gpio)
> +		return gpiod_set_value_cansleep(tcpci->orientation_gpio,
> +						orientation != TYPEC_ORIENTATION_NORMAL);
> +
>  	switch (orientation) {
>  	case TYPEC_ORIENTATION_NONE:
>  		/* We can't put a single output into high impedance */
> @@ -903,6 +909,7 @@ EXPORT_SYMBOL_GPL(tcpci_unregister_port);
>  static int tcpci_probe(struct i2c_client *client)
>  {
>  	struct tcpci_chip *chip;
> +	struct gpio_desc *orient_gpio = NULL;
>  	int err;
>  	u16 val = 0;
>  
> @@ -931,12 +938,23 @@ static int tcpci_probe(struct i2c_client *client)
>  	if (err < 0)
>  		return err;
>  
> +	if (err == 0) {
> +		orient_gpio = devm_gpiod_get_optional(&client->dev, "orientation",
> +						      GPIOD_OUT_LOW);
> +		if (IS_ERR(orient_gpio))
> +			return dev_err_probe(&client->dev, PTR_ERR(orient_gpio),
> +					"unable to acquire orientation gpio\n");
> +		err = !!orient_gpio;
> +	}
> +
>  	chip->data.set_orientation = err;
>  
>  	chip->tcpci = tcpci_register_port(&client->dev, &chip->data);
>  	if (IS_ERR(chip->tcpci))
>  		return PTR_ERR(chip->tcpci);
>  
> +	chip->tcpci->orientation_gpio = orient_gpio;
> +
>  	err = devm_request_threaded_irq(&client->dev, client->irq, NULL,
>  					_tcpci_irq,
>  					IRQF_SHARED | IRQF_ONESHOT,
> 
> -- 
> 2.34.1

-- 
heikki

