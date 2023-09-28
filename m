Return-Path: <linux-usb+bounces-711-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A66557B1FF9
	for <lists+linux-usb@lfdr.de>; Thu, 28 Sep 2023 16:47:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 58B91282BD4
	for <lists+linux-usb@lfdr.de>; Thu, 28 Sep 2023 14:47:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E62F83FB39;
	Thu, 28 Sep 2023 14:47:13 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A2FE8480;
	Thu, 28 Sep 2023 14:47:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18E3CC433C8;
	Thu, 28 Sep 2023 14:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695912433;
	bh=DAhYMVG3nEzAFn/EI+pyjEUCUyXo8CLi3ZCOtHs/arQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=mCgSUN8BLRBjiIjTvtgM4sByKgXNxwGgVACsctHPBYgPR+J2tr64sI/av6TRNwRID
	 Sxpn8EtCKqLGWGkJfqA9lzSasMm32pAlX3fk96W+pNc/Z8t7zWt4lC1lJGyhvJjTk3
	 KbQbRykpAUQgmcMwdYlm7LxXjVrzITokeNS1iiL9FEjABOlk+ay3qcO+KyIsM/M1si
	 YzWniGsMD8aMrpaqQuqzdGXL4I9jgcUjssGoiN1moF8vjmRqZ1qZxM/8jMQt85LeEx
	 Qo/pzFld00MzXxlDSJchdTVb+rUd2j2Dz05u6es26vKor49zKn5/xfCyisM7GjHH4+
	 sqAdTLKWtX6pg==
Received: (nullmailer pid 408729 invoked by uid 1000);
	Thu, 28 Sep 2023 14:47:11 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: linux-riscv@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Fu Wei <wefu@redhat.com>, Guo Ren <guoren@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>
In-Reply-To: <20230927164222.3505-2-jszhang@kernel.org>
References: <20230927164222.3505-1-jszhang@kernel.org>
 <20230927164222.3505-2-jszhang@kernel.org>
Message-Id: <169591240666.408168.6432337250715117687.robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: usb: Add T-HEAD TH1520 USB controller
Date: Thu, 28 Sep 2023 09:47:11 -0500


On Thu, 28 Sep 2023 00:42:21 +0800, Jisheng Zhang wrote:
> T-HEAD TH1520 platform's USB has a wrapper module around
> the DesignWare USB3 DRD controller. Add binding information doc for
> it.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  .../bindings/usb/thead,th1520-usb.yaml        | 73 +++++++++++++++++++
>  1 file changed, 73 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/thead,th1520-usb.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/usb/thead,th1520-usb.example.dts:25.13-43.11: Warning (unit_address_vs_reg): /example-0/usb: node has a reg or ranges property, but no unit name

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230927164222.3505-2-jszhang@kernel.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


