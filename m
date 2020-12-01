Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10D8D2CA3D2
	for <lists+linux-usb@lfdr.de>; Tue,  1 Dec 2020 14:28:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728608AbgLAN2d (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Dec 2020 08:28:33 -0500
Received: from gproxy5-pub.mail.unifiedlayer.com ([67.222.38.55]:33473 "EHLO
        gproxy5-pub.mail.unifiedlayer.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725977AbgLAN2d (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 1 Dec 2020 08:28:33 -0500
Received: from cmgw11.unifiedlayer.com (unknown [10.9.0.11])
        by gproxy5.mail.unifiedlayer.com (Postfix) with ESMTP id B6B5B14053D
        for <linux-usb@vger.kernel.org>; Tue,  1 Dec 2020 06:27:50 -0700 (MST)
Received: from bh-25.webhostbox.net ([208.91.199.152])
        by cmsmtp with ESMTP
        id k5h8kmdz3dCH5k5h8kqxal; Tue, 01 Dec 2020 06:27:50 -0700
X-Authority-Reason: nr=8
X-Authority-Analysis: v=2.3 cv=MYVCRa3f c=1 sm=1 tr=0
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19 a=kj9zAlcOel0A:10:nop_charset_1
 a=zTNgK-yGK50A:10:nop_rcvd_month_year
 a=evQFzbml-YQA:10:endurance_base64_authed_username_1 a=1XWaLZrsAAAA:8
 a=UxyB6CtYh_KT3jgNamkA:9 a=CjuIK1q_8ugA:10:nop_charset_2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
        :Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
        :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=gs8O5DPC1kaSyT11h66Ne9sdXYv+9pEsxRosfLlpD1s=; b=r0qQ6yblnGh+GzDR/PtmUquVr4
        EyF/NEJ0H4ursol8NfchcbIvqLC0RykgvTMSKLzUaRHEJo1WN92mDbbFWGGVL5w2wOY/usyGfvOyr
        ImHQ3Aj3SbOWnrUaR1/IfgQhG7Ymlol0qD+IX7v69yPkfyvj24nmJMMF3UAFfjwkQlkDe+qHaQbNp
        SATj0S5Beqv8YRNka2n5pU7xGShMcB3XDpOZ2uDhiVTCZ9EAejj8FJ5OcLvbmMKz3XHj0sPiuj0Vs
        6Aoqq4iRgjdq4vys4vosj3bLlXuCPIVnG5xKJKBjOlwoihMCST1ngZdtnf1UaS8y9WEzWjNS0nodT
        cbE7ltBQ==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:59970 helo=localhost)
        by bh-25.webhostbox.net with esmtpa (Exim 4.93)
        (envelope-from <linux@roeck-us.net>)
        id 1kk5h7-000Bvg-Rp; Tue, 01 Dec 2020 13:27:49 +0000
Date:   Tue, 1 Dec 2020 05:27:49 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Badhri Jagan Sridharan <badhri@google.com>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/3] usb: typec: tcpci: Add support to report vSafe0V
Message-ID: <20201201132749.GD232197@roeck-us.net>
References: <20201201013246.32034-1-badhri@google.com>
 <20201201013246.32034-2-badhri@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201201013246.32034-2-badhri@google.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1kk5h7-000Bvg-Rp
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (localhost) [108.223.40.66]:59970
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 26
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Nov 30, 2020 at 05:32:45PM -0800, Badhri Jagan Sridharan wrote:
> This change adds vbus_vsafe0v which when set, makes TCPM
> query for VSAFE0V by assigning the tcpc.is_vbus_vsafe0v callback.
> Also enables ALERT.ExtendedStatus which is triggered when
> status of EXTENDED_STATUS.vSafe0V changes.
> EXTENDED_STATUS.vSafe0V is set when vbus is at vSafe0V and
> cleared otherwise.
> 
> Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
> ---
>  drivers/usb/typec/tcpm/tcpci.c | 55 ++++++++++++++++++++++++++--------
>  drivers/usb/typec/tcpm/tcpci.h |  6 ++++
>  2 files changed, 49 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
> index 12d983a75510..e281b8bee4db 100644
> --- a/drivers/usb/typec/tcpm/tcpci.c
> +++ b/drivers/usb/typec/tcpm/tcpci.c
> @@ -402,6 +402,19 @@ static int tcpci_get_vbus(struct tcpc_dev *tcpc)
>  	return !!(reg & TCPC_POWER_STATUS_VBUS_PRES);
>  }
>  
> +static int tcpci_is_vbus_vsafe0v(struct tcpc_dev *tcpc)
> +{
> +	struct tcpci *tcpci = tcpc_to_tcpci(tcpc);
> +	unsigned int reg;
> +	int ret;
> +
> +	ret = regmap_read(tcpci->regmap, TCPC_EXTENDED_STATUS, &reg);
> +	if (ret < 0)
> +		return ret;
> +
> +	return !!(reg & TCPC_EXTENDED_STATUS_VSAFE0V);
> +}
> +
>  static int tcpci_set_vbus(struct tcpc_dev *tcpc, bool source, bool sink)
>  {
>  	struct tcpci *tcpci = tcpc_to_tcpci(tcpc);
> @@ -554,12 +567,22 @@ static int tcpci_init(struct tcpc_dev *tcpc)
>  		TCPC_ALERT_RX_HARD_RST | TCPC_ALERT_CC_STATUS;
>  	if (tcpci->controls_vbus)
>  		reg |= TCPC_ALERT_POWER_STATUS;
> +	/* Enable VSAFE0V status interrupt when detecting VSAFE0V is supported */
> +	if (tcpci->data->vbus_vsafe0v) {
> +		reg |= TCPC_ALERT_EXTENDED_STATUS;
> +		ret = regmap_write(tcpci->regmap, TCPC_EXTENDED_STATUS_MASK,
> +				   TCPC_EXTENDED_STATUS_VSAFE0V);
> +		if (ret < 0)
> +			return ret;
> +	}
>  	return tcpci_write16(tcpci, TCPC_ALERT_MASK, reg);
>  }
>  
>  irqreturn_t tcpci_irq(struct tcpci *tcpci)
>  {
>  	u16 status;
> +	int ret;
> +	unsigned int raw;
>  
>  	tcpci_read16(tcpci, TCPC_ALERT, &status);
>  
> @@ -575,18 +598,17 @@ irqreturn_t tcpci_irq(struct tcpci *tcpci)
>  		tcpm_cc_change(tcpci->port);
>  
>  	if (status & TCPC_ALERT_POWER_STATUS) {
> -		unsigned int reg;
> -
> -		regmap_read(tcpci->regmap, TCPC_POWER_STATUS_MASK, &reg);
> -
> -		/*
> -		 * If power status mask has been reset, then the TCPC
> -		 * has reset.
> -		 */
> -		if (reg == 0xff)
> -			tcpm_tcpc_reset(tcpci->port);
> -		else
> -			tcpm_vbus_change(tcpci->port);
> +		ret = regmap_read(tcpci->regmap, TCPC_POWER_STATUS_MASK, &raw);
> +		if (ret >= 0) {
> +			/*
> +			 * If power status mask has been reset, then the TCPC
> +			 * has reset.
> +			 */
> +			if (raw == 0xff)
> +				tcpm_tcpc_reset(tcpci->port);
> +			else
> +				tcpm_vbus_change(tcpci->port);
> +		}

This change seems unrelated to this patch. Besides that, are you sure that
ignoring an error from regmap_read() is sensible here ?

Overall, it may make sense to improve error handling in this driver, but I think
it should be done in a separate patch.

>  	}
>  
>  	if (status & TCPC_ALERT_RX_STATUS) {
> @@ -622,6 +644,12 @@ irqreturn_t tcpci_irq(struct tcpci *tcpci)
>  		tcpm_pd_receive(tcpci->port, &msg);
>  	}
>  
> +	if (status & TCPC_ALERT_EXTENDED_STATUS) {
> +		ret = regmap_read(tcpci->regmap, TCPC_EXTENDED_STATUS, &raw);
> +		if (ret >= 0 && (raw & TCPC_EXTENDED_STATUS_VSAFE0V))
> +			tcpm_vbus_change(tcpci->port);
> +	}
> +
>  	if (status & TCPC_ALERT_RX_HARD_RST)
>  		tcpm_pd_hard_reset(tcpci->port);
>  
> @@ -699,6 +727,9 @@ struct tcpci *tcpci_register_port(struct device *dev, struct tcpci_data *data)
>  			tcpci_set_auto_vbus_discharge_threshold;
>  	}
>  
> +	if (tcpci->data->vbus_vsafe0v)
> +		tcpci->tcpc.is_vbus_vsafe0v = tcpci_is_vbus_vsafe0v;
> +
>  	err = tcpci_parse_config(tcpci);
>  	if (err < 0)
>  		return ERR_PTR(err);
> diff --git a/drivers/usb/typec/tcpm/tcpci.h b/drivers/usb/typec/tcpm/tcpci.h
> index 3fe313655f0c..116a69c85e38 100644
> --- a/drivers/usb/typec/tcpm/tcpci.h
> +++ b/drivers/usb/typec/tcpm/tcpci.h
> @@ -49,6 +49,9 @@
>  #define TCPC_TCPC_CTRL_ORIENTATION	BIT(0)
>  #define TCPC_TCPC_CTRL_BIST_TM		BIT(1)
>  
> +#define TCPC_EXTENDED_STATUS		0x20
> +#define TCPC_EXTENDED_STATUS_VSAFE0V	BIT(0)
> +
>  #define TCPC_ROLE_CTRL			0x1a
>  #define TCPC_ROLE_CTRL_DRP		BIT(6)
>  #define TCPC_ROLE_CTRL_RP_VAL_SHIFT	4
> @@ -155,11 +158,14 @@ struct tcpci;
>   *		is sourcing vbus.
>   * @auto_discharge_disconnect:
>   *		Optional; Enables TCPC to autonously discharge vbus on disconnect.
> + * @vbus_vsafe0v:
> + *		optional; Set when TCPC can detect whether vbus is at VSAFE0V.
>   */
>  struct tcpci_data {
>  	struct regmap *regmap;
>  	unsigned char TX_BUF_BYTE_x_hidden:1;
>  	unsigned char auto_discharge_disconnect:1;
> +	unsigned char vbus_vsafe0v:1;
>  
>  	int (*init)(struct tcpci *tcpci, struct tcpci_data *data);
>  	int (*set_vconn)(struct tcpci *tcpci, struct tcpci_data *data,
> -- 
> 2.29.2.454.gaff20da3a2-goog
> 
