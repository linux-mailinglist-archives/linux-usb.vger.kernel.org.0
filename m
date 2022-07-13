Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C8C3573915
	for <lists+linux-usb@lfdr.de>; Wed, 13 Jul 2022 16:43:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236586AbiGMOn1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 Jul 2022 10:43:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236598AbiGMOn0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 13 Jul 2022 10:43:26 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5993B2ED73
        for <linux-usb@vger.kernel.org>; Wed, 13 Jul 2022 07:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1657723402;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=H4v+SMT4YyFBFqIk3h1YXOzJcv6SHCw5As/1u7zBjaA=;
        b=fxdOT9H7a3HaCFj0KLmn40Fm4kShfd2tZN4qm6mWdmFIvyrAOR8qeQdv447k50adjp8mHn
        atUDLw+E+RJSQpdzvNz4psHGkg7vULVT3OkLXvbj4UsZ6zI7i3DaU0jJ6SgPVxik0NCkOX
        RLxEu2ldlnGrOqYvjytsqmIiSvBlA5U=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-629-uD1M8WYjOh2FBmJIvNvgQg-1; Wed, 13 Jul 2022 10:43:19 -0400
X-MC-Unique: uD1M8WYjOh2FBmJIvNvgQg-1
Received: by mail-qv1-f70.google.com with SMTP id fc20-20020ad44f34000000b00472ff2a85beso3854630qvb.4
        for <linux-usb@vger.kernel.org>; Wed, 13 Jul 2022 07:43:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=H4v+SMT4YyFBFqIk3h1YXOzJcv6SHCw5As/1u7zBjaA=;
        b=Bsi0mAF7Kd5ReEb/cdAKGZ5EbxAz40tjPB3AiReCfwUwffP2gCpCbh1F8O1hkuoK6H
         zAGy9toO0arEud2LlAGUHbTZugk2UkklOXfE61fDxda72LQ1G0xJrNfQx+32K6vBuxae
         751CCy+TH0dmZVJDG0OX9gz1GzDZk1mRhokxkubVajYAE7VlscEzS/2mer00YvK1UmoL
         HjGy4yoeKl0etH1WfyVN6WA1eVrbsgBz8EuLrX/x+TKLCsaLpUJJxfFOT8xWTNgThjwT
         vF02w44LX68a1QXBo/2dhxNR0eu6NNVtaK8VK3lknhyaxQITfzCJf1rF/ga/rI/vpRxM
         sUhg==
X-Gm-Message-State: AJIora+5j9Q+jivL/rAWQRkOsfDPbFIY9BFFdlWPW+ddSPFvTDHJoB1r
        sOzoLmKLPiuBdsjAzjPYEnJcBjJo/95winqt4khykBI1fVB2YfBeSJGYetZF5jXhBrW/tLK8RS9
        /f7BPG1mP9pf5smDoNo+y
X-Received: by 2002:a05:6214:d0a:b0:473:584f:273d with SMTP id 10-20020a0562140d0a00b00473584f273dmr3178900qvh.127.1657723398345;
        Wed, 13 Jul 2022 07:43:18 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vVehCzGhVquOdqnAhdxWfZLL8LwuEOx6uq5tz/bi4ruQ+Vc8Bgb4U7OGBQUaph9+ojKaRgbw==
X-Received: by 2002:a05:6214:d0a:b0:473:584f:273d with SMTP id 10-20020a0562140d0a00b00473584f273dmr3178858qvh.127.1657723397983;
        Wed, 13 Jul 2022 07:43:17 -0700 (PDT)
Received: from halaneylaptop ([2600:1700:1ff0:d0e0::2e])
        by smtp.gmail.com with ESMTPSA id s7-20020a05620a254700b006a6b374d8bbsm12386760qko.69.2022.07.13.07.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jul 2022 07:43:17 -0700 (PDT)
Date:   Wed, 13 Jul 2022 09:43:10 -0500
From:   Andrew Halaney <ahalaney@redhat.com>
To:     Johan Hovold <johan@kernel.org>
Cc:     Johan Hovold <johan+linaro@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Felipe Balbi <balbi@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/7] arm64: dts: qcom: sc8280xp: fix USB interrupts
Message-ID: <20220713144310.kehfuqvfhsjb36ri@halaneylaptop>
References: <20220713131340.29401-1-johan+linaro@kernel.org>
 <20220713131340.29401-6-johan+linaro@kernel.org>
 <20220713141228.5z5rmgepj6mepjyp@halaneylaptop>
 <Ys7YKkRAAI0Vbseh@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Ys7YKkRAAI0Vbseh@hovoldconsulting.com>
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jul 13, 2022 at 04:35:22PM +0200, Johan Hovold wrote:
> On Wed, Jul 13, 2022 at 09:12:28AM -0500, Andrew Halaney wrote:
> > On Wed, Jul 13, 2022 at 03:13:38PM +0200, Johan Hovold wrote:
> > > The two single-port SC8280XP USB controllers do not have an hs_phy_irq
> > > interrupt. Instead they have a pwr_event interrupt which is distinct
> > > from the former and not yet supported by the driver.
> > > 
> > > Fix the USB node interrupt names so that they match the devicetree
> > > binding.
> > > 
> > > Fixes: 152d1faf1e2f ("arm64: dts: qcom: add SC8280XP platform")
> > > Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> > > ---
> > >  arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 12 ++++++++----
> > >  1 file changed, 8 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> > > index 45cc7d714fd2..4a7aa9992f3a 100644
> > > --- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> > > @@ -1875,8 +1875,10 @@ usb_0: usb@a6f8800 {
> > >  					      <&pdc 14 IRQ_TYPE_EDGE_BOTH>,
> > >  					      <&pdc 15 IRQ_TYPE_EDGE_BOTH>,
> > >  					      <&pdc 138 IRQ_TYPE_LEVEL_HIGH>;
> > > -			interrupt-names = "hs_phy_irq", "dp_hs_phy_irq",
> > > -					  "dm_hs_phy_irq", "ss_phy_irq";
> > > +			interrupt-names = "pwr_event",
> > > +					  "dp_hs_phy_irq",
> > > +					  "dm_hs_phy_irq",
> > > +					  "ss_phy_irq";
> > >  
> > >  			power-domains = <&gcc USB30_PRIM_GDSC>;
> > >  
> > > @@ -1925,8 +1927,10 @@ usb_1: usb@a8f8800 {
> > >  					      <&pdc 12 IRQ_TYPE_EDGE_BOTH>,
> > >  					      <&pdc 13 IRQ_TYPE_EDGE_BOTH>,
> > >  					      <&pdc 136 IRQ_TYPE_LEVEL_HIGH>;
> > > -			interrupt-names = "hs_phy_irq", "dp_hs_phy_irq",
> > > -					  "dm_hs_phy_irq", "ss_phy_irq";
> > > +			interrupt-names = "pwr_event",
> > > +					  "dp_hs_phy_irq",
> > > +					  "dm_hs_phy_irq",
> > > +					  "ss_phy_irq";
> > 
> > For this specific change to pwr_event:
> > 
> >     Reviewed-by: Andrew Halaney <ahalaney@redhat.com>
> > 
> > That being said, I was reviewing this against the (fairly old)
> > downstream release I have, and the IRQs defined there look like this:
> > 
> > 		interrupts-extended = <&pdc 12 IRQ_TYPE_EDGE_RISING>,
> > 				<&intc GIC_SPI 811 IRQ_TYPE_LEVEL_HIGH>,
> > 				<&pdc 136 IRQ_TYPE_LEVEL_HIGH>,
> > 				<&pdc 13 IRQ_TYPE_EDGE_RISING>;
> > 		interrupt-names = "dp_hs_phy_irq", "pwr_event_irq",
> > 				"ss_phy_irq", "dm_hs_phy_irq";
> > 
> > The part I want to highlight is that the "pwr_event" irq downstream maps
> > to <&intc GIC_SPI 811 IRQ_TYPE_LEVEL_HIGH>, but the current upstream
> > devicetree I'm looking at has it mapped to <&intc GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>
> > 
> > Do you happen to have any source you can also check to confirm if this
> > is a bug or not?
> 
> Good catch! I believe this is another copy-paste error when creating
> base dtsi based on some vendor source (or perhaps an error carried over
> from an earlier version).
> 
> The vendor devicetree I have access to also has 811 here, which matches
> the pattern for usb_0 (dwc3 interrupt + 1).
> 
> Do you mind if I fold a fix for that into a v2 of this patch?
> 
> Thanks for reviewing!

Sounds good, feel free to add my R-B with that change as well!

> 
> Johan
> 

