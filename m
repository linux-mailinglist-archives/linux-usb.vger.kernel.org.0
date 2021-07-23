Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23E8B3D3E59
	for <lists+linux-usb@lfdr.de>; Fri, 23 Jul 2021 19:18:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230098AbhGWQhr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 23 Jul 2021 12:37:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229616AbhGWQhq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 23 Jul 2021 12:37:46 -0400
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com [IPv6:2607:f8b0:4864:20::f2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 078DEC061575
        for <linux-usb@vger.kernel.org>; Fri, 23 Jul 2021 10:18:19 -0700 (PDT)
Received: by mail-qv1-xf2f.google.com with SMTP id d17so1630254qvn.13
        for <linux-usb@vger.kernel.org>; Fri, 23 Jul 2021 10:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eCv0QU6je2rmYu7A4iiFs2epRehoLyh4UDlFtuOF100=;
        b=T38PXGyhDq3GOvv+TSyGaL98LpXC704ivvid7yFGErfCo8cZeMnXO2/DuN2QeCU21x
         QbYbFj5q5lVkkgszSpL9hwaFK9IvDx60myR43gqYhJND+GKiAMUqC/EHZeIhC4mZsDXV
         vqsdDWOVm6tzHAWQcXHiG7z18VEGZAg3sIOB3KkJ1ABYhjRSSL4WmgR8UoXkjKquWD91
         vhRC7+6gUPxDzERD4zjjszGMozXGhfKvWS3JPWnImlunvIuRgOV7ohYapZMOcLMG+AUQ
         6lL/WKs0MNB5Djc8tMcWkdvArbfRftyfAUBmUBX4JwODIHZX+KMjkptQvYNatBfZI/jW
         KgtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eCv0QU6je2rmYu7A4iiFs2epRehoLyh4UDlFtuOF100=;
        b=KI3E6VfJklZtIBCO0+fkGNzFXKUFa9BHX0hM1lTx4ZrnQkfvFzmNpjRhuwoFFkAGkt
         eqHhgcpcaDZNtRwuGM9HwHKewvykjaYuYk98naoZqm+rawoKoOvrWprsookijQwoU1B2
         FdvhOY96Gony/lyjLjSd5WtCyNfvfHFujPviAGPvDRIKLb/QbONaimHgiQVp/UwrVnyO
         9NF7DC/jes+QwIxzoEO0VVFVY39KAt4Vm1fAaMVNM7JsBq80vsSpiK3+bOkyE6Ujas5D
         7BLYzQ/k8GEJd+vfDWT6QayLhTZTHyRKYtLbJtTK5vuJy7fMMBDjCQz6R/x9Zd3c6wiA
         pNfQ==
X-Gm-Message-State: AOAM530Kmjhgr5XqKDaDCCzMv9w019swQ4M7uGmASnrRVf+45623Hh+r
        /BqfN5GmhYN9wYcaXAc7bJxS5CwwSDFFEPtk/RH5QfNB6HfZew==
X-Google-Smtp-Source: ABdhPJwnqwfHO2wjh7DgPt0pwDZnajREVOWdRwd3yK4zHaOZy6liw3a08k3kg/Z9WgRWDJpGdggxHF6DWGnBekrI7wI=
X-Received: by 2002:a05:6214:e83:: with SMTP id hf3mr5823233qvb.19.1627060697501;
 Fri, 23 Jul 2021 10:18:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210716093916.1516845-1-kyletso@google.com>
In-Reply-To: <20210716093916.1516845-1-kyletso@google.com>
From:   Kyle Tso <kyletso@google.com>
Date:   Sat, 24 Jul 2021 01:18:01 +0800
Message-ID: <CAGZ6i=3PJ+aRzM7=c6f9oCaCjvdQ7GqtCn+dv7H0yC8WMoe+KA@mail.gmail.com>
Subject: Re: [PATCH] usb: typec: tcpm: Support non-PD mode
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org
Cc:     badhri@google.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jul 16, 2021 at 5:39 PM Kyle Tso <kyletso@google.com> wrote:
>
> tcpm.c could work well without PD capabilities. Do not block the probe
> if capabilities are not defined in fwnode and skip the PD power
> negotiation in the state machine.
>
> Signed-off-by: Kyle Tso <kyletso@google.com>
> ---

Hi, any comments about this patch?

thanks,
Kyle

>  drivers/usb/typec/tcpm/tcpm.c | 50 ++++++++++++++++++++---------------
>  1 file changed, 29 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index 5b22a1c931a9..a42de5e17d24 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -3914,6 +3914,8 @@ static void run_state_machine(struct tcpm_port *port)
>                 if (port->ams == POWER_ROLE_SWAP ||
>                     port->ams == FAST_ROLE_SWAP)
>                         tcpm_ams_finish(port);
> +               if (!port->nr_src_pdo)
> +                       tcpm_set_state(port, SRC_READY, 0);
>                 port->upcoming_state = SRC_SEND_CAPABILITIES;
>                 tcpm_ams_start(port, POWER_NEGOTIATION);
>                 break;
> @@ -4161,7 +4163,10 @@ static void run_state_machine(struct tcpm_port *port)
>                                 current_lim = PD_P_SNK_STDBY_MW / 5;
>                         tcpm_set_current_limit(port, current_lim, 5000);
>                         tcpm_set_charge(port, true);
> -                       tcpm_set_state(port, SNK_WAIT_CAPABILITIES, 0);
> +                       if (!port->nr_snk_pdo)
> +                               tcpm_set_state(port, SNK_READY, 0);
> +                       else
> +                               tcpm_set_state(port, SNK_WAIT_CAPABILITIES, 0);
>                         break;
>                 }
>                 /*
> @@ -5939,15 +5944,17 @@ static int tcpm_fw_get_caps(struct tcpm_port *port,
>
>         /* Get source pdos */
>         ret = fwnode_property_count_u32(fwnode, "source-pdos");
> -       if (ret <= 0)
> -               return -EINVAL;
> +       if (ret < 0)
> +               ret = 0;
>
>         port->nr_src_pdo = min(ret, PDO_MAX_OBJECTS);
> -       ret = fwnode_property_read_u32_array(fwnode, "source-pdos",
> -                                            port->src_pdo, port->nr_src_pdo);
> -       if ((ret < 0) || tcpm_validate_caps(port, port->src_pdo,
> -                                           port->nr_src_pdo))
> -               return -EINVAL;
> +       if (port->nr_src_pdo) {
> +               ret = fwnode_property_read_u32_array(fwnode, "source-pdos",
> +                                                    port->src_pdo, port->nr_src_pdo);
> +               if ((ret < 0) || tcpm_validate_caps(port, port->src_pdo,
> +                                                   port->nr_src_pdo))
> +                       return -EINVAL;
> +       }
>
>         if (port->port_type == TYPEC_PORT_SRC)
>                 return 0;
> @@ -5963,19 +5970,21 @@ static int tcpm_fw_get_caps(struct tcpm_port *port,
>  sink:
>         /* Get sink pdos */
>         ret = fwnode_property_count_u32(fwnode, "sink-pdos");
> -       if (ret <= 0)
> -               return -EINVAL;
> +       if (ret < 0)
> +               ret = 0;
>
>         port->nr_snk_pdo = min(ret, PDO_MAX_OBJECTS);
> -       ret = fwnode_property_read_u32_array(fwnode, "sink-pdos",
> -                                            port->snk_pdo, port->nr_snk_pdo);
> -       if ((ret < 0) || tcpm_validate_caps(port, port->snk_pdo,
> -                                           port->nr_snk_pdo))
> -               return -EINVAL;
> +       if (port->nr_snk_pdo) {
> +               ret = fwnode_property_read_u32_array(fwnode, "sink-pdos",
> +                                                    port->snk_pdo, port->nr_snk_pdo);
> +               if ((ret < 0) || tcpm_validate_caps(port, port->snk_pdo,
> +                                                   port->nr_snk_pdo))
> +                       return -EINVAL;
>
> -       if (fwnode_property_read_u32(fwnode, "op-sink-microwatt", &mw) < 0)
> -               return -EINVAL;
> -       port->operating_snk_mw = mw / 1000;
> +               if (fwnode_property_read_u32(fwnode, "op-sink-microwatt", &mw) < 0)
> +                       return -EINVAL;
> +               port->operating_snk_mw = mw / 1000;
> +       }
>
>         port->self_powered = fwnode_property_read_bool(fwnode, "self-powered");
>
> @@ -6283,9 +6292,8 @@ struct tcpm_port *tcpm_register_port(struct device *dev, struct tcpc_dev *tcpc)
>         int err;
>
>         if (!dev || !tcpc ||
> -           !tcpc->get_vbus || !tcpc->set_cc || !tcpc->get_cc ||
> -           !tcpc->set_polarity || !tcpc->set_vconn || !tcpc->set_vbus ||
> -           !tcpc->set_pd_rx || !tcpc->set_roles || !tcpc->pd_transmit)
> +           !tcpc->get_vbus || !tcpc->set_cc || !tcpc->get_cc || !tcpc->set_polarity ||
> +           !tcpc->set_vconn || !tcpc->set_vbus || !tcpc->set_roles)
>                 return ERR_PTR(-EINVAL);
>
>         port = devm_kzalloc(dev, sizeof(*port), GFP_KERNEL);
> --
> 2.32.0.402.g57bb445576-goog
>
