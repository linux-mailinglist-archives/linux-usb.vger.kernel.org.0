Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 915D46D8F65
	for <lists+linux-usb@lfdr.de>; Thu,  6 Apr 2023 08:29:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235354AbjDFG3B (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 6 Apr 2023 02:29:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235237AbjDFG3A (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 6 Apr 2023 02:29:00 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B6492127
        for <linux-usb@vger.kernel.org>; Wed,  5 Apr 2023 23:28:58 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id ix20so36665602plb.3
        for <linux-usb@vger.kernel.org>; Wed, 05 Apr 2023 23:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1680762537;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ds1vegpZJoGzt+l9VG2A5rlhA7aP7vtKqadcyhSTMi4=;
        b=UFfVN82Ds/vCiAJ+xE9Db1RY1dnrFcIBWWmNdxZx5cxNzhpca1ezKVq9g0A6Z+gwhx
         kuT3PNeU+F/aOIrmyz1jU9WZtKNGtXGHGiTdG+oOcbc+wcsNmySI8i2wJc4a4Hgyv5yz
         5UOeCvfX5fZ7xZK9pfLAaXm7Smj0P5FvZmWodwYCqksYQ7WVPB7k/mGEhlNVhJG9/L3D
         GLDjetE51tPQcTgVMEeN4Snj8RJKtTwKiwjkxjOQGfYy6vr+2qUrqCss8bYztEpka3gk
         DbFE3n3al2+U+nY9SP49sd8N1vNzKJZOdjKCb5Y2T1znDTB2Z0lWiva+d4lc4Z50NFk5
         HyPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680762537;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ds1vegpZJoGzt+l9VG2A5rlhA7aP7vtKqadcyhSTMi4=;
        b=euziVEw6BSQnYT25gaiHPsxpwcM6OuUZAg4kG7eAJz7sTVZGc3reZI+5+PuPjBSGf4
         PNNtAuFCCNKcURqiZQET8Y+aSo45Rjvu9Aia2KvN/q9FTC4Aat+bNMlOa1jzZnEUaOYn
         6zJNPQgabl+HztbbND8mwevCwZMQvAd/WBkAx0N+1cDmoFR6oOXNeDVjfDm9ob0cuC57
         Weimtnmp1AajXxCuCaSmO0OtsOvv45iGeGbkQHHlrbiHefzbMs/+2ZaaYqtobxim00vR
         5vSboyW0h/tivodZlC+j7WtNuv4RnTgu7LAtwnCHuVKAKX16AZGjY3G1xG0W1Wr6WjQL
         dgVQ==
X-Gm-Message-State: AAQBX9dXDt3xZvXDNdO/lB4chJ5qSCcsuBICB0gn07bC1jlagzXOAry6
        CYL801CRPLSaISzh2WygjDUwrILbz3eQTCEmXycD9g==
X-Google-Smtp-Source: AKy350YyToEoLgnOGqGsSQredjiBc5uLLg/U97OsTt7Q7smCyHkVd9FISwEyDZ5pcwlfBO5OATAjXUyGWBfolP0Cg6U=
X-Received: by 2002:a17:90a:aa05:b0:23d:551c:c5fb with SMTP id
 k5-20020a17090aaa0500b0023d551cc5fbmr3284823pjq.4.1680762537298; Wed, 05 Apr
 2023 23:28:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230406061905.2460827-1-badhri@google.com>
In-Reply-To: <20230406061905.2460827-1-badhri@google.com>
From:   Badhri Jagan Sridharan <badhri@google.com>
Date:   Wed, 5 Apr 2023 23:28:20 -0700
Message-ID: <CAPTae5JuYfbRin3M9AngtLouUo7T1wCETY0YrzUhwP+KTMviuA@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] usb: gadget: udc: core: Invoke usb_gadget_connect
 only when started
To:     gregkh@linuxfoundation.org, stern@rowland.harvard.edu,
        colin.i.king@gmail.com, xuetao09@huawei.com,
        quic_eserrao@quicinc.com, water.zhangjiantao@huawei.com,
        peter.chen@freescale.com, balbi@ti.com
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-15.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
        USER_IN_DEF_SPF_WL autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Apologies resent V1 again instead of V2. Have sent V2 for real.


On Wed, Apr 5, 2023 at 11:19=E2=80=AFPM Badhri Jagan Sridharan
<badhri@google.com> wrote:
>
> usb_udc_connect_control does not check to see if the udc
> has already been started. This causes gadget->ops->pullup
> to be called through usb_gadget_connect when invoked
> from usb_udc_vbus_handler even before usb_gadget_udc_start
> is called. Guard this by checking for udc->started in
> usb_udc_connect_control before invoking usb_gadget_connect.
>
> Guarding udc_connect_control, udc->started and udc->vbus
> with its own mutex as usb_udc_connect_control_locked
> can be simulataneously invoked from different code paths.
>
> Cc: stable@vger.kernel.org
>
> Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
> Fixes: 628ef0d273a6 ("usb: udc: add usb_udc_vbus_handler")
> ---
>  drivers/usb/gadget/udc/core.c | 20 ++++++++++++++++----
>  1 file changed, 16 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.=
c
> index 3dcbba739db6..890f92cb6344 100644
> --- a/drivers/usb/gadget/udc/core.c
> +++ b/drivers/usb/gadget/udc/core.c
> @@ -56,6 +56,8 @@ static LIST_HEAD(udc_list);
>  /* Protects udc_list, udc->driver, driver->is_bound, and related calls *=
/
>  static DEFINE_MUTEX(udc_lock);
>
> +/* Protects udc->vbus, udc-started and udc_connect_control_locked */
> +static DEFINE_MUTEX(udc_connect_control_lock);
>  /* ---------------------------------------------------------------------=
---- */
>
>  /**
> @@ -1078,9 +1080,10 @@ EXPORT_SYMBOL_GPL(usb_gadget_set_state);
>
>  /* ---------------------------------------------------------------------=
---- */
>
> -static void usb_udc_connect_control(struct usb_udc *udc)
> +/* Acquire udc_connect_control_lock before calling this function. */
> +static void usb_udc_connect_control_locked(struct usb_udc *udc)
>  {
> -       if (udc->vbus)
> +       if (udc->vbus && udc->started)
>                 usb_gadget_connect(udc->gadget);
>         else
>                 usb_gadget_disconnect(udc->gadget);
> @@ -1099,10 +1102,12 @@ void usb_udc_vbus_handler(struct usb_gadget *gadg=
et, bool status)
>  {
>         struct usb_udc *udc =3D gadget->udc;
>
> +       mutex_lock(&udc_connect_control_lock);
>         if (udc) {
>                 udc->vbus =3D status;
> -               usb_udc_connect_control(udc);
> +               usb_udc_connect_control_locked(udc);
>         }
> +       mutex_unlock(&udc_connect_control_lock);
>  }
>  EXPORT_SYMBOL_GPL(usb_udc_vbus_handler);
>
> @@ -1140,14 +1145,18 @@ static inline int usb_gadget_udc_start(struct usb=
_udc *udc)
>  {
>         int ret;
>
> +       mutex_lock(&udc_connect_control_lock);
>         if (udc->started) {
>                 dev_err(&udc->dev, "UDC had already started\n");
> +               mutex_unlock(&udc_connect_control_lock);
>                 return -EBUSY;
>         }
>
>         ret =3D udc->gadget->ops->udc_start(udc->gadget, udc->driver);
>         if (!ret)
>                 udc->started =3D true;
> +       usb_udc_connect_control_locked(udc);
> +       mutex_unlock(&udc_connect_control_lock);
>
>         return ret;
>  }
> @@ -1165,13 +1174,17 @@ static inline int usb_gadget_udc_start(struct usb=
_udc *udc)
>   */
>  static inline void usb_gadget_udc_stop(struct usb_udc *udc)
>  {
> +       mutex_lock(&udc_connect_control_lock);
>         if (!udc->started) {
>                 dev_err(&udc->dev, "UDC had already stopped\n");
> +               mutex_unlock(&udc_connect_control_lock);
>                 return;
>         }
>
>         udc->gadget->ops->udc_stop(udc->gadget);
>         udc->started =3D false;
> +       usb_udc_connect_control_locked(udc);
> +       mutex_unlock(&udc_connect_control_lock);
>  }
>
>  /**
> @@ -1527,7 +1540,6 @@ static int gadget_bind_driver(struct device *dev)
>         if (ret)
>                 goto err_start;
>         usb_gadget_enable_async_callbacks(udc);
> -       usb_udc_connect_control(udc);
>
>         kobject_uevent(&udc->dev.kobj, KOBJ_CHANGE);
>         return 0;
>
> base-commit: d629c0e221cd99198b843d8351a0a9bfec6c0423
> --
> 2.40.0.348.gf938b09366-goog
>
