Return-Path: <linux-usb+bounces-803-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 417087B36E6
	for <lists+linux-usb@lfdr.de>; Fri, 29 Sep 2023 17:35:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by ny.mirrors.kernel.org (Postfix) with ESMTP id D420D1C209FA
	for <lists+linux-usb@lfdr.de>; Fri, 29 Sep 2023 15:35:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E08351BBF;
	Fri, 29 Sep 2023 15:35:36 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 176C251BA4;
	Fri, 29 Sep 2023 15:35:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAC20C433B6;
	Fri, 29 Sep 2023 15:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696001734;
	bh=ti/iY/I8rL5lxV45hGyYfqiTkZyE90nEyx2osM8ZrS4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=LNMo1g0SUF0MshCK7LlJJbQzOUCYhoIrwB0l6YUZb0PbLJcbMcvwykPloDmyIsYoi
	 xeuehITcBmi1duzE7qO/Gf+8zjPBf4h/K12XsEQitc121OMB5jVeYkH3oXiLB7xWxu
	 kXUNZMRei9/6rqt0Q0FMOWrglBmLQ6sJLLP/YSybuNwXFYIlkJRtXU6iTpLssd7fwG
	 O22v6dCSsNK8eDTRkhxq5FT0KmsluuikuLnEg+u32nnRXryeQgN+oHyNvrBL5WohX2
	 f8izjKJFjvLfLIKunnmccRHUFUKTzmEt2CUc3FVbzHa8YcLJunWI1jUweUpca0UaXk
	 lp7u+svNF7Etg==
Received: (nullmailer pid 3601357 invoked by uid 1000);
	Fri, 29 Sep 2023 15:35:24 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Cc: ulf.hansson@linaro.org, Frank Rowand <frowand.list@gmail.com>, edumazet@google.com, jic23@kernel.org, richardcochran@gmail.com, krzysztof.kozlowski+dt@linaro.org, linux-iio@vger.kernel.org, fabrice.gasnier@foss.st.com, linux-mmc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org, davem@davemloft.net, kuba@kernel.org, Oleksii_Moisieiev@epam.com, hugues.fruchet@foss.st.com, linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, conor+dt@kernel.org, linux-phy@lists.infradead.org, mchehab@kernel.org, linux-crypto@vger.kernel.org, devicetree@vger.kernel.org, linux-i2c@vger.kernel.org, vkoul@kernel.org, linux-spi@vger.kernel.org, olivier.moysan@foss.st.com, linux-serial@vger.kernel.org, arnd@kernel.org, alsa-devel@alsa-project.org, herbert@gondor.apana.org.au, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org, dmaengine@vger.kernel.org, alexandre.torgue@foss.st.com, lee@kernel.org, peng.fan@oss.nxp.com, arnaud
 .pouliquen@foss.st.com, catalin.marinas@arm.com, will@kernel.org, pabeni@redhat.com, robh+dt@kernel.org, andi.shyti@kernel.org
In-Reply-To: <20230929142852.578394-3-gatien.chevallier@foss.st.com>
References: <20230929142852.578394-1-gatien.chevallier@foss.st.com>
 <20230929142852.578394-3-gatien.chevallier@foss.st.com>
Message-Id: <169600172300.3601265.2185363377386180804.robh@kernel.org>
Subject: Re: [PATCH v5 02/11] dt-bindings: treewide: add access-controller
 description
Date: Fri, 29 Sep 2023 10:35:24 -0500


On Fri, 29 Sep 2023 16:28:43 +0200, Gatien Chevallier wrote:
> access-controller is an optional property that allows a peripheral to
> refer to one or more domain access controller(s).
> 
> Description of this property is added to all peripheral binding files of
> the peripheral under the STM32 firewall controllers. It allows an accurate
> representation of the hardware, where various peripherals are connected
> to this firewall bus. The firewall can then check the peripheral accesses
> before allowing it to probe.
> 
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> ---
> 
> Changes in V5:
> 	- Discarded review tags as the content has changed
> 	- Renamed feature-domains to access-controller
> 	- Removed extra blank line in st,stm32-timers.yaml
> 
> Changes in V4:
> 	- Added Jonathan's tag for IIO
> 
> Changes in V2:
> 	- Add missing "feature-domains" property declaration
> 	  in bosch,m_can.yaml and st,stm32-cryp.yaml files
> 
>  Documentation/devicetree/bindings/crypto/st,stm32-cryp.yaml   | 4 ++++
>  Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml   | 4 ++++
>  Documentation/devicetree/bindings/dma/st,stm32-dma.yaml       | 4 ++++
>  Documentation/devicetree/bindings/dma/st,stm32-dmamux.yaml    | 4 ++++
>  Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml       | 4 ++++
>  Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml   | 4 ++++
>  .../devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml       | 4 ++++
>  Documentation/devicetree/bindings/iio/dac/st,stm32-dac.yaml   | 4 ++++
>  Documentation/devicetree/bindings/media/cec/st,stm32-cec.yaml | 4 ++++
>  Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml    | 4 ++++
>  .../bindings/memory-controllers/st,stm32-fmc2-ebi.yaml        | 4 ++++
>  Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml   | 4 ++++
>  Documentation/devicetree/bindings/mfd/st,stm32-timers.yaml    | 4 ++++
>  Documentation/devicetree/bindings/mmc/arm,pl18x.yaml          | 4 ++++
>  Documentation/devicetree/bindings/net/can/bosch,m_can.yaml    | 4 ++++
>  Documentation/devicetree/bindings/net/stm32-dwmac.yaml        | 4 ++++
>  Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml  | 4 ++++
>  .../devicetree/bindings/regulator/st,stm32-vrefbuf.yaml       | 4 ++++
>  Documentation/devicetree/bindings/rng/st,stm32-rng.yaml       | 4 ++++
>  Documentation/devicetree/bindings/serial/st,stm32-uart.yaml   | 4 ++++
>  Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml     | 4 ++++
>  Documentation/devicetree/bindings/sound/st,stm32-sai.yaml     | 4 ++++
>  Documentation/devicetree/bindings/sound/st,stm32-spdifrx.yaml | 4 ++++
>  Documentation/devicetree/bindings/spi/st,stm32-qspi.yaml      | 4 ++++
>  Documentation/devicetree/bindings/spi/st,stm32-spi.yaml       | 4 ++++
>  Documentation/devicetree/bindings/usb/dwc2.yaml               | 4 ++++
>  26 files changed, 104 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml: access-controller: missing type definition

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230929142852.578394-3-gatien.chevallier@foss.st.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


