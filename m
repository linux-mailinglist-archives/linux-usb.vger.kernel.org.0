Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1CFF7562701
	for <lists+linux-usb@lfdr.de>; Fri,  1 Jul 2022 01:27:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231455AbiF3XVu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 30 Jun 2022 19:21:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230199AbiF3XVt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 30 Jun 2022 19:21:49 -0400
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9290C41610
        for <linux-usb@vger.kernel.org>; Thu, 30 Jun 2022 16:21:41 -0700 (PDT)
Received: by mail-ot1-x32b.google.com with SMTP id l9-20020a056830268900b006054381dd35so575587otu.4
        for <linux-usb@vger.kernel.org>; Thu, 30 Jun 2022 16:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=kUR5Qxlkv2VG+1nVFyFj0M5xEGNTEOVvRQq3OJdVQgs=;
        b=PSntTRcqPoByfC6Hz4lzpHn3LJzLyjZ6J9v2Gw/9CwqDwUG5K5pYjyGKE60IUpqemz
         csOfaY/EhvtPQSCBjmwtt0xkC+vziMex47gWhtn8+LjQKq3z+dOARW9sQ4F9QC0LZsCz
         vX8ShPn0VqsbDj01CzXSySigIXkRcShlNs8jk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=kUR5Qxlkv2VG+1nVFyFj0M5xEGNTEOVvRQq3OJdVQgs=;
        b=uEvZ7ss7hxQPOes5b/pRgcp8yIOIGTu6c0I4IWiOOhTw9EgXdzHUB/owYOPDnA8pXE
         SYQ7scboPJ196gIHall+c8ltLTUqtuARcNGF75DOFKR8GOO7Rd2MieGLxL8AZbZryNLM
         NjVV29WS+JOrQyIrBOC5rOcvue2OmKC9N9mDIGvVtMaNeFoU5Le7H4W84Ubmbhrktj+s
         A+LPEE1n8TtvnOw5UGSelJbE/UzqUduLeeNDlBrqJmcWIYMT/IjAZ6V5cxwEeoQEb4wR
         syH2sNCW7gtQY2oZBybY6jqjMGwvDwhbsZrx2gcnLzOrQFJF+IYZXsWAa07sjdK2ab5Y
         JCmg==
X-Gm-Message-State: AJIora9nQXnp4+cagM9JI2E3Sl+52c21/pMJtkhjNReKk50CQtot84s2
        eBczPBdDEOJFZRzC+3jkZwUqidIwlQJs88k2Q8WTTw==
X-Google-Smtp-Source: AGRyM1vqO13MJJ6cDRR/NbBgbmt0dA/vGMSsOaDTCVXU7xFDY+OyANJR8RR8KiHUFljvGHszFB+vN6QObK5feiOxPBY=
X-Received: by 2002:a9d:6484:0:b0:60b:eb0b:4054 with SMTP id
 g4-20020a9d6484000000b0060beb0b4054mr5246393otl.159.1656631300928; Thu, 30
 Jun 2022 16:21:40 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 30 Jun 2022 16:21:40 -0700
MIME-Version: 1.0
In-Reply-To: <CACeCKafzB0wW_B2TOEWywLMyB+UhYCpXYDVBV=UbyxBiGnv1Rw@mail.gmail.com>
References: <20220622173605.1168416-1-pmalani@chromium.org>
 <20220622173605.1168416-6-pmalani@chromium.org> <CAE-0n517BB8YbN5AZG6M3ZrZGOJDV=+t0R9d8wD+gVqO1aD1Xg@mail.gmail.com>
 <CACeCKafR8hFke_tc2=1VGDNF-CFrZoAG1aUKuxGJG-6pd37hbg@mail.gmail.com>
 <CAE-0n50XbO5Wu4-429Ao05A4QrbSXoi1wBjTpGFjKm3pZj1Ybg@mail.gmail.com> <CACeCKafzB0wW_B2TOEWywLMyB+UhYCpXYDVBV=UbyxBiGnv1Rw@mail.gmail.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Thu, 30 Jun 2022 16:21:40 -0700
Message-ID: <CAE-0n50Akd8QikGhaAQgxLkJBhE-7KQf5aJ_P2ajOmCjLk555g@mail.gmail.com>
Subject: Re: [PATCH v5 5/9] drm/bridge: anx7625: Add typec_mux_set callback function
To:     Prashant Malani <pmalani@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        bleung@chromium.org, heikki.krogerus@linux.intel.com,
        Pin-Yen Lin <treapking@chromium.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        =?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= 
        <nfraprado@collabora.com>, Allen Chen <allen.chen@ite.com.tw>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Maxime Ripard <maxime@cerno.tech>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Xin Ji <xji@analogixsemi.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Quoting Prashant Malani (2022-06-28 13:56:22)
> On Tue, Jun 28, 2022 at 1:40 PM Stephen Boyd <swboyd@chromium.org> wrote:
> >
> > I suppose none of those things matter though as long as there is some
> > typec switch registered here so that the driver can be informed of the
> > pin assignment. Is it right that the "mode-switch" property is only
> > required in DT if this device is going to control the mode of the
> > connector, i.e. USB+DP, or just DP? Where this device can't do that
> > because it doesn't support only DP.
>
> If the anx7625 is used just to route all lanes from 1 usb-c-connector (i.e
> the USB+DP case), a mode-switch wouldn't be of much use, since one
> would also route the CC lines to the built-in PD controller; so it will
> already have knowledge of what mode the switch is in.
>
> The mode-switch is likely only relevant for this hardware configuration(
> it's "DP only" in the sense that the USB pins to the SoC never go anywhere).
> One only has 2 SS lanes each (from each usb-c-connector).
>
> Since there is no CC-line, the anx7625 needs to know which one has DP
> enabled on it.

Can the CC line be "captured" and not actually sent to the anx7625? I
imagine if that is possible, maybe the CC lines would go to some
micro-controller or something that did more typec management things and
then the anx7625 driver would need to do software control of the mode
and orientation control.
