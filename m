Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39F823DB3A8
	for <lists+linux-usb@lfdr.de>; Fri, 30 Jul 2021 08:31:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237553AbhG3Gb0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 30 Jul 2021 02:31:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237205AbhG3Gb0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 30 Jul 2021 02:31:26 -0400
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B05BC0613C1;
        Thu, 29 Jul 2021 23:31:21 -0700 (PDT)
Received: by mail-ot1-x331.google.com with SMTP id 48-20020a9d0bb30000b02904cd671b911bso8476565oth.1;
        Thu, 29 Jul 2021 23:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=KEs0/nw4wD987DXkrooQuBV+OiTDfI/Kw4URyeY+L0M=;
        b=dw5e0ivnBCe2pZ07/0cnTZziQOZtHltWi5Hyd3ceVrOjtkMaGg0K9H2RWHTjwMpnQZ
         uuz5gL+Urfgoac/eeIXw9bCPl4bRcd8KVHUmA0ULTWUzpQuXyd/ywn450hvbPMeygaz7
         NUnuFVkLw/oSneqcI9/w6Huud3HR8yGUfPpOsZ3SomJqcjh+A+qcc1Ena4CahFe/JY/S
         yIXSF9XcomISNt16h6aBeuMLM/eJ7ZPeE8X3oZWgOqyr3GOgG8tvFv+Z7WkYF98SplBi
         DkEVVvFFp80B+Q0lQZuQtxvKCnbUKYiPoLqXrWDL2QqHryGQRXnGI33sDhK/eKGFqcyR
         x/5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KEs0/nw4wD987DXkrooQuBV+OiTDfI/Kw4URyeY+L0M=;
        b=dlpjZAXSJcM7uodjz7oKaKgRnJC07Ol1f9UXHXqMT+QFHkzdooZASrBMmAIbSAZsmz
         Qe8LW5ApMkP5InWTAHjaoXuMn9HEbRz6dbtl0E79HzZqz9USTqK6LnJpjVTLwoLw13/g
         ozZjin8BgmRKmxguRzmyZsuD5mAOAne9ja8UN4+jdtFo2rtuHGE68BJ3ouwnjbzfGk0s
         WN5LuBy943PztmCVivgnNf29PaouO+Due1zXtOYhX4uNCzHEHEfOQBhPnj2n86QmRd5+
         Al+peJoXB67EitNbFIqOEG1wDLy3hW+2JLjDi93U+EIj8l8IuhpwrW8IDFwHMq7OgAx/
         ylLg==
X-Gm-Message-State: AOAM533fNddQXXr4iOruQLH2lQ/vXJis8bF+ROpJrFZNWHsyCk2DjGlR
        sWL36haLOGmFxO2LiGJpsKf10y+oeAw=
X-Google-Smtp-Source: ABdhPJxl1Pfqb8dOXXH0C8BRFeIPyFahy/tqowSL3UODEkqh03IqilTzuNmzyaKVfWxRhD2tprBnFg==
X-Received: by 2002:a05:6830:4188:: with SMTP id r8mr881555otu.53.1627626680357;
        Thu, 29 Jul 2021 23:31:20 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z3sm149361oti.29.2021.07.29.23.31.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jul 2021 23:31:19 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH v4 2/2] usb: typec: tcpm: Support non-PD mode
To:     Kyle Tso <kyletso@google.com>, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, robh+dt@kernel.org
Cc:     badhri@google.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20210730061832.1927936-1-kyletso@google.com>
 <20210730061832.1927936-3-kyletso@google.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <7f36b8b7-b770-6c29-b69f-f0e8ca06ff7d@roeck-us.net>
Date:   Thu, 29 Jul 2021 23:31:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210730061832.1927936-3-kyletso@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 7/29/21 11:18 PM, Kyle Tso wrote:
> Even if the Type-C controller supports PD, it is doable to disable PD
> capabilities with the current state machine in TCPM. Without enabling RX
> in low-level drivers and with skipping the power negotiation, the port
> is eligible to be a non-PD Type-C port. Use new flags whose values are
> populated from the device tree to decide the port PD capability. Adding
> "pd-unsupported" property in device tree indicates that the port does
> not support PD. If PD is not supported, the device tree property
> "typec-power-opmode" shall be added to specify the advertised Rp value
> if the port supports SRC role.
> 
> Signed-off-by: Kyle Tso <kyletso@google.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> changes since v3:
> - commit msg updated
> - removed unnecessary empty lines
> - re-factored the code of reading device tree properties and the error
>    handling
> - removed unnecessay variable initialization
> - modified the comments
> 
>   drivers/usb/typec/tcpm/tcpm.c | 87 +++++++++++++++++++++++++++--------
>   1 file changed, 68 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index 5b22a1c931a9..faea1bf9dce0 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -316,6 +316,7 @@ struct tcpm_port {
>   	struct typec_partner *partner;
>   
>   	enum typec_cc_status cc_req;
> +	enum typec_cc_status src_rp;	/* work only if pd_supported == false */
>   
>   	enum typec_cc_status cc1;
>   	enum typec_cc_status cc2;
> @@ -323,6 +324,7 @@ struct tcpm_port {
>   
>   	bool attached;
>   	bool connected;
> +	bool pd_supported;
>   	enum typec_port_type port_type;
>   
>   	/*
> @@ -815,6 +817,9 @@ static enum typec_cc_status tcpm_rp_cc(struct tcpm_port *port)
>   	int nr_pdo = port->nr_src_pdo;
>   	int i;
>   
> +	if (!port->pd_supported)
> +		return port->src_rp;
> +
>   	/*
>   	 * Search for first entry with matching voltage.
>   	 * It should report the maximum supported current.
> @@ -3568,9 +3573,11 @@ static int tcpm_src_attach(struct tcpm_port *port)
>   	if (ret < 0)
>   		return ret;
>   
> -	ret = port->tcpc->set_pd_rx(port->tcpc, true);
> -	if (ret < 0)
> -		goto out_disable_mux;
> +	if (port->pd_supported) {
> +		ret = port->tcpc->set_pd_rx(port->tcpc, true);
> +		if (ret < 0)
> +			goto out_disable_mux;
> +	}
>   
>   	/*
>   	 * USB Type-C specification, version 1.2,
> @@ -3600,7 +3607,8 @@ static int tcpm_src_attach(struct tcpm_port *port)
>   out_disable_vconn:
>   	tcpm_set_vconn(port, false);
>   out_disable_pd:
> -	port->tcpc->set_pd_rx(port->tcpc, false);
> +	if (port->pd_supported)
> +		port->tcpc->set_pd_rx(port->tcpc, false);
>   out_disable_mux:
>   	tcpm_mux_set(port, TYPEC_STATE_SAFE, USB_ROLE_NONE,
>   		     TYPEC_ORIENTATION_NONE);
> @@ -3804,6 +3812,20 @@ static enum typec_pwr_opmode tcpm_get_pwr_opmode(enum typec_cc_status cc)
>   	}
>   }
>   
> +static enum typec_cc_status tcpm_pwr_opmode_to_rp(enum typec_pwr_opmode opmode)
> +{
> +	switch (opmode) {
> +	case TYPEC_PWR_MODE_USB:
> +		return TYPEC_CC_RP_DEF;
> +	case TYPEC_PWR_MODE_1_5A:
> +		return TYPEC_CC_RP_1_5;
> +	case TYPEC_PWR_MODE_3_0A:
> +	case TYPEC_PWR_MODE_PD:
> +	default:
> +		return TYPEC_CC_RP_3_0;
> +	}
> +}
> +
>   static void run_state_machine(struct tcpm_port *port)
>   {
>   	int ret;
> @@ -3914,6 +3936,10 @@ static void run_state_machine(struct tcpm_port *port)
>   		if (port->ams == POWER_ROLE_SWAP ||
>   		    port->ams == FAST_ROLE_SWAP)
>   			tcpm_ams_finish(port);
> +		if (!port->pd_supported) {
> +			tcpm_set_state(port, SRC_READY, 0);
> +			break;
> +		}
>   		port->upcoming_state = SRC_SEND_CAPABILITIES;
>   		tcpm_ams_start(port, POWER_NEGOTIATION);
>   		break;
> @@ -4161,7 +4187,10 @@ static void run_state_machine(struct tcpm_port *port)
>   				current_lim = PD_P_SNK_STDBY_MW / 5;
>   			tcpm_set_current_limit(port, current_lim, 5000);
>   			tcpm_set_charge(port, true);
> -			tcpm_set_state(port, SNK_WAIT_CAPABILITIES, 0);
> +			if (!port->pd_supported)
> +				tcpm_set_state(port, SNK_READY, 0);
> +			else
> +				tcpm_set_state(port, SNK_WAIT_CAPABILITIES, 0);
>   			break;
>   		}
>   		/*
> @@ -4389,7 +4418,8 @@ static void run_state_machine(struct tcpm_port *port)
>   		tcpm_set_vbus(port, true);
>   		if (port->ams == HARD_RESET)
>   			tcpm_ams_finish(port);
> -		port->tcpc->set_pd_rx(port->tcpc, true);
> +		if (port->pd_supported)
> +			port->tcpc->set_pd_rx(port->tcpc, true);
>   		tcpm_set_attached_state(port, true);
>   		tcpm_set_state(port, SRC_UNATTACHED, PD_T_PS_SOURCE_ON);
>   		break;
> @@ -5898,6 +5928,7 @@ EXPORT_SYMBOL_GPL(tcpm_tcpc_reset);
>   static int tcpm_fw_get_caps(struct tcpm_port *port,
>   			    struct fwnode_handle *fwnode)
>   {
> +	const char *opmode_str;
>   	const char *cap_str;
>   	int ret;
>   	u32 mw, frs_current;
> @@ -5932,22 +5963,37 @@ static int tcpm_fw_get_caps(struct tcpm_port *port,
>   		return ret;
>   	port->typec_caps.type = ret;
>   	port->port_type = port->typec_caps.type;
> +	port->pd_supported = !fwnode_property_read_bool(fwnode, "pd-unsupported");
>   
>   	port->slow_charger_loop = fwnode_property_read_bool(fwnode, "slow-charger-loop");
>   	if (port->port_type == TYPEC_PORT_SNK)
>   		goto sink;
>   
> -	/* Get source pdos */
> -	ret = fwnode_property_count_u32(fwnode, "source-pdos");
> -	if (ret <= 0)
> -		return -EINVAL;
> +	/* Get Source PDOs for the PD port or Source Rp value for the non-PD port */
> +	if (port->pd_supported) {
> +		ret = fwnode_property_count_u32(fwnode, "source-pdos");
> +		if (ret == 0)
> +			return -EINVAL;
> +		else if (ret < 0)
> +			return ret;
>   
> -	port->nr_src_pdo = min(ret, PDO_MAX_OBJECTS);
> -	ret = fwnode_property_read_u32_array(fwnode, "source-pdos",
> -					     port->src_pdo, port->nr_src_pdo);
> -	if ((ret < 0) || tcpm_validate_caps(port, port->src_pdo,
> -					    port->nr_src_pdo))
> -		return -EINVAL;
> +		port->nr_src_pdo = min(ret, PDO_MAX_OBJECTS);
> +		ret = fwnode_property_read_u32_array(fwnode, "source-pdos",
> +						     port->src_pdo, port->nr_src_pdo);
> +		if (ret)
> +			return ret;
> +		ret = tcpm_validate_caps(port, port->src_pdo, port->nr_src_pdo);
> +		if (ret)
> +			return ret;
> +	} else {
> +		ret = fwnode_property_read_string(fwnode, "typec-power-opmode", &opmode_str);
> +		if (ret)
> +			return ret;
> +		ret = typec_find_pwr_opmode(opmode_str);
> +		if (ret < 0)
> +			return ret;
> +		port->src_rp = tcpm_pwr_opmode_to_rp(ret);
> +	}
>   
>   	if (port->port_type == TYPEC_PORT_SRC)
>   		return 0;
> @@ -5961,6 +6007,11 @@ static int tcpm_fw_get_caps(struct tcpm_port *port,
>   	if (port->typec_caps.prefer_role < 0)
>   		return -EINVAL;
>   sink:
> +	port->self_powered = fwnode_property_read_bool(fwnode, "self-powered");
> +
> +	if (!port->pd_supported)
> +		return 0;
> +
>   	/* Get sink pdos */
>   	ret = fwnode_property_count_u32(fwnode, "sink-pdos");
>   	if (ret <= 0)
> @@ -5977,9 +6028,7 @@ static int tcpm_fw_get_caps(struct tcpm_port *port,
>   		return -EINVAL;
>   	port->operating_snk_mw = mw / 1000;
>   
> -	port->self_powered = fwnode_property_read_bool(fwnode, "self-powered");
> -
> -	/* FRS can only be supported byb DRP ports */
> +	/* FRS can only be supported by DRP ports */
>   	if (port->port_type == TYPEC_PORT_DRP) {
>   		ret = fwnode_property_read_u32(fwnode, "new-source-frs-typec-current",
>   					       &frs_current);
> 

