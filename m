Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A71E1560C33
	for <lists+linux-usb@lfdr.de>; Thu, 30 Jun 2022 00:16:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230019AbiF2WPW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 29 Jun 2022 18:15:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229575AbiF2WPV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 29 Jun 2022 18:15:21 -0400
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE51533A37
        for <linux-usb@vger.kernel.org>; Wed, 29 Jun 2022 15:15:20 -0700 (PDT)
Received: by mail-oi1-x22a.google.com with SMTP id p8so23524040oip.8
        for <linux-usb@vger.kernel.org>; Wed, 29 Jun 2022 15:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=mVoh40gI4rO7l5P610TuxYrPnSY080uxRzgBN6iYHPw=;
        b=J1EwYJaAuhZYWSzaIMQPrFvichlEBV0wEJXVGgxiGkfuiW+LSAUKhLXvFor3y/gY1I
         g3G55YwwfAtYsFNCQU8luQfEzkAkaPjhdlG7yLKWNA4GRVnA32+sM/PnVfP6m/I2yL3N
         QBDpAhJJfkc47+mpEs2pdgJjynB//53l3WQeM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=mVoh40gI4rO7l5P610TuxYrPnSY080uxRzgBN6iYHPw=;
        b=OveSGCxXiJtDj2TOR1CaknBIp7tmPTWYIFFj6a+OItIscLDYqr2bppUMp9Jn7dGnFY
         RnJFOR5IuyevP41MKyqAZAXRwmEGaLP5nSxDFx45YV6X2elJwbae+J377CmnWLQyAHUU
         nQGrgATBUGWI1iJFrpUAME8M7TqE97TakUosO0reBkgu3msxZifFczdfxHmHa8t5lGVB
         LnAB5RHKbz/v7R5quGJDxKNCJIYxxZnknRbhZE9sdC3aaPq039t1L0gesV59xRQi81iT
         f9Zsg0gHTNeKFD/wnqkGe2ZlgPcvc2qTLFP4llX6H8Cy2C+5IhMO5ZysfJDwrRyMlsF9
         c7Pg==
X-Gm-Message-State: AJIora828Qj0cwcv/BMz1R+YBfBpZRPof7hbrCX/BR/WkvlPuW6YdTJg
        VBmWImEk5NDBfk3akRQXy624Ds18yaZiunOJ+WF5YQ==
X-Google-Smtp-Source: AGRyM1tbuJ+dTBm80e52XefpYch+GdMWbSr4bA36AZQ68tY4ma07ZyFuFFne+0loAcndzlIIccRQmt/8JirxK9nrK/k=
X-Received: by 2002:a05:6808:171c:b0:334:9342:63ef with SMTP id
 bc28-20020a056808171c00b00334934263efmr3625283oib.63.1656540920035; Wed, 29
 Jun 2022 15:15:20 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 29 Jun 2022 15:15:19 -0700
MIME-Version: 1.0
In-Reply-To: <20220628053148.GA21797@hu-pkondeti-hyd.qualcomm.com>
References: <1654158277-12921-1-git-send-email-quic_kriskura@quicinc.com>
 <YpkRDi2m7cLaKYEf@google.com> <Yp5nf2w8uVZ38/XZ@google.com>
 <Yqd9IHQEj3Ex+FcF@google.com> <YqjLHyUVEjf7I3MI@google.com>
 <20220616091110.GA24114@hu-pkondeti-hyd.qualcomm.com> <YqtlRQOwb3t6Xtd0@google.com>
 <20220620085415.GA13744@hu-pkondeti-hyd.qualcomm.com> <CAE-0n52bq9feA6BVdAp791SWQtT1Yj4M2ppg3o_KOaRFO8r+0Q@mail.gmail.com>
 <20220628053148.GA21797@hu-pkondeti-hyd.qualcomm.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Wed, 29 Jun 2022 15:15:19 -0700
Message-ID: <CAE-0n50PGw_XSZ0-iV7gem6+-LENoq6ZVOwX3f+0XjkrHg-rLw@mail.gmail.com>
Subject: Re: [PATCH v20 2/5] usb: dwc3: core: Host wake up support from system suspend
To:     Pavan Kondeti <quic_pkondeti@quicinc.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Felipe Balbi <balbi@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Krishna Kurapati <quic_kriskura@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Doug Anderson <dianders@chromium.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, quic_ppratap@quicinc.com,
        quic_vpulyala@quicinc.com
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

Quoting Pavan Kondeti (2022-06-27 22:31:48)
> On Mon, Jun 27, 2022 at 01:02:49PM -0700, Stephen Boyd wrote:
> > Quoting Pavan Kondeti (2022-06-20 01:54:15)
> > >
> > > Would like to hear other people thoughts on this.
> > >
> >
> > I'm not following very closely but it sounds like a problem that may be
> > solved by using the component driver code (see
> > include/linux/component.h). That would let you move anything that needs
> > to be done once the child devices probe to the aggregate driver 'bind'
> > function (see struct component_master_ops::bind).
>
> Thanks Stephen for letting us know about the component device framework.
>
> IIUC,
>
> - dwc3-qcom (parent of the dwc3 core) registers as a component master by
> calling component_master_add_with_match() before calling
> of_platform_populate(). The match callback could be as simple as comparing
> the device against our child device.
>
> - The dwc3 core (child) at the end of its probe can add as a component by calling
> component_add().
>
> - The above triggers the component_master_ops::bind callback implemented in
>   dwc3-qcom driver which signals that we are good to go.
>
> - The dwc-qcom can call component_bind_all() to finish the formality i.e
>   telling the dwc3 core that we are good to go.
>
> Is my understanding correct? This is what we are looking for i.e a way for
> the child device(s) to signal the parent when the former is bounded.

Sounds about right to me.

>
> Also what happens when the child device probe fails for any reason. i.e
> component_add() would never be called so the master driver i.e dwc3-qcom would
> wait indefinitely. May be it needs to implement a timeout or runtime suspend
> etc should take care of keeping the resoures in suspend state.

When the child fails probe, it should return -EPROBE_DEFER if probe
needs to be deferred. Then the driver will attempt probe at a later
time. If probe fails without defer then it will never work and dwc3-qcom
will wait indefinitely. Not much we can do in that situation.

dwc3-qcom should wait for dwc3 core to call component_add() and then do
whatever needs to be done once the dwc3 core is registered in the
dwc3-qcom bind callback. Honestly this may all be a little overkill if
there's only two drivers here, dwc3-qcom and dwc3 core. It could
probably just be some callback from dwc3 core at the end of probe that
calls some function in dwc3-qcom.
