Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97C3C59A8F2
	for <lists+linux-usb@lfdr.de>; Sat, 20 Aug 2022 00:59:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243343AbiHSWzW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 19 Aug 2022 18:55:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243256AbiHSWzU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 19 Aug 2022 18:55:20 -0400
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07FFE10DCD7
        for <linux-usb@vger.kernel.org>; Fri, 19 Aug 2022 15:55:19 -0700 (PDT)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-324ec5a9e97so157949957b3.7
        for <linux-usb@vger.kernel.org>; Fri, 19 Aug 2022 15:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=cS/kuLnPP2ycMAb+4GFjyKvYClGwacVOaG/GdCCcX3E=;
        b=Isiv0LJrfAWVrYWLGTYqoFk7nqIAox7SkpjdLcd6nWTP5m1SY/fz8TO9LKhoAPrw+T
         qBPEb/knPbfBD1lNbRdzMKznlxaWBVCi0IfWiQtZdkp8azSyBbimy4ezRgRoEstgl+Wj
         yt3en8fzROvDSehUAtEuq3lxurwKa6ZdoD86M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=cS/kuLnPP2ycMAb+4GFjyKvYClGwacVOaG/GdCCcX3E=;
        b=2KPH5e9TOhwDPFjNAAAaJl1EjMUvVYp0J2M2W2xSTKlJ3/ofuxaoz6bypLne1m0OBd
         DmKLmutqZ2lXxWAnAkZb8srv+rjMw6cmTI8SKuy7Mcs7K6AvaiGetR7K6ttkBHR+4oqb
         d4NUQ7diQP9hzPV2NBNfymQlM1CpMdDsDqN8cNYF9sxZ7aCCKR4kklnhDeZVBobMCkFQ
         BeSj5NnAAKu22mdCuflZ1eFWKhYyyLTrlG5T+BNqA/aI36d+HDjQwXutcN4RB9pGRTir
         FGP7C0hh7PPhzSaIhLXkMhd1/EbWVOKfApVVPoDoH0nItAkRvhI/B017KWZaU4tNFolm
         1N8g==
X-Gm-Message-State: ACgBeo1EEfbF29Fr45WqYMFji+xqKoZu/NKO121dS6pl7qFd8Ln3wKYh
        NB249IUUvaLyYteVIpR3n5ItQ3aUimydb9s2OEHjiw==
X-Google-Smtp-Source: AA6agR6LKOU/mYIufJm2GU7IunlNwXFZrwVteZWtS4q01qi8fIqF26flbEbDiy37n+tk6dUFoayZwQ0X0SPCZ2ffjJ4=
X-Received: by 2002:a81:658:0:b0:334:a23e:6caa with SMTP id
 85-20020a810658000000b00334a23e6caamr9413958ywg.283.1660949718288; Fri, 19
 Aug 2022 15:55:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220810204750.3672362-1-bjorn.andersson@linaro.org>
 <20220810204750.3672362-2-bjorn.andersson@linaro.org> <a13bce60-25b4-d075-d56a-d1283e91e3ba@linaro.org>
 <20220814210104.GA690892-robh@kernel.org> <Yv1y9Wjp16CstJvK@baldur>
 <CAE-0n53AjJ_G6yZoTALWpKvZUdF+8nFZ+TQh=Ch=8xgdMVqDkw@mail.gmail.com>
 <CACeCKadP-AZ8OU4A=7CrwAz7yuLvMvjvAcw7K-FORFmkMvx7cA@mail.gmail.com> <YwAIGf59H9iKUhXF@builder.lan>
In-Reply-To: <YwAIGf59H9iKUhXF@builder.lan>
From:   Prashant Malani <pmalani@chromium.org>
Date:   Fri, 19 Aug 2022 15:55:07 -0700
Message-ID: <CACeCKadt3aoz8MZvy+tGHCxiHOPty4cLcG7AGS+oMEVnREt4sw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: usb: Introduce GPIO-based SBU mux
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Pin-yen Lin <treapking@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Aug 19, 2022 at 3:01 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
>
> You can't physically connect 1, 2 or 4 lanes of DP from a DP chip to
> your usb-c-connector at the same time as you physically connect 0, 2 or
> 4 lanes of USB from a USB PHY.

I apologize in case I'm misunderstanding, but why is that not possible?
anx7625 allows that configuration (2 lane DP + 2 lane USB going to
a single USB-C-connector)

Since the discussion is to support various conceivable hardware configurations
That same anx7625 can support 1 1-lane DP (or 2 1-lane DPs), and 1
2-lane Type-C output.
The cross-point switch allows for that level of configuration.

> > So, how about 4 endpoints (1 for each SS lane) in the usb-c-connector port@1?
> > That should support every conceivable configuration and bridge/PHY hardware.
> > and also allows a way to specify any lane remapping (similar to what
> > "data lanes" does)
> > if that is required.
>
> Wouldn't that prevent you from handling orientation switching, given
> that the graph is static?

It depends. If the end-points from the usb-c-connector
go to the same switch, then it should allow orientation switching
(anx7625 allows
this). The port driver would just tell the orientation switch(es) attached to
it that we are in NORMAL or REVERSE orientation.

The graph is static, since the hardware line routing between components
doesn't change (e.g SSTX1 from the Type-C port is always routed to Pin
X1,X2 on the switch hardware), but that is what the switch is for.
Note that in this case, the expectation is that
the switch driver only registers 1 switch (it can figure out that all
4 endpoints
go to the same Type-C port).

The limitation to orientation switching would depend on how the
hardware is routed.
