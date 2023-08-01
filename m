Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E832576B603
	for <lists+linux-usb@lfdr.de>; Tue,  1 Aug 2023 15:37:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234348AbjHANhd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Aug 2023 09:37:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232499AbjHANhc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 1 Aug 2023 09:37:32 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54C3E10DB
        for <linux-usb@vger.kernel.org>; Tue,  1 Aug 2023 06:37:31 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-55c993e26ffso3383786a12.0
        for <linux-usb@vger.kernel.org>; Tue, 01 Aug 2023 06:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690897051; x=1691501851;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cowyey8Lk1VTMQ+gKOmVt3V3o00gzV8VCGl1nB1Gx0w=;
        b=DnBTYhXyItZJj7bR2iH8VoNe5WZ0XpnU81ARCcznt4EDZapYATeNcAykhGVPVOVlDS
         2v76ZEpaInAlvemfTtjZL7I/tMEVAG00aM2FNanjCiTDpLbU++opXKUy8unvmVaT3+FR
         wk2D8IsakGcmxKm+W/gXKcYr2WmlsjAAc1i9Mo2Rq2X7nIaYtSobJydybKV0GwzyklGs
         xcyYTk3VlFV791PuSngMu4TpvC21Oo+XU7TpghulF4m35bhgcFhc1Bb0g4Gf0oJvufFg
         owbqeMEGLyGQ1UcjPZy2d1JukLPax8vbRYUxGFdni2BbeG/nbpZyYP6ozamxj6oYRCLd
         yBqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690897051; x=1691501851;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cowyey8Lk1VTMQ+gKOmVt3V3o00gzV8VCGl1nB1Gx0w=;
        b=kx998Po5mN/8ZoZtvLKqNwAlCcoYSjIT+S/pAAFbwP2fqEjjCZ+yQrX3Fm2LwgZUN/
         un4FkBBmNw3x2rmDnvMpMozwijX2A6xb+DMy/Ykanf3zJgJaP3lXCXWFoMWP8IuwYLal
         rv6yXa7F2RzdeOfWwReXB+juigWlw36Me3rRFqz3h4yzlaaMNicj2L3ogXhPjphoCNzD
         8hYpid2B0t14kkWOTQNvU6CSA/4mALz8Ca1qSDbjoR2wsPJKIK87CfDQ18Lpwrlf1o9q
         hvpbukglKwmjQoARywIIiBn0zSZgp46am4DefvEkjC2hW+eV2iDf+cgRqsykrba6RS20
         p2Yw==
X-Gm-Message-State: ABy/qLa818R/KB5ATRXszgFYcVECm6icUvO/Nn+8vhEXMM06jKe24H3Z
        01DyaWiTCXYPZHtXiIfiPJLlery65sM2nOoNdX/QBA==
X-Google-Smtp-Source: APBJJlFOeuibw2GoIe4yZQMmf5Aw6/U4iCpgO4XXJ+rPryDpDUAuXs9zFXaqijU07d6O9nEeUDVUJzFWSuGZOjYLOZQ=
X-Received: by 2002:a17:90a:1302:b0:268:c6f:3b3d with SMTP id
 h2-20020a17090a130200b002680c6f3b3dmr11191968pja.4.1690897050565; Tue, 01 Aug
 2023 06:37:30 -0700 (PDT)
MIME-Version: 1.0
References: <48b2f1f1-0639-46bf-bbfc-98cb05a24914@rowland.harvard.edu>
In-Reply-To: <48b2f1f1-0639-46bf-bbfc-98cb05a24914@rowland.harvard.edu>
From:   Badhri Jagan Sridharan <badhri@google.com>
Date:   Tue, 1 Aug 2023 06:36:53 -0700
Message-ID: <CAPTae5K4T0yd4ZOQ8zrB6dWgntWH_Q+RKwePuFaFK5fuOg7-PA@mail.gmail.com>
Subject: Re: [PATCH] USB: Gadget: core: Help prevent panic during UVC unconfigure
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Avichal Rakesh <arakesh@google.com>,
        USB mailing list <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Alan,

On Sat, Jul 29, 2023 at 7:59=E2=80=AFAM Alan Stern <stern@rowland.harvard.e=
du> wrote:
>
> Avichal Rakesh reported a kernel panic that occurred when the UVC
> gadget driver was removed from a gadget's configuration.  The panic
> involves a somewhat complicated interaction between the kernel driver
> and a userspace component (as described in the Link tag below), but
> the analysis did make one thing clear: The Gadget core should
> accomodate gadget drivers calling usb_gadget_deactivate() as part of
> their unbind procedure.
>
> Currently this doesn't work.  gadget_unbind_driver() calls
> driver->unbind() while holding the udc->connect_lock mutex, and
> usb_gadget_deactivate() attempts to acquire that mutex, which will
> result in a deadlock.
>
> The simple fix is for gadget_unbind_driver() to release the mutex when
> invoking the ->unbind() callback.  There is no particular reason for
> it to be holding the mutex at that time, and the mutex isn't held
> while the ->bind() callback is invoked.  So we'll drop the mutex
> before performing the unbind callback and reacquire it afterward.
>
> We'll also add a couple of comments to usb_gadget_activate() and
> usb_gadget_deactivate().  Because they run in process context they
> must not be called from a gadget driver's ->disconnect() callback,
> which (according to the kerneldoc for struct usb_gadget_driver in
> include/linux/usb/gadget.h) may run in interrupt context.  This may
> help prevent similar bugs from arising in the future.
>
> Reported-and-tested-by: Avichal Rakesh <arakesh@google.com>
> Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
> Fixes: 286d9975a838 ("usb: gadget: udc: core: Prevent soft_connect_store(=
) race")
> Link: https://lore.kernel.org/linux-usb/4d7aa3f4-22d9-9f5a-3d70-1bd7148ff=
4ba@google.com/
> Cc: Badhri Jagan Sridharan <badhri@google.com>
> Cc: <stable@vger.kernel.org>
>
> ---
>
>  drivers/usb/gadget/udc/core.c |    9 +++++++++
>  1 file changed, 9 insertions(+)
>
> Index: usb-devel/drivers/usb/gadget/udc/core.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- usb-devel.orig/drivers/usb/gadget/udc/core.c
> +++ usb-devel/drivers/usb/gadget/udc/core.c
> @@ -822,6 +822,9 @@ EXPORT_SYMBOL_GPL(usb_gadget_disconnect)
>   * usb_gadget_activate() is called.  For example, user mode components m=
ay
>   * need to be activated before the system can talk to hosts.
>   *
> + * This routine may sleep; it must not be called in interrupt context
> + * (such as from within a gadget driver's disconnect() callback).
> + *
>   * Returns zero on success, else negative errno.
>   */
>  int usb_gadget_deactivate(struct usb_gadget *gadget)
> @@ -860,6 +863,8 @@ EXPORT_SYMBOL_GPL(usb_gadget_deactivate)
>   * This routine activates gadget which was previously deactivated with
>   * usb_gadget_deactivate() call. It calls usb_gadget_connect() if needed=
.
>   *
> + * This routine may sleep; it must not be called in interrupt context.
> + *
>   * Returns zero on success, else negative errno.
>   */
>  int usb_gadget_activate(struct usb_gadget *gadget)
> @@ -1639,7 +1644,11 @@ static void gadget_unbind_driver(struct
>         usb_gadget_disable_async_callbacks(udc);
>         if (gadget->irq)
>                 synchronize_irq(gadget->irq);
> +       mutex_unlock(&udc->connect_lock);
> +

In my humble opinion, this should be OK.
I was wondering what would happen if soft_connect_store() is invoked
right after the udc->connect_lock is dropped. One of your previous
patches(1016fc0c096c USB: gadget: Fix obscure lockdep violation for
udc_mutex) already prevents this race by making soft_connect_store()
acquire device_lock(&udc->gadget->dev); and hence avoids the race.

Thanks,
Badhri


>         udc->driver->unbind(gadget);
> +
> +       mutex_lock(&udc->connect_lock);
>         usb_gadget_udc_stop_locked(udc);
>         mutex_unlock(&udc->connect_lock);
>
