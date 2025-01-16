Return-Path: <linux-usb+bounces-19403-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CCFAA139D1
	for <lists+linux-usb@lfdr.de>; Thu, 16 Jan 2025 13:19:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 263AA16344C
	for <lists+linux-usb@lfdr.de>; Thu, 16 Jan 2025 12:19:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDC521DE4F0;
	Thu, 16 Jan 2025 12:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hxTqZgcN"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 378731DE2CA;
	Thu, 16 Jan 2025 12:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737029985; cv=none; b=YBRDDV2wxuOrDoHvimNJ47mY8FJvftvxWx91fBdJt87mjtm/gfNHH+6wgcqYSdhFJNe2TTmEj9Tzp5DtCeIB0WtMWITma9tPWqqqa3edUg33yofOm6PdvF0l6HNJOTCi16sLrAQakHlK6ET2raMAlKGoRdqqYxK1gwHlgkRnKk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737029985; c=relaxed/simple;
	bh=jNwnnWI4E1+sbyid1AOzUV6nRLY2Vp7HufWzpcSahas=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z7mYTGo54uDkui2mb2Gn5MmKwky3wCWbQGcRWJNwMkIUjXektTrjwoNG2ak5bK6JyPlfYkTxPX3NWIgdz52A8wqVnDdlXmuyVf5AKn3uCWbWe6eWdgsMyoEUsqEd8/7WtnCpOt9RhtSszd9WegvAQvz8XLScydYTzr0McRDR690=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hxTqZgcN; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737029983; x=1768565983;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jNwnnWI4E1+sbyid1AOzUV6nRLY2Vp7HufWzpcSahas=;
  b=hxTqZgcNfhYhWJjJMp8p51iWJJn7LYQxNfbMq/TVmH9ERdhzUIFlzW1R
   +VXu/Q/3MNE3I5TgjumCZ5IGnqbmWvL1skCmgHAfGZsng3fJ7snZN714O
   LYArkEZl8nlyj+lu/2kU/tiKJ2GYzinjP0RA/hmRbllqrVHLLD7BWPRnI
   7he1JKQQFCgFAm8Swy9ZHPZFRqK3z/V0HT8lIMVRWaC3IaCSrkjdFMsTq
   pK1PHAvYgodHkd8ZMWPPRor5Fb7FsutNNw9WVbjUxKaJL0t8DaGvF4n5g
   bTzRA39MJmh7DvGmX3AdjF9rD8hbFDAy0EccDsweGPLf1cplQp/EX57Ne
   Q==;
X-CSE-ConnectionGUID: 13lleuOMR3qz2r+8TFMjsw==
X-CSE-MsgGUID: yyncMob1QfGnQHLvWMJUnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="48826990"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="48826990"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2025 04:19:41 -0800
X-CSE-ConnectionGUID: PshTnfDqRJGjP6FJ0IPmiw==
X-CSE-MsgGUID: WCUw1IKFTw+2cp301Oa6yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,209,1732608000"; 
   d="scan'208";a="110459258"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by fmviesa004.fm.intel.com with SMTP; 16 Jan 2025 04:19:36 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 16 Jan 2025 14:19:35 +0200
Date: Thu, 16 Jan 2025 14:19:35 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mathias Nyman <mathias.nyman@intel.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Peter Chen <peter.chen@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, usb-storage@lists.one-eyed-alien.net
Subject: Re: [PATCH 3/6] USB: typec: Use str_enable_disable-like helpers
Message-ID: <Z4j5V8ACfJLG-7Oy@kuha.fi.intel.com>
References: <20250114-str-enable-disable-usb-v1-0-c8405df47c19@linaro.org>
 <20250114-str-enable-disable-usb-v1-3-c8405df47c19@linaro.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250114-str-enable-disable-usb-v1-3-c8405df47c19@linaro.org>

On Tue, Jan 14, 2025 at 09:05:36PM +0100, Krzysztof Kozlowski wrote:
> Replace ternary (condition ? "enable" : "disable") syntax with helpers
> from string_choices.h because:
> 1. Simple function call with one argument is easier to read.  Ternary
>    operator has three arguments and with wrapping might lead to quite
>    long code.
> 2. Is slightly shorter thus also easier to read.
> 3. It brings uniformity in the text - same string.
> 4. Allows deduping by the linker, which results in a smaller binary
>    file.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/class.c                          |  7 ++++---
>  drivers/usb/typec/tcpm/fusb302.c                   | 24 +++++++++++-----------
>  .../usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c    |  3 ++-
>  .../typec/tcpm/qcom/qcom_pmic_typec_pdphy_stub.c   |  3 ++-
>  drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c |  4 +++-
>  drivers/usb/typec/tcpm/tcpm.c                      |  7 ++++---
>  6 files changed, 27 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> index d9d019cff01908eaa8dcb484a87147f3d9992bf3..9c76c3d0c6cff9c9b94ef35fb0cb4be0e395aad6 100644
> --- a/drivers/usb/typec/class.c
> +++ b/drivers/usb/typec/class.c
> @@ -10,6 +10,7 @@
>  #include <linux/mutex.h>
>  #include <linux/property.h>
>  #include <linux/slab.h>
> +#include <linux/string_choices.h>
>  #include <linux/usb/pd_vdo.h>
>  #include <linux/usb/typec_mux.h>
>  #include <linux/usb/typec_retimer.h>
> @@ -361,7 +362,7 @@ active_show(struct device *dev, struct device_attribute *attr, char *buf)
>  {
>  	struct typec_altmode *alt = to_typec_altmode(dev);
>  
> -	return sprintf(buf, "%s\n", alt->active ? "yes" : "no");
> +	return sprintf(buf, "%s\n", str_yes_no(alt->active));
>  }
>  
>  static ssize_t active_store(struct device *dev, struct device_attribute *attr,
> @@ -707,7 +708,7 @@ static ssize_t supports_usb_power_delivery_show(struct device *dev,
>  {
>  	struct typec_partner *p = to_typec_partner(dev);
>  
> -	return sprintf(buf, "%s\n", p->usb_pd ? "yes" : "no");
> +	return sprintf(buf, "%s\n", str_yes_no(p->usb_pd));
>  }
>  static DEVICE_ATTR_RO(supports_usb_power_delivery);
>  
> @@ -1855,7 +1856,7 @@ static ssize_t vconn_source_show(struct device *dev,
>  	struct typec_port *port = to_typec_port(dev);
>  
>  	return sprintf(buf, "%s\n",
> -		       port->vconn_role == TYPEC_SOURCE ? "yes" : "no");
> +		       str_yes_no(port->vconn_role == TYPEC_SOURCE));
>  }
>  static DEVICE_ATTR_RW(vconn_source);
>  
> diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fusb302.c
> index e2fe479e16ada018930ea0dbbf58ee37ce9a1990..f15c63d3a8f441569ec98302f5b241430d8e4547 100644
> --- a/drivers/usb/typec/tcpm/fusb302.c
> +++ b/drivers/usb/typec/tcpm/fusb302.c
> @@ -24,6 +24,7 @@
>  #include <linux/slab.h>
>  #include <linux/spinlock.h>
>  #include <linux/string.h>
> +#include <linux/string_choices.h>
>  #include <linux/types.h>
>  #include <linux/usb.h>
>  #include <linux/usb/typec.h>
> @@ -733,7 +734,7 @@ static int tcpm_set_vconn(struct tcpc_dev *dev, bool on)
>  
>  	mutex_lock(&chip->lock);
>  	if (chip->vconn_on == on) {
> -		fusb302_log(chip, "vconn is already %s", on ? "On" : "Off");
> +		fusb302_log(chip, "vconn is already %s", str_on_off(on));
>  		goto done;
>  	}
>  	if (on) {
> @@ -746,7 +747,7 @@ static int tcpm_set_vconn(struct tcpc_dev *dev, bool on)
>  	if (ret < 0)
>  		goto done;
>  	chip->vconn_on = on;
> -	fusb302_log(chip, "vconn := %s", on ? "On" : "Off");
> +	fusb302_log(chip, "vconn := %s", str_on_off(on));
>  done:
>  	mutex_unlock(&chip->lock);
>  
> @@ -761,7 +762,7 @@ static int tcpm_set_vbus(struct tcpc_dev *dev, bool on, bool charge)
>  
>  	mutex_lock(&chip->lock);
>  	if (chip->vbus_on == on) {
> -		fusb302_log(chip, "vbus is already %s", on ? "On" : "Off");
> +		fusb302_log(chip, "vbus is already %s", str_on_off(on));
>  	} else {
>  		if (on)
>  			ret = regulator_enable(chip->vbus);
> @@ -769,15 +770,14 @@ static int tcpm_set_vbus(struct tcpc_dev *dev, bool on, bool charge)
>  			ret = regulator_disable(chip->vbus);
>  		if (ret < 0) {
>  			fusb302_log(chip, "cannot %s vbus regulator, ret=%d",
> -				    on ? "enable" : "disable", ret);
> +				    str_enable_disable(on), ret);
>  			goto done;
>  		}
>  		chip->vbus_on = on;
> -		fusb302_log(chip, "vbus := %s", on ? "On" : "Off");
> +		fusb302_log(chip, "vbus := %s", str_on_off(on));
>  	}
>  	if (chip->charge_on == charge)
> -		fusb302_log(chip, "charge is already %s",
> -			    charge ? "On" : "Off");
> +		fusb302_log(chip, "charge is already %s", str_on_off(charge));
>  	else
>  		chip->charge_on = charge;
>  
> @@ -854,16 +854,16 @@ static int tcpm_set_pd_rx(struct tcpc_dev *dev, bool on)
>  	ret = fusb302_pd_set_auto_goodcrc(chip, on);
>  	if (ret < 0) {
>  		fusb302_log(chip, "cannot turn %s auto GCRC, ret=%d",
> -			    on ? "on" : "off", ret);
> +			    str_on_off(on), ret);
>  		goto done;
>  	}
>  	ret = fusb302_pd_set_interrupts(chip, on);
>  	if (ret < 0) {
>  		fusb302_log(chip, "cannot turn %s pd interrupts, ret=%d",
> -			    on ? "on" : "off", ret);
> +			    str_on_off(on), ret);
>  		goto done;
>  	}
> -	fusb302_log(chip, "pd := %s", on ? "on" : "off");
> +	fusb302_log(chip, "pd := %s", str_on_off(on));
>  done:
>  	mutex_unlock(&chip->lock);
>  
> @@ -1531,7 +1531,7 @@ static void fusb302_irq_work(struct work_struct *work)
>  	if (interrupt & FUSB_REG_INTERRUPT_VBUSOK) {
>  		vbus_present = !!(status0 & FUSB_REG_STATUS0_VBUSOK);
>  		fusb302_log(chip, "IRQ: VBUS_OK, vbus=%s",
> -			    vbus_present ? "On" : "Off");
> +			    str_on_off(vbus_present));
>  		if (vbus_present != chip->vbus_present) {
>  			chip->vbus_present = vbus_present;
>  			tcpm_vbus_change(chip->tcpm_port);
> @@ -1562,7 +1562,7 @@ static void fusb302_irq_work(struct work_struct *work)
>  	if ((interrupt & FUSB_REG_INTERRUPT_COMP_CHNG) && intr_comp_chng) {
>  		comp_result = !!(status0 & FUSB_REG_STATUS0_COMP);
>  		fusb302_log(chip, "IRQ: COMP_CHNG, comp=%s",
> -			    comp_result ? "true" : "false");
> +			    str_true_false(comp_result));
>  		if (comp_result) {
>  			/* cc level > Rd_threshold, detach */
>  			chip->cc1 = TYPEC_CC_OPEN;
> diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
> index 726423684bae0a690bd20547313704b7d2f4cfdc..18303b34594bbf6f43d1138177c4ab58f0dec395 100644
> --- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
> +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
> @@ -12,6 +12,7 @@
>  #include <linux/regmap.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/slab.h>
> +#include <linux/string_choices.h>
>  #include <linux/usb/pd.h>
>  #include <linux/usb/tcpm.h>
>  #include "qcom_pmic_typec.h"
> @@ -418,7 +419,7 @@ static int qcom_pmic_typec_pdphy_set_pd_rx(struct tcpc_dev *tcpc, bool on)
>  
>  	spin_unlock_irqrestore(&pmic_typec_pdphy->lock, flags);
>  
> -	dev_dbg(pmic_typec_pdphy->dev, "set_pd_rx: %s\n", on ? "on" : "off");
> +	dev_dbg(pmic_typec_pdphy->dev, "set_pd_rx: %s\n", str_on_off(on));
>  
>  	return ret;
>  }
> diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy_stub.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy_stub.c
> index df79059cda6755d4de35b7239fadc2dff2e699b1..8fac171778daf471fe4d03de8cc4f9c7ce1f323b 100644
> --- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy_stub.c
> +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy_stub.c
> @@ -12,6 +12,7 @@
>  #include <linux/regmap.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/slab.h>
> +#include <linux/string_choices.h>
>  #include <linux/usb/pd.h>
>  #include <linux/usb/tcpm.h>
>  #include "qcom_pmic_typec.h"
> @@ -38,7 +39,7 @@ static int qcom_pmic_typec_pdphy_stub_set_pd_rx(struct tcpc_dev *tcpc, bool on)
>  	struct pmic_typec *tcpm = tcpc_to_tcpm(tcpc);
>  	struct device *dev = tcpm->dev;
>  
> -	dev_dbg(dev, "set_pd_rx: %s\n", on ? "on" : "off");
> +	dev_dbg(dev, "set_pd_rx: %s\n", str_on_off(on));
>  
>  	return 0;
>  }
> diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> index c37dede62e12cd8a105da108838b5ca4f5e632d7..4fc83dcfae643e7a8b8e89ac6e6f5a9aaba3f65b 100644
> --- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> @@ -13,6 +13,7 @@
>  #include <linux/regmap.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/slab.h>
> +#include <linux/string_choices.h>
>  #include <linux/usb/tcpm.h>
>  #include <linux/usb/typec_mux.h>
>  #include <linux/workqueue.h>
> @@ -562,7 +563,8 @@ static int qcom_pmic_typec_port_set_vconn(struct tcpc_dev *tcpc, bool on)
>  	spin_unlock_irqrestore(&pmic_typec_port->lock, flags);
>  
>  	dev_dbg(dev, "set_vconn: orientation %d control 0x%08x state %s cc %s vconn %s\n",
> -		orientation, value, on ? "on" : "off", misc_to_vconn(misc), misc_to_cc(misc));
> +		orientation, value, str_on_off(on), misc_to_vconn(misc),
> +		misc_to_cc(misc));
>  
>  	return ret;
>  }
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index fcf2d7902352c447651f30610d59fef2471f3124..ef2cec386d965512c64e8b7e640199e10bb7bc94 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -21,6 +21,7 @@
>  #include <linux/seq_file.h>
>  #include <linux/slab.h>
>  #include <linux/spinlock.h>
> +#include <linux/string_choices.h>
>  #include <linux/usb.h>
>  #include <linux/usb/pd.h>
>  #include <linux/usb/pd_ado.h>
> @@ -892,8 +893,8 @@ static int tcpm_enable_auto_vbus_discharge(struct tcpm_port *port, bool enable)
>  
>  	if (port->tcpc->enable_auto_vbus_discharge) {
>  		ret = port->tcpc->enable_auto_vbus_discharge(port->tcpc, enable);
> -		tcpm_log_force(port, "%s vbus discharge ret:%d", enable ? "enable" : "disable",
> -			       ret);
> +		tcpm_log_force(port, "%s vbus discharge ret:%d",
> +			       str_enable_disable(enable), ret);
>  		if (!ret)
>  			port->auto_vbus_discharge_enabled = enable;
>  	}
> @@ -4439,7 +4440,7 @@ static void tcpm_unregister_altmodes(struct tcpm_port *port)
>  
>  static void tcpm_set_partner_usb_comm_capable(struct tcpm_port *port, bool capable)
>  {
> -	tcpm_log(port, "Setting usb_comm capable %s", capable ? "true" : "false");
> +	tcpm_log(port, "Setting usb_comm capable %s", str_true_false(capable));
>  
>  	if (port->tcpc->set_partner_usb_comm_capable)
>  		port->tcpc->set_partner_usb_comm_capable(port->tcpc, capable);
> 
> -- 
> 2.43.0

-- 
heikki

