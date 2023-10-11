Return-Path: <linux-usb+bounces-1434-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 062147C4A98
	for <lists+linux-usb@lfdr.de>; Wed, 11 Oct 2023 08:31:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3698F1C20D2B
	for <lists+linux-usb@lfdr.de>; Wed, 11 Oct 2023 06:31:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8B82171A0;
	Wed, 11 Oct 2023 06:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h0+TZTiZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B62179BC;
	Wed, 11 Oct 2023 06:31:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDFF4C433C7;
	Wed, 11 Oct 2023 06:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697005894;
	bh=zvpSv8bmJ90ROuqL9qzQWu4rBI3ZmjnN0yYWmOHl4i8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=h0+TZTiZ5yN+tsWxZmFQ7Vdu+xS8Tgcbro3PWnOTfyMxELldEukn/XHur31AHGMLX
	 dZc7JAqHCdvlH7aPHQCGWTAbAWVQa6Di/i5RG5C7Gqs7nkTndPGSkrK/CeoZTpHxOx
	 7JjA3Mixo3ED2YBbmCLi/V8C1UE2qaNZmuz6jEAjxUIXQ31h6ZTQZPWni0tM2sswsK
	 FlRvua1ZSF62GIfDZUsGFR3JTJdZepcqtyIcaC/17F9LuR9WE3UiR7dTWo8eEbXPdy
	 N8geQNXbrH+qhhgVlTjnDznm8M/Qrmow/kfxkJVUNNuYlYDn9EYYYTHgAwo7kezKge
	 N5jEx1OZX3UHg==
Received: (nullmailer pid 2911056 invoked by uid 1000);
	Wed, 11 Oct 2023 06:31:32 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Anand Moon <linux.amoon@gmail.com>
Cc: Icenowy Zheng <uwu@icenowy.me>, linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, linux-usb@vger.kernel.org
In-Reply-To: <20231011051152.133257-1-linux.amoon@gmail.com>
References: <20231011051152.133257-1-linux.amoon@gmail.com>
Message-Id: <169700589265.2911018.855796610271678067.robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: usb: Add the binding example for
 the Genesys Logic GL3523 hub
Date: Wed, 11 Oct 2023 01:31:32 -0500


On Wed, 11 Oct 2023 10:41:48 +0530, Anand Moon wrote:
> Add the binding example for the USB3.1 Genesys Logic GL3523
> integrates with USB 3.1 Gen 1 Super Speed and USB 2.0 High-Speed
> hub.
> 
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
> New patch.
> ---
>  .../bindings/usb/genesys,gl850g.yaml          | 28 +++++++++++++++++--
>  1 file changed, 25 insertions(+), 3 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/usb-hcd.example.dtb: hub@1: 'reset-gpios' is a required property
	from schema $id: http://devicetree.org/schemas/usb/genesys,gl850g.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/usb-hcd.example.dtb: hub@1: 'vdd-supply' is a required property
	from schema $id: http://devicetree.org/schemas/usb/genesys,gl850g.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/usb-hcd.example.dtb: hub@1: 'peer-hub' is a required property
	from schema $id: http://devicetree.org/schemas/usb/genesys,gl850g.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/usb-device.example.dtb: hub@1: 'reset-gpios' is a required property
	from schema $id: http://devicetree.org/schemas/usb/genesys,gl850g.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/usb-device.example.dtb: hub@1: 'vdd-supply' is a required property
	from schema $id: http://devicetree.org/schemas/usb/genesys,gl850g.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/usb-device.example.dtb: hub@1: 'peer-hub' is a required property
	from schema $id: http://devicetree.org/schemas/usb/genesys,gl850g.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20231011051152.133257-1-linux.amoon@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


