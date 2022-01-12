Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 457AD48C2C8
	for <lists+linux-usb@lfdr.de>; Wed, 12 Jan 2022 12:04:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239653AbiALLE2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Jan 2022 06:04:28 -0500
Received: from mga06.intel.com ([134.134.136.31]:2972 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238831AbiALLE0 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 12 Jan 2022 06:04:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641985466; x=1673521466;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cu6m9exXXAvkqDERQdt8YyrKT0ohDm5ImW/tV6NtgO8=;
  b=WdAwgDIH3ZOQu+CO0/Uc0ggP8uQphEgSTHm+Om/UlhV3XrnLpJafm37I
   86bdAWYVqi4jdKBjbVgHSMdH7jX/MU5i4t239lODyD6M//NFoRcAYaRKD
   /MkjUtjh+aKsbukiHXtIn5boaNp/A9eShBxk4PpnzM6ahN5XhmyBSU9Cb
   nyq2+YsbQdycT6RM3fX1brMAAkQXKxc8AHvihF+2cyS7ANXC2a6MaOhPn
   wzvTXpfdmrQ7qITL9ouA26+rql4d5FrFVqyVwkT0j0pCPWyUJuEgDbzu3
   QdaJCUaF24hT7S7kpVBYQ34fhfszK2WPZFQOPV2ycpSpTDI5j8Z3+7XZ6
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10224"; a="304448333"
X-IronPort-AV: E=Sophos;i="5.88,282,1635231600"; 
   d="scan'208";a="304448333"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2022 03:04:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,282,1635231600"; 
   d="scan'208";a="670116393"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 12 Jan 2022 03:04:21 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 12 Jan 2022 13:04:20 +0200
Date:   Wed, 12 Jan 2022 13:04:20 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Xu Yang <xu.yang_2@nxp.com>
Cc:     linux@roeck-us.net, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, jun.li@nxp.com, linux-imx@nxp.com
Subject: Re: [PATCH v2] usb: typec: tcpci: don't touch CC line if it's Vconn
 source
Message-ID: <Yd61tEZZfnYU/L1V@kuha.fi.intel.com>
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
> termination, the voltage of the another CC line is likely to be fluctuant
> and unstable.
> 
> Therefore, we should verify whether a CC line is soucing Vconn before
> changing its termination. And only changing the termination that is
> not a Vconn line. This can be done by reading the VCONN Present bit of
> POWER_ STATUS register. To determinate the polarity, we can read the
> Plug Orientation bit of TCPC_CONTROL register. Since only if Plug
> Orientation is set, Vconn can be sourced.
> 
> Fixes: 0908c5aca31e ("usb: typec: tcpm: AMS and Collision Avoidance")
> cc: <stable@vger.kernel.org>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

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

-- 
heikki
