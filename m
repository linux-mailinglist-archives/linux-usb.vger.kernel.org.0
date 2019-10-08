Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7179D02F0
	for <lists+linux-usb@lfdr.de>; Tue,  8 Oct 2019 23:39:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730523AbfJHVjW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Oct 2019 17:39:22 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:47052 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729436AbfJHVjV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Oct 2019 17:39:21 -0400
Received: by mail-pf1-f194.google.com with SMTP id q5so145700pfg.13
        for <linux-usb@vger.kernel.org>; Tue, 08 Oct 2019 14:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=gheI/meqGI0DVAyYyzES95PEdXdAVmvD0ZvASb4GjbU=;
        b=LsjVfmWZjPm/7WrDTnl+31bzlJFBi/03KSbuBHeB9lkl3NWJhdJkezbgQYrfwppu0/
         KT4AausKsDcDsi9b2DBn57Cf9BJd052Lz8VHn/lZvf8i9p0iGMPgyv3UCJcKzRnVEMdg
         7ZuE9BMzpyp4J3U42EHXHkxPpVBWAH+g62cHHgAlRbFc+7alvyUiSSsBqct/NCO5JzwZ
         0GWJI849m0oQlZkQzRFqmvzaLlBJEjhgOJCYt0xjC1UAHWs+fO2887VpBIZEdLkQYxgl
         Ou4cjFm+IAuQudhGtmKB5t5xtmfP3FZ4MBrs7EmVG+7HScHuo29yKGUhf2tXFGWqjxG2
         HDxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=gheI/meqGI0DVAyYyzES95PEdXdAVmvD0ZvASb4GjbU=;
        b=TfpcY7S9T9FEbrN3htBiPKWDQAN8XDguKhgOfRhs2vTO6iTBwvWcPvXAWSWJ+w8Cnf
         U4T1Jfzk9pLk1Ql8bx85E2+mLbUshsk0NOLd0Yh2pFhYVJesb4b/RNr3t5zNpMfFVKgf
         qdxOMYVG7/B2Zj0ayoDv3+mffu7sJ+nuhImg0RrSTUC5BKmJcRY6tTOzPgWh/i+8IG43
         32vMGyxEAd4DZN07l5gcIItPlywAIoc5cj55FSfZrrwIBh3OJwfA9yLjjMM7WcoNCRwL
         bqmrIfFLu8P7e51O1EhEt7JzS3yd5MDXzfbMoTPbxL93xQByTCArR/KvGYBjWz+iC3GH
         wxhg==
X-Gm-Message-State: APjAAAWoIvU6J40Pn3xnJ4hWp98DGV5JYMptCCGxJbV0cmLnffgsF0m8
        sczpQOJYcXyt/cwiiOu3L/GOFQmG
X-Google-Smtp-Source: APXvYqy+fY/adNWgXBwcvGINGOTrwvzkISA+B1R3NGFpfC7vFKukdAwKG90dTLEzrnpQhXMb79wy7g==
X-Received: by 2002:a17:90a:8c15:: with SMTP id a21mr8111249pjo.99.1570570761021;
        Tue, 08 Oct 2019 14:39:21 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q15sm124705pgl.12.2019.10.08.14.39.20
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Oct 2019 14:39:20 -0700 (PDT)
Date:   Tue, 8 Oct 2019 14:39:19 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 7/9] usb: typec: hd3ss3220: Start using struct
 typec_operations
Message-ID: <20191008213919.GD16138@roeck-us.net>
References: <20191008111350.68581-1-heikki.krogerus@linux.intel.com>
 <20191008111350.68581-8-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191008111350.68581-8-heikki.krogerus@linux.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Oct 08, 2019 at 02:13:48PM +0300, Heikki Krogerus wrote:
> Supplying the operation callbacks as part of a struct
> typec_operations instead of as part of struct
> typec_capability during port registration. After this there
> is not need to keep the capabilities stored anywhere in the
> driver.
> 
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/usb/typec/hd3ss3220.c | 24 +++++++++++++-----------
>  1 file changed, 13 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/usb/typec/hd3ss3220.c b/drivers/usb/typec/hd3ss3220.c
> index 1900910c637e..7c3ee9d28670 100644
> --- a/drivers/usb/typec/hd3ss3220.c
> +++ b/drivers/usb/typec/hd3ss3220.c
> @@ -38,7 +38,6 @@ struct hd3ss3220 {
>  	struct regmap *regmap;
>  	struct usb_role_switch	*role_sw;
>  	struct typec_port *port;
> -	struct typec_capability typec_cap;
>  };
>  
>  static int hd3ss3220_set_source_pref(struct hd3ss3220 *hd3ss3220, int src_pref)
> @@ -74,11 +73,9 @@ static enum usb_role hd3ss3220_get_attached_state(struct hd3ss3220 *hd3ss3220)
>  	return attached_state;
>  }
>  
> -static int hd3ss3220_dr_set(const struct typec_capability *cap,
> -			    enum typec_data_role role)
> +static int hd3ss3220_dr_set(struct typec_port *port, enum typec_data_role role)
>  {
> -	struct hd3ss3220 *hd3ss3220 = container_of(cap, struct hd3ss3220,
> -						   typec_cap);
> +	struct hd3ss3220 *hd3ss3220 = typec_get_drvdata(port);
>  	enum usb_role role_val;
>  	int pref, ret = 0;
>  
> @@ -99,6 +96,10 @@ static int hd3ss3220_dr_set(const struct typec_capability *cap,
>  	return ret;
>  }
>  
> +static const struct typec_operations hd3ss3220_ops = {
> +	.dr_set = hd3ss3220_dr_set
> +};
> +
>  static void hd3ss3220_set_role(struct hd3ss3220 *hd3ss3220)
>  {
>  	enum usb_role role_state = hd3ss3220_get_attached_state(hd3ss3220);
> @@ -153,6 +154,7 @@ static const struct regmap_config config = {
>  static int hd3ss3220_probe(struct i2c_client *client,
>  		const struct i2c_device_id *id)
>  {
> +	struct typec_capability typec_cap = { };
>  	struct hd3ss3220 *hd3ss3220;
>  	struct fwnode_handle *connector;
>  	int ret;
> @@ -181,13 +183,13 @@ static int hd3ss3220_probe(struct i2c_client *client,
>  	if (IS_ERR_OR_NULL(hd3ss3220->role_sw))
>  		return PTR_ERR(hd3ss3220->role_sw);
>  
> -	hd3ss3220->typec_cap.prefer_role = TYPEC_NO_PREFERRED_ROLE;
> -	hd3ss3220->typec_cap.dr_set = hd3ss3220_dr_set;
> -	hd3ss3220->typec_cap.type = TYPEC_PORT_DRP;
> -	hd3ss3220->typec_cap.data = TYPEC_PORT_DRD;
> +	typec_cap.prefer_role = TYPEC_NO_PREFERRED_ROLE;
> +	typec_cap.driver_data = hd3ss3220;
> +	typec_cap.type = TYPEC_PORT_DRP;
> +	typec_cap.data = TYPEC_PORT_DRD;
> +	typec_cap.ops = &hd3ss3220_ops;
>  
> -	hd3ss3220->port = typec_register_port(&client->dev,
> -					      &hd3ss3220->typec_cap);
> +	hd3ss3220->port = typec_register_port(&client->dev, &typec_cap);
>  	if (IS_ERR(hd3ss3220->port))
>  		return PTR_ERR(hd3ss3220->port);
>  
> -- 
> 2.23.0
> 
