Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E4DBDE14D
	for <lists+linux-usb@lfdr.de>; Mon, 21 Oct 2019 01:47:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726610AbfJTXrr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 20 Oct 2019 19:47:47 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:43023 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726200AbfJTXrq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 20 Oct 2019 19:47:46 -0400
Received: by mail-pf1-f193.google.com with SMTP id a2so7213289pfo.10;
        Sun, 20 Oct 2019 16:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=LgAyQ8X2dZ7cKsLLWDHjFUGHzz/QMm5gx18yOHpKukg=;
        b=k1Bb/nlmXD53ATW6OvZcm7AyDorWveXkNEw2pgD/QYNIGtYkYSOB7ijzcKboZuIp8A
         xSiHDprKUIbg6zTeIURwjNzGCJk5zxbrUkCGpScZklmhSGSRB9jJtJhNlU2o2GOxyWuA
         P/3CEduN0zVyRukFRoOzGIRJB9EJ3hyawnyYO9iC1zAfRZS6K2iXLFKx+P4I3vJaWHyP
         pOsDYU5WWFZrU0VGJ3d64Yj8ZUe3PA8pJkf3nQqJ9e2OBggPEnRFQ04moJoYnkQUgsc3
         CzpaLD1k9Ijich20JrD3mqJtNs0Xw5J41Ozxvmjrm/gYZ87ByrkRU4FZR3aOS1NisHGY
         SKTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=LgAyQ8X2dZ7cKsLLWDHjFUGHzz/QMm5gx18yOHpKukg=;
        b=MWwM+Ru5sJDLYiztauZaUt6qZ6mkuPK5RQu8UOxEDV+AneMI2Ay0wjsj1rktL5XnBb
         A4ywIUlRhv6va8ii76IpXLMTH9cFRUebT6+i53g9uKI1FC2ibe4P1Kc9LQpt/psYPh+s
         nZy5reLoGdeSqLKB8bb0D3VQo+LF334J6VfyjsZmaev1MDw7pm9SpCrKoEpZYZFIk0LL
         PLo8kzfhPYhyyQumQbY3dZHL/g7xihEeGJqjYWeE9njJKE+AOh+vdgmx6l9RnCWpx/aC
         CHV8XUKqh3VxGCIs+veN4V0hKS80SDfiDC7l2e2QsCZ6qE0TeTO408EcwTdkJOwTHSzt
         YkEw==
X-Gm-Message-State: APjAAAWaJjDYr1oHwdy0Ffdgbky6Kc5c0+JLFYE5tf01a0xgDoFl3nBK
        +1px5L3q4dM785BHeipeqco=
X-Google-Smtp-Source: APXvYqwC9IHw5VKNldON4KI2crz5Ud5utEmrBYmzSrf1yGvTmElp23gyVtRSMbMbJy7VaVTjIoRhCg==
X-Received: by 2002:aa7:955a:: with SMTP id w26mr20106550pfq.193.1571615265319;
        Sun, 20 Oct 2019 16:47:45 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j17sm12688918pfr.70.2019.10.20.16.47.43
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 20 Oct 2019 16:47:44 -0700 (PDT)
Date:   Sun, 20 Oct 2019 16:47:42 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        platform-driver-x86@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/3] usb: typec: tcpm: Remove tcpc_config configuration
 mechanism
Message-ID: <20191020234742.GA18123@roeck-us.net>
References: <20191018195719.94634-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191018195719.94634-1-hdegoede@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Oct 18, 2019 at 09:57:17PM +0200, Hans de Goede wrote:
> All configuration can and should be done through fwnodes instead of
> through the tcpc_config struct and there are no existing users left of
> struct tcpc_config, so lets remove it.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/usb/typec/tcpm/tcpm.c | 90 ++---------------------------------
>  include/linux/usb/tcpm.h      | 41 ----------------
>  2 files changed, 3 insertions(+), 128 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index 5f61d9977a15..c5fa18759f8e 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -380,9 +380,6 @@ static enum tcpm_state tcpm_default_state(struct tcpm_port *port)
>  			return SNK_UNATTACHED;
>  		else if (port->try_role == TYPEC_SOURCE)
>  			return SRC_UNATTACHED;
> -		else if (port->tcpc->config &&
> -			 port->tcpc->config->default_role == TYPEC_SINK)
> -			return SNK_UNATTACHED;
>  		/* Fall through to return SRC_UNATTACHED */
>  	} else if (port->port_type == TYPEC_PORT_SNK) {
>  		return SNK_UNATTACHED;
> @@ -4131,7 +4128,7 @@ static int tcpm_try_role(const struct typec_capability *cap, int role)
>  	mutex_lock(&port->lock);
>  	if (tcpc->try_role)
>  		ret = tcpc->try_role(tcpc, role);
> -	if (!ret && (!tcpc->config || !tcpc->config->try_role_hw))
> +	if (!ret)
>  		port->try_role = role;
>  	port->try_src_count = 0;
>  	port->try_snk_count = 0;
> @@ -4368,34 +4365,6 @@ void tcpm_tcpc_reset(struct tcpm_port *port)
>  }
>  EXPORT_SYMBOL_GPL(tcpm_tcpc_reset);
>  
> -static int tcpm_copy_pdos(u32 *dest_pdo, const u32 *src_pdo,
> -			  unsigned int nr_pdo)
> -{
> -	unsigned int i;
> -
> -	if (nr_pdo > PDO_MAX_OBJECTS)
> -		nr_pdo = PDO_MAX_OBJECTS;
> -
> -	for (i = 0; i < nr_pdo; i++)
> -		dest_pdo[i] = src_pdo[i];
> -
> -	return nr_pdo;
> -}
> -
> -static int tcpm_copy_vdos(u32 *dest_vdo, const u32 *src_vdo,
> -			  unsigned int nr_vdo)
> -{
> -	unsigned int i;
> -
> -	if (nr_vdo > VDO_MAX_OBJECTS)
> -		nr_vdo = VDO_MAX_OBJECTS;
> -
> -	for (i = 0; i < nr_vdo; i++)
> -		dest_vdo[i] = src_vdo[i];
> -
> -	return nr_vdo;
> -}
> -
>  static int tcpm_fw_get_caps(struct tcpm_port *port,
>  			    struct fwnode_handle *fwnode)
>  {
> @@ -4698,35 +4667,10 @@ static int devm_tcpm_psy_register(struct tcpm_port *port)
>  	return PTR_ERR_OR_ZERO(port->psy);
>  }
>  
> -static int tcpm_copy_caps(struct tcpm_port *port,
> -			  const struct tcpc_config *tcfg)
> -{
> -	if (tcpm_validate_caps(port, tcfg->src_pdo, tcfg->nr_src_pdo) ||
> -	    tcpm_validate_caps(port, tcfg->snk_pdo, tcfg->nr_snk_pdo))
> -		return -EINVAL;
> -
> -	port->nr_src_pdo = tcpm_copy_pdos(port->src_pdo, tcfg->src_pdo,
> -					  tcfg->nr_src_pdo);
> -	port->nr_snk_pdo = tcpm_copy_pdos(port->snk_pdo, tcfg->snk_pdo,
> -					  tcfg->nr_snk_pdo);
> -
> -	port->nr_snk_vdo = tcpm_copy_vdos(port->snk_vdo, tcfg->snk_vdo,
> -					  tcfg->nr_snk_vdo);
> -
> -	port->operating_snk_mw = tcfg->operating_snk_mw;
> -
> -	port->typec_caps.prefer_role = tcfg->default_role;
> -	port->typec_caps.type = tcfg->type;
> -	port->typec_caps.data = tcfg->data;
> -	port->self_powered = tcfg->self_powered;
> -
> -	return 0;
> -}
> -
>  struct tcpm_port *tcpm_register_port(struct device *dev, struct tcpc_dev *tcpc)
>  {
>  	struct tcpm_port *port;
> -	int i, err;
> +	int err;
>  
>  	if (!dev || !tcpc ||
>  	    !tcpc->get_vbus || !tcpc->set_cc || !tcpc->get_cc ||
> @@ -4759,15 +4703,10 @@ struct tcpm_port *tcpm_register_port(struct device *dev, struct tcpc_dev *tcpc)
>  	tcpm_debugfs_init(port);
>  
>  	err = tcpm_fw_get_caps(port, tcpc->fwnode);
> -	if ((err < 0) && tcpc->config)
> -		err = tcpm_copy_caps(port, tcpc->config);
>  	if (err < 0)
>  		goto out_destroy_wq;
>  
> -	if (!tcpc->config || !tcpc->config->try_role_hw)
> -		port->try_role = port->typec_caps.prefer_role;
> -	else
> -		port->try_role = TYPEC_NO_PREFERRED_ROLE;
> +	port->try_role = port->typec_caps.prefer_role;
>  
>  	port->typec_caps.fwnode = tcpc->fwnode;
>  	port->typec_caps.revision = 0x0120;	/* Type-C spec release 1.2 */
> @@ -4797,29 +4736,6 @@ struct tcpm_port *tcpm_register_port(struct device *dev, struct tcpc_dev *tcpc)
>  		goto out_role_sw_put;
>  	}
>  
> -	if (tcpc->config && tcpc->config->alt_modes) {
> -		const struct typec_altmode_desc *paltmode = tcpc->config->alt_modes;
> -
> -		i = 0;
> -		while (paltmode->svid && i < ARRAY_SIZE(port->port_altmode)) {
> -			struct typec_altmode *alt;
> -
> -			alt = typec_port_register_altmode(port->typec_port,
> -							  paltmode);
> -			if (IS_ERR(alt)) {
> -				tcpm_log(port,
> -					 "%s: failed to register port alternate mode 0x%x",
> -					 dev_name(dev), paltmode->svid);
> -				break;
> -			}
> -			typec_altmode_set_drvdata(alt, port);
> -			alt->ops = &tcpm_altmode_ops;
> -			port->port_altmode[i] = alt;
> -			i++;
> -			paltmode++;
> -		}
> -	}
> -
>  	mutex_lock(&port->lock);
>  	tcpm_init(port);
>  	mutex_unlock(&port->lock);
> diff --git a/include/linux/usb/tcpm.h b/include/linux/usb/tcpm.h
> index f516955a0cf4..e7979c01c351 100644
> --- a/include/linux/usb/tcpm.h
> +++ b/include/linux/usb/tcpm.h
> @@ -46,45 +46,6 @@ enum tcpm_transmit_type {
>  	TCPC_TX_BIST_MODE_2 = 7
>  };
>  
> -/**
> - * struct tcpc_config - Port configuration
> - * @src_pdo:	PDO parameters sent to port partner as response to
> - *		PD_CTRL_GET_SOURCE_CAP message
> - * @nr_src_pdo:	Number of entries in @src_pdo
> - * @snk_pdo:	PDO parameters sent to partner as response to
> - *		PD_CTRL_GET_SINK_CAP message
> - * @nr_snk_pdo:	Number of entries in @snk_pdo
> - * @operating_snk_mw:
> - *		Required operating sink power in mW
> - * @type:	Port type (TYPEC_PORT_DFP, TYPEC_PORT_UFP, or
> - *		TYPEC_PORT_DRP)
> - * @default_role:
> - *		Default port role (TYPEC_SINK or TYPEC_SOURCE).
> - *		Set to TYPEC_NO_PREFERRED_ROLE if no default role.
> - * @try_role_hw:True if try.{Src,Snk} is implemented in hardware
> - * @alt_modes:	List of supported alternate modes
> - */
> -struct tcpc_config {
> -	const u32 *src_pdo;
> -	unsigned int nr_src_pdo;
> -
> -	const u32 *snk_pdo;
> -	unsigned int nr_snk_pdo;
> -
> -	const u32 *snk_vdo;
> -	unsigned int nr_snk_vdo;
> -
> -	unsigned int operating_snk_mw;
> -
> -	enum typec_port_type type;
> -	enum typec_port_data data;
> -	enum typec_role default_role;
> -	bool try_role_hw;	/* try.{src,snk} implemented in hardware */
> -	bool self_powered;	/* port belongs to a self powered device */
> -
> -	const struct typec_altmode_desc *alt_modes;
> -};
> -
>  /* Mux state attributes */
>  #define TCPC_MUX_USB_ENABLED		BIT(0)	/* USB enabled */
>  #define TCPC_MUX_DP_ENABLED		BIT(1)	/* DP enabled */
> @@ -92,7 +53,6 @@ struct tcpc_config {
>  
>  /**
>   * struct tcpc_dev - Port configuration and callback functions
> - * @config:	Pointer to port configuration
>   * @fwnode:	Pointer to port fwnode
>   * @get_vbus:	Called to read current VBUS state
>   * @get_current_limit:
> @@ -121,7 +81,6 @@ struct tcpc_config {
>   * @mux:	Pointer to multiplexer data
>   */
>  struct tcpc_dev {
> -	const struct tcpc_config *config;
>  	struct fwnode_handle *fwnode;
>  
>  	int (*init)(struct tcpc_dev *dev);
> -- 
> 2.23.0
> 
