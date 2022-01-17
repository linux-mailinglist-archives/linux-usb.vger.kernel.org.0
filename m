Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53C5C490A17
	for <lists+linux-usb@lfdr.de>; Mon, 17 Jan 2022 15:14:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236889AbiAQON2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 Jan 2022 09:13:28 -0500
Received: from mga14.intel.com ([192.55.52.115]:46362 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236343AbiAQON0 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 17 Jan 2022 09:13:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642428806; x=1673964806;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=43PV9bhBIFft5caO8yFZnYnnxjd0G1wvIsaDIEH2CDs=;
  b=LoixF7NMGs4Frz5gKTI/kvL6idgAVH3mkKXllm/YT7emUHXT+dWDJzz6
   GHKgMMAhcfSJskvyZLifSXPJgN+gP+Hzco7zrjG+y5xnl7RbiV7VVwF37
   hTv8q+CJ6R7j6x1qbmtJ+qg6sktz1fZU1/EmMHtijv+McK+vlyv1FPtcD
   D1fqhdVYDRmfLXO7vEjRi/sAcL7VXrhtGrpDXXh/QoyCpI8ryaYtioMo+
   9JnhhXU0o1qGePQ3cDcnQGP0Vr4dHmKRNrZmF0WeCEQJFK2HgmX3UyHUR
   TCJkqwosHUD+qH/vd4LN5A8+9Viw4mrfwKKUBzLT9rs++LB8lxIz4bUEY
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10229"; a="244828196"
X-IronPort-AV: E=Sophos;i="5.88,295,1635231600"; 
   d="scan'208";a="244828196"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2022 06:11:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,295,1635231600"; 
   d="scan'208";a="671568639"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 17 Jan 2022 06:11:44 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 17 Jan 2022 16:11:43 +0200
Date:   Mon, 17 Jan 2022 16:11:43 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Xu Yang <xu.yang_2@nxp.com>
Cc:     linux@roeck-us.net, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, jun.li@nxp.com, linux-imx@nxp.com
Subject: Re: [PATCH v3] usb: typec: tcpci: don't touch CC line if it's Vconn
 source
Message-ID: <YeV5H8AwoN59aP9g@kuha.fi.intel.com>
References: <20220113092943.752372-1-xu.yang_2@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220113092943.752372-1-xu.yang_2@nxp.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jan 13, 2022 at 05:29:43PM +0800, Xu Yang wrote:
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

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
> v2: changed subject line
> v3: optimized the commit message and code according to Guenter's suggestions
> ---
>  drivers/usb/typec/tcpm/tcpci.c | 26 ++++++++++++++++++++++++++
>  drivers/usb/typec/tcpm/tcpci.h |  1 +
>  2 files changed, 27 insertions(+)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
> index 35a1307349a2..e07d26a3cd8e 100644
> --- a/drivers/usb/typec/tcpm/tcpci.c
> +++ b/drivers/usb/typec/tcpm/tcpci.c
> @@ -75,9 +75,25 @@ static int tcpci_write16(struct tcpci *tcpci, unsigned int reg, u16 val)
>  static int tcpci_set_cc(struct tcpc_dev *tcpc, enum typec_cc_status cc)
>  {
>  	struct tcpci *tcpci = tcpc_to_tcpci(tcpc);
> +	bool vconn_pres;
> +	enum typec_cc_polarity polarity = TYPEC_POLARITY_CC1;
>  	unsigned int reg;
>  	int ret;
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
>  	switch (cc) {
>  	case TYPEC_CC_RA:
>  		reg = (TCPC_ROLE_CTRL_CC_RA << TCPC_ROLE_CTRL_CC1_SHIFT) |
> @@ -112,6 +128,16 @@ static int tcpci_set_cc(struct tcpc_dev *tcpc, enum typec_cc_status cc)
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

-- 
heikki
