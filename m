Return-Path: <linux-usb+bounces-235-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8658B7A2D7E
	for <lists+linux-usb@lfdr.de>; Sat, 16 Sep 2023 04:37:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 98FEC1C20C40
	for <lists+linux-usb@lfdr.de>; Sat, 16 Sep 2023 02:37:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F8776130;
	Sat, 16 Sep 2023 02:36:57 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303CD5697;
	Sat, 16 Sep 2023 02:36:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4FD3C433CB;
	Sat, 16 Sep 2023 02:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694831817;
	bh=DUIXYVvaiR1keYTg+miPivXtIvLrN04LFwPuanPw45o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=MAJt6ld0NervcoMWRakm4IMmY4S9TiVuhxsX/g1way4XvP8b2eUtPLgPa0PhXXCmb
	 s8mUtmMLKbpIcPqSyH5HXMT8CiTGZ32xvQXZyAY4ys8ravwyX6mg4dORPZfU7qmFRy
	 vo+mQbCrWxa43bVwwY3iG13MOMqTyKXtZLpLU2iqNMPkDz5go/v6k2P7zwqUzWCS2M
	 OSQ5Gvm+ibHFQOOJs1wtxM+o1CRWqo3A9XinbhcjKG4FXgWYzblzj2tcuWG7jJTPtG
	 yC5vuoD4Pi/xf0YIALg8zuOWDbQPZSb8Zq7sUwvpNzo3k5bG/jReMkRWrNbzSI0xLn
	 WaAaFR2HTbvRQ==
Received: (nullmailer pid 607832 invoked by uid 1000);
	Sat, 16 Sep 2023 02:36:49 -0000
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
Cc: broonie@kernel.org, andersson@kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, conor+dt@kernel.org, agross@kernel.org, tiwai@suse.com, lgirdwood@gmail.com, bgoswami@quicinc.com, konrad.dybcio@linaro.org, perex@perex.cz, devicetree@vger.kernel.org, gregkh@linuxfoundation.org, Thinh.Nguyen@synopsys.com, srinivas.kandagatla@linaro.org, alsa-devel@alsa-project.org, krzysztof.kozlowski+dt@linaro.org, mathias.nyman@intel.com, robh+dt@kernel.org, linux-usb@vger.kernel.org
In-Reply-To: <20230916001026.315-25-quic_wcheng@quicinc.com>
References: <20230916001026.315-1-quic_wcheng@quicinc.com>
 <20230916001026.315-25-quic_wcheng@quicinc.com>
Message-Id: <169483180949.607796.6898944173811945795.robh@kernel.org>
Subject: Re: [PATCH v6 24/33] ASoC: dt-bindings: Update example for
 enabling USB offload on SM8250
Date: Fri, 15 Sep 2023 21:36:49 -0500


On Fri, 15 Sep 2023 17:10:17 -0700, Wesley Cheng wrote:
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

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230916001026.315-25-quic_wcheng@quicinc.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


