Return-Path: <linux-usb+bounces-956-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC7D7B5892
	for <lists+linux-usb@lfdr.de>; Mon,  2 Oct 2023 19:00:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id B44D8284215
	for <lists+linux-usb@lfdr.de>; Mon,  2 Oct 2023 17:00:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8B4D1DDD5;
	Mon,  2 Oct 2023 17:00:28 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 839521CF83;
	Mon,  2 Oct 2023 17:00:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4EA1C433C8;
	Mon,  2 Oct 2023 17:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696266028;
	bh=3UbyqZIFaU6RJC2KOuQvJj8u1FhIUKRifoIKRVKlW9k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Oe7AKrswQVKt5UlDiKVSxuiRD2QnAnHROWGMNBPHHdFj6b3rzg71vcTho3JhcVpsJ
	 EQj/R+RDo3YeYG/I7SMUvMI/WkfXl5pDsWO40OyzoWY6AJnkW8/4cMYv9qbyq/Ly9/
	 /EyvByBCPqTrQ1iVbv0oUG1vE4Hv0vUVoDglY5NZne5XaIz8YUJfClfz8caBlHvTZy
	 4poorrJtt3NdkTsnEWCDrdYShiBq+NmrlbiPJBnXPuDAQLKGbSeF9u/xTf4pGvS7C1
	 wQKOoVsi6SfgJcOtpmUBrY5LbynOLWobJ1JIF2gZkbJ2ABeR8YREvJlCr0vqcuYii3
	 KYCpwq72VoR8g==
Received: (nullmailer pid 1934730 invoked by uid 1000);
	Mon, 02 Oct 2023 17:00:25 -0000
Date: Mon, 2 Oct 2023 12:00:25 -0500
From: Rob Herring <robh@kernel.org>
To: Piyush Mehta <piyush.mehta@amd.com>
Cc: gregkh@linuxfoundation.org, michal.simek@amd.com, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, peter.chen@kernel.org, linus.walleij@linaro.org, paul@crapouillou.net, arnd@arndb.de, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, git@amd.com
Subject: Re: [RFC PATCH 1/3] dt-binding: usb: ulpi-phy: add ulpi-phy binding
Message-ID: <20231002170025.GA1928031-robh@kernel.org>
References: <20230929064852.16642-1-piyush.mehta@amd.com>
 <20230929064852.16642-2-piyush.mehta@amd.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230929064852.16642-2-piyush.mehta@amd.com>

On Fri, Sep 29, 2023 at 12:18:50PM +0530, Piyush Mehta wrote:
> Create an ulpi-phy binding to read and write PHY registers with explicit
> control of the address and data using the usb.VIEWPORT register.
> 
> Signed-off-by: Piyush Mehta <piyush.mehta@amd.com>
> ---
> This binding patch was created to support generic platforms. This binding
> will be modified in accordance with patch [3/3] procedures. One of the
> approch may be Create a zynq phy platform driver in "driver/usb/phy" with
> driver source "phy-ulpi-zynq-usb.c" and then the binding will be particular
> to the Xilinx/AMD zynq platform.
> 
> This binding was built with the Zynq hardware design example in consideration
> of as a generic platform. The viewport provide access the Chipidea controller
> to interface with the ULPI PHY.
> ---
>  .../devicetree/bindings/usb/ulpi-phy.yaml     | 48 +++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/ulpi-phy.yaml
> 
> diff --git a/Documentation/devicetree/bindings/usb/ulpi-phy.yaml b/Documentation/devicetree/bindings/usb/ulpi-phy.yaml
> new file mode 100644
> index 000000000000..490b2f610129
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/ulpi-phy.yaml
> @@ -0,0 +1,48 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/ulpi-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ULPI PHY- Generic platform
> +
> +maintainers:
> +  - Piyush Mehta <piyush.mehta@amd.com>
> +
> +properties:
> +  compatible:
> +    const: ulpi-phy
> +
> +  reg:
> +    maxItems: 1
> +
> +  '#phy-cells':
> +    const: 0
> +
> +  external-drv-vbus:
> +    description:
> +      If present, configure ulpi-phy external supply to drive 5V on VBus.
> +    type: boolean
> +
> +  view-port:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Address to read and write PHY registers with explicit control of
> +      the address and data using the usb.VIEWPORT register.
> +
> +required:
> +  - compatible
> +  - reg
> +  - view-port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    phy0@e0002000 {
> +        compatible = "ulpi-phy";
> +        #phy-cells = <0x00>;
> +        reg = <0xe0002000 0x1000>;
> +        view-port = <0x170>;

I don't understand. Do you have an MMIO address and the VIEWPORT 
address to the PHY? You need both?

There's already a defined binding for ULPI bus:

Documentation/devicetree/bindings/usb/ulpi.txt

Why can't you use/expand that?

Rob

