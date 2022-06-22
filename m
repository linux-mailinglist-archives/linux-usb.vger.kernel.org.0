Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B8AAE5552E1
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jun 2022 19:52:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377276AbiFVRwl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Jun 2022 13:52:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359181AbiFVRwk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 22 Jun 2022 13:52:40 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03D9135DEC
        for <linux-usb@vger.kernel.org>; Wed, 22 Jun 2022 10:52:38 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id t1so31485185ybd.2
        for <linux-usb@vger.kernel.org>; Wed, 22 Jun 2022 10:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fUSmK7RJ4lRM7Yk3nFFgboloKX+Bx0NQLAzjfaTQ4dE=;
        b=STXFwg1mfBWfKxKHCbKBpyd0eW/G6gEkq9668fjCDL/iGMPvKtfKvYJyqyEhEwixak
         kYRwtypdaZYxHUnduLk9aIAL9Vj0jJPwUTAiMBtvHQx0rp9UpqU5/dHF6qyaQByehRIV
         PdtFoiFiWq32cVeHJ4A7EO6VsPgKncenjRIII=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fUSmK7RJ4lRM7Yk3nFFgboloKX+Bx0NQLAzjfaTQ4dE=;
        b=jdtwhYTqQg1qGF90a/JUsnPN2DenXL2GczfdxcCROz0hmM1G+Db2tgJb6ln6Wa4ipF
         +kucckPqqlIooPt+aKbQuvKQMjxSJxwZ380fVbLZXTGJYCYATC0dWRYSBtBic70FIzMx
         VTAuvGZ476hvvO8AIE4ueKJVAc9k8ZxELeqktUMO78ct8Kzh5MjLFw/z/IK2JKSp7xGw
         QqtXeYa8RyeDCRl39tq9eTMIiVs2G17xm7fze+R/FGVNElYX4udbS5GQQZRbVfYemWEI
         7SLq/8zv/X4Bf3dv5T8zsQwqHbEEmAAtrWYHsyXsE5vV8UEBy2sLr2PAP1yzcJ6gt34+
         CEcg==
X-Gm-Message-State: AJIora9NT8R13GTFrIyWPLbj759A0sEBOACDIQAxc6Y/d+CtSP3vlBeg
        e6wA+/e9KxHLCK7qBb+7R2bv3ScSFIbULECA/OUQVw==
X-Google-Smtp-Source: AGRyM1uyljzuoQBj9S63poZWW7UCRBrOVn0dHy9ufWgOBUKqN0s1gOhcOj48rq/eqEA/zMp2QRFHFs2auD5Rhi+jzn4=
X-Received: by 2002:a5b:8d1:0:b0:668:c6ca:7571 with SMTP id
 w17-20020a5b08d1000000b00668c6ca7571mr4869130ybq.445.1655920358190; Wed, 22
 Jun 2022 10:52:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220615172129.1314056-1-pmalani@chromium.org>
 <CACeCKaetgayTS+yX0cuNiK7j6Yqd4o2ziX6nCoGTt64A3jFT=g@mail.gmail.com>
 <YrHE9KrF0HG9rVi/@kroah.com> <8f0501c5-84f2-10f1-ae06-4b3936c50b12@linaro.org>
 <YrMxFeMc0tk/K1qL@kroah.com>
In-Reply-To: <YrMxFeMc0tk/K1qL@kroah.com>
From:   Prashant Malani <pmalani@chromium.org>
Date:   Wed, 22 Jun 2022 10:52:27 -0700
Message-ID: <CACeCKac0missZ84EzgHK0QJpmYUSqRaOtEJLdRs+dejybrp0cw@mail.gmail.com>
Subject: Re: [PATCH v4 0/7] usb: typec: Introduce typec-switch binding
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        bleung@chromium.org, swboyd@chromium.org,
        heikki.krogerus@linux.intel.com,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Maxime Ripard <maxime@cerno.tech>,
        Neil Armstrong <narmstrong@baylibre.com>,
        =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= 
        <nfraprado@collabora.com>, Pin-Yen Lin <treapking@chromium.org>,
        Robert Foss <robert.foss@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Xin Ji <xji@analogixsemi.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jun 22, 2022 at 8:11 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Wed, Jun 22, 2022 at 04:53:40PM +0200, Krzysztof Kozlowski wrote:
> > On 21/06/2022 15:17, Greg Kroah-Hartman wrote:
> > > On Wed, Jun 15, 2022 at 11:13:33AM -0700, Prashant Malani wrote:
> > >> I should add:
> > >>
> > >> Series submission suggestions (of course, open to better suggestions too):
> > >> - Patches 1-3 can go through the USB repo.
> > >
> > > I will take patches 1 and 2 now.
> > >
> > > seems the others need reworks or acks from the DT people.
> >
> > I just gave for patch 3 and before for 4, so you can grab these as well.
>
> They are gone from my queue, a resend with that ack would be good so
> that I can pick it up easier.

Thanks Greg. I've sent out v5 [1] which has the Reviewed-by tags from
Krzysztof.

[1] https://lore.kernel.org/linux-usb/20220622173605.1168416-1-pmalani@chromium.org/

Best regards,

-Prashant
