Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 69AAA59EC5A
	for <lists+linux-usb@lfdr.de>; Tue, 23 Aug 2022 21:32:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232069AbiHWTbc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 23 Aug 2022 15:31:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234189AbiHWTbG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 23 Aug 2022 15:31:06 -0400
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F8D56D9F3
        for <linux-usb@vger.kernel.org>; Tue, 23 Aug 2022 11:21:46 -0700 (PDT)
Received: by mail-qk1-x72d.google.com with SMTP id f4so10936062qkl.7
        for <linux-usb@vger.kernel.org>; Tue, 23 Aug 2022 11:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=VRH9i7gn6G7q7zM5zkrgK8otWVHlhX+rKEaQTiTTOG8=;
        b=MZCbr/WEbJydxnsRP5iDs8/+UKHC04XK4zcpwO5zyFGAWWy/6HFHsOKp7qYfTJmKBT
         fBzs3v7/7AQJ0KzQ8i+gXfbYpjMe2dGZrjRk4LEtEg8YwZ+TcO0L/E4zM2ooV1ss+2+B
         Gr1DyQWP/qboa72UXqPFD27ZSZg7AfE02sPVw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=VRH9i7gn6G7q7zM5zkrgK8otWVHlhX+rKEaQTiTTOG8=;
        b=3zfQl4YDZ9Fsg8S2z3dM271IrogGu70EKT9kHqoAIIowz5EhxBJxhBGbVzSPjGYuJG
         JOT2AxKCKGVEIc+ICXVOuCVMnddrgYNm5uTEwVtXz904PwC+Hba4iTViZaXNPVwk0dVc
         ZBaJhMA+4IsjztcAbB7yorkjRP4nB/54ie8UmsSeBLY36Ry4oASkTa6ZLJbkgL+ROkbZ
         U5EnEc1VM1bCnSmVspPOCKj8Wpbsq4Vg5jCtkZaQZJdqfsAzpdvM5GwRlJWVBY7Qx80x
         jt5BsfdQxH1azhYwxFQYw7Bl7oqzSUF+OU12qjw2KRjo6YiDttiYo1FLFQbNn1u5rPAA
         q/SA==
X-Gm-Message-State: ACgBeo31baD0Kwhjg+gA3LxPya6x2Oi+C0uUH9DzpB+Y7zlsTJ1jzUoW
        igACKOuQHnHHte7d/1/gxAQiqEY99jSbCpD6O0sP3A==
X-Google-Smtp-Source: AA6agR7Tplpl0I6QcELlwZXfwpUh5dE7G8dVWSaIMwN975uDfjb3e5Hod1U6v27fYqIISntknbMDFc+HKE9bvLh75Ek=
X-Received: by 2002:a05:620a:c44:b0:6b6:5c63:aebc with SMTP id
 u4-20020a05620a0c4400b006b65c63aebcmr17241718qki.170.1661278905154; Tue, 23
 Aug 2022 11:21:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220810204750.3672362-1-bjorn.andersson@linaro.org>
 <20220810204750.3672362-2-bjorn.andersson@linaro.org> <a13bce60-25b4-d075-d56a-d1283e91e3ba@linaro.org>
 <20220814210104.GA690892-robh@kernel.org> <Yv1y9Wjp16CstJvK@baldur>
 <CAE-0n53AjJ_G6yZoTALWpKvZUdF+8nFZ+TQh=Ch=8xgdMVqDkw@mail.gmail.com>
 <CACeCKadP-AZ8OU4A=7CrwAz7yuLvMvjvAcw7K-FORFmkMvx7cA@mail.gmail.com>
 <CAE-0n53C+D=9gdSXKsjr4KZVrb-gpeo_EyuX3DfNKp19FoicXA@mail.gmail.com>
 <YwADGgNVwtKacUBR@builder.lan> <CACeCKaeXpU+AxFNAwkutMX9LT2XLgAv1XmwJRyj7Exqxg6v8rA@mail.gmail.com>
 <YwBdTAIqFbedC6Oa@builder.lan>
In-Reply-To: <YwBdTAIqFbedC6Oa@builder.lan>
From:   Prashant Malani <pmalani@chromium.org>
Date:   Tue, 23 Aug 2022 11:21:33 -0700
Message-ID: <CACeCKafDfiZ8o2Ac-QYTcWT0dFtX6gXfrBPsGgwxRG+-FF4aQw@mail.gmail.com>
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
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Aug 19, 2022 at 9:04 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Fri 19 Aug 17:18 CDT 2022, Prashant Malani wrote:
>
> > On Fri, Aug 19, 2022 at 2:39 PM Bjorn Andersson
> > <bjorn.andersson@linaro.org> wrote:
>
> Are you saying that two of your SS-lanes in connector A are connected to
> directly to the QMP PHY at the same time as two SS-lanes from connector
> B are connected to the same two pads on the QMP PHY - without any
> mux etc inbetween?
>
> I.e. that there are a set of pins in connector A which is directly
> connected to a set of pins in connector B?
>
>
> I was under the impression that in your hardware there's some component
> muxing the single DP output to one of the connectors. If so there should
> be no graph-link directly connecting the two usb-c-connectors and the
> one QMP PHY.
>
> Is this not the case?

I can't speak to the QMP PHY specifically (since I'm not using that hardware),
but your impression is right.
There is a component (anx7625) muxing the single DP output to the 2
usb-c-connectors
(specifically, 2 lanes each from the 2 usb-c-connectors).
The other 2 lanes (from the 2 USB-C-connectors) go to a USB3 hub; hence the need
for 2 endpoints for each usb-c-connector).

So,  the anx7625 should register the mode switches and it needs the
graph connections
from 2 usb-c-connectors

BR,

-Prashant
