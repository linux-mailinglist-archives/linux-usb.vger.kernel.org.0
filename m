Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1C0641DE5D
	for <lists+linux-usb@lfdr.de>; Thu, 30 Sep 2021 18:05:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348156AbhI3QHS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 30 Sep 2021 12:07:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348158AbhI3QHO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 30 Sep 2021 12:07:14 -0400
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D22DC06176D
        for <linux-usb@vger.kernel.org>; Thu, 30 Sep 2021 09:05:32 -0700 (PDT)
Received: by mail-oi1-x229.google.com with SMTP id w206so7914847oiw.4
        for <linux-usb@vger.kernel.org>; Thu, 30 Sep 2021 09:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=vYKsPBiDJqWgn94z0UrisRrDiPIkl/InaR+MbnDzd8o=;
        b=XhAVOr/0A4R/z99tlCeSSHraD2rZ5vHyFbhTb43A/MXaFjTdRn+YxPnSnr1gS5DDF9
         8uKdNk+GEVCTF6jBsbp7QiwGS2/UWZ0UOBqGCAkVw+TITRFWXcCa1t9MKQX3c1GRGt1F
         jvYccHHP5wBGLZcruY3bA3Yfi2fTnH0pmQHx4S/KXKGyM/DPAen3gCCaglOumcRoiejK
         vsApbVLIdx6ZrUVI6P+zV9rtBwob8R8V/bdBTbtI75T39PmMgTDsZUi1GOQOodK2jkUp
         Azjel8ZfF9N+C2z29j3eN1LjCz/NSn2+rzolTfTiGoU3WUhSwJAPblDHUP/jM6fE32I/
         CGIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vYKsPBiDJqWgn94z0UrisRrDiPIkl/InaR+MbnDzd8o=;
        b=ii91FX3ILQNU0g9XT67pXvc0jDGLq3A2JRTDGTVBRM78WCFj7pofb/ZUf9TkcoRSXX
         wPGZEzYzhegf7uHG+ZN8xX5YTC2AxLyCvKnZP5UKJ5gtMVMUYs711KyAA+ix1SlY9ROL
         rY79WpOWt9zA02s2zY8FTbLf6m45KBDTSRp92tEUo2GUZjj700oD4zUAVD4Ul1W/zFFV
         unZDLYIUQZB1vbDuCbnAYZ4cB8am9D1080kK840T/bvs4Ej4ILbERQcw0qBvh++rSn5G
         1AKK+6lSQFMfGh9zPqDEbd7MiYx0gd8i0J3ldM13JEWr5ZLhvpLFodUSO6R7631Y89WE
         HMrg==
X-Gm-Message-State: AOAM532MVHy9DUwx/5aCCeyxsqCPnnR4WkHwDNYYsBktkx78QlH68hri
        1h8rn+RK6C+atl1PEVqVv8GzoA==
X-Google-Smtp-Source: ABdhPJzkcIYZeTpr8veDVdd9USNDj/qqDvR5BA6ShZH//YGQawtDR/aJqibAv9FK+9S05XHjuwQutQ==
X-Received: by 2002:a05:6808:144b:: with SMTP id x11mr3467780oiv.111.1633017931479;
        Thu, 30 Sep 2021 09:05:31 -0700 (PDT)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id b2sm248127ooi.25.2021.09.30.09.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Sep 2021 09:05:31 -0700 (PDT)
Date:   Thu, 30 Sep 2021 09:07:20 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sandeep Maheswaram <sanm@codeaurora.org>
Cc:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Pratham Pratap <prathampratap@codeaurora.org>
Subject: Re: [PATCH 1/3] dt-bindings: usb: qcom,dwc3: Add multi-pd bindings
 for dwc3 qcom
Message-ID: <YVXguCSrsdMoCCXH@ripper>
References: <1630346073-7099-1-git-send-email-sanm@codeaurora.org>
 <1630346073-7099-2-git-send-email-sanm@codeaurora.org>
 <YTduDqCO9aUyAsw1@ripper>
 <e947695b-cd50-391b-3de9-3c028dbddab2@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e947695b-cd50-391b-3de9-3c028dbddab2@codeaurora.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu 30 Sep 02:41 PDT 2021, Sandeep Maheswaram wrote:

> 
> On 9/7/2021 7:20 PM, Bjorn Andersson wrote:
> > On Mon 30 Aug 10:54 PDT 2021, Sandeep Maheswaram wrote:
> > 
> > > Add multi pd bindings to set performance state for cx domain
> > > to maintain minimum corner voltage for USB clocks.
> > > 
> > > Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> > > ---
> > >   Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 13 ++++++++++++-
> > >   1 file changed, 12 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> > > index e70afc4..838d9c4 100644
> > > --- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> > > +++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> > > @@ -41,7 +41,18 @@ properties:
> > >     power-domains:
> > >       description: specifies a phandle to PM domain provider node
> > > -    maxItems: 1
> > > +    minItems: 1
> > > +    items:
> > > +      - description: optional,cx power domain
> > > +      - description: USB gdsc power domain
> > > +
> > > +  power-domain-names:
> > > +     items:
> > > +      - const: cx
> > > +      - const: usb_gdsc
> > But "usb_gdsc" is a subdomain of "cx", why can't we describe this fact
> > in gcc?
> > 
> > Regards,
> > Bjorn
> Thanks for your review.
> Any idea on how can this be described in gcc ? Can you point any reference
> for this .
> 

There's a series from Dmitry that defines such a relationship between
MDSS_GDSC and the MMCX domain on SM8250. This seems like a continuation
of that support, given that we have multiple parent domains (cx, mx
etc).

You can find that discussion here:

https://lore.kernel.org/all/20210727202004.712665-1-dmitry.baryshkov@linaro.org/

Regards,
Bjorn

> Regards
> Sandeep
> > > +
> > > +  required-opps:
> > > +    description: specifies the performance state to cx power domain
> > >     clocks:
> > >       description:
> > > -- 
> > > QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> > > of Code Aurora Forum, hosted by The Linux Foundation
> > > 
