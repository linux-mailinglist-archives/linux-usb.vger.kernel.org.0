Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE5FE48E27A
	for <lists+linux-usb@lfdr.de>; Fri, 14 Jan 2022 03:18:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238826AbiANCSQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 Jan 2022 21:18:16 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:41594 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229863AbiANCSQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 13 Jan 2022 21:18:16 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 15A22B82358;
        Fri, 14 Jan 2022 02:18:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC3E8C36AEF;
        Fri, 14 Jan 2022 02:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1642126693;
        bh=P1/N97qrEN7OwDzBcrxxQIrJdtloUJCnxS1wgbtrCVM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=QYtU58SWQAS2nW70wDP3uVrqmntYUAbtHHgfjpTb6y9QEZbPGstwleFUxNLyMTOhv
         bdWGfOnqdY8SjQ79fefOLG3VwUmUGqm7zhU0rb+lcAb2UXKtBgB18hy0+C16HAf4vp
         biA2P3XPqI9gzkmi/onud4im34WDuMkKviB3pvdiHm6kHN+1yx0B3xRKYumig91R46
         MuEasLFEhZ0nC0mTp/7DEdQJCLf/PtZXCHprejPgDWzb+KuUTFf52hNHFcJ6OtaEFQ
         t3lHBDNx0ETv6LRwLvThlKGBz6erkkvXDIwseS1AZUfsTdra1DpgJ0Q/7gCpqp+IIJ
         Ued1lNQfzVtPg==
Received: by mail-ed1-f47.google.com with SMTP id 30so29966491edv.3;
        Thu, 13 Jan 2022 18:18:13 -0800 (PST)
X-Gm-Message-State: AOAM530SQJQEk3nGpjA/7P91rrVJtqy5+xU+X9pC0uMgtNqe+zWPoDRt
        hQCG0cJYZZOaubsEM9aVqvV61USOLCYp+MDwbA==
X-Google-Smtp-Source: ABdhPJzJtUnKNQo/Bj/LSw6HKCaJNjJyNVbLFe5//sHX+TzEPF/xGB8NfXgefDf/U7lsR3ybcd4pbaOsd0Gafuw8gVY=
X-Received: by 2002:a17:906:1dc3:: with SMTP id v3mr522295ejh.264.1642126692204;
 Thu, 13 Jan 2022 18:18:12 -0800 (PST)
MIME-Version: 1.0
References: <20220110201936.1371891-1-robert.hancock@calian.com>
 <20220110201936.1371891-4-robert.hancock@calian.com> <1641914089.158670.2944752.nullmailer@robh.at.kernel.org>
 <03419935b624427ef8a1ee6b545e236be9cc7941.camel@calian.com>
 <CAL_JsqKn16rZxRCaQQnxW+BRjxzQdn9DqUmj-XiyJuxBegg0dw@mail.gmail.com> <2273126d255bd126e4ec97e90316027308b41c15.camel@calian.com>
In-Reply-To: <2273126d255bd126e4ec97e90316027308b41c15.camel@calian.com>
From:   Rob Herring <robh@kernel.org>
Date:   Thu, 13 Jan 2022 20:18:00 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJY58nVoanh8EvS3TUTF28V3AsNwsv+6=jSH3BHNzn0ZQ@mail.gmail.com>
Message-ID: <CAL_JsqJY58nVoanh8EvS3TUTF28V3AsNwsv+6=jSH3BHNzn0ZQ@mail.gmail.com>
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

On Thu, Jan 13, 2022 at 11:58 AM Robert Hancock
<robert.hancock@calian.com> wrote:
>
> On Wed, 2022-01-12 at 13:46 -0600, Rob Herring wrote:
> > On Wed, Jan 12, 2022 at 10:54 AM Robert Hancock
> > <robert.hancock@calian.com> wrote:
> > > On Tue, 2022-01-11 at 09:14 -0600, Rob Herring wrote:
> > > > On Mon, 10 Jan 2022 14:19:34 -0600, Robert Hancock wrote:
> > > > > Document the new snps,ref-clock-fladj property which can be used to set
> > > > > the fractional portion of the reference clock period.
> > > > >
> > > > > Signed-off-by: Robert Hancock <robert.hancock@calian.com>
> > > > > ---
> > > > >  Documentation/devicetree/bindings/usb/snps,dwc3.yaml | 12 ++++++++++++
> > > > >  1 file changed, 12 insertions(+)
> > > > >
> > > >
> > > > My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> > > > on your patch (DT_CHECKER_FLAGS is new in v5.13):
> > > >
> > > > yamllint warnings/errors:
> > > >
> > > > dtschema/dtc warnings/errors:
> > > > schemas/usb/snps,dwc3.yaml: ignoring, error in schema: properties:
> > > > snps,ref-
> > > > clock-fladj
> > >
> > > I'm assuming this schema file needs to be updated, but I'm not sure where
> > > it
> > > lives? I don't see such a file in the devicetree-org/dt-schema repo?
> >
> > Try Documentation/devicetree/bindings/usb/snps,dwc3.yaml
>
> That's the one I'm patching, but it seems like it is comparing that to another
> schema file that I can't find, and is unhappy because the new property I'm
> adding isn't there? The way it's defined in the bindings file itself seems no
> different from the others:

The problem is in Documentation/devicetree/bindings/usb/snps,dwc3.yaml
with the property you added. It is as simple as that. It's failing on
the meta-schema vendor-props.yaml which is in the dtschema repo (and
also on your computer where dtschema is installed).

Just run:

dt-doc-validate -u Documentation/devicetree/bindings/
Documentation/devicetree/bindings/usb/snps,dwc3.yaml

>
> dtschema/dtc warnings/errors:
> schemas/usb/snps,dwc3.yaml: ignoring, error in schema: properties: snps,ref-
> clock-fladj
> /builds/robherring/linux-dt-
> review/Documentation/devicetree/bindings/usb/snps,dwc3.yaml:
> properties:snps,ref-clock-fladj: 'oneOf' conditional failed, one must be fixed:

The important parts are what came after the above. Read the 'hints'.

Rob
