Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A5B5459ECE3
	for <lists+linux-usb@lfdr.de>; Tue, 23 Aug 2022 21:51:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232266AbiHWTvg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 23 Aug 2022 15:51:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232665AbiHWTvE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 23 Aug 2022 15:51:04 -0400
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 177952638
        for <linux-usb@vger.kernel.org>; Tue, 23 Aug 2022 11:55:07 -0700 (PDT)
Received: by mail-qk1-x72d.google.com with SMTP id w18so11009650qki.8
        for <linux-usb@vger.kernel.org>; Tue, 23 Aug 2022 11:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=0og1NC2/HzAvVvbV76h98xTKlthNFgmiVfi+QQP1fKE=;
        b=U0z64/twq5fRD8PYe86SWj5MOzpiyeXAojxyeZG0RaM1CXF41MQ7cPW/q9AnhX2dmh
         K2Y6rdcknRckWMxeZtzuaO410aPqaOGK7MxxbKy3NKHXUAfIhIatbt9pe/+MkwZi9cIn
         iavxD4ltIYascRH9D2WiBcTk4ZY1mW2Bd2Lio=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=0og1NC2/HzAvVvbV76h98xTKlthNFgmiVfi+QQP1fKE=;
        b=RR13K23wJOSYuJi/Ln20CXaezgQ+Ob8oZJjUW+MhoBholrO9AsWBt45bNOifg/5Ojc
         abY9BXqLESdwsVXh9aTQLc2bi/eNQJY8nClvSGbq4iT4wQa2XN0ehLmSenQ/JlLY+mhF
         A2yKVxQOq+ExCbJ7oHZFjCzdBMB/e734Apd5upkzOi5m7Hk3O/4faf6/YAWjzhnJX/Nv
         +vGH16DfxACutdkuP3BJbG/3fQEyyZeECOeyzTjvwoAh3vdSKlWleJBAX9T99+lsjpHr
         lRGgty1orMPgdsmQ77YO2zG30LbRmZ3+wyVfDK8E6PomNxPrpBZ1sPV4V3DrJtP6xKmC
         jFvA==
X-Gm-Message-State: ACgBeo28s6+rsroiZDOqb8nCOZddrvBZA+ARKgs3u5VzFwSTzP9Dxs0Y
        upYAtWWgz6tl/i1juCGgyYic5k2RBCDuEUahGTkCOw==
X-Google-Smtp-Source: AA6agR6NLbXWUWNv+sSduGg86IvYbjufKWNoFOftL8eY63TNbzBoCvYh91fB2EfAvaLFYG5z39FD6/3huPMVBknE62c=
X-Received: by 2002:a05:620a:4553:b0:6bb:1dd0:e44c with SMTP id
 u19-20020a05620a455300b006bb1dd0e44cmr16944782qkp.543.1661280906190; Tue, 23
 Aug 2022 11:55:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220810204750.3672362-1-bjorn.andersson@linaro.org>
 <20220810204750.3672362-2-bjorn.andersson@linaro.org> <a13bce60-25b4-d075-d56a-d1283e91e3ba@linaro.org>
 <20220814210104.GA690892-robh@kernel.org> <Yv1y9Wjp16CstJvK@baldur>
 <CAE-0n53AjJ_G6yZoTALWpKvZUdF+8nFZ+TQh=Ch=8xgdMVqDkw@mail.gmail.com>
 <CACeCKadP-AZ8OU4A=7CrwAz7yuLvMvjvAcw7K-FORFmkMvx7cA@mail.gmail.com>
 <YwAIGf59H9iKUhXF@builder.lan> <CACeCKadt3aoz8MZvy+tGHCxiHOPty4cLcG7AGS+oMEVnREt4sw@mail.gmail.com>
 <YwBei45gx4oVqSql@builder.lan>
In-Reply-To: <YwBei45gx4oVqSql@builder.lan>
From:   Prashant Malani <pmalani@chromium.org>
Date:   Tue, 23 Aug 2022 11:54:53 -0700
Message-ID: <CACeCKaewr92JcouMgyiL5rKdHf_dDmoWoyoW-U2snCNBkNijQg@mail.gmail.com>
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

On Fri, Aug 19, 2022 at 9:09 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
>
> We're talking about the static configuration here, where you describe
> which component are connected together. We can not dynamically switch
> the Devicetree representation around to match what the Type-C controller
> negotiates.

Yes, but we don't need to switch the device tree representation at all.
The pin routing/connections from the connector (not the cable or the partner),
to the muxing hardware (QMP phy or anx7625) remains fixed always
The port driver tells what orientation the peripheral is connected with,
and the muxing/orientation hardware routes the signals according to that.

>
> But why do you need to express the relationship between these 2
> components with > 1 link in the graph?
>
> > The graph is static, since the hardware line routing between components
> > doesn't change (e.g SSTX1 from the Type-C port is always routed to Pin
> > X1,X2 on the switch hardware), but that is what the switch is for.
> > Note that in this case, the expectation is that
> > the switch driver only registers 1 switch (it can figure out that all
> > 4 endpoints
> > go to the same Type-C port).
> >
>
> Why do we need to express this with 4 endpoints and then implement code
> to discover that the 4 endpoints points to the same remote? Why not just
> describe the logical relationship between the two components in one
> endpoint reference?

The issue I see is with the "supplier" side of that graph relationship
(i.e the DRM bridge side).
Since the bridge can be directly connected to a DP panel, the
endpoints can (technically)
represent a single DP lane. So, using 4 end-points for the
usb-c-connector port@1 gives
us something which is compatible with the bridge side endpoints too
(regardless of what
the bridge is connected to on the "output" side).
Reading the discussion, I agree 4 lanes is over-specifying, and 2
endpoints is probably
enough (especially if we can use data-lanes on the bridge side
to define the number of lanes if needed for DP panel connections).

BR,

-Prashant
