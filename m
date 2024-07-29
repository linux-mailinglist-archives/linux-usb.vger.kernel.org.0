Return-Path: <linux-usb+bounces-12582-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D0093FDCC
	for <lists+linux-usb@lfdr.de>; Mon, 29 Jul 2024 20:53:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C668A282EA5
	for <lists+linux-usb@lfdr.de>; Mon, 29 Jul 2024 18:53:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2675E188CA7;
	Mon, 29 Jul 2024 18:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nQKb85Qk"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CBA6187344;
	Mon, 29 Jul 2024 18:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722279177; cv=none; b=YjfWu6c2JaM1aauxfOW7ufhHI9+HoGrz0qM+t2ouWwPLl4pCFMWhbg6OWsAQtZfVHnRoDTJaRaeffnGqilG/FABkbm+Q5M3asYxaS7X8BmHkM9kLE4ELIVwSxGddERp3DI1IcSNHde+IPxryPyHxRLEsYDOVN2hbDUDhcGvAX3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722279177; c=relaxed/simple;
	bh=vsqLLDDZY6D3lJdg9vpCEv/GMhqruvs+fapG3j0a0QU=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=lfhe+79fMoqbPHJNaiKQFVCP0UJvNdROGWCo9CQSoSGZhd/pep7SIU92ZA84EWIdKCaP2zyEWo6s0Rydg9JapWrfCFyOj6a9xpOvW68UZs3JwhnmJRonfyfj6VapTjLvUZCRtLp6npc8i0i8qMocdJuYv8t9nzwqtI7yGp5VWSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nQKb85Qk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F75EC4AF0B;
	Mon, 29 Jul 2024 18:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722279177;
	bh=vsqLLDDZY6D3lJdg9vpCEv/GMhqruvs+fapG3j0a0QU=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=nQKb85Qkji/RdhYlHQt0ujUtUIMnXbcBi+YRXFaYcfamKcriesDmMyUAD1gt5E9M7
	 zxo+Gl/0dChFsv8XTvrfb++4x3/LidUl0jC5SrmhVm3xYKCYeg12ugHlz4WGBR72kI
	 Ny4szV1ulxYzb7zPuskv04jZM4rjbZufKkZupiLHQ/IAAktm3h4SOuYCFyiIrWHLIM
	 +DQlSX5PqnVdAx/uhtUEJxOTAZG4JoFefvfvANZ9owtmBKXea6lnxaAKMhUP6Gk5Pq
	 g+tgFietVVs2hsB0/WDz5zuyWaL5dMr0zK7mBHX1LawcIep+VkT1F3+B85sQn+IjYf
	 bwM9qKc7cJhaA==
Date: Mon, 29 Jul 2024 12:52:56 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: devicetree@vger.kernel.org, andersson@kernel.org, 
 s.hauer@pengutronix.de, krzk+dt@kernel.org, conor+dt@kernel.org, 
 gregkh@linuxfoundation.org, festevam@gmail.com, 
 linux-arm-kernel@lists.infradead.org, shawnguo@kernel.org, 
 linux-usb@vger.kernel.org, imx@lists.linux.dev, kernel@pengutronix.de, 
 jun.li@nxp.com
In-Reply-To: <20240729081039.3904797-1-xu.yang_2@nxp.com>
References: <20240729081039.3904797-1-xu.yang_2@nxp.com>
Message-Id: <172227905062.1346514.6301429778096950851.robh@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: usb: gpio-sbu-mux: Add an entry for
 PTN36043


On Mon, 29 Jul 2024 16:10:37 +0800, Xu Yang wrote:
> Add a compatible entry for the NXP PTN36043 GPIO-based mux hardware
> used for connecting, disconnecting and switching orientation of
> the SBU lines in USB Type-C applications.
> 
> PTN36043 datasheet: https://www.nxp.com/docs/en/data-sheet/PTN36043A.pdf
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


New warnings running 'make CHECK_DTBS=y freescale/imx8mp-evk.dtb freescale/imx8mq-evk.dtb' for 20240729081039.3904797-1-xu.yang_2@nxp.com:

arch/arm64/boot/dts/freescale/imx8mq-evk.dtb: usb@38100000: role-switch-default-mode:0: 'none' is not one of ['host', 'peripheral']
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/freescale/imx8mq-evk.dtb: usb@38100000: Unevaluated properties are not allowed ('adp-disable', 'dr_mode', 'hnp-disable', 'role-switch-default-mode', 'srp-disable', 'usb-role-switch' were unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/freescale/imx8mq-evk.dtb: usb@38100000: role-switch-default-mode:0: 'none' is not one of ['host', 'peripheral']
	from schema $id: http://devicetree.org/schemas/usb/fsl,imx8mq-dwc3.yaml#
arch/arm64/boot/dts/freescale/imx8mq-evk.dtb: usb@38100000: Unevaluated properties are not allowed ('adp-disable', 'dr_mode', 'hnp-disable', 'role-switch-default-mode', 'srp-disable', 'usb-role-switch' were unexpected)
	from schema $id: http://devicetree.org/schemas/usb/fsl,imx8mq-dwc3.yaml#
arch/arm64/boot/dts/freescale/imx8mq-evk.dtb: usb@38100000: Unevaluated properties are not allowed ('adp-disable', 'assigned-clock-parents', 'assigned-clock-rates', 'assigned-clocks', 'clock-names', 'clocks', 'dr_mode', 'hnp-disable', 'interrupts', 'phy-names', 'phys', 'port', 'power-domains', 'reg', 'role-switch-default-mode', 'snps,dis-u1-entry-quirk', 'snps,dis-u2-entry-quirk', 'snps,parkmode-disable-ss-quirk', 'srp-disable', 'usb-role-switch' were unexpected)
	from schema $id: http://devicetree.org/schemas/usb/fsl,imx8mq-dwc3.yaml#
arch/arm64/boot/dts/freescale/imx8mp-evk.dtb: usb-phy@381f0040: 'fsl,pcs-tx-deemph-3p5db', 'fsl,phy-comp-dis-tune', 'fsl,phy-pcs-tx-swing-full', 'fsl,phy-tx-preemp-amp-tune', 'fsl,phy-tx-vboost-level', 'fsl,phy-tx-vref-tune' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/phy/fsl,imx8mq-usb-phy.yaml#
arch/arm64/boot/dts/freescale/imx8mp-evk.dtb: usb@32f10100: usb@38100000:role-switch-default-mode:0: 'none' is not one of ['host', 'peripheral']
	from schema $id: http://devicetree.org/schemas/usb/fsl,imx8mp-dwc3.yaml#
arch/arm64/boot/dts/freescale/imx8mp-evk.dtb: usb@32f10100: usb@38100000: Unevaluated properties are not allowed ('adp-disable', 'dr_mode', 'hnp-disable', 'role-switch-default-mode', 'srp-disable', 'usb-role-switch' were unexpected)
	from schema $id: http://devicetree.org/schemas/usb/fsl,imx8mp-dwc3.yaml#
arch/arm64/boot/dts/freescale/imx8mp-evk.dtb: usb@38100000: role-switch-default-mode:0: 'none' is not one of ['host', 'peripheral']
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/freescale/imx8mp-evk.dtb: usb@38100000: Unevaluated properties are not allowed ('adp-disable', 'dr_mode', 'hnp-disable', 'role-switch-default-mode', 'srp-disable', 'usb-role-switch' were unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/freescale/imx8mp-evk.dtb: usb-phy@382f0040: 'fsl,phy-tx-preemp-amp-tune', 'fsl,phy-tx-vref-tune' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/phy/fsl,imx8mq-usb-phy.yaml#






