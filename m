Return-Path: <linux-usb+bounces-31828-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC52CE8A6F
	for <lists+linux-usb@lfdr.de>; Tue, 30 Dec 2025 04:41:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1C5F33002D07
	for <lists+linux-usb@lfdr.de>; Tue, 30 Dec 2025 03:41:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA4AF2F1FE1;
	Tue, 30 Dec 2025 03:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JLBJMCZB"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 663042E8B8A;
	Tue, 30 Dec 2025 03:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767066102; cv=none; b=Kn4mvu+KoL2UM6gz+pO76+FVg2cCOy/kPRpphgdsoIDcRZ8H4ZZulpXspzLJIZ1HEnEGtHEiUa+SlLiCtdz0eDIFUfYZS5zrt64KzAbT3TXB7gAGaaOq7tlugpLDdU2RLQEnUBnXBT3kls9b9w9mvD7rT1M5dVdJTNn9juEQ+rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767066102; c=relaxed/simple;
	bh=vBm70uEKN6LrjBttlBHkZ4+VsRI0CjQ1k56XQhZmnH0=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=USEK8+DycBJUWn2QA4LDebgSVm19iafk0rFq7mGlhMzpZZgjnjyAk2BU+XY4YmYN23mzWPCXAa/tAYC1Cymlmxhc1bcQc/JsFWJwDGn59YNpQEeWugU64dXzBf7N7EyIvdx2fJJbxCQ23K1o0rwPpAvIKHIB5A6c3Pnm64Vuk6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JLBJMCZB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E36C4C113D0;
	Tue, 30 Dec 2025 03:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767066102;
	bh=vBm70uEKN6LrjBttlBHkZ4+VsRI0CjQ1k56XQhZmnH0=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=JLBJMCZBYXdywuOAj7JR76nzzNKZOxzCOXXNeqAX9OTV1DmPLDRnM/RXS/3pkfDWL
	 4PoAiAWU2Subugv+N7rRVA4uPNjqBS/LX3KQ74yBRdjwkyv+yl3/C7J8bgZlm76cWD
	 IgRWDO7PuGeC8GrQBYeoPLy8DAy23SKzqzv2kFvaNV+SIzZ30vw3uTENCgtVx7KWq5
	 3ChlGv/ju9wJZ5Wk+Rrc10/iMlZl3i02mNIpdjDyw+LC2YjX2XAU4hBHUtNXWhr8tL
	 beJMBhEG+Xzh2zTpMTIXRrT9QJUAMITi/rdp7zURlqLqeMeD4tcyKFPmbr4QBUwcro
	 Nt0Ox/CXFXfAA==
Date: Mon, 29 Dec 2025 21:41:41 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: krzk+dt@kernel.org, linux-riscv@lists.infradead.org, palmer@dabbelt.com, 
 devicetree@vger.kernel.org, linux-phy@lists.infradead.org, 
 gregkh@linuxfoundation.org, vkoul@kernel.org, alex@ghiti.fr, 
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, conor@kernel.org, 
 aou@eecs.berkeley.edu, pjw@kernel.org, neil.armstrong@linaro.org
To: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
In-Reply-To: <20251230023725.15966-3-jiayu.riscv@isrc.iscas.ac.cn>
References: <20251230023725.15966-1-jiayu.riscv@isrc.iscas.ac.cn>
 <20251230023725.15966-3-jiayu.riscv@isrc.iscas.ac.cn>
Message-Id: <176706609979.3313865.8414588586918215477.robh@kernel.org>
Subject: Re: [PATCH 2/5] dt-bindings: soc: canaan: Add top syscon for
 Canaan K230 SoC


On Tue, 30 Dec 2025 10:37:21 +0800, Jiayu Du wrote:
> The Canaan K230 SoC top system controller provides register access
> to configure related modules. It includes a USB2 PHY and eMMC/SDIO PHY.
> 
> Signed-off-by: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
> ---
>  .../soc/canaan/canaan,k230-hisys-cfg.yaml     | 68 +++++++++++++++++++
>  1 file changed, 68 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/canaan/canaan,k230-hisys-cfg.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/canaan/canaan,k230-hisys-cfg.yaml: Unresolvable reference: schemas/phy/canaan,k230-usb-phy.yaml#
Lexical error: Documentation/devicetree/bindings/soc/canaan/canaan,k230-hisys-cfg.example.dts:27.35-56 Unexpected 'K230_HS_USB0_AHB_GATE'
Lexical error: Documentation/devicetree/bindings/soc/canaan/canaan,k230-hisys-cfg.example.dts:34.35-56 Unexpected 'K230_HS_USB1_AHB_GATE'
FATAL ERROR: Syntax error parsing input tree
make[2]: *** [scripts/Makefile.dtbs:145: Documentation/devicetree/bindings/soc/canaan/canaan,k230-hisys-cfg.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1565: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20251230023725.15966-3-jiayu.riscv@isrc.iscas.ac.cn

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


