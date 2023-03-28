Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7CA7D6CC3A8
	for <lists+linux-usb@lfdr.de>; Tue, 28 Mar 2023 16:56:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233558AbjC1O4I (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 28 Mar 2023 10:56:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233557AbjC1O4H (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 28 Mar 2023 10:56:07 -0400
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 218CCD520
        for <linux-usb@vger.kernel.org>; Tue, 28 Mar 2023 07:56:06 -0700 (PDT)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-5419d4c340aso234450307b3.11
        for <linux-usb@vger.kernel.org>; Tue, 28 Mar 2023 07:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680015365;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DQcDqYvcmv564x3yanLM9u/Rj6EqvyETRJ8BJOl4/XY=;
        b=CImWm3EHMLY9MfIyNwah+/pjs8TLbOEWUC03xr7NyvdqmqRUJdy3C9RpT5n2jGj7b2
         ZenTt79XlFeaOR/4IuGlhn30oasKuP66rag/+lrd5y0cc4D0xn1f5BzbOyvdL3KgsV81
         svv3a1H6n52G4LnD6qxjm80TjWCQw8fYMKrDoFSIj5sFYo18C+R/1h9bsmmswiMj8HsU
         PI5MwiCWiCHbGSSn3WJEx5fKRGFM2640RpKr9d9wSLA+RgLgOyd49b75lSKUnUABKaPY
         cu1Zy0rrEkPEPYsYfLxV+oXpFeZBT1mNmJe99qjd3LVlloJU9QLZxs6bmET4A/bA5nVM
         P/bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680015365;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DQcDqYvcmv564x3yanLM9u/Rj6EqvyETRJ8BJOl4/XY=;
        b=3dG+gI2WH6hDnOJ+OpptWcEz6F5sK0rpYfwY07pg7KlXv5gjerLd8ZpkqKLZloEi4I
         Uq5y4hynSNqeXoG0LlLzcnhESVNTleOI64MKqTrnnRBK1yiG4nMVAPnETqjoIrixnziR
         YNLpBJnDyZkdYTTMTA9ItRH0YE13V3UUOhRyhtG8RpTiLaDzbtwmq6LDLKt/LkkkixOz
         zH9uH6oMZZnowXYmb2hJvn7rUjIqHTRT1oOmxyxCiNEDfrO3SMtcO6MTifSUYUSHIULx
         A9T9hgrMtE57TtDoRLxYA2/t4lj1aTYKMwHvzC8EY3+oxCcRY7yCW1QuxN+QyFq40z2j
         V4PA==
X-Gm-Message-State: AAQBX9eE9yYYs2kvPv1QDQ6Q/3Gzd2YxsIK6u/kxnf9ygyYIhga7CBiP
        LE9PnTLRoRTfuUU98h2x+as=
X-Google-Smtp-Source: AKy350buKpecnJ3MuWh/2VZjjLZTD1LVajAzGPaLqfnpgXIwVLMlAMJDJNLOLsHlvftIR0hhoKnMCQ==
X-Received: by 2002:a0d:fc02:0:b0:541:95ef:1700 with SMTP id m2-20020a0dfc02000000b0054195ef1700mr17437237ywf.39.1680015364886;
        Tue, 28 Mar 2023 07:56:04 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z67-20020a0dd746000000b00545a08184d2sm2464524ywd.98.2023.03.28.07.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 07:56:04 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Tue, 28 Mar 2023 07:56:03 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Li Jun <jun.li@nxp.com>, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, xu.yang_2@nxp.com,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH] usb: typec: tcpm: try to get role switch from tcpc fwnode
Message-ID: <dbd87836-4125-4887-95af-e42b8c0ada9a@roeck-us.net>
References: <1679991784-25500-1-git-send-email-jun.li@nxp.com>
 <ZCL1pULmTtMOpaKB@kuha.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZCL1pULmTtMOpaKB@kuha.fi.intel.com>
X-Spam-Status: No, score=0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,
        FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Mar 28, 2023 at 05:11:49PM +0300, Heikki Krogerus wrote:
> +Bryan
> 
> On Tue, Mar 28, 2023 at 04:23:04PM +0800, Li Jun wrote:
> > Try to get usb role switch from tcpc fwnode if failed to
> > get role switch from port dev, this is for case the port
> > for role switch endpoint is located in connector node,
> > as per connector binding doc, port@0 for HS is required.
> > 
> > ptn5110: tcpc@50 {
> > 	compatible = "nxp,ptn5110";
> > 	...
> > 	status = "okay";
> > 
> > 	connector {
> > 		compatible = "usb-c-connector";
> > 		label = "USB-C";
> > 		...
> > 
> > 		ports {
> > 			#address-cells = <1>;
> > 			#size-cells = <0>;
> > 
> > 			port@0 {
> > 				reg = <0>;
> > 
> > 				typec_conn: endpoint {
> > 					remote-endpoint = <&usb2_controller>;
> > 				};
> > 			};
> > 		};
> > 	};
> > };
> > 
> > Signed-off-by: Li Jun <jun.li@nxp.com>
> > ---
> >  drivers/usb/typec/tcpm/tcpm.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> > index a0d943d78580..f0534bdb4462 100644
> > --- a/drivers/usb/typec/tcpm/tcpm.c
> > +++ b/drivers/usb/typec/tcpm/tcpm.c
> > @@ -6557,6 +6557,8 @@ struct tcpm_port *tcpm_register_port(struct device *dev, struct tcpc_dev *tcpc)
> >  	port->port_type = port->typec_caps.type;
> >  
> >  	port->role_sw = usb_role_switch_get(port->dev);
> > +	if (!port->role_sw)
> > +		port->role_sw = fwnode_usb_role_switch_get(tcpc->fwnode);
> >  	if (IS_ERR(port->role_sw)) {
> >  		err = PTR_ERR(port->role_sw);
> >  		goto out_destroy_wq;
> 
> This looks like exactly the same as the RFC from Bryan that I just
> commented. I have not objections if this looks okay to you Brian. I
> think we should still wait for comments also from Guenter.
> 

Ok with me.

Guenter

> thanks,
> 
> -- 
> heikki
