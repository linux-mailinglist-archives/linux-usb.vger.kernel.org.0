Return-Path: <linux-usb+bounces-18608-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D46809F5CC7
	for <lists+linux-usb@lfdr.de>; Wed, 18 Dec 2024 03:22:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B1A281891099
	for <lists+linux-usb@lfdr.de>; Wed, 18 Dec 2024 02:22:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8078D12F59C;
	Wed, 18 Dec 2024 02:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NubPVAK8"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC7BB182C5;
	Wed, 18 Dec 2024 02:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734488559; cv=none; b=NHx57ZitchdF7vZtayA/T1uYFEe4ZMDs/MK3cFpC7ZizDvu9PWKc5l7FKdd17OdAN22PnkLey1lLB/jHElzEtzS9xIl2PCJJC3G2UGCvtovSkblKPGipKxjxW/v8DXqsJY8Ou7DyA4bgA+6PHU68ziLFu04QchSKSH0+dVI+zp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734488559; c=relaxed/simple;
	bh=heI1OUOEP9bs0UP79AWiCn+zld9HCpic8/hFKnUWZdM=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=aBfCoKBRZRjcTBe3fKCK6go5AdqDQDPjW0r6X4lJDXEtk+oIxdrrP0R6SwY4XM+8RH9iXf+/QkxLUFKVnVSQbV7g1kiU8my0n+4hR6v9rwlwH84HLCBSOX0TMwCF/hsW96kkeCU6IMJs3lq42sakQyXZ3LoxJL55wLxA4+cuuXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NubPVAK8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A4B1C4CED3;
	Wed, 18 Dec 2024 02:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734488558;
	bh=heI1OUOEP9bs0UP79AWiCn+zld9HCpic8/hFKnUWZdM=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=NubPVAK8R5kV2IaxTagxZWS3SC2lT48uu5dklkL/nrIyJFzGokghh2AD8c0PhtK+3
	 Z9qZ538szVDA8qcbl+LfbjhDDXG89o37wM2ByaM413OHiPgz5oMkdh8ynb3HbIW6mU
	 KQFUmDN/Mf5Q8+1Zjhw7TyLCIDPYRFnLAKCvuK1WCUE0qnM18PCiHwwqQ8h8Y4C2Sc
	 7/qA1przGDa2vkffgcVMem+w2Gz4TTIJppWyswBRh48sK2/jCYgFpZg0OP6ppPnrV/
	 7UQE/G0oC/I0UI6e42tZNC83kfi4A42/4b5GdcIiqUnalyHt6Ba9d6QsKYNAY52oKD
	 b3fFg4L61q9tA==
Date: Tue, 17 Dec 2024 20:22:36 -0600
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: conor+dt@kernel.org, James.Li1@synopsys.com, m.felsch@pengutronix.de, 
 Jianheng.Zhang@synopsys.com, linux-kernel@vger.kernel.org, 
 andre.draszik@linaro.org, emanuele.ghidoli@toradex.com, 
 rdbabiera@google.com, devicetree@vger.kernel.org, 
 u.kleine-koenig@baylibre.com, xu.yang_2@nxp.com, 
 Martin.McKenny@synopsys.com, heikki.krogerus@linux.intel.com, 
 linux-usb@vger.kernel.org, jun.li@nxp.com, gregkh@linuxfoundation.org, 
 dan.carpenter@linaro.org
To: "Miao.Zhu" <Miao.Zhu@synopsys.com>
In-Reply-To: <20241218010718.224530-3-miao@synopsys.com>
References: <20241202054314.k6dt7uhnv2kavea4@hippo>
 <20241218010718.224530-1-miao@synopsys.com>
 <20241218010718.224530-3-miao@synopsys.com>
Message-Id: <173448855676.4113446.18228420092453259118.robh@kernel.org>
Subject: Re: [PATCH v2 2/2] dt-bindings: usb: ptn5110: add TCPC properties


On Wed, 18 Dec 2024 02:07:18 +0100, Miao.Zhu wrote:
> The TCPCI driver has flags to configure its protperties but
> no way to enable these flags yet. Add these flags into DT
> so that the driver can be compatible with TCPCI  Spec R2 V1.0.
> 
> Signed-off-by: Miao.Zhu <miao@synopsys.com>
> ---
> V1 -> V2: no changes
> ---
>  Documentation/devicetree/bindings/usb/nxp,ptn5110.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/nxp,ptn5110.yaml: TX_BUF_BYTE_x_hidden: missing type definition
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/nxp,ptn5110.yaml: RX_BUF_BYTE_x_hidden: missing type definition
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/nxp,ptn5110.yaml: auto_discharge_disconnect: missing type definition
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/nxp,ptn5110.yaml: vbus_vsafe0v: missing type definition

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241218010718.224530-3-miao@synopsys.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


