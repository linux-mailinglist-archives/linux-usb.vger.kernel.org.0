Return-Path: <linux-usb+bounces-1429-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E46747C47C8
	for <lists+linux-usb@lfdr.de>; Wed, 11 Oct 2023 04:31:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9A3FB28213F
	for <lists+linux-usb@lfdr.de>; Wed, 11 Oct 2023 02:31:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 740726124;
	Wed, 11 Oct 2023 02:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sxdTmUcf"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B689B610B;
	Wed, 11 Oct 2023 02:31:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 598FBC433C8;
	Wed, 11 Oct 2023 02:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696991467;
	bh=2kt6GpEYEc8TWPUIQauHW2cC+U9TC95GtdTD5AMuWXM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=sxdTmUcfddQMbjHtHzygFI7iHhQppaRc61TRTTgLg79FG3XdyZLUmkIhmx2sDGmrE
	 bI6yKgT1rXtFEa1tH31L0zuSO6PN7iQDP7v3lwOuPXeJmQNycI4APPH69ReNufSXNq
	 BhRyZeWo8EP11u4ndChfI0HpAsxzYtUevHR7wzzrg+hL7CrugQrSq9/UICShEK82W3
	 kbPc4w5w5bG85yIXh4KZQ4x1hQMv1el5VFbuJA5FnSMZQXEitnoLcoZz7PTZ1cTtFf
	 y0+WECKdKwL4wP/rJYK4sAi9AQOac2YvTFr6rKCNQkxWV0d/9J/6YLFv0fiEX5Qrie
	 ptfsmbNPUWo6Q==
Received: (nullmailer pid 2560993 invoked by uid 1000);
	Wed, 11 Oct 2023 02:31:04 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: konrad.dybcio@linaro.org, agross@kernel.org, devicetree@vger.kernel.org, bgoswami@quicinc.com, broonie@kernel.org, krzysztof.kozlowski+dt@linaro.org, lgirdwood@gmail.com, gregkh@linuxfoundation.org, andersson@kernel.org, conor+dt@kernel.org, linux-usb@vger.kernel.org, mathias.nyman@intel.com, perex@perex.cz, tiwai@suse.com, robh+dt@kernel.org, Thinh.Nguyen@synopsys.com, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, srinivas.kandagatla@linaro.org
In-Reply-To: <20231011002146.1821-15-quic_wcheng@quicinc.com>
References: <20231011002146.1821-1-quic_wcheng@quicinc.com>
 <20231011002146.1821-15-quic_wcheng@quicinc.com>
Message-Id: <169699146356.2560906.8654324582682669209.robh@kernel.org>
Subject: Re: [PATCH v8 14/34] dt-bindings: usb: dwc3: Limit
 num-hc-interrupters definition
Date: Tue, 10 Oct 2023 21:31:04 -0500


On Tue, 10 Oct 2023 17:21:26 -0700, Wesley Cheng wrote:
> Ensure that the number of XHCI secondary interrupters defined for a DWC3
> based implementation is limited to 8.  XHCI in general can potentially
> support up to 1024 interrupters.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---
>  Documentation/devicetree/bindings/usb/snps,dwc3.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/snps,dwc3.yaml: num-hc-interrupters: missing type definition

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20231011002146.1821-15-quic_wcheng@quicinc.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


