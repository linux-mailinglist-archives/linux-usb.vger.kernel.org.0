Return-Path: <linux-usb+bounces-1430-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C37667C47CC
	for <lists+linux-usb@lfdr.de>; Wed, 11 Oct 2023 04:31:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EFB501C20FD3
	for <lists+linux-usb@lfdr.de>; Wed, 11 Oct 2023 02:31:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0A526132;
	Wed, 11 Oct 2023 02:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l1GYsJYz"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C8C98F40;
	Wed, 11 Oct 2023 02:31:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48238C433CB;
	Wed, 11 Oct 2023 02:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696991470;
	bh=qtYTDtPUnp7DJJUirTj/ZCpKPdotItW9GEvz9OO8YTw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=l1GYsJYzzJrZ2IGjldrlVYtL+STlJJWL8SrHg0IKfBIYE1ObSK/pSNiexQ8lZHt0A
	 R5teAJI0nXOD9z2KKDUCOxVb+9KYt0wu06YQFPi3H4BzOUtasR7YQuwzplJ6c/znx4
	 iGj+BpJ/zxxkp9amwRlKKrIxPDYc9paLwp0x0QK+5tTF66XiAdHADBxIv1e3BucZtV
	 VczLrJkDWKg6QEuCbJJryFlwoFpnGlfm+h89VrdJuM1kC/OPz04bIh47y6lwn6mtqj
	 Y/WfNz/ivYZmeUDjs1uFRPMpjWVFc/smExUXbpLiyuzHq9zf74N5wInM9uVrIcJM31
	 /gPwUITMLaCOw==
Received: (nullmailer pid 2560996 invoked by uid 1000);
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
Cc: bgoswami@quicinc.com, lgirdwood@gmail.com, broonie@kernel.org, gregkh@linuxfoundation.org, robh+dt@kernel.org, konrad.dybcio@linaro.org, conor+dt@kernel.org, linux-usb@vger.kernel.org, andersson@kernel.org, Thinh.Nguyen@synopsys.com, srinivas.kandagatla@linaro.org, linux-kernel@vger.kernel.org, agross@kernel.org, mathias.nyman@intel.com, alsa-devel@alsa-project.org, devicetree@vger.kernel.org, perex@perex.cz, tiwai@suse.com, krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org
In-Reply-To: <20231011002146.1821-26-quic_wcheng@quicinc.com>
References: <20231011002146.1821-1-quic_wcheng@quicinc.com>
 <20231011002146.1821-26-quic_wcheng@quicinc.com>
Message-Id: <169699146438.2560961.3220166947763848754.robh@kernel.org>
Subject: Re: [PATCH v8 25/34] ASoC: dt-bindings: Update example for
 enabling USB offload on SM8250
Date: Tue, 10 Oct 2023 21:31:04 -0500


On Tue, 10 Oct 2023 17:21:37 -0700, Wesley Cheng wrote:
> Add an example on enabling of USB offload for the Q6DSP.  The routing can
> be done by the mixer, which can pass the multimedia stream to the USB
> backend.
> 
> Acked-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---
>  .../devicetree/bindings/sound/qcom,sm8250.yaml    | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/sound/qcom,sm8250.example.dts:97.44-45 syntax error
FATAL ERROR: Unable to parse input tree
make[2]: *** [scripts/Makefile.lib:419: Documentation/devicetree/bindings/sound/qcom,sm8250.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1427: dt_binding_check] Error 2
make: *** [Makefile:234: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20231011002146.1821-26-quic_wcheng@quicinc.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


