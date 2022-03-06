Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D5BD4CED3A
	for <lists+linux-usb@lfdr.de>; Sun,  6 Mar 2022 19:40:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233040AbiCFSky (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 6 Mar 2022 13:40:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230078AbiCFSkv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 6 Mar 2022 13:40:51 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5F8029822
        for <linux-usb@vger.kernel.org>; Sun,  6 Mar 2022 10:39:58 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id h13so4932845ede.5
        for <linux-usb@vger.kernel.org>; Sun, 06 Mar 2022 10:39:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PJdT0uYnIkrEHo7bQMb01yqEAfgHuebjZMfybZUKXYE=;
        b=B/5f58vo38KUye6rmtbHQBaKoggxbOmSU0CQJSWqOAHyy9t315nFmnDuBmDN1ozPVT
         JuhWsDbopsXEFZIL+xUPJBnH2WPNrq38E6lEDXRBn7DEce6AOKlLN/VYyRVTFYlSh6Rv
         nzjiRiQM0rz62DZOG2Ynfyu+9z8r/oClL3gXo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PJdT0uYnIkrEHo7bQMb01yqEAfgHuebjZMfybZUKXYE=;
        b=pkaExKYrk93Ml8hZsX2mfWctVk7Fi+lXud3HW17HwODQe0rElQImPyuaUpORSvet3M
         tsvExle65ulvsPMRUPhk6X23EDAg67Hu+WBAeLZgNxjL4Gg3pxF5cmW0wXYcqXglUFeY
         629wxm78SF/fHcSVz/6yYuq6jcGsqXZdQ1/Jah40EMqtf7mOPid6cv2WnDX9cTimaB52
         LE0IUmaOCf2vF5Kbg+ov0WHe3qgX8XY3yXAQfxMf1hCwb6DIuYGpezYmQPzECFsJks0y
         4pjrcYFsTd4UTkkorsZv3G2R2HDX2VwU3xNZ+SDpee8A9pl/HL97t/e2Z8jy347bmsVC
         RyeQ==
X-Gm-Message-State: AOAM533r+kSf3IVobz9pFJZ95xqXetXWPZ/jtVkcMEMEMU6z8TU4GSQV
        lgjUjUH3pB5f2HWwWc571vMBh/bM+iq/oKUcvTU=
X-Google-Smtp-Source: ABdhPJwEG5X8nyeZCkCC5UBDSlCl57OEbjfg77uPBHsIgKj3O+sN5f0A9MibT9gwHTdGza8wI19igA==
X-Received: by 2002:a05:6402:6da:b0:3fd:cacb:f4b2 with SMTP id n26-20020a05640206da00b003fdcacbf4b2mr7814192edy.332.1646591997156;
        Sun, 06 Mar 2022 10:39:57 -0800 (PST)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com. [209.85.218.43])
        by smtp.gmail.com with ESMTPSA id fx13-20020a170906b74d00b006da9e406786sm3584410ejb.189.2022.03.06.10.39.55
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Mar 2022 10:39:56 -0800 (PST)
Received: by mail-ej1-f43.google.com with SMTP id qx21so27553907ejb.13
        for <linux-usb@vger.kernel.org>; Sun, 06 Mar 2022 10:39:55 -0800 (PST)
X-Received: by 2002:a05:6512:6c6:b0:447:ca34:b157 with SMTP id
 u6-20020a05651206c600b00447ca34b157mr5678695lff.435.1646591984685; Sun, 06
 Mar 2022 10:39:44 -0800 (PST)
MIME-Version: 1.0
References: <20220306175034.3084609-1-jakobkoschel@gmail.com> <20220306175034.3084609-2-jakobkoschel@gmail.com>
In-Reply-To: <20220306175034.3084609-2-jakobkoschel@gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun, 6 Mar 2022 10:39:28 -0800
X-Gmail-Original-Message-ID: <CAHk-=wheru6rEfzC2wuO9k03PRF6s3nhxryCAnwR5bzKwPV2ww@mail.gmail.com>
Message-ID: <CAHk-=wheru6rEfzC2wuO9k03PRF6s3nhxryCAnwR5bzKwPV2ww@mail.gmail.com>
Subject: Re: [PATCH 01/26] usb: gadget: fsl: remove usage of list iterator
 past the loop body
To:     Jakob Koschel <jakobkoschel@gmail.com>
Cc:     Greg Kroah-Hartman <greg@kroah.com>, linux-kernel@vger.kernel.org,
        Felipe Balbi <balbi@kernel.org>, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Cristian Birsan <cristian.birsan@microchip.com>,
        Al Cooper <alcooperx@gmail.com>, Li Yang <leoyang.li@nxp.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Michal Simek <michal.simek@xilinx.com>,
        "open list:USB GADGET/PERIPHERAL SUBSYSTEM" 
        <linux-usb@vger.kernel.org>, Mike Rapoport <rppt@kernel.org>,
        Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
        Cristiano Giuffrida <c.giuffrida@vu.nl>,
        "Bos, H.J." <h.j.bos@vu.nl>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Mar 6, 2022 at 9:51 AM Jakob Koschel <jakobkoschel@gmail.com> wrote:
>
>         /* make sure it's actually queued on this endpoint */
> -       list_for_each_entry(req, &ep->queue, queue) {
> -               if (&req->req == _req)
> +       list_for_each_entry(tmp, &ep->queue, queue) {
> +               if (&tmp->req == _req) {
> +                       req = tmp;
>                         break;
> +               }
>         }

Honestly, I think many (most?) of these would be a lot cleaner as

        list_for_each_entry(tmp, &ep->queue, queue) {
                if (&tmp->req != _req)
                        continue;
                req = tmp;
                break;
        }

and in fact maybe that 'tmp' would be better named 'iter' or similar
(maybe 'pos', which is what the list.h macros themselves use for the
iterator naming), just from a naming standpoint.

Because it's not really some temporary variable, it has a real use.

           Linus
