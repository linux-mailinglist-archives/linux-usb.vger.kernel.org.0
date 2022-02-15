Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1FB8A4B7607
	for <lists+linux-usb@lfdr.de>; Tue, 15 Feb 2022 21:48:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243392AbiBOTLT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 15 Feb 2022 14:11:19 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:52038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234523AbiBOTLS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 15 Feb 2022 14:11:18 -0500
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com [IPv6:2607:f8b0:4864:20::f29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36143C24AE
        for <linux-usb@vger.kernel.org>; Tue, 15 Feb 2022 11:11:08 -0800 (PST)
Received: by mail-qv1-xf29.google.com with SMTP id a28so27387qvb.10
        for <linux-usb@vger.kernel.org>; Tue, 15 Feb 2022 11:11:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=X9oIpTmWH153dZPbERckgwcW88amB5wLeggsaAJv2ZI=;
        b=nQBCpjZ8lrNiWaxU4Wg2alyfbeoW6NWsW4O4lUAYOIf3kh4200lqryhrnZrd/i0dTg
         Os4bogB5jd/j3L1NssRvTvI7jkV+eA8agcBWgmGTe/9nQdwQpTAKMKJOh/BEGUqxxhQR
         LIPxM/gXNHIQgpzqCktJVYqGCILCSn5RwW+Vw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=X9oIpTmWH153dZPbERckgwcW88amB5wLeggsaAJv2ZI=;
        b=ODXxbjRV3NPql67zQQWKPgYdJAIQ9bf0TeE67fzsvwHQ5SPuRwwWl+J95tIJvTC5nv
         S63zYROLaqNcu2cbv03tWvte9oe3IQ5fJopqcdsKuHKKwsJhaSSM7rhAL3eHQ4gGCym1
         H+sSyffarqf9xUinQgwDQrJx3kRho30DGsKGfVNfeNgckZ34YIiH/AqYBOSRmf4XguCh
         rAYJLo0/4ot4J+wUmabF0Rgui3zzBsuZAzir6jWcJKkCmu8nYs3yXhfQ+qJsjodHduhi
         nWhsS6KNG39D9eCKzVasoMOt9XKxFCCQ4HoR+czRIe6H3MChzVyBZmdVN5hkSfSDMB5k
         OZ/w==
X-Gm-Message-State: AOAM532OGrG+0imMDJMdRrkB7rgJOpXxGoalhQa1hBF4SFgzHptijk10
        t7Us1MCO2LfwHPL8D+7JjbGG7GWsYfBAXQ==
X-Google-Smtp-Source: ABdhPJxfbqwm/+f1C9SaZkrvg8Ua8gA//aPyr6k5essWq5QNoxbZKoUFlj5nsSbHk9pX/6qSi6DtpQ==
X-Received: by 2002:a05:6214:c23:: with SMTP id a3mr471047qvd.52.1644952267076;
        Tue, 15 Feb 2022 11:11:07 -0800 (PST)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com. [209.85.222.182])
        by smtp.gmail.com with ESMTPSA id o19sm20197510qta.19.2022.02.15.11.11.06
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Feb 2022 11:11:06 -0800 (PST)
Received: by mail-qk1-f182.google.com with SMTP id c189so18193231qkg.11
        for <linux-usb@vger.kernel.org>; Tue, 15 Feb 2022 11:11:06 -0800 (PST)
X-Received: by 2002:a05:6638:168d:: with SMTP id f13mr243041jat.44.1644951842244;
 Tue, 15 Feb 2022 11:04:02 -0800 (PST)
MIME-Version: 1.0
References: <20220119204345.3769662-1-mka@chromium.org> <20220119124327.v20.5.Ie0d2c1214b767bb5551dd4cad38398bd40e4466f@changeid>
 <YgJMkFAxjazkUDZd@kroah.com> <YgLCswtX/0THkzXT@google.com>
 <CAD=FV=WMP8M5HTRNv9_scvrytbpE0iBdUack=XaHoypGNLJeVA@mail.gmail.com> <Ygv3FSDS/fq1oePy@kroah.com>
In-Reply-To: <Ygv3FSDS/fq1oePy@kroah.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 15 Feb 2022 11:03:50 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XpF=BMKxjkX6xciWP=q=3qQ_dCusBX8KJ4GjubuqN2nQ@mail.gmail.com>
Message-ID: <CAD=FV=XpF=BMKxjkX6xciWP=q=3qQ_dCusBX8KJ4GjubuqN2nQ@mail.gmail.com>
Subject: Re: [PATCH v20 5/5] arm64: dts: qcom: sc7180-trogdor: Add nodes for
 onboard USB hub
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Matthias Kaehlcke <mka@chromium.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Felipe Balbi <balbi@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Peter Chen <peter.chen@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Roger Quadros <rogerq@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Linux USB List <linux-usb@vger.kernel.org>,
        Bastien Nocera <hadess@hadess.net>,
        Ravi Chandra Sadineni <ravisadineni@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Tue, Feb 15, 2022 at 10:55 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Tue, Feb 15, 2022 at 09:54:54AM -0800, Doug Anderson wrote:
> > Hi,
> >
> > On Tue, Feb 8, 2022 at 11:21 AM Matthias Kaehlcke <mka@chromium.org> wrote:
> > >
> > > On Tue, Feb 08, 2022 at 11:57:20AM +0100, Greg Kroah-Hartman wrote:
> > > > On Wed, Jan 19, 2022 at 12:43:45PM -0800, Matthias Kaehlcke wrote:
> > > > > Add nodes for the onboard USB hub on trogdor devices. Remove the
> > > > > 'always-on' property from the hub regulator, since the regulator
> > > > > is now managed by the onboard_usb_hub driver.
> > > > >
> > > > > Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> > > > > Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> > > > > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> > > > > ---
> > > >
> > > > No DT maintainer approval yet?  :(
> > >
> > > Bjorn usually just picks DT changes into the QCOM tree when they are
> > > ready, so I wouldn't interpret anything into the lack of an explicit
> > > Ack.
> >
> > Right, so the expectation is that this patch wouldn't land through the
> > USB tree but would instead land through the Qualcomm tree, probably a
> > revision after the code lands in the USB tree to avoid dependency
> > problems.
>
> But our tools pick up the whole series.  I can't just do "i will pick
> patches 1-4 only" easily, and neither can any other maintainer.
>
> Why not just get their ack so that I know it can come through the USB
> tree?  That's what normally happens for other changes like this where a
> driver change is required first.

Huh. That's the first time I've heard that and I'm pretty used to
patches in a series going through different trees, but it would be OK
w/ me if Bjorn was willing to Ack this. Bjorn: what say you? I guess
alternatively Matthias could send two series: one with the code and a
later one with the dts.

-Doug
