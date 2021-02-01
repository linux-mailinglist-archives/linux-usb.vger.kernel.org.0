Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23E5F30AECE
	for <lists+linux-usb@lfdr.de>; Mon,  1 Feb 2021 19:14:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231995AbhBASNn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 1 Feb 2021 13:13:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231945AbhBASNm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 1 Feb 2021 13:13:42 -0500
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3554DC061756
        for <linux-usb@vger.kernel.org>; Mon,  1 Feb 2021 10:13:02 -0800 (PST)
Received: by mail-qk1-x72d.google.com with SMTP id n15so17195984qkh.8
        for <linux-usb@vger.kernel.org>; Mon, 01 Feb 2021 10:13:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0Ps8FU4d7d3oiVbWoQjhiPbJFARiTozLfZPcUixydTI=;
        b=EvZrIQYVapkr7qX2PPntbHfsHMSJqwUs6Cd3VO5KjP4MeEZjB9UgQ19+GG4gdKTt0J
         XjymWR3sj/oLh3zqU3FC2YCDqwLXsVGaQK3WPZcp7RAYI9M0uQzz/5Rag84v7VXomFNr
         1PLTpFo3Z2wlhGHrynFOOGG9ZnNHWDCLmxJGQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0Ps8FU4d7d3oiVbWoQjhiPbJFARiTozLfZPcUixydTI=;
        b=QROzEpdAhKHnSIST2SBJydQq1X39AcenI00Mo3rz7UVfMbU5smplC9nnoUihOqXBWw
         FoPP+T4jATAHnKMBEjKd/Wh8zpn3Twkg7j9R38DoVS7sc7GM/bSrYgAt2HzjNwp4FhqD
         3Sb0e+2lr1AC4V1vp34Aa34748P9qk4uT7pFO7uIKiF5O0s48PxC9LNROEwwIiK+94BX
         h7DnUx8hndQI6DYIppcEru4Xs4E0hhUDq8sMtfzq16kCHIRy2PJGpCKstksiCcLxeAoO
         7GdVq0rtJbTO4xxWtkrg71PjbPj9jMlf2RjS+DsTMO8PkFqmi/1eZlzlxKRRJDqQFKhk
         Aw0A==
X-Gm-Message-State: AOAM5314p2I+ADO2YbX1vNPkepbOsA3C+bqYYrn+v3U384J26bb/GweK
        zfYdMcVVUV+RJdko2TUZfOv40/e0HjY2o7eQ8IoB8g==
X-Google-Smtp-Source: ABdhPJzC08aljw8iKeT2/zcYu/8Ecw1WrjCFFv7qOm22f7x3+noWDpmP48mrId+lo2dytgAmS14AgKRhpzsTDpL84vU=
X-Received: by 2002:a05:620a:22c7:: with SMTP id o7mr17320159qki.157.1612203181358;
 Mon, 01 Feb 2021 10:13:01 -0800 (PST)
MIME-Version: 1.0
References: <20210129061406.2680146-1-bleung@chromium.org> <20210129061406.2680146-5-bleung@chromium.org>
In-Reply-To: <20210129061406.2680146-5-bleung@chromium.org>
From:   Prashant Malani <pmalani@chromium.org>
Date:   Mon, 1 Feb 2021 10:12:49 -0800
Message-ID: <CACeCKafOGXS9nhYKiR-hSMUoC8+010Ye-b7Zd5=wZQtUpuVmQg@mail.gmail.com>
Subject: Re: [PATCH 4/6] platform/chrome: cros_ec_typec: Report SOP' PD
 revision from status
To:     Benson Leung <bleung@chromium.org>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "open list:USB NETWORKING DRIVERS" <linux-usb@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Guenter Roeck <groeck@chromium.org>,
        Benson Leung <bleung@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Benson,

On Thu, Jan 28, 2021 at 10:14 PM Benson Leung <bleung@chromium.org> wrote:
>
> cros_typec_handle_sop_prime_disc now takes the PD revision provided
> by the EC_CMD_TYPEC_STATUS command response for the SOP'.
>
> Attach the properly formatted pd_revision to the cable desc before
> registering the cable.
>
> Signed-off-by: Benson Leung <bleung@chromium.org>
Reviewed-by: Prashant Malani <pmalani@chromium.org>

> ---
>  drivers/platform/chrome/cros_ec_typec.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
> index e724a5eaef1c..30600e9454e1 100644
> --- a/drivers/platform/chrome/cros_ec_typec.c
> +++ b/drivers/platform/chrome/cros_ec_typec.c
> @@ -748,7 +748,7 @@ static void cros_typec_parse_pd_identity(struct usb_pd_identity *id,
>                 id->vdo[i - 3] = disc->discovery_vdo[i];
>  }
>
> -static int cros_typec_handle_sop_prime_disc(struct cros_typec_data *typec, int port_num)
> +static int cros_typec_handle_sop_prime_disc(struct cros_typec_data *typec, int port_num, u16 pd_revision)
>  {
>         struct cros_typec_port *port = typec->ports[port_num];
>         struct ec_response_typec_discovery *disc = port->disc_data;
> @@ -794,6 +794,7 @@ static int cros_typec_handle_sop_prime_disc(struct cros_typec_data *typec, int p
>         }
>
>         c_desc.identity = &port->c_identity;
> +       c_desc.pd_revision = pd_revision;
>
>         port->cable = typec_register_cable(port->port, &c_desc);
>         if (IS_ERR(port->cable)) {
> @@ -893,7 +894,11 @@ static void cros_typec_handle_status(struct cros_typec_data *typec, int port_num
>
>         if (resp.events & PD_STATUS_EVENT_SOP_PRIME_DISC_DONE &&
>             !typec->ports[port_num]->sop_prime_disc_done) {
> -               ret = cros_typec_handle_sop_prime_disc(typec, port_num);
> +               u16 sop_prime_revision;
> +
> +               /* Convert BCD to the format preferred by the TypeC framework */
> +               sop_prime_revision = (le16_to_cpu(resp.sop_prime_revision) & 0xff00) >> 4;
> +               ret = cros_typec_handle_sop_prime_disc(typec, port_num, sop_prime_revision);
>                 if (ret < 0)
>                         dev_err(typec->dev, "Couldn't parse SOP' Disc data, port: %d\n", port_num);
>                 else
> --
> 2.30.0.365.g02bc693789-goog
>
