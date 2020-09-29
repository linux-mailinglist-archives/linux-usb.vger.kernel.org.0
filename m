Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B27B327BAB7
	for <lists+linux-usb@lfdr.de>; Tue, 29 Sep 2020 04:14:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727077AbgI2COl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 28 Sep 2020 22:14:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726421AbgI2COl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 28 Sep 2020 22:14:41 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30137C061755
        for <linux-usb@vger.kernel.org>; Mon, 28 Sep 2020 19:14:41 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id 5so2586978pgf.5
        for <linux-usb@vger.kernel.org>; Mon, 28 Sep 2020 19:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=NJyfJV0mLhvnopBF7R+bmMKM4pD4/rdCgYSx26wTIQQ=;
        b=WeX9L69GnQyTFblx+JruceS9uLJZT3wTAfEH06yPM7treyDdXRmMfVSB7sqs09v5qk
         fDdfP3kdprwfjBcjC5USwBtO+LCxvGMufjgkvMSIduvWiEIQQ7sfgtd3JznTK9ZhLgzw
         LH2IMDposzLFHkQPVNm8IMBPCaSnwavCQJAqU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NJyfJV0mLhvnopBF7R+bmMKM4pD4/rdCgYSx26wTIQQ=;
        b=l66lb7ZNFdDm6bpkS25j9EjoL0p4uz9zrCpu4hxRNkGBnu/YoNZwtZPy4Jqy1QiZVY
         4yOQKDLrdcbnWjdtROwyeLx7zcW+AJ24WJAuAqGfMViC34k314ORPg1FKdKFbPttpubO
         ixCtKn0kAnkCTIgIFMMI2l+YnngMoPYy/jLhXDYGNqydvE/0KG9cEit+xSmrI8GWLTIr
         spyOlM8Od+O+thSO+7xXuQogWgN4JhZ+7x55Ymy2D2KCbxtz2WRNigMcdYIOmcGbmkIq
         9FeVLKro4Dy9zI48Fe41xOjjPtf79TPbPC0zTSx+NfgMjyqh/tTtWvjQWIk4U+9Zo+/h
         GWBA==
X-Gm-Message-State: AOAM530wCr3MzWHDV0s6w6ZUAZiCMRFvJiV5CnhHBFK40kU/hlvd6EN5
        CKZEXU+zygsMLWWT6BrS2UENqa9L952tbA==
X-Google-Smtp-Source: ABdhPJzxfQrnv9qqyOeEAlNcjoz6xg6zHl6YLNk0ci2aubO4kcV3KSuIPgoUGDlZ1pvgC8UfFJSDpg==
X-Received: by 2002:a17:902:a713:b029:d2:6356:8761 with SMTP id w19-20020a170902a713b02900d263568761mr2200547plq.77.1601345680707;
        Mon, 28 Sep 2020 19:14:40 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
        by smtp.gmail.com with ESMTPSA id l13sm2830722pgq.33.2020.09.28.19.14.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2020 19:14:40 -0700 (PDT)
Date:   Mon, 28 Sep 2020 19:14:39 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Doug Anderson <dianders@chromium.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        LKML <linux-kernel@vger.kernel.org>, linux-usb@vger.kernel.org,
        Bastien Nocera <hadess@hadess.net>,
        Stephen Boyd <swboyd@chromium.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Ravi Chandra Sadineni <ravisadineni@chromium.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Peter Chen <peter.chen@nxp.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: usb: Add binding for discrete
 onboard USB hubs
Message-ID: <20200929021439.GC1099144@google.com>
References: <20200928101326.v4.1.I248292623d3d0f6a4f0c5bc58478ca3c0062b49a@changeid>
 <CAD=FV=XWphkhFmEk6dzGn7h2mY5xBHY554rOfn+bSi5Nci27gA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAD=FV=XWphkhFmEk6dzGn7h2mY5xBHY554rOfn+bSi5Nci27gA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Sep 28, 2020 at 03:13:26PM -0700, Doug Anderson wrote:
> Hi,
> 
> On Mon, Sep 28, 2020 at 10:14 AM Matthias Kaehlcke <mka@chromium.org> wrote:
> >
> > +examples:
> > +  - |
> > +    usb_hub: usb-hub {
> > +        compatible = "realtek,rts5411", "onboard-usb-hub";
> > +        vdd-supply = <&pp3300_hub>;

I will admit that using the name 'vdd' for a sole supply is somewhat
arbitrary, if anybody has better suggestions I'm open to it :)

> > +    };
> > +
> > +    usb_controller {
> 
> Super nitty nit: prefer dashes for node names.

ack

> > +        dr_mode = "host";
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        /* 2.0 hub on port 1 */
> > +        hub@1 {
> > +            compatible = "usbbda,5411";
> 
> Presumably we need something in the bindings for "usbbda,5411" ?

I'm not sure how this should look like in a .yaml. Rob, do you have any
suggestions?

Strictly speaking the compatible string isn't needed, the driver will match
the device without it based on VID/PID and the port.

> > +            reg = <1>;
> > +            hub = <&usb_hub>;
> > +        };
> > +
> > +        /* 3.0 hub on port 2 */
> > +        hub@2 {
> > +            compatible = "usbbda,411";
> 
> Presumably we need something in the bindings for "usbbda,411" ?

ditto
