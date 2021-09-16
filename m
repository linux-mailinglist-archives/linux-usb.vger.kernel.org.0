Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB4A540D1F9
	for <lists+linux-usb@lfdr.de>; Thu, 16 Sep 2021 05:20:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234057AbhIPDVh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Sep 2021 23:21:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234037AbhIPDVg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Sep 2021 23:21:36 -0400
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E944C061574
        for <linux-usb@vger.kernel.org>; Wed, 15 Sep 2021 20:20:17 -0700 (PDT)
Received: by mail-oi1-x22f.google.com with SMTP id s20so7197179oiw.3
        for <linux-usb@vger.kernel.org>; Wed, 15 Sep 2021 20:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=lPWedfA6r5VCpfB+zmlwyCRlfxGZZAM5B9I6qXkXYnw=;
        b=nRaXHUaZOABPQsT/e+jIn5OXE+ZVZn6XRVyxnQcasRRQZUzl3cSz91sbvN/1W5edQw
         u/dC/P36SbnUDKr91tmKbnnQm+yuUjXhmkqk4Z5hUHXY014Dyo3hocyEmqlPiVqrCGv8
         s2vzL610MoTnXtn2IaT2MOkECAspTo1TUA8nM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=lPWedfA6r5VCpfB+zmlwyCRlfxGZZAM5B9I6qXkXYnw=;
        b=5JvDm7GplWZ+lZDCBNNR5Awqs2EhNFQeaytYj1/CcQRGzSlqyU+EsGzkOtmxT4sV6c
         WVsx+fh8xtLZ0glYb692I3yVN9haUIZhdEcFm1bBtxpBPfmJijKxHhZQIxAErizl6aOu
         qw/6LGYSlnxAzmeFU91Zd3jDtkMgwIYgO50Ar6QEWFgi7FP2HeFLehoyx8RwNu5UiIc+
         h0MalTIX2psA/2XtvLR//rm8tKNYnl7BZkEwv8bUmjx7EL6Nl+KPbgamN7YlrDUDxH3t
         /q25Y2TGJ/+CaQf2mUSf0K7F2Y6RGjZ67NUocJmHWo7X1EGj8F0QgWUE/Yf1n3SLnrwE
         qZ/Q==
X-Gm-Message-State: AOAM532kx6Spq1zmvA2m3uwDWtv9g7MJvyxby61kHThqtr6/l7cYRUbs
        DBe4/9UYQ8S4EsrhWazORePkI1cug/Ym8QIloA0cpA==
X-Google-Smtp-Source: ABdhPJzcuEuuVZqh9OT/QB1maRe+ri9jh0M8oeXjbVigf7qvvq/MXTnJTKj4EjVCG4VZHXMT6ucXez6AP2ttiVv7/RE=
X-Received: by 2002:a54:4419:: with SMTP id k25mr7796058oiw.32.1631762416365;
 Wed, 15 Sep 2021 20:20:16 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 15 Sep 2021 20:20:15 -0700
MIME-Version: 1.0
In-Reply-To: <20210817215201.795062-9-hdegoede@redhat.com>
References: <20210817215201.795062-1-hdegoede@redhat.com> <20210817215201.795062-9-hdegoede@redhat.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Wed, 15 Sep 2021 20:20:15 -0700
Message-ID: <CAE-0n53cRs3USijgp5nKy0KoykrNAOs90K-pMk9QBkT+qOgyHw@mail.gmail.com>
Subject: Re: [PATCH 8/8] usb: typec: altmodes/displayport: Notify drm subsys
 of hotplug events
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Hans de Goede <hdegoede@redhat.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Imre Deak <imre.deak@intel.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Lyude <lyude@redhat.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>, pmalani@chromium.org,
        robh@kernel.org
Cc:     Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Quoting Hans de Goede (2021-08-17 14:52:01)
> diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
> index aa669b9cf70e..c1d8c23baa39 100644
> --- a/drivers/usb/typec/altmodes/displayport.c
> +++ b/drivers/usb/typec/altmodes/displayport.c
> @@ -125,6 +129,7 @@ static int dp_altmode_configure(struct dp_altmode *dp, u8 con)
>  static int dp_altmode_status_update(struct dp_altmode *dp)
>  {
>         bool configured = !!DP_CONF_GET_PIN_ASSIGN(dp->data.conf);
> +       bool hpd = !!(dp->data.status & DP_STATUS_HPD_STATE);
>         u8 con = DP_STATUS_CONNECTION(dp->data.status);
>         int ret = 0;
>
> @@ -137,6 +142,11 @@ static int dp_altmode_status_update(struct dp_altmode *dp)
>                 ret = dp_altmode_configure(dp, con);
>                 if (!ret)
>                         dp->state = DP_STATE_CONFIGURE;
> +       } else {
> +               if (dp->hpd != hpd) {
> +                       drm_connector_oob_hotplug_event(dp->connector_fwnode);
> +                       dp->hpd = hpd;
> +               }
>         }
>
>         return ret;
> @@ -512,6 +522,7 @@ static const struct attribute_group dp_altmode_group = {
>  int dp_altmode_probe(struct typec_altmode *alt)
>  {
>         const struct typec_altmode *port = typec_altmode_get_partner(alt);
> +       struct fwnode_handle *fwnode;
>         struct dp_altmode *dp;
>         int ret;
>
> @@ -540,6 +551,11 @@ int dp_altmode_probe(struct typec_altmode *alt)
>         alt->desc = "DisplayPort";
>         alt->ops = &dp_altmode_ops;
>
> +       fwnode = dev_fwnode(alt->dev.parent->parent); /* typec_port fwnode */
> +       dp->connector_fwnode = fwnode_find_reference(fwnode, "displayport", 0);

I'm trying to figure out how to translate this over to DT bindings. Is
there a binding document for this fwnode reference? If not, can you
please update
Documentation/devicetree/bindings/connector/usb-connector.yaml with this
property?

I think this means that the type-c node would have a 'displayport =
<&some_phandle>' property in it that points to the display port hardware
device that's pumping out the DisplayPort data?

> +       if (IS_ERR(dp->connector_fwnode))
> +               dp->connector_fwnode = NULL;
> +
>         typec_altmode_set_drvdata(alt, dp);
>
>         dp->state = DP_STATE_ENTER;
> @@ -555,6 +571,13 @@ void dp_altmode_remove(struct typec_altmode *alt)
>
>         sysfs_remove_group(&alt->dev.kobj, &dp_altmode_group);
>         cancel_work_sync(&dp->work);
> +
> +       if (dp->connector_fwnode) {
> +               if (dp->hpd)
> +                       drm_connector_oob_hotplug_event(dp->connector_fwnode);

I was hoping that we could make a type-c connector into a drm_bridge.
I'm thinking that it would be a DP-to-panel bridge. Then a panel could
be created as well on the end of the type-c connector and the bridge
would report hpd whenever the type-c logic figures out the cable has
been connected and hpd is asserted. The actual DisplayPort hardware
that's encoding data would then find the bridge through the graph
binding connected to the output node.

I'm not sure how MST is handled though. In that scenario maybe there's
more than one panel?

If you're interested the dts file that I'm trying to make this work for
is sc7180-trogdor.dtsi and I need to hook up mdss_dp's output port to
the two type-c connectors, usb_c0 and usb_c1, somehow. The two ports are
actually muxed by the EC (parent node) so only one type-c port can be
connected to the DP hardware at a time.

> +
> +               fwnode_handle_put(dp->connector_fwnode);
> +       }
