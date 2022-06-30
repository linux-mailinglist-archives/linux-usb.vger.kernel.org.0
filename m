Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 064E55620ED
	for <lists+linux-usb@lfdr.de>; Thu, 30 Jun 2022 19:11:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235344AbiF3RKr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 30 Jun 2022 13:10:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234431AbiF3RKq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 30 Jun 2022 13:10:46 -0400
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D23623C4AD
        for <linux-usb@vger.kernel.org>; Thu, 30 Jun 2022 10:10:44 -0700 (PDT)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-3176b6ed923so185575917b3.11
        for <linux-usb@vger.kernel.org>; Thu, 30 Jun 2022 10:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=C4tyH3Wyg1tODv7Sm2smKsBoDS+J8nqhwGQaq6vu3uY=;
        b=gnYGD2jS1FIJGGpq0jD3UITkms56aodG5VSVUw4KGb2NOASUoMBZF4GAF2pCZD4yuT
         1BUfIMSa7UwkVNInhHWxVQsdUY45IwPorOfEp3ZMwrgvpq7Eq/wAAm816woi+NAnVzkO
         puOGIsOCuaPz5ZUYu6Y4EcKmJFWfdgBhBGv2w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=C4tyH3Wyg1tODv7Sm2smKsBoDS+J8nqhwGQaq6vu3uY=;
        b=YgEB9oYgBz2aQyqOlk3zu4CLO/lLdka3WsL0JIdyxw/dtDkDmH8YFtWb21zly0VwwH
         RWtB3Pds8LP21a3rIPV89aGUOi3EMqs0ASQr1QSPDvEh0EbjkidIZ1374Y5nchs/PYJi
         iWoA+a30UMOotFQErnsLvn0ndxh42c8CVB2kpvhUL6Z7w6ecaDhGBOlc+e5SFJgaOv5b
         l27gzhjxZqfOHRuhdhur6SEiuVfuF6yFnI0Nfp9W5e3weDXgQXs7RLylykNatgTn6HsL
         xDosorWhcVzDAOOoxO2VU7wPvoZHm3oh7b1UU/WxBafNWQKE8LXaLykHF9c01Duma4Dq
         4olg==
X-Gm-Message-State: AJIora9miCdoT4euYXKzi4lPN0O9rpcKjSoVlk2PW+tgIqu5z6gvLLzd
        TrVLhklpD/Ts+8JfU0Qd1g84gm5GfpVDmMIQltClBQ==
X-Google-Smtp-Source: AGRyM1uMIL9QXjLW/PVKIiDg5RY+SUgQa/orAvMkYfMDivtbvx25fWOLwDlCvs4yZik4khUw0Q+DzoBnfW9oVFDgjCg=
X-Received: by 2002:a81:5745:0:b0:318:99e6:3279 with SMTP id
 l66-20020a815745000000b0031899e63279mr11262932ywb.311.1656609043950; Thu, 30
 Jun 2022 10:10:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220622173605.1168416-1-pmalani@chromium.org>
 <20220622173605.1168416-2-pmalani@chromium.org> <20220627210407.GA2905757-robh@kernel.org>
 <CACeCKackdbDZrk5fk7qyMwSdTdzyTS=m1vHPFnQOj672W=2nOA@mail.gmail.com>
 <20220628182336.GA711518-robh@kernel.org> <CAEXTbpex9nxP-nyPWvSBchAW4j3C4MZfVHTb=5X0iSLY1bSAKg@mail.gmail.com>
 <CAEXTbpf_jxK-R5aA81FCbpAH4bChA2B9+8qExZUbA7Y+Ort=Gg@mail.gmail.com>
 <CAL_Jsq+C04RXLtm6Ac85Ru3EGwJbqV_UD3_dDWVrKvFSvdm7Ng@mail.gmail.com>
 <CAE-0n53ers881LOTCEmKDDxJQt+5vvXJSURs=o6TcOiR5m_EAw@mail.gmail.com>
 <CACeCKacJnnk4_dXEX7XiboOWrYpfAcE=ukP63agVAYUxWR9Vbg@mail.gmail.com> <CAE-0n50jm1ovUcBC0GCQJszk-4u+0vDQtAxHxsu9SLyn_CkQuQ@mail.gmail.com>
In-Reply-To: <CAE-0n50jm1ovUcBC0GCQJszk-4u+0vDQtAxHxsu9SLyn_CkQuQ@mail.gmail.com>
From:   Prashant Malani <pmalani@chromium.org>
Date:   Thu, 30 Jun 2022 10:10:32 -0700
Message-ID: <CACeCKadtmGZ5iuTHdMms6ZHGn-Uv=MbcdtqmUzqCb=5WHuPj2Q@mail.gmail.com>
Subject: Re: [PATCH v5 1/9] dt-bindings: usb: Add Type-C switch binding
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Pin-yen Lin <treapking@chromium.org>,
        Rob Herring <robh@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux USB List <linux-usb@vger.kernel.org>,
        Benson Leung <bleung@chromium.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
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
        Sam Ravnborg <sam@ravnborg.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Xin Ji <xji@analogixsemi.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

(CC+ Bjorn)

On Wed, Jun 29, 2022 at 4:55 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Prashant Malani (2022-06-29 15:55:10)
> > On Wed, Jun 29, 2022 at 2:58 PM Stephen Boyd <swboyd@chromium.org> wrote:
> > >
> > > My understanding is there are 4 DP lanes on it6505 and two lanes are
> > > connected to one usb-c-connector and the other two lanes are connected
> > > to a different usb-c-connector. The IT6505 driver will send DP out on
> > > the associated two DP lanes depending on which usb-c-connector has DP
> > > pins assigned by the typec manager.
> [...]
> >
> > We can adopt this binding, but from what I gathered in this thread, that
> > shouldn't be done, because IT6505 isn't meant to be aware of Type-C
> > connections at all.
>
> How will the driver know which usb-c-connector to route DP to without
> making the binding aware of typec connections?

I agree with you; I'm saying my interpretation of the comments of this
thread are that it's not the intended usage of the it6505 part, so the driver
shouldn't be updated to support that.

>
> HPD can be signalled out of band, or not at all (no-hpd). I suspect it's
> valid to ignore/disconnect the HPD pin here and start/stop DP when, for
> example, the HPD pin toggles within a dp-connector. HPD could be
> signaled directly to the kernel via an out of band gpio going from the
> dp-connector to the SoC. In this case HPD for each dp-connector could be
> a different gpio and the driver may be required to arbitrate between the
> two dp-connectors with some 'first to signal wins' logic or something.

Sure, it's possible. I just didn't see anything in the anx7625 datasheet
to suggest it supported 2x1-lane DP outputs.

For that matter I don't think even it6505 supports > 1 DP sink (based
on my reading of the datasheet), but I don't have too much experience
with these parts.


> > My interpretation of the current mode-switch search code [1] is that
> > a top level property of "mode-switch" is required.
>
> Yeah that's how it is right now, but does it have to stay that way?
> Could the code search the graph and look for a matching node that's
> registered with the typec framework?

I'll have to get back to you on that after reading the code a bit more.
Maybe Heikki or Bjorn have some comments about it.
The ACPI Type-C ports do require a device handle labelled "mode-switch"
which points to the switch device.
