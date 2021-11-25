Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BE4C45D39B
	for <lists+linux-usb@lfdr.de>; Thu, 25 Nov 2021 04:28:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237551AbhKYDbk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 24 Nov 2021 22:31:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235496AbhKYD3k (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 24 Nov 2021 22:29:40 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A530CC0617A2
        for <linux-usb@vger.kernel.org>; Wed, 24 Nov 2021 19:20:55 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id l16so8342443wrp.11
        for <linux-usb@vger.kernel.org>; Wed, 24 Nov 2021 19:20:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WxjiNUJy68gL0klua+S0wi7T6cgmLd4NS/9mBaoSKI8=;
        b=LMd1tkg6a4hm7GhfyNKHPf3nUARGuIN+9NyYKFgJW31jM54GU/qLZRtMMDGtfEgE9r
         54tDAWdZSSVBTaxnleb+WpfiBmC6pSpMNYc9ki6CgwGa6KdutSCYllGvWo2KeIpL9Xcx
         UxLbwqEvEbFjWgdHlcz0IfX+SOoR4N8VUymUI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WxjiNUJy68gL0klua+S0wi7T6cgmLd4NS/9mBaoSKI8=;
        b=KPZPz1b0W5aYyAEPSPsfzXq3ymJYTlbFYuyYBRW+ZNRK9GAJtsXyFbjkiJUYCAmwSo
         D6WMZ6H7WHbqHYOvPRhkUiySFX7WI/MIKvd5z2pg3cGhCPSI+FeTfR2t4FeuUxKhRp6E
         pagroQfP+OqGEGqp43QFInQZYZ+egy8gJwLx4QA7cDpzLlV0LIj1JsWS+HROFCaNEmEQ
         c6BUg22FiDAPDbY+4C59UXhsZI79K0Ceh6r4bD8AeX3CUUmGOZ43XL7CsVQ9b++ptxrP
         gjWh3h7EmdPWmDAa0iVbTOBIjOZaTEXivPxPbYJ2lcpzB5M0V2qUuYs5fHgAWwgIoK6B
         ezHA==
X-Gm-Message-State: AOAM531Ap4UWyFP1Sv0RcyTAzUNIsOTU1hw3EXpISimOIioZAUHj4AGV
        KsAJKI09k0FVYzmRN1wSHj6a5uHWUMCd7tsRRauHaw==
X-Google-Smtp-Source: ABdhPJyOHA6IYBcg9GhLCMMTSOi0mWjReHWBBrqjSv0Vs5V6bvDEjtmMYIaQjuWqyMXZtZTOJA7xlLfWlQVb1W0NtTM=
X-Received: by 2002:adf:ef4f:: with SMTP id c15mr3077743wrp.226.1637810453840;
 Wed, 24 Nov 2021 19:20:53 -0800 (PST)
MIME-Version: 1.0
References: <20211124231028.696982-1-pmalani@chromium.org> <20211124231028.696982-2-pmalani@chromium.org>
In-Reply-To: <20211124231028.696982-2-pmalani@chromium.org>
From:   Prashant Malani <pmalani@chromium.org>
Date:   Wed, 24 Nov 2021 19:20:42 -0800
Message-ID: <CACeCKafocHs6P=0b-yOcu2Oqzw_DX6RCzyiowngMkHV2Tgy8LA@mail.gmail.com>
Subject: Re: [PATCH 1/4] usb: typec: Add port registration notifier
To:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Cc:     wonchung@google.com, bleung@chromium.org,
        heikki.krogerus@linux.intel.com,
        Alan Stern <stern@rowland.harvard.edu>,
        Bjorn Helgaas <bhelgaas@google.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Rajat Jain <rajatja@google.com>,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>,
        Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Nov 24, 2021 at 3:11 PM Prashant Malani <pmalani@chromium.org> wrote:
>
> Introduce a blocking notifier to be called when a new Type C port gets
> registered with the connector class framework.
>
> Signed-off-by: Prashant Malani <pmalani@chromium.org>
> ---
> NOTE: typec_port_registration_register_notify() is a bit long,
> so please let me know if you have any shorter suggestions for naming
> this function.
>
>  drivers/usb/typec/class.c | 30 ++++++++++++++++++++++++++++++
>  include/linux/usb/typec.h | 13 +++++++++++++
>  2 files changed, 43 insertions(+)
>
> diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> index aeef453aa658..14b82109b0f5 100644
> --- a/drivers/usb/typec/class.c
> +++ b/drivers/usb/typec/class.c
> @@ -16,6 +16,8 @@
>  #include "bus.h"
>  #include "class.h"
>
> +static BLOCKING_NOTIFIER_HEAD(typec_port_registration_notifier);
> +
>  static DEFINE_IDA(typec_index_ida);
>
>  struct class typec_class = {
> @@ -1979,6 +1981,32 @@ void typec_port_register_altmodes(struct typec_port *port,
>  }
>  EXPORT_SYMBOL_GPL(typec_port_register_altmodes);
>
> +/**
> + *  typec_port_registration_register_notify - Register a notifier for Type C port registration.
> + *  @nb: notifier block to signal
> + *
> + *  This function allows callers to get a notification when a Type C port is registered with
> + *  the connector class.
> + */
> +int typec_port_registration_register_notify(struct notifier_block *nb)
> +{
> +       return blocking_notifier_chain_register(&typec_port_registration_notifier, nb);
> +}
> +EXPORT_SYMBOL_GPL(typec_port_registration_register_notify);
> +
> +/**
> + *  typec_port_registration_unregister_notify - Unregister a notifier for Type C port registration.
> + *  @nb: notifier block to unregister
> + *
> + *  This function allows callers to unregister notifiers which were previously registered using
> + *  typec_port_registration_register_notify().
> + */
> +int typec_port_registration_unregister_notify(struct notifier_block *nb)
> +{
> +       return blocking_notifier_chain_unregister(&typec_port_registration_notifier, nb);
> +}
> +EXPORT_SYMBOL_GPL(typec_port_registration_unregister_notify);
> +
>  /**
>   * typec_register_port - Register a USB Type-C Port
>   * @parent: Parent device
> @@ -2086,6 +2114,8 @@ struct typec_port *typec_register_port(struct device *parent,
>         if (ret)
>                 dev_warn(&port->dev, "failed to create symlinks (%d)\n", ret);
>
> +       blocking_notifier_call_chain(&typec_port_registration_notifier, 0, port);
> +
>         return port;
>  }
>  EXPORT_SYMBOL_GPL(typec_register_port);
> diff --git a/include/linux/usb/typec.h b/include/linux/usb/typec.h
> index e2e44bb1dad8..398317835f24 100644
> --- a/include/linux/usb/typec.h
> +++ b/include/linux/usb/typec.h
> @@ -3,6 +3,7 @@
>  #ifndef __LINUX_USB_TYPEC_H
>  #define __LINUX_USB_TYPEC_H
>
> +#include <linux/notifier.h>
>  #include <linux/types.h>
>
>  /* USB Type-C Specification releases */
> @@ -308,6 +309,8 @@ int typec_get_negotiated_svdm_version(struct typec_port *port);
>  #if IS_REACHABLE(CONFIG_TYPEC)
>  int typec_link_port(struct device *port);
>  void typec_unlink_port(struct device *port);
> +int typec_port_registration_register_notify(struct notifier_block *nb);
> +int typec_port_registration_unregister_notify(struct notifier_block *nb);
>  #else
>  static inline int typec_link_port(struct device *port)
>  {
> @@ -315,6 +318,16 @@ static inline int typec_link_port(struct device *port)
>  }
>
>  static inline void typec_unlink_port(struct device *port) { }
> +
> +int typec_port_registration_register_notify(struct notifier_block *nb)
> +{
> +       return 0;
> +}
> +
> +int typec_port_registration_unregister_notify(struct notifier_block *nb)
> +{
> +       return 0;
> +}
>  #endif

Oops, looks like I forgot to static inline these....

Also, probably better to return -ENODEV for these calls?

Sorry about that; I'll fix it up and send another version.

Thanks,
