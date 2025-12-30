Return-Path: <linux-usb+bounces-31827-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C6819CE8A75
	for <lists+linux-usb@lfdr.de>; Tue, 30 Dec 2025 04:41:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3FB723014A25
	for <lists+linux-usb@lfdr.de>; Tue, 30 Dec 2025 03:41:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB96F2DF3CC;
	Tue, 30 Dec 2025 03:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qvQBAtQs"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D5AEEA8;
	Tue, 30 Dec 2025 03:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767066101; cv=none; b=SPwfeJ4T6AGhsnZAG/fjzb+0gdv7zKMLoDbSif6efZkoesOJRkvt5gWbsMIrHuEodvgpXQVE1wBcPlC6xdZiWc/iY1ZFNLq3ZzeyUqjY02dnuWuH4cOV/ZP4nnKkefBuxzGDUnCWaTj5c4QMIURtxW+TxXPuq5A1D0XFf2JViRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767066101; c=relaxed/simple;
	bh=FBYZJLqTJj6T2CX6kHrfFxJOGHTG7o2x6HGNVT60X5M=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=T84sfgqAe0btzJ0rUCCXnqx/YeJFwkuwD2DcXNmYHwmzSVbd89JcBMmJ9F36LDTsVVxn/xSDfxCXGu4h3zV1KPvefhBPjPRBcp9INfHp0qK9nXf7kfg/Vne6F4vmsqvC0hmCvOqmVtaXdXbeFEbZKEXENSFhz6P0ar5o0PVpAr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qvQBAtQs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACAE5C4CEFB;
	Tue, 30 Dec 2025 03:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767066100;
	bh=FBYZJLqTJj6T2CX6kHrfFxJOGHTG7o2x6HGNVT60X5M=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=qvQBAtQs6VCjF05fQp//RYcW5/clAwkEWZcIAVdrEFtaVrhmCPWCZQ37T6UAi+WW1
	 +gefcz+yXppeFw9K6fvcUIM+iLHnaBOKDeAD2REOuya6o/gQ9LMI+VcSYf4hx7JXJ5
	 o6/3rjwKYP++mn3V+huuwTmy2AtvPLbgLD6tgPqvvREh2GYC4Tb166+9rwwJRCSRjX
	 UaKzZUgsOhXJwDDsrA8PUl5gQ3ae1Qvozeo5SuQ9vQELJYV39Egq2hZj2A/wFfwF1t
	 SfEclDYykILBvlp/QmgpRo8mwuGvLBLuce+efMxkFh6AFCXgIzWBFzSrViv+u0nSA1
	 yENqwPDAhv58Q==
Date: Mon, 29 Dec 2025 21:41:39 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-phy@lists.infradead.org, aou@eecs.berkeley.edu, 
 devicetree@vger.kernel.org, pjw@kernel.org, alex@ghiti.fr, conor@kernel.org, 
 gregkh@linuxfoundation.org, neil.armstrong@linaro.org, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, vkoul@kernel.org, 
 krzk+dt@kernel.org, linux-riscv@lists.infradead.org, palmer@dabbelt.com
To: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
In-Reply-To: <20251230023725.15966-4-jiayu.riscv@isrc.iscas.ac.cn>
References: <20251230023725.15966-1-jiayu.riscv@isrc.iscas.ac.cn>
 <20251230023725.15966-4-jiayu.riscv@isrc.iscas.ac.cn>
Message-Id: <176706609879.3313806.3074189602443802489.robh@kernel.org>
Subject: Re: [PATCH 3/5] dt-bindings: usb: dwc2: Add support for Canaan
 K230 SoC


On Tue, 30 Dec 2025 10:37:22 +0800, Jiayu Du wrote:
> Add 'canaan,k230-usb' compatible string with 'snps,dwc2' as fallback
> for the DWC2 IP which is used by Canaan K230.
> 
> Signed-off-by: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
> ---
>  Documentation/devicetree/bindings/usb/dwc2.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/canaan/canaan,k230-hisys-cfg.yaml: Unresolvable reference: schemas/phy/canaan,k230-usb-phy.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/phy/canaan,k230-usb-phy.yaml: properties:reg: {'description': 'Two register regions for USB PHY in HiSysConfig syscon block.', 'items': [{'description': 'USB PHY test control reg (pullup/pulldown config)'}, {'description': 'USB PHY core control reg (PLL/transceiver tuning)'}], 'minItems': 2, 'maxItems': 2} should not be valid under {'required': ['maxItems']}
	hint: "maxItems" is not needed with an "items" list
	from schema $id: http://devicetree.org/meta-schemas/items.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/phy/canaan,k230-usb-phy.yaml: properties:reg: 'oneOf' conditional failed, one must be fixed:
	False schema does not allow 2
	[{'description': 'USB PHY test control reg (pullup/pulldown config)'}, {'description': 'USB PHY core control reg (PLL/transceiver tuning)'}] is too long
	[{'description': 'USB PHY test control reg (pullup/pulldown config)'}, {'description': 'USB PHY core control reg (PLL/transceiver tuning)'}] is too short
	1 was expected
	hint: "minItems" is only needed if less than the "items" list length
	from schema $id: http://devicetree.org/meta-schemas/items.yaml
Lexical error: Documentation/devicetree/bindings/soc/canaan/canaan,k230-hisys-cfg.example.dts:27.35-56 Unexpected 'K230_HS_USB0_AHB_GATE'
Lexical error: Documentation/devicetree/bindings/soc/canaan/canaan,k230-hisys-cfg.example.dts:34.35-56 Unexpected 'K230_HS_USB1_AHB_GATE'
FATAL ERROR: Syntax error parsing input tree
make[2]: *** [scripts/Makefile.dtbs:145: Documentation/devicetree/bindings/soc/canaan/canaan,k230-hisys-cfg.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1565: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20251230023725.15966-4-jiayu.riscv@isrc.iscas.ac.cn

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


