Return-Path: <linux-usb+bounces-2094-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4E77D42CF
	for <lists+linux-usb@lfdr.de>; Tue, 24 Oct 2023 00:42:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F2885B20CE1
	for <lists+linux-usb@lfdr.de>; Mon, 23 Oct 2023 22:42:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E53722F1D;
	Mon, 23 Oct 2023 22:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4617822337;
	Mon, 23 Oct 2023 22:42:09 +0000 (UTC)
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EB2610D;
	Mon, 23 Oct 2023 15:42:08 -0700 (PDT)
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-5842a7fdc61so1783574eaf.3;
        Mon, 23 Oct 2023 15:42:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698100927; x=1698705727;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OQtZrDjxMO0cn6Z1v3NtG+S2tU9MQ3gDl1rlW3lNWy0=;
        b=l40lAiaLG15ugjRlFfYqAlN6SMq0cK3BXnRwJ70ixggMKlQEwUxietAQbfKIEQcxpJ
         fWSWTAiHBp0m+jRG8QZBN8aaQ73x6ikIzfSrXK9pXILXL2F4x2ELnZ8BlxOcYePJyXbU
         5HTn5+dOkkKMdql6sx2a6gblWM5KEulqny9K2P9Ex4H09e7lWXksad8kzPfas5nOstjL
         mBKEVGIhvZVFmVLs+jGQ6gvyRMyHhL8oqlWD2swEkUhes6iOucEgqbkqEuSH1X7F11HG
         dMoXKmao/rXw/geBqyoHPRsi4XqrdyQl5ppjmNnIuKv6El1gIveLJwjIgdvSQTeXhoII
         xlAg==
X-Gm-Message-State: AOJu0YxVxaz6p6vjLD6y3B8+aCxtU9cQpL+OgB9zjt6pBGuQnCtKZZOm
	eMFzB0v64UfCN+sfQd7GBVkTCsg/aA==
X-Google-Smtp-Source: AGHT+IEx9L2hGghv2/kE/n011his5PMYgI+6kmyvJkZKOk/GWfuvIwxtr8nh8WcfcPdwpBQQHnFGOQ==
X-Received: by 2002:a4a:d032:0:b0:57b:7e41:9f11 with SMTP id w18-20020a4ad032000000b0057b7e419f11mr9924525oor.2.1698100927290;
        Mon, 23 Oct 2023 15:42:07 -0700 (PDT)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id w13-20020a4adecd000000b0057b95dc4c44sm1696534oou.48.2023.10.23.15.42.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 15:42:06 -0700 (PDT)
Received: (nullmailer pid 1724522 invoked by uid 1000);
	Mon, 23 Oct 2023 22:42:05 -0000
Date: Mon, 23 Oct 2023 17:42:05 -0500
From: Rob Herring <robh@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Conor Dooley <conor@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, linux-rockchip@lists.infradead.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v4 1/3] dt-bindings: usb: add rk3588 compatible to
 rockchip,dwc3
Message-ID: <20231023224205.GA1163435-robh@kernel.org>
References: <20231020150022.48725-1-sebastian.reichel@collabora.com>
 <20231020150022.48725-2-sebastian.reichel@collabora.com>
 <20231020-shudder-tackle-cc98a82f1cd0@spud>
 <20231020160329.uqgjjr6ubfrcqjkj@mercury.elektranox.org>
 <20231022214219.GA706888-robh@kernel.org>
 <20231023001803.7fylnbv74zp2ynx7@mercury.elektranox.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231023001803.7fylnbv74zp2ynx7@mercury.elektranox.org>

On Mon, Oct 23, 2023 at 02:18:03AM +0200, Sebastian Reichel wrote:
> Hi Rob,
> 
> On Sun, Oct 22, 2023 at 04:42:19PM -0500, Rob Herring wrote:
> > On Fri, Oct 20, 2023 at 06:03:29PM +0200, Sebastian Reichel wrote:
> > > On Fri, Oct 20, 2023 at 04:36:19PM +0100, Conor Dooley wrote:
> > > > On Fri, Oct 20, 2023 at 04:11:40PM +0200, Sebastian Reichel wrote:
> > > > > [...]
> > > > > +allOf:
> > > > > +  - $ref: snps,dwc3.yaml#
> > > > > +  - if:
> > > > > +      properties:
> > > > > +        compatible:
> > > > > +          contains:
> > > > > +            const: rockchip,rk3328-dwc3
> > > > > +    then:
> > > > > +      properties:
> > > > > +        clocks:
> > > > > +          minItems: 3
> > > > > +          maxItems: 4
> > > > > +        clock-names:
> > > > > +          minItems: 3
> > > > > +          items:
> > > > > +            - const: ref_clk
> > > > > +            - const: suspend_clk
> > > > > +            - const: bus_clk
> > > > > +            - const: grf_clk
> > > > 
> > > > minItems for clocks and clock-names is already 3, is it not?
> > > 
> > > Yes, but the following 'maxItems: 4' implicitly sets it to 4,
> > > so I had to set it again. The same is true for clock-names -
> > > providings new 'items:' effectively drops the "minItems: 3"
> > > from the generic section.
> > 
> > Are you sure? We don't add anything implicit in the if/then schemas. 
> > Could be a tool issue though.
> 
> I had this issue in the past. But just in case I also did a re-test
> before sending my last mail and I did get a warning. So yes, I'm
> quite sure :)

Well, I'm quite surprised no one else noticed. Anyways, I'm working on a 
fix for it. In the meantime, just leave it as you have it.

Note that there's an existing error in this binding I noticed in the 
example. The clocks and clock-names lengths don't match.

Rob

