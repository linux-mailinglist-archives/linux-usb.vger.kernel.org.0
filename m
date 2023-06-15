Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05A38731FC9
	for <lists+linux-usb@lfdr.de>; Thu, 15 Jun 2023 20:11:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238762AbjFOSLe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 15 Jun 2023 14:11:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235704AbjFOSLd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 15 Jun 2023 14:11:33 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7298E2964
        for <linux-usb@vger.kernel.org>; Thu, 15 Jun 2023 11:11:30 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-25c101bf7deso2607800a91.1
        for <linux-usb@vger.kernel.org>; Thu, 15 Jun 2023 11:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686852690; x=1689444690;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DJi3cCnc2qA6VU+gHOwF45LozWJ4WxOCugFiLIt6KK0=;
        b=7edQvGXJpXGAfxPgc1jNQFe7QPN0YXhx1L5+4xX9bOk38QV/xd3JIVc3YdwnxBnguX
         qCcK6VDiEyl6HgOruxjXZgKChfrH0MABQ3xeaKHfvwY4Jg1OEdu/snrxtho/ENIplk5E
         vZoMUnWWZXXfw6QGJFs5JP8jiPhWNZOxU9OUDTw4PJIxoWbxp04eTrdo7PQ7anDqCybU
         jZYhmoNzJ5ZdHSPtP62IcDyxwVuVhEUvRb4fB0yTqGW48/nYD78h01fYXApcRWre41x8
         xBIQoZv1DDsu1su4VSCj6IzZMT95/5JJE6+PdFEC2v6fFt92jY2se8QSO2IMrJ8Z4vgt
         TUvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686852690; x=1689444690;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DJi3cCnc2qA6VU+gHOwF45LozWJ4WxOCugFiLIt6KK0=;
        b=U0zWJMtbEoEQ29wFv6wdrkj/USgv9HGIP8uiA/pVcdm8/BPrX28h23EnZK53CPvrvD
         GGJUE+UHdsR//hTiWXbFWyr/LMxix1g8iwzk/gKXhjTARNvV1OUhz5UtaBT+G11Yw9VH
         hDo6y/Gz37I5hK62vsFuxQD0VrK08AOMUITuApB8O65VcUKiyRSs3XwpS6XtBSkwhSLp
         4usjObW7TjEQCg3G+L9VpVPXr/Y8qvUdrHu9r4O5kGvj02NmHUxpGJPdhAMaye8Z8c5r
         zfTtTyj3HxumbXcdaXmzXD/66HG2aDkMsT7o5oDewZnHX5JZ+oxufaPGqULnHhdBv7dA
         TqCA==
X-Gm-Message-State: AC+VfDz8b5RY0FopBLb/8L+W4/lXnnEjYXO2gzBQd+a8do2Hq0yW6Djs
        ItOVCjvLgW2ub2GS/5EPAZBmUBldIZZYGY7D3dXf4OxRlt34AtI/NhmIwA==
X-Google-Smtp-Source: ACHHUZ7TdJMcV7jKggkCi2cBsbe/G/xosY3BmPuZPnQO1p22CBqpygxGJ/8KZn+ho/nF5S+ofziY6O9lshA4erx07+c=
X-Received: by 2002:a17:90b:1b0f:b0:253:3e9d:f925 with SMTP id
 nu15-20020a17090b1b0f00b002533e9df925mr5004732pjb.31.1686852689775; Thu, 15
 Jun 2023 11:11:29 -0700 (PDT)
MIME-Version: 1.0
References: <32e22952-8574-4120-979b-ebb6af5f54b4@moroto.mountain>
In-Reply-To: <32e22952-8574-4120-979b-ebb6af5f54b4@moroto.mountain>
From:   Badhri Jagan Sridharan <badhri@google.com>
Date:   Thu, 15 Jun 2023 11:10:53 -0700
Message-ID: <CAPTae5LVtQryd=yHJo0NksRnxxP7kykw3SgKNx72MqPSyooTnA@mail.gmail.com>
Subject: Re: [PATCH] usb: gadget: udc: core: Fix double unlock in usb_gadget_activate()
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Francesco Dolcini <francesco.dolcini@toradex.com>,
        Krishna Kurapati <quic_kriskura@quicinc.com>,
        Elson Roy Serrao <quic_eserrao@quicinc.com>,
        linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Thanks Dan for posting this !

Regards,
Badhri

On Thu, Jun 15, 2023 at 8:43=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> Do not call mutex_unlock(&gadget->udc->connect_lock) twice in a row.
>
> Fixes: 286d9975a838 ("usb: gadget: udc: core: Prevent soft_connect_store(=
) race")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Badhri Jagan Sridharan <badhri@google.com>

> ---
>  drivers/usb/gadget/udc/core.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.=
c
> index 83fd1de14784..d58640a9d0ca 100644
> --- a/drivers/usb/gadget/udc/core.c
> +++ b/drivers/usb/gadget/udc/core.c
> @@ -878,8 +878,6 @@ int usb_gadget_activate(struct usb_gadget *gadget)
>          */
>         if (gadget->connected)
>                 ret =3D usb_gadget_connect_locked(gadget);
> -       mutex_unlock(&gadget->udc->connect_lock);
> -
>  unlock:
>         mutex_unlock(&gadget->udc->connect_lock);
>         trace_usb_gadget_activate(gadget, ret);
> --
> 2.39.2
>
