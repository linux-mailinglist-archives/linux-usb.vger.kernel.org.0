Return-Path: <linux-usb+bounces-32379-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2ABD232D1
	for <lists+linux-usb@lfdr.de>; Thu, 15 Jan 2026 09:36:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D44C931102A7
	for <lists+linux-usb@lfdr.de>; Thu, 15 Jan 2026 08:30:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ED6B3375A7;
	Thu, 15 Jan 2026 08:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RnQ994vF"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E8533508B;
	Thu, 15 Jan 2026 08:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768465806; cv=none; b=L94/kOiawq9Es4MrIOQbmO3w2y3nnW0Rrm1HMyqIifSmI2q+vSJWZET+r9b7ahnQuohGxAP4heJmPHz3spRWMfO/4HCxJC6Wg1TDvTMBDja8BK6q8B3x+mChw5RgEFoeCVH8Hy95tMcR1GtrTOUuhsjPWulEto9yGnIEolJ0o0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768465806; c=relaxed/simple;
	bh=PlgI399ItX0zMEfC+5UwO2zrl+leB7wgtmhP+blcFv0=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=qo5I0dnpzH1li3qjReq7+7erIIpwUbLUE7xA4UBQ+dTTyYAbIBazL25N/y94+/6l5IKvDDo1rrhV3+1SbPrD3yNeK5tmXtLSmb0yMmSwEX6xYisW6cJdUDs0uFw9qIdzGGJ2bhcA4NoAZhQls12v+eAT34fbjrmZSPeEbWUxqOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RnQ994vF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DAE1C116D0;
	Thu, 15 Jan 2026 08:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768465804;
	bh=PlgI399ItX0zMEfC+5UwO2zrl+leB7wgtmhP+blcFv0=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=RnQ994vFURPycFo5eH7iciU0c8aDtEfA3XTf2fteC4M2RdxCH/Wy0LV4MeMX2lezD
	 eBJtkvpMvKEM4imHd7vHiXCOrCc9xlJUEnuhMY+QtK8zf4D7ATwR/CkfYOPSsFe4L/
	 2VBF3B8PlgJHPz59osAebBvMSRtw0R1MKOLFMrjpPBg+qWgb5ykCifOi7+2zsFjPlY
	 EJixz4uiv1s97M8mQx0GOO8HIwC90bb6GFPIpPiZckZnnSESokCqDePwMs5DGmR33I
	 WHrehNQZq8yYtiK/Kza9X/Yfct7nxHeETZjlzyEj9dnEwy4aCdiydioD9weYjGIpSp
	 1KwXL8JxrkkoQ==
Date: Thu, 15 Jan 2026 02:30:03 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: vkoul@kernel.org, linux-usb@vger.kernel.org, conor+dt@kernel.org, 
 krzk+dt@kernel.org, linux-kernel@vger.kernel.org, cyy@cyyself.name, 
 alex@ghiti.fr, pjw@kernel.org, kingxukai@zohomail.com, conor@kernel.org, 
 aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org, palmer@dabbelt.com, 
 neil.armstrong@linaro.org, gaohan@iscas.ac.cn, 
 linux-phy@lists.infradead.org, gregkh@linuxfoundation.org, 
 18771902331@163.com, devicetree@vger.kernel.org, TroyMitchell988@gmail.com
To: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
In-Reply-To: <20260115064223.21926-3-jiayu.riscv@isrc.iscas.ac.cn>
References: <20260115064223.21926-1-jiayu.riscv@isrc.iscas.ac.cn>
 <20260115064223.21926-3-jiayu.riscv@isrc.iscas.ac.cn>
Message-Id: <176846580373.38125.3306033410225962520.robh@kernel.org>
Subject: Re: [PATCH v2 2/4] dt-bindings: usb: dwc2: Add support for Canaan
 K230 SoC


On Thu, 15 Jan 2026 14:42:20 +0800, Jiayu Du wrote:
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
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/phy/canaan,k230-usb-phy.example.dtb: usb-phy@91585000 (canaan,k230-usb-phy): reg: [[0, 2438483968], [0, 1024]] is too long
	from schema $id: http://devicetree.org/schemas/phy/canaan,k230-usb-phy.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260115064223.21926-3-jiayu.riscv@isrc.iscas.ac.cn

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


