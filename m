Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C428340061A
	for <lists+linux-usb@lfdr.de>; Fri,  3 Sep 2021 21:49:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239176AbhICTux (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Sep 2021 15:50:53 -0400
Received: from mail-oo1-f48.google.com ([209.85.161.48]:35431 "EHLO
        mail-oo1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234588AbhICTux (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 Sep 2021 15:50:53 -0400
Received: by mail-oo1-f48.google.com with SMTP id y3-20020a4ab403000000b00290e2a52c71so24046oon.2;
        Fri, 03 Sep 2021 12:49:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=grquTj9le7LyKwa10qtUsy6uhDA/Og3HGD4G7QWDUb4=;
        b=XAspmNGbVMjLw7N0oCcgv5jYCaIOtX7WwPdUY5ACqHintGBLOOEbt++nSI/Ui53+4p
         trUbKJKMrTEV3Z/K8pNWHF1MUPaiuHv4eLqvL4JE+Av+WmLKPjHilPo82Z4S5QVFfGqM
         cSZMraa6yS1qww8C6vudS2ssRAMF/NTsTgoV6uNFNz40ZxzlRa6c/lT6MAWMmlqGBZrA
         1TLdyBnYX7FKsio74Go6knBnF/K0M592T4znNZuh+xzHojpRDK/nvtVdvnxhvH0ZpmiL
         WaYC6HVeSWEloZuas9zqVcw7A3RUKScABRW/I3Uga3wu5cLCJLSffNGXPA46W67O8MXK
         xhYw==
X-Gm-Message-State: AOAM531pc3/FLZ2uhJmpEUCYNAkAo3b8XuLOyd/qtIqbJUqSHctTZZXX
        ZXOvjgCKkAjTihdggTWDdFqmvEdVVA==
X-Google-Smtp-Source: ABdhPJzE4B+wXlgP6ywfh4wkKs8nUK6ytNyELJgMM6mJAhKo1xm4kn1xnsFaeB53y4uB+huAG1XsjA==
X-Received: by 2002:a4a:bd17:: with SMTP id n23mr4344751oop.54.1630698592341;
        Fri, 03 Sep 2021 12:49:52 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id 14sm66624otl.50.2021.09.03.12.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 12:49:51 -0700 (PDT)
Received: (nullmailer pid 3345524 invoked by uid 1000);
        Fri, 03 Sep 2021 19:49:50 -0000
Date:   Fri, 3 Sep 2021 14:49:50 -0500
From:   Rob Herring <robh@kernel.org>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     Maxime Ripard <maxime@cerno.tech>, devicetree@vger.kernel.org,
        Frank Rowand <frowand.list@gmail.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 37/52] dt-bindings: usb: dwc3: Fix usb-phy check
Message-ID: <YTJ8Xry7IAMIdpEn@robh.at.kernel.org>
References: <20210901091852.479202-1-maxime@cerno.tech>
 <20210901091852.479202-38-maxime@cerno.tech>
 <87a6kwcvzb.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87a6kwcvzb.fsf@kernel.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Sep 01, 2021 at 03:36:35PM +0300, Felipe Balbi wrote:
> 
> Maxime Ripard <maxime@cerno.tech> writes:
> 
> > The original binding was allowing any combination of usb2-phy and
> > usb3-phy in the phys and phy-names properties.
> >
> > However, the current binding enforces that those properties must be a
> > list of usb2-phy and usb3-phy, with exactly one element, effectively
> > making usb2-phy the only value being valid.
> >
> > Let's rework the properties description to allow either one or two
> > element picked with values either usb2-phy or usb3-phy. The rest of the
> > tooling makes sure that we don't get any duplicate value, so this should
> > be what we want.
> >
> > Cc: Felipe Balbi <balbi@kernel.org>
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Cc: linux-usb@vger.kernel.org
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > ---
> >  Documentation/devicetree/bindings/usb/snps,dwc3.yaml | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
> > index 078fb7889593..c1c970073681 100644
> > --- a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
> > +++ b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
> > @@ -73,15 +73,15 @@ properties:
> >  
> >    phys:
> >      minItems: 1
> > -    items:
> > -      - description: USB2/HS PHY
> > -      - description: USB3/SS PHY
> > +    maxItems: 2
> 
> I'm not sure you should enforce a maximum of 2 PHYs. Some systems may
> use more than one USB2 PHY to take care of different parts of the USB
> link.

It was already limited to 2. This change doesn't change that.

Rob
