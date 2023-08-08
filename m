Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7730B77446C
	for <lists+linux-usb@lfdr.de>; Tue,  8 Aug 2023 20:18:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235642AbjHHSSc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Aug 2023 14:18:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234098AbjHHSRx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Aug 2023 14:17:53 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 001DF30E2
        for <linux-usb@vger.kernel.org>; Tue,  8 Aug 2023 10:25:20 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-31771bb4869so5182533f8f.0
        for <linux-usb@vger.kernel.org>; Tue, 08 Aug 2023 10:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=libre.computer; s=google; t=1691515519; x=1692120319;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wYPXrTj0ac3/TbvRu9WrEZ10bFywEsKaB4qoBFTir7E=;
        b=UnPN3rgiHS1U9PsEh0MI0ilU6n5W9r/pDsM94F1dAnr+7RP2M//z3rsiRjs5pdPs1A
         MkrbXoGkun1t73Guy7+lIbRdF1PrKsoAHE9Qpz/slmqjesJ9w3nR/70NxStnn9W8UJWH
         p4nt+6nmKi8/QtBfhGgylZyPbFmzsf8RuYbbciBmo5GIbYgJtitsWTGztK5CD1BVP9/2
         +9SZC0bwI53sSPatXCMTGv/7nUHqaeGe441Gl59OSLR2uF5Q4Rf9JuNxg8Q+13qysr5U
         boDasOLKssIg+FgjpVNigx6RjMIiAlBSt0fOFhEFQZyEmCCetwprSaLrQZI6c44OfQjY
         iuAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691515519; x=1692120319;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wYPXrTj0ac3/TbvRu9WrEZ10bFywEsKaB4qoBFTir7E=;
        b=g5ot2grgFBFDL3BZbDf6bTFwkdIHqQ/MIymQtBuhBp1FoU3jQbjaizJK+VlsQYMDX5
         zif9YGfEBeBwAhyJYqpE2QEJD3IHT/Unnsja2iegn0BBOLA7q21Hpbnef4YKGq90vVuc
         5k5flItxmCAIOPjPELa8RSHdIvNIGL7vjWmJJEnrgA30Gdrydnp9y8vQR4Yq8xGXW7pz
         tjaHN0HzAqJcMuL+htQ5BV69F/v/mYXwDLOL5I7z+CIFwbsr5Jvly1r06nW68y4ZGqJK
         AZQoqRKXscVEziv5zu9DGV6H8MsrpLO8UHwODQqibz7aOkJEWInAO2mXtO1aLsw5bLfx
         YrpA==
X-Gm-Message-State: AOJu0YyuA8Jc8falU30ZmT70qkkoipPsRIhQa+Tv8rDyx1i4F0gq/Jhb
        XTQ9EPIdilW6YaBQnu4YR52vIOwbDcKqnuUZxRM4UaCk6QCwLXawKT9k2THZmdg=
X-Google-Smtp-Source: AGHT+IGwJkEwmhGtX5OwedSjwf3ch9f4Rn33ZkTyBMpaVuhixVe3FEg1sM8V6DxiweX0z+J81sYoBkLLrAGCleGW+tw=
X-Received: by 2002:a2e:87c6:0:b0:2b6:e2aa:8fc2 with SMTP id
 v6-20020a2e87c6000000b002b6e2aa8fc2mr6824193ljj.46.1691474997354; Mon, 07 Aug
 2023 23:09:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230808032510.31754-1-luke.lu@libre.computer> <2023080851-duh-scroll-09bf@gregkh>
In-Reply-To: <2023080851-duh-scroll-09bf@gregkh>
From:   Luke Lu <luke.lu@libre.computer>
Date:   Tue, 8 Aug 2023 06:09:45 +0000
Message-ID: <CAAzmgs5U=BNzNNeskUMe_YEken1-CmzssRFPDCmsmar9SQo+WQ@mail.gmail.com>
Subject: Re: [PATCH] usb: dwc3: meson-g12a: do post init to fix broken usb
 after resumption
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Neil Armstrong <neil.armstrong@linaro.org>,
        linux-usb@vger.kernel.org, linux-amlogic@lists.infradead.org,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Da Xue <da@libre.computer>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DATE_IN_PAST_06_12,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

HI Greg:

On Tue, Aug 8, 2023 at 4:56=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Tue, Aug 08, 2023 at 03:25:10AM +0000, Luke Lu wrote:
> > Device connected to usb otg port of GXL-based boards can not be
> > recognised after resumption, doesn't recover even if disconnect and
> > reconnect the device. dmesg shows it disconnects during resumption.
> >
> > [   41.492911] usb 1-2: USB disconnect, device number 3
> > [   41.499346] usb 1-2: unregistering device
> > [   41.511939] usb 1-2: unregistering interface 1-2:1.0
> >
> > Calling usb_post_init() will fix this issue, and it's tested and
> > verified on libretech's aml-s905x-cc board.
> >
> > Signed-off-by: Luke Lu <luke.lu@libre.computer>
>
> What commit id does this fix?
Using "git blame" to explore the history, found dwc3_meson_g12a_resume() wa=
s
introduced along with the file of drivers/usb/dwc3/dwc3-meson-g12a.c.
as Da Xue pointed out, the suspend/resume was never tested in GXL based SoC=
,
so it's broken since the beginning..

For the Fixes tag, I think it's proper to use "5b0ba0caaf3a: (usb:
dwc3: meson-g12a: refactor usb init)"
since the usb_post_init() function was introduced in this commit and
this patch will depend on it.

> Should it also go to stable kernels?
>
Yes, It would be great if the patch can go to stable tree, thanks for
suggesting this
I have it tested on 6.1-lts tree.

Btw, I would wait for a few days for more comments and CC to stable in
next v2 if no objection.

> thanks,
>
> greg k-h

Luke
