Return-Path: <linux-usb+bounces-234-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A27F7A2D7C
	for <lists+linux-usb@lfdr.de>; Sat, 16 Sep 2023 04:37:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 44C58282CFB
	for <lists+linux-usb@lfdr.de>; Sat, 16 Sep 2023 02:37:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EB69568E;
	Sat, 16 Sep 2023 02:36:54 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B58A40;
	Sat, 16 Sep 2023 02:36:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D12ADC433C8;
	Sat, 16 Sep 2023 02:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694831813;
	bh=s/9j8ncCW1j9ftHgl8PJ5uWrhqOWZyMg0gJKtCzpw44=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=V3lgnTnpoxVTXk+zFc3Y7Ufd5mtyYnREpoZ2P9jnoqQaACKVYQpbAfV8kHW0s3eUJ
	 9I0W6CahYt1w7JyUXuEw4pyxyJBK2DsDUI3vOKooneyFtla8ulzgNuv77M2GfiBraR
	 6WPZ0HjYeql1jwrHMVhQC8CFWGCEBarQ8mh5kzDnn2KLRomuSG6pmAQ1hAbxeC7Uhw
	 rvVEg+2MlHSvrKHXeC4i4i2Pc2pNv2zjnvG9psnVX0ehl/m2vT7uEPRbtdcQmZ+kF1
	 xF1ofd4K9rxFn9WLABWCL7j/hGast9tOi0XSxZyb2pGTxMLu1Z0soKe0PexRs4Qxse
	 eAuAxL6rVQsbw==
Received: (nullmailer pid 607829 invoked by uid 1000);
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
Cc: mathias.nyman@intel.com, robh+dt@kernel.org, tiwai@suse.com, lgirdwood@gmail.com, srinivas.kandagatla@linaro.org, bgoswami@quicinc.com, gregkh@linuxfoundation.org, andersson@kernel.org, krzysztof.kozlowski+dt@linaro.org, perex@perex.cz, Thinh.Nguyen@synopsys.com, alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, agross@kernel.org, broonie@kernel.org, linux-kernel@vger.kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, konrad.dybcio@linaro.org
In-Reply-To: <20230916001026.315-24-quic_wcheng@quicinc.com>
References: <20230916001026.315-1-quic_wcheng@quicinc.com>
 <20230916001026.315-24-quic_wcheng@quicinc.com>
Message-Id: <169483180888.607767.1542710881062922444.robh@kernel.org>
Subject: Re: [PATCH v6 23/33] ASoC: dt-bindings: Add Q6USB backend
Date: Fri, 15 Sep 2023 21:36:49 -0500


On Fri, 15 Sep 2023 17:10:16 -0700, Wesley Cheng wrote:
> Add a dt-binding to describe the definition of enabling the Q6 USB backend
> device for audio offloading.  The node carries information, which is passed
> along to the QC USB SND class driver counterpart.  These parameters will be
> utilized during QMI stream enable requests.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---
>  .../devicetree/bindings/sound/qcom,q6usb.yaml | 55 +++++++++++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/qcom,q6usb.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/qcom,q6usb.yaml: $id: Cannot determine base path from $id, relative path/filename doesn't match actual path or filename
 	 $id: http://devicetree.org/schemas/sound/qcom,q6usb-dais.yaml
 	file: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/qcom,q6usb.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/qcom,q6usb.example.dtb: dais: qcom,usb-audio-intr-num:0: [0, 2] is too long
	from schema $id: http://devicetree.org/schemas/sound/qcom,q6usb-dais.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/qcom,q6usb.example.dtb: dais: qcom,usb-audio-intr-num:0: [0, 2] is too long
	from schema $id: http://devicetree.org/schemas/sound/qcom,q6usb-dais.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230916001026.315-24-quic_wcheng@quicinc.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


