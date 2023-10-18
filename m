Return-Path: <linux-usb+bounces-1860-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1595C7CE0DE
	for <lists+linux-usb@lfdr.de>; Wed, 18 Oct 2023 17:12:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4B754B211D0
	for <lists+linux-usb@lfdr.de>; Wed, 18 Oct 2023 15:12:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1CE938BC5;
	Wed, 18 Oct 2023 15:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y54PYHPh"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2848038BB8;
	Wed, 18 Oct 2023 15:12:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E983C433C8;
	Wed, 18 Oct 2023 15:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697641955;
	bh=fr5zaOzgWJ22rsMn0JC7sZ22BkfuCDopCtSjW7N5yHs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y54PYHPhnx82rs4cdBxW3IACo8wtYtFZj8XIckJ1LFZNhwI9DMPwpuDG5JCfRI2AA
	 oiQ8JOV/Chsam/a8AZF+yt/TSYEMChNppUd6dZbGF/zd7PXeL6mC/xHEK6W1mGG7hQ
	 rrpzGiW4bUTwf8qHe7DfntG/0fOdFIbMtuWkh69kU+wjdbBXYSTyASgLhvcColAibY
	 /xOSn/qmxjXsTvBEZU0AldcfXSuo0LkbA057OhTfa0jzg6iPI67BvQT05wGhPoLE4u
	 iCQmpqgnEtpCgC0TsMlxMmo3xD49FhR+ddYTUbp8pg3psdbGVBQ8b24+oR8fMB3yMn
	 2oC+2Ph37KUog==
Date: Wed, 18 Oct 2023 23:00:22 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Anand Moon <linux.amoon@gmail.com>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: usb: vialab,vl817: remove reset-gpios from
 required list
Message-ID: <ZS/zBvaWicGAeaGq@xhacker>
References: <20231017160158.1065-1-jszhang@kernel.org>
 <04ee08a4-e804-40fe-b24e-7a56c9e24e8b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <04ee08a4-e804-40fe-b24e-7a56c9e24e8b@linaro.org>

On Tue, Oct 17, 2023 at 06:53:56PM +0200, Krzysztof Kozlowski wrote:
> On 17/10/2023 18:01, Jisheng Zhang wrote:
> > The "reset-gpios" is optional in real case, for example reset pin is
> > is hard wired to "high". And this fact is also reflected by the
> > devm_gpio_get_optional() calling in driver code.
> > 
> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > ---
> >  .../bindings/usb/thead,th1520-usb.yaml        | 42 ++++++++++---------
> >  .../devicetree/bindings/usb/vialab,vl817.yaml |  1 -
> >  2 files changed, 23 insertions(+), 20 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/usb/thead,th1520-usb.yaml b/Documentation/devicetree/bindings/usb/thead,th1520-usb.yaml
> > index afb618eb5013..ce1cab75f0ff 100644
> > --- a/Documentation/devicetree/bindings/usb/thead,th1520-usb.yaml
> > +++ b/Documentation/devicetree/bindings/usb/thead,th1520-usb.yaml
> > @@ -28,6 +28,10 @@ properties:
> >  
> >    ranges: true
> >  
> > +  thead,misc-syscon:
> > +    $ref: /schemas/types.yaml#/definitions/phandle-array
> > +    description: a phandle to the misc system register controller syscon node.
> 
> Either you combined two unrelated changes or this should be resets from
> reset-controller.

oops, this change isn't expected... I was working on TH1520 usb but
add local changes step by step, but then found vl817 need to be patched.
I forgot to reset TH1520 usb part. Sorry for noise. V2 will be sent out
soon.

