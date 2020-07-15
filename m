Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CD4B221232
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jul 2020 18:25:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726827AbgGOQZM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Jul 2020 12:25:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725770AbgGOQZH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Jul 2020 12:25:07 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD2F6C061755;
        Wed, 15 Jul 2020 09:25:07 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id k5so3211933pjg.3;
        Wed, 15 Jul 2020 09:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6OxB8yXUbjqLqy6UM+HxywH3ynWzmwHFc2n7Yp8WHA0=;
        b=hMLtT0+keXp39EyvI1kSFSqUosgLDz2/BuUQhceva3UdHHDD3QE0ZGa6YiR5QXxFhX
         QvwawR4avNciS0BVH6x/Olm+0yqGQulNQCrt6NIaWjWAtmgMeD/xXr/ZX7A0XwcnMUJx
         KsF6qr9d8ATa4RQLQfhELZWHA1UbjkduZrbbMEqw8LdFaYwNrjYSAHLl24eDopRz2Ufe
         gb+M2aew0tA+TWKJwKSdcTVQghuVbWrsZBb9oCzEBMt67hEEVps0F/XjOdO1dXMKqU65
         HLwHFPfr7OGPA/5XE4GOKRL0yHj8lAXdbXYOsbxstmYBq+XpUPRiMNn8Mna2SFqkygF6
         9vxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=6OxB8yXUbjqLqy6UM+HxywH3ynWzmwHFc2n7Yp8WHA0=;
        b=E0ueSFF92Yyon2g8uNHc2ELzf2eOTZrTiQK5zG/JRaLRBVK8IIJk+EJXMt7RgQX6dG
         uJvemOHjF9DQQ3m5P/UY4wvryMX4Y62W7b2A95nUi5nKLqdZe4KdLkcocLdKZFwqXS+f
         gSlC2YCryBFLC03VqW3pCOXdYxVtk/BWe9URI/9JQ7YZ15FD5fd0sbOg0cQBcWKE+a6A
         HForsC225QYoL69hg7aqyfGNTOBw0bdfETlN/vtE0TpnmwUm2ZcTJhOjHDOggpF/dXOF
         8EIK4ajyhaTOy4eEqY9oKGRlwCBYSNTmaP3+btty3vFf35CrW4kI3h9uWtwFGs8uW0n5
         FURw==
X-Gm-Message-State: AOAM532LctqT0lMtQCuhiRKYzhNl9n67gcXIQzcHsCRlUPILFp1nWHrl
        3CZQTK/TvPWUN2+efXh+r4rSdzIZ
X-Google-Smtp-Source: ABdhPJx/oJQAxCLrZdkObtX6gcOj9aVpU/b9RcKbvYjes+cZjfo6pHsiGT7LYvhezYM38EDYsea5Yw==
X-Received: by 2002:a17:902:c086:: with SMTP id j6mr178573pld.293.1594830307043;
        Wed, 15 Jul 2020 09:25:07 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j36sm2884891pgj.39.2020.07.15.09.25.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2020 09:25:06 -0700 (PDT)
Subject: Re: [PATCH 2/3 v2] usb: typec: tcpm: Support bist test data mode for
 compliance
To:     Badhri Jagan Sridharan <badhri@google.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        reg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200714231207.866838-1-badhri@google.com>
 <20200714231207.866838-2-badhri@google.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <a88cc020-5231-768a-8e84-b14e8935d83a@roeck-us.net>
Date:   Wed, 15 Jul 2020 09:25:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200714231207.866838-2-badhri@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 7/14/20 4:12 PM, Badhri Jagan Sridharan wrote:
> TCPM supports BIST carried mode. PD compliance tests require
> BIST Test Data to be supported as well.
> 
> Introducing set_bist_data callback to signal tcpc driver for
> configuring the port controller hardware to enable/disable
> BIST Test Data mode.
> 
> Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>

This needs to be the first patch in the series. For the code itself:

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> Version history:
> Changes since V1:(Guenter's suggestions)
> - Split the change into two: TCPM and TCPCI
> - Move BIST log to TCPM log
> ---
>  drivers/usb/typec/tcpm/tcpm.c | 11 +++++++++++
>  include/linux/usb/tcpm.h      |  2 ++
>  2 files changed, 13 insertions(+)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index 82b19ebd7838e0..379fcab9dbd973 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -2746,6 +2746,11 @@ static void tcpm_detach(struct tcpm_port *port)
>  	if (!port->attached)
>  		return;
>  
> +	if (port->tcpc->set_bist_data) {
> +		tcpm_log(port, "disable BIST MODE TESTDATA");
> +		port->tcpc->set_bist_data(port->tcpc, false);
> +	}
> +
>  	if (tcpm_port_is_disconnected(port))
>  		port->hard_reset_count = 0;
>  
> @@ -3555,6 +3560,12 @@ static void run_state_machine(struct tcpm_port *port)
>  		case BDO_MODE_CARRIER2:
>  			tcpm_pd_transmit(port, TCPC_TX_BIST_MODE_2, NULL);
>  			break;
> +		case BDO_MODE_TESTDATA:
> +			if (port->tcpc->set_bist_data) {
> +				tcpm_log(port, "Enable BIST MODE TESTDATA");
> +				port->tcpc->set_bist_data(port->tcpc, true);
> +			}
> +			break;
>  		default:
>  			break;
>  		}
> diff --git a/include/linux/usb/tcpm.h b/include/linux/usb/tcpm.h
> index e7979c01c3517c..89f58760cf4800 100644
> --- a/include/linux/usb/tcpm.h
> +++ b/include/linux/usb/tcpm.h
> @@ -79,6 +79,7 @@ enum tcpm_transmit_type {
>   * @try_role:	Optional; called to set a preferred role
>   * @pd_transmit:Called to transmit PD message
>   * @mux:	Pointer to multiplexer data
> + * @set_bist_data: Turn on/off bist data mode for compliance testing
>   */
>  struct tcpc_dev {
>  	struct fwnode_handle *fwnode;
> @@ -103,6 +104,7 @@ struct tcpc_dev {
>  	int (*try_role)(struct tcpc_dev *dev, int role);
>  	int (*pd_transmit)(struct tcpc_dev *dev, enum tcpm_transmit_type type,
>  			   const struct pd_message *msg);
> +	int (*set_bist_data)(struct tcpc_dev *dev, bool on);
>  };
>  
>  struct tcpm_port;
> 

