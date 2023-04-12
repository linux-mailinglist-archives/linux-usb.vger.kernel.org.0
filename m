Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C1F06DF63D
	for <lists+linux-usb@lfdr.de>; Wed, 12 Apr 2023 14:56:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231523AbjDLM4C (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Apr 2023 08:56:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229647AbjDLMz7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 12 Apr 2023 08:55:59 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEE539017
        for <linux-usb@vger.kernel.org>; Wed, 12 Apr 2023 05:55:32 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A408462A83
        for <linux-usb@vger.kernel.org>; Wed, 12 Apr 2023 12:54:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F983C433EF
        for <linux-usb@vger.kernel.org>; Wed, 12 Apr 2023 12:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1681304099;
        bh=a6CdUHN2i+lHGZJUPEA+ZIoQD+xPlEBo2v9VaNWYIPI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=AGTcgDk8j+TFjzRMFcxeUPu3c6TP69+mjhSCLZ6t7NrRtA/upo1Vv70tXNvYtxNpO
         WbhbXpPx79yd3eNPC/VXwWNLyp+PjGINqq4OxWfhc1oegwy08qmN9nLMw93xkEAEaL
         uhA5H5WpxIfnOymxJSUFUxBQONOAnBSI8hAtqXunKbYcJSpSRaHJ3NgDRmVErsuiGG
         xhHj/W+ex9FLp1cm1lEhxCHBSnUpqfPWgixJjyi7tvYC7ArdduX/NpjSoQTpvs+3go
         noLG1+8JhbTdY9Gxs6f7EcDb/dXftmoZvGTlTT4Qf8M14Qw+TZ7hqbOhEw9bG7vgoT
         YRfumTMokBPEA==
Received: by mail-yb1-f181.google.com with SMTP id c2so890600ybo.9
        for <linux-usb@vger.kernel.org>; Wed, 12 Apr 2023 05:54:59 -0700 (PDT)
X-Gm-Message-State: AAQBX9eqerBQynolbI3QOJtWCrjjjN7skgdnCowO/jg+kMydbmpf6gB/
        Xt9w09QfV1m2F/eORhlqZ2UUkSlniOgZ1ZtzJw==
X-Google-Smtp-Source: AKy350b9MHUR2tIjtRJrj6VsXvQwyF6Qi4NtOeH1Ze7Yr5jmANstQlQxNkphzkqmGx1sDC31scrlPxVqPmR557yhN+o=
X-Received: by 2002:a25:dac3:0:b0:b6a:2590:6c63 with SMTP id
 n186-20020a25dac3000000b00b6a25906c63mr1883987ybf.2.1681304098078; Wed, 12
 Apr 2023 05:54:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230412033006.10859-1-stanley_chang@realtek.com> <20230412033006.10859-2-stanley_chang@realtek.com>
In-Reply-To: <20230412033006.10859-2-stanley_chang@realtek.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Wed, 12 Apr 2023 07:54:46 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLqTHbHjB1qiLduhzvTaO7EBMgL6KYqZJtgStGVGtX1vQ@mail.gmail.com>
Message-ID: <CAL_JsqLqTHbHjB1qiLduhzvTaO7EBMgL6KYqZJtgStGVGtX1vQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] dt-bindings: usb: snps,dwc3: Add
 'snps,global-regs-starting-offset' quirk
To:     Stanley Chang <stanley_chang@realtek.com>
Cc:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Apr 11, 2023 at 10:30=E2=80=AFPM Stanley Chang
<stanley_chang@realtek.com> wrote:
>
> Add a new 'snps,global-regs-starting-offset' DT to dwc3 core to remap
> the global register start address
>
> The RTK DHC SoCs were designed the global register address offset at
> 0x8100. The default address is at DWC3_GLOBALS_REGS_START (0xc100).
> Therefore, add the property of device-tree to adjust this start address.
>
> Signed-off-by: Stanley Chang <stanley_chang@realtek.com>
> ---
>  Documentation/devicetree/bindings/usb/snps,dwc3.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml b/Docum=
entation/devicetree/bindings/usb/snps,dwc3.yaml
> index be36956af53b..5cbf3b7ded04 100644
> --- a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
> +++ b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
> @@ -359,6 +359,13 @@ properties:
>      items:
>        enum: [1, 4, 8, 16, 32, 64, 128, 256]
>
> +  snps,global-regs-starting-offset:
> +    description:
> +      value for remapping global register start address. For some dwc3
> +      controller, the dwc3 global register start address is not at
> +      default DWC3_GLOBALS_REGS_START (0xc100). This property is added t=
o
> +      adjust the address.

We already have 'reg' or using a specific compatible to handle
differences. Use one of those, not a custom property. Generally,
properties should be used for things that vary per board, not fixed in
a given SoC.

Rob
