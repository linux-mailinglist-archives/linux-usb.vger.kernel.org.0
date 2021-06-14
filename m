Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1C303A6C75
	for <lists+linux-usb@lfdr.de>; Mon, 14 Jun 2021 18:52:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235214AbhFNQyO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 14 Jun 2021 12:54:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234348AbhFNQyN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 14 Jun 2021 12:54:13 -0400
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com [IPv6:2607:f8b0:4864:20::e2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90B85C061767
        for <linux-usb@vger.kernel.org>; Mon, 14 Jun 2021 09:52:10 -0700 (PDT)
Received: by mail-vs1-xe2b.google.com with SMTP id f21so8172047vsl.4
        for <linux-usb@vger.kernel.org>; Mon, 14 Jun 2021 09:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qI8JpFMh7+nrwzVv1jWVM5ml0OUiY5MJQrtGKYX8w3k=;
        b=eVGDtJeB3NP1YU2OckLCU2+if7afqsRRCInB7mMgNIybpYLMLgzkFefYdr+bFXX+Pb
         hWcIUU4wrrjVcAsG1xldBIq8Y/94R08Z6b34qYhl6CuMujqc5WzJp0a92p7n3NJrE2rR
         hZcpCcTurdeVtAylilTWhvpgauRPC9zSn5DSXQR4TfY97RCg91PTjlFD8AoTHiTTUC+J
         NyaY6Uy/QmLvbqKT116GwLKOiEHJBfMhjIiP+bmqKTYNElNCgk3UTFw4VXNzphhE41uK
         xTC9JbDWs64guA4T+VE3waJTio+tKZzVPhJflJEFzbs7rxQYfM+fcvIoEstDI4HJDSWQ
         Bkbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qI8JpFMh7+nrwzVv1jWVM5ml0OUiY5MJQrtGKYX8w3k=;
        b=arUhGWsZxj7o+JWiF4bEUgI8ShajVl4XUdvfEUoh5e3bOS4CVu0g0fTktRHlL5Vqc2
         33K+PFozi8KLmGar33R8jeodbzDOJzC+y/fs0Hhqg+O3CBVmCzoArkOGdPZl6kFgr0Gh
         rTASSGAHHPenPF2Ooe6PhDw52rUJjglqkrjhBh/EnWFqHhZK+DWBGGNEOP1s33BOdQeZ
         9Fso7aBcHQctmxnqSJuXPPme+x7IFZBC3Akh52ujmtfKOZ3kreOdqsji+Rnh0F40Q9Io
         K+jTttHFz8YCXcPAwuccktIRzEbpriaICaFQQxH6R6CM+O5o6OgJG4kgmT5zttEKZ9Sw
         3oWQ==
X-Gm-Message-State: AOAM531aVwBIc47BgLNpSMjaDJdcKlXg9ag4quwX/x4Su2iGHDI7J2TH
        bf2Cup2SUktn/mukVPJbSr6YbkItG/MBnsa3hpbd5A==
X-Google-Smtp-Source: ABdhPJwTOtTYWIw8/DHdS2gKarUJzdUDIoUmiwbV/4/1y92NutyH5q2jqvt2X7yb7d5Ds03TnsjJOYAamVmKwRFgULo=
X-Received: by 2002:a05:6102:2378:: with SMTP id o24mr292281vsa.12.1623689527787;
 Mon, 14 Jun 2021 09:52:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210613151223.563736-1-kyletso@google.com>
In-Reply-To: <20210613151223.563736-1-kyletso@google.com>
From:   Badhri Jagan Sridharan <badhri@google.com>
Date:   Mon, 14 Jun 2021 09:51:31 -0700
Message-ID: <CAPTae5JHHYO=y7279pFcHrt1oD3HHU8m3qkdb1vmNkbf6rLpqA@mail.gmail.com>
Subject: Re: [PATCH] usb: typec: tcpm: Relax disconnect threshold during power negotiation
To:     Kyle Tso <kyletso@google.com>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        USB <linux-usb@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Kyle,

The change doesn't seem to handle the cases where the partner does not
accept the request i.e.
       "case PD_CTRL_REJECT:
        case PD_CTRL_WAIT:
        case PD_CTRL_NOT_SUPP:"
We should fall back to the disconnect threshold based on the
previously negotiated voltage levels in those cases.

Regards,
Badhri


On Sun, Jun 13, 2021 at 8:13 AM Kyle Tso <kyletso@google.com> wrote:
>
> If the voltage is being decreased in power negotiation, the Source will
> set the power supply to operate at the new voltage level before sending
> PS_RDY. Relax the disconnect threshold for Sink after receiving Accept
> Message to ensure the relaxed setting is enabled before the voltage
> collapse. And the real threshold will be set after Sink receives PS_RDY
> Message.
>
> Fixes: f321a02caebd ("usb: typec: tcpm: Implement enabling Auto Discharge disconnect support")
> Cc: Badhri Jagan Sridharan <badhri@google.com>
> Signed-off-by: Kyle Tso <kyletso@google.com>
> ---
>  drivers/usb/typec/tcpm/tcpm.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index 0db685d5d9c0..9f3f37da71b6 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -2646,6 +2646,8 @@ static void tcpm_pd_ctrl_request(struct tcpm_port *port,
>                 switch (port->state) {
>                 case SNK_NEGOTIATE_CAPABILITIES:
>                         port->pps_data.active = false;
> +                       /* Voltage is going to be at new level. Relax the threshold here. */
> +                       tcpm_set_auto_vbus_discharge_threshold(port, TYPEC_PWR_MODE_USB, false, 0);
>                         tcpm_set_state(port, SNK_TRANSITION_SINK, 0);
>                         break;
>                 case SNK_NEGOTIATE_PPS_CAPABILITIES:
> @@ -2656,6 +2658,8 @@ static void tcpm_pd_ctrl_request(struct tcpm_port *port,
>                         port->req_supply_voltage = port->pps_data.req_out_volt;
>                         port->req_current_limit = port->pps_data.req_op_curr;
>                         power_supply_changed(port->psy);
> +                       /* Voltage is going to be at new level. Relax the threshold here. */
> +                       tcpm_set_auto_vbus_discharge_threshold(port, TYPEC_PWR_MODE_USB, false, 0);
>                         tcpm_set_state(port, SNK_TRANSITION_SINK, 0);
>                         break;
>                 case SOFT_RESET_SEND:
> --
> 2.32.0.272.g935e593368-goog
>
