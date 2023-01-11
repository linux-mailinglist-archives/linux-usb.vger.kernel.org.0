Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 478CE6651E8
	for <lists+linux-usb@lfdr.de>; Wed, 11 Jan 2023 03:35:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235274AbjAKCe6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 10 Jan 2023 21:34:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235786AbjAKCed (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 10 Jan 2023 21:34:33 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37DEA14D24
        for <linux-usb@vger.kernel.org>; Tue, 10 Jan 2023 18:33:36 -0800 (PST)
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id C78833F5E1
        for <linux-usb@vger.kernel.org>; Wed, 11 Jan 2023 02:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1673404413;
        bh=G7nMTKlWPzsJeiptQPccA7hZCccjgxjT288CIm/kx5Q=;
        h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
         To:Cc:Content-Type;
        b=C8Q+EGCjj66Fyox946rgmzOVjXkGdu70DvZlbTQ9u2jIDlNDdyu5zhHNRB5I4ZMvM
         84wiXA78bcOQrMNCwfL49lds09/7j2YBE/fFSQKufQeS8cKjJZYIm7re91xXtSIj/h
         1alTm3pyaAVDGpwRRoVhBmh+N0hDzWYHzcfVXhk+e6Z9WAthOLMZeo1InkF+lyCVYE
         n/y2EbaBw5pLFm4k4ThLrUjwm8QYTLnrOei44NTX6OqzT0tEEjW5dlNdpok4J5TKjy
         1I0F0SpjJLeyU9NNHDr4zZJ9M+mYB9YSSKuNRomSFmB92l8i3JjvGQrI0cCGKKK/ci
         AZhqwf4vQR00Q==
Received: by mail-pg1-f200.google.com with SMTP id w185-20020a6382c2000000b004b1fcf39c18so3896967pgd.13
        for <linux-usb@vger.kernel.org>; Tue, 10 Jan 2023 18:33:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G7nMTKlWPzsJeiptQPccA7hZCccjgxjT288CIm/kx5Q=;
        b=G3S9dWm1hBDJ2dNkh2E+AM473FY300CD0+DrBQiLnGRT9bDcMyL6KwHSl9ftVVzrU+
         0s5gdqiI9JUi14UKoccim2FgMwh2YqzfWWrW7uHCTzC6/dAAZCjgO9gLTjJyYBVrVKnf
         UeOAC53yx/2uvj485wYUdvsCt5vdLLgaB0FIQdiCiYW5JI2OGeGr6GZCvnqrlhFg67Ok
         /hjlFy3GRKLd2eZrHu/CH6XHGPrQnG2LIC3+cQCts5rNuPOYUnK/XHT8lVuw1OqYvuhl
         h4uaIeVGxbSugsPO0FYKw0UjNMjY92dvnN21+XT5PQndNRLeo4Y88+nkujTvuIYVuS04
         kOdA==
X-Gm-Message-State: AFqh2kqbTmN33B1YAZ79eGzJ0noPMYsDXnTAyCR1EKB+aCOxZDRvIPG8
        aJ4frytMAgzbQ4Sez/yXPF5/OLbyC0CzmgXzBpXRBvEhVwxyWcM+Uv+wRKa1aAKvc38t5bhJZ06
        K8linxumxX3VViX0qMVnNvuULZDc0pQ9B/3j+DeR4Krhqi82yLFsXwA==
X-Received: by 2002:a17:903:250:b0:192:c188:70c9 with SMTP id j16-20020a170903025000b00192c18870c9mr2221280plh.67.1673404411955;
        Tue, 10 Jan 2023 18:33:31 -0800 (PST)
X-Google-Smtp-Source: AMrXdXt3ySzQH8MoKp2TnS0icCt1hCqE8mwE7lPxZ53EB+SWW7himVr6K42jA37t3j1E1Bo22rW+oijFASRNibTXqSY=
X-Received: by 2002:a17:903:250:b0:192:c188:70c9 with SMTP id
 j16-20020a170903025000b00192c18870c9mr2221279plh.67.1673404411546; Tue, 10
 Jan 2023 18:33:31 -0800 (PST)
MIME-Version: 1.0
References: <20230110081938.30308-1-yangyinglu@loongson.cn>
In-Reply-To: <20230110081938.30308-1-yangyinglu@loongson.cn>
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
Date:   Wed, 11 Jan 2023 10:33:20 +0800
Message-ID: <CAAd53p6eUNJf7aNkiXcTKAfhL_cM1Ki7JnW7s4oP7BeFQkP6ag@mail.gmail.com>
Subject: Re: [PATCH v1] usb: handle warm-reset port requests on hub_init
To:     yangyinglu <yangyinglu@loongson.cn>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Mathias Nyman <mathias.nyman@linux.intel.com>,
        Douglas Anderson <dianders@chromium.org>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Bhuvanesh Surachari <Bhuvanesh_Surachari@mentor.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Ray Chi <raychi@google.com>,
        Michael Grzeschik <m.grzeschik@pengutronix.de>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yinbo Zhu <zhuyinbo@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi yangyinglu,

On Tue, Jan 10, 2023 at 4:20 PM yangyinglu <yangyinglu@loongson.cn> wrote:
>
> USB-C storage device not detected on USB 3.0 host when
> plugged in after boot, so need to warm-reset port

Is it possible to enable USB dyndbg, plug a USB 3.0 device, then paste
the relevant dmesg here? Thanks!

Kai-Heng

>
> Signed-off-by: yangyinglu <yangyinglu@loongson.cn>
> ---
>  drivers/usb/core/hub.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> index 77e73fc8d673..bd4496b80c2d 100644
> --- a/drivers/usb/core/hub.c
> +++ b/drivers/usb/core/hub.c
> @@ -1159,7 +1159,7 @@ static void hub_activate(struct usb_hub *hub, enum hub_activation_type type)
>                 }
>
>                 /* Make sure a warm-reset request is handled by port_event */
> -               if (type == HUB_RESUME &&
> +               if ((type == HUB_RESUME || type == HUB_INIT2) &&
>                     hub_port_warm_reset_required(hub, port1, portstatus))
>                         set_bit(port1, hub->event_bits);
>
> --
> 2.20.1
>
