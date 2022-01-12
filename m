Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD94448CC43
	for <lists+linux-usb@lfdr.de>; Wed, 12 Jan 2022 20:47:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350176AbiALTrY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Jan 2022 14:47:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344762AbiALTrE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 12 Jan 2022 14:47:04 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C02F1C061756;
        Wed, 12 Jan 2022 11:47:03 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 871CCB820E0;
        Wed, 12 Jan 2022 19:47:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42F9DC36AE9;
        Wed, 12 Jan 2022 19:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1642016821;
        bh=xPan4dyLo+Yw9ucNGe6Ip9UFfAcPV5Adg0Tu85Olhis=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=R/vMXr23TxqdPD8uqaAN2WK5vGv1GerDfjVP5mFmjrJr4fsLJzsj7DuBGViCxERCA
         E/AhN1AVpF57oIY1ON/dZDNdvR6p85yapSH9bux/dJyeLOIgwzM5gv4+Q+renOgvgt
         khWoFLdYrkbqB9Ox2j0vpHyoFa3ChIjBi9yEgJKNca8wMDYfXuaQHVEAe2t8kAzLXT
         1+wY7LSWrTQ33o6wMX5cF+b/Tf+gJ64JLeG9Qw6d2gvEdoltyNAwgWwq78/Tr9M4K8
         //CDTd3uVZmR1Z0+B3LvUv4WHO/1yOIDVU1d3pTxPSaXyM/P85ys9TvE7GeiGbq8Ah
         dyG+0+JS8rvWQ==
Received: by mail-ed1-f49.google.com with SMTP id k15so14120137edk.13;
        Wed, 12 Jan 2022 11:47:01 -0800 (PST)
X-Gm-Message-State: AOAM533xdQXi6aBJq4IENYqQask4gWysE97Y3n8GugcoccxLO+PO2qgo
        0XEbXg1hAJhjys2ITO1KMD+6yGXOCLFJrqSxEw==
X-Google-Smtp-Source: ABdhPJxfAlnawHFKyW8uscvZHjkYz6VLEzV5D41qSUwk1sownLJf+nxOAWzuOzUYj/T1x+I9IkCrvtpm1uKrBIJbSrI=
X-Received: by 2002:a17:907:98af:: with SMTP id ju15mr3052ejc.264.1642016819551;
 Wed, 12 Jan 2022 11:46:59 -0800 (PST)
MIME-Version: 1.0
References: <20220110201936.1371891-1-robert.hancock@calian.com>
 <20220110201936.1371891-4-robert.hancock@calian.com> <1641914089.158670.2944752.nullmailer@robh.at.kernel.org>
 <03419935b624427ef8a1ee6b545e236be9cc7941.camel@calian.com>
In-Reply-To: <03419935b624427ef8a1ee6b545e236be9cc7941.camel@calian.com>
From:   Rob Herring <robh@kernel.org>
Date:   Wed, 12 Jan 2022 13:46:47 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKn16rZxRCaQQnxW+BRjxzQdn9DqUmj-XiyJuxBegg0dw@mail.gmail.com>
Message-ID: <CAL_JsqKn16rZxRCaQQnxW+BRjxzQdn9DqUmj-XiyJuxBegg0dw@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] dt-bindings: usb: dwc3: add reference clock period
 fractional adjustment
To:     Robert Hancock <robert.hancock@calian.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "mounika.grace.akula@xilinx.com" <mounika.grace.akula@xilinx.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "Thinh.Nguyen@synopsys.com" <Thinh.Nguyen@synopsys.com>,
        "michal.simek@xilinx.com" <michal.simek@xilinx.com>,
        "manish.narani@xilinx.com" <manish.narani@xilinx.com>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jan 12, 2022 at 10:54 AM Robert Hancock
<robert.hancock@calian.com> wrote:
>
> On Tue, 2022-01-11 at 09:14 -0600, Rob Herring wrote:
> > On Mon, 10 Jan 2022 14:19:34 -0600, Robert Hancock wrote:
> > > Document the new snps,ref-clock-fladj property which can be used to set
> > > the fractional portion of the reference clock period.
> > >
> > > Signed-off-by: Robert Hancock <robert.hancock@calian.com>
> > > ---
> > >  Documentation/devicetree/bindings/usb/snps,dwc3.yaml | 12 ++++++++++++
> > >  1 file changed, 12 insertions(+)
> > >
> >
> > My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> > on your patch (DT_CHECKER_FLAGS is new in v5.13):
> >
> > yamllint warnings/errors:
> >
> > dtschema/dtc warnings/errors:
> > schemas/usb/snps,dwc3.yaml: ignoring, error in schema: properties: snps,ref-
> > clock-fladj
>
> I'm assuming this schema file needs to be updated, but I'm not sure where it
> lives? I don't see such a file in the devicetree-org/dt-schema repo?

Try Documentation/devicetree/bindings/usb/snps,dwc3.yaml
