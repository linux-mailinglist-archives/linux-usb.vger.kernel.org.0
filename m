Return-Path: <linux-usb+bounces-17786-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B66639D54D4
	for <lists+linux-usb@lfdr.de>; Thu, 21 Nov 2024 22:40:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2E5F8282DB5
	for <lists+linux-usb@lfdr.de>; Thu, 21 Nov 2024 21:39:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 896641DA0FE;
	Thu, 21 Nov 2024 21:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SEKboTw4"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04E621D47DC;
	Thu, 21 Nov 2024 21:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732225183; cv=none; b=dWc2KvQvAkIZCiUS/0lJea0aRTWT2C4Iwe8tfrHjMPe1eY0eQnGa0N45RzQ8cxJM5bbNFvwXObnvL34emF1vm38qoYmFQL4wTUjjWyWiFsiFlrgrVA6zBA5Br6dWqSyPt3AxyXvLhxoTLu1ZCvz6EFRGDOpTwlpzN2W2FgPAvS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732225183; c=relaxed/simple;
	bh=t5evj8QlSvXour9hJpuwutaiF1DHjXLc0vuzkj1EIqA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jumDui5uHrk1qJ+VTn/D49+CrAtsvOkwdIqyBvW1oiDnSqKpinc+0SsOoOfxhraCLK2AFdm3d7pc6eDNbBc3W+mMcZcIMFT5hNLdCXgOpXGm96uNekX8UTzuav0GBrLOedWQP8EJxVwF7ZSbqeMcXaI1dfRGE2q2cw+SEySHGoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SEKboTw4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D63F1C4CECC;
	Thu, 21 Nov 2024 21:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732225182;
	bh=t5evj8QlSvXour9hJpuwutaiF1DHjXLc0vuzkj1EIqA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SEKboTw4h1cJSjf7cu+qGesjrWqjo2bPnLXrZjYgmVbWMvGgqDmBK8EctnAN/DG0d
	 4cpUCWt2Ci1ILuRX89ELTgrIQRjTS62J1jPHEVmOQZIz93C07K7F7ePUEzF+JwhHH9
	 4oeytD1SobEjTBn9/WiNJJdL048vKj6Ah2L5HOG3l8urelYhBvVuO9EAdOnBsks2DB
	 8D+pSvjHHYqKOHUOKApp/BOzDRkCaGTGkwlt94h6ag+GU0HAOERfa144b5hWrrdMiM
	 G8Bg5qKcxvUmZdTjDwQABky5G6TVwFQ4CkyVB0VHgWM2rbgTwNm8mvte6BgwIm64A5
	 GXNwayBWWUEvg==
Date: Thu, 21 Nov 2024 15:39:40 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: linux-arm-kernel@lists.infradead.org, festevam@gmail.com,
	vkoul@kernel.org, alexander.stein@ew.tq-group.com,
	linux-usb@vger.kernel.org, jun.li@nxp.com, conor+dt@kernel.org,
	krzk+dt@kernel.org, kishon@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-phy@lists.infradead.org,
	gregkh@linuxfoundation.org, shawnguo@kernel.org
Subject: Re: [PATCH v2] dt-bindings: phy: imx8mq-usb: correct reference to
 usb-switch.yaml
Message-ID: <173222518009.3833281.16277279997685475186.robh@kernel.org>
References: <20241119105017.917833-1-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241119105017.917833-1-xu.yang_2@nxp.com>


On Tue, 19 Nov 2024 18:50:17 +0800, Xu Yang wrote:
> The i.MX95 usb-phy can work with or without orientation-switch. With
> current setting, if usb-phy works without orientation-switch, the
> dt-schema check will show below error:
> 
> phy@4c1f0040: 'oneOf' conditional failed, one must be fixed:
>         'port' is a required property
>         'ports' is a required property
>         from schema $id: http://devicetree.org/schemas/phy/fsl,imx8mq-usb-phy.yaml#
> 
> This will correct the behavior of referring to usb-switch.yaml.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> 
> ---
> v2: remake patch and subject
> ---
>  .../devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml        | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


