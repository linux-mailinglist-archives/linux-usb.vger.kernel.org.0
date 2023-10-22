Return-Path: <linux-usb+bounces-2060-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F237D261E
	for <lists+linux-usb@lfdr.de>; Sun, 22 Oct 2023 23:42:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C9ACDB20DA1
	for <lists+linux-usb@lfdr.de>; Sun, 22 Oct 2023 21:42:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4E4513AED;
	Sun, 22 Oct 2023 21:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C562279D3;
	Sun, 22 Oct 2023 21:42:23 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B71BE5;
	Sun, 22 Oct 2023 14:42:22 -0700 (PDT)
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3b2e22a4004so2026478b6e.3;
        Sun, 22 Oct 2023 14:42:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698010942; x=1698615742;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XD6hNKWqp4dlOId5gsO4sOaKWKbRB4aMfCpeXMgYAks=;
        b=H2qBXVE5yjMOnOmTFUzTMf951wDgBlySfakhbSgFpZxkJ2R1L7TOpB1UAguFKVFaCT
         GFGj/zJMrbSdu2LpmevAW6F9jFlLgA+DloBhNAD+5YYcSNjSbPg1D3rxsKsKuk8uhajD
         owCLNae/IWBZ/nKN6+/eBnG7PG/jqpeS7yZCY4oxPCx0mlpHMQZv4WphqQeFI6zvD6mV
         2cMXk5bh/j2NS63idkHek+bxGmdqI4+At9vQP8gZpHk2oWZnPoYatmRQ7Q0Xei7TwhGp
         103u/TnQNNwU2vV0Qy+lwQxt2J/qexT2Slz0vs7sodG8lkbhkWqumXGq8M/odyzx3jiu
         DVQw==
X-Gm-Message-State: AOJu0Yx1HNM1wkCNg4kkg8QkBxPTPSYLidCMScTUa4tAxWwRwMVTu3oP
	BrKqEs4VqiS4Jsro5hHDYA==
X-Google-Smtp-Source: AGHT+IHtnYoRv+W2kAG7aMLEsfhEq8v6lHvAvr7C6bOY3fLoAYpynDcTsoQtDY8VI4Ae+1twkAxDgA==
X-Received: by 2002:a05:6808:222a:b0:3ae:5442:ed11 with SMTP id bd42-20020a056808222a00b003ae5442ed11mr11305393oib.54.1698010941722;
        Sun, 22 Oct 2023 14:42:21 -0700 (PDT)
Received: from herring.priv ([2607:fb91:e6c1:8e5d:a109:ceb8:bec4:d970])
        by smtp.gmail.com with ESMTPSA id u15-20020a056808150f00b003ae5cb55513sm1229441oiw.38.2023.10.22.14.42.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Oct 2023 14:42:21 -0700 (PDT)
Received: (nullmailer pid 721245 invoked by uid 1000);
	Sun, 22 Oct 2023 21:42:19 -0000
Date: Sun, 22 Oct 2023 16:42:19 -0500
From: Rob Herring <robh@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Conor Dooley <conor@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, linux-rockchip@lists.infradead.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v4 1/3] dt-bindings: usb: add rk3588 compatible to
 rockchip,dwc3
Message-ID: <20231022214219.GA706888-robh@kernel.org>
References: <20231020150022.48725-1-sebastian.reichel@collabora.com>
 <20231020150022.48725-2-sebastian.reichel@collabora.com>
 <20231020-shudder-tackle-cc98a82f1cd0@spud>
 <20231020160329.uqgjjr6ubfrcqjkj@mercury.elektranox.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231020160329.uqgjjr6ubfrcqjkj@mercury.elektranox.org>

On Fri, Oct 20, 2023 at 06:03:29PM +0200, Sebastian Reichel wrote:
> Hi Conor,
> 
> On Fri, Oct 20, 2023 at 04:36:19PM +0100, Conor Dooley wrote:
> > On Fri, Oct 20, 2023 at 04:11:40PM +0200, Sebastian Reichel wrote:
> > > [...]
> > > +allOf:
> > > +  - $ref: snps,dwc3.yaml#
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          contains:
> > > +            const: rockchip,rk3328-dwc3
> > > +    then:
> > > +      properties:
> > > +        clocks:
> > > +          minItems: 3
> > > +          maxItems: 4
> > > +        clock-names:
> > > +          minItems: 3
> > > +          items:
> > > +            - const: ref_clk
> > > +            - const: suspend_clk
> > > +            - const: bus_clk
> > > +            - const: grf_clk
> > 
> > minItems for clocks and clock-names is already 3, is it not?
> 
> Yes, but the following 'maxItems: 4' implicitly sets it to 4,
> so I had to set it again. The same is true for clock-names -
> providings new 'items:' effectively drops the "minItems: 3"
> from the generic section.

Are you sure? We don't add anything implicit in the if/then schemas. 
Could be a tool issue though.

Rob

