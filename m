Return-Path: <linux-usb+bounces-16491-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 350DD9A722C
	for <lists+linux-usb@lfdr.de>; Mon, 21 Oct 2024 20:18:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 645131C21786
	for <lists+linux-usb@lfdr.de>; Mon, 21 Oct 2024 18:18:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8E3D1F9429;
	Mon, 21 Oct 2024 18:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ATnty0cM"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A9471991D7;
	Mon, 21 Oct 2024 18:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729534688; cv=none; b=nqZ4aY8+/XhdMGFgS5BVdShKYDuQQ1n84Z6Y9KisiYhny+JuiXj+u/HILzjagKWsCZ4mfL1ypyIYmvMB/SFNUKwZhMXtSpfcZLRaWHMcLYa6nSIt/XekOjzYD10gKf8ifbkIPe35+DcHBRhzsz2s51H/9ircjyFPjYz03CYEfs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729534688; c=relaxed/simple;
	bh=DelKPsg/gdkXW4pmPXHI8KyZww5jWxkQrb7liNX5VaY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EVNZahOo2TrqcygFbv7SqGh02mri0kFmXKwBfdTQud12AGl0o+H6swnb73GRZZ75Lc+FkGTp404YBoxarKWNsXTxrm7tSR1iLlUAOE2TsfxnHBT5r4s9PPYlyqg9xjOORZ5uANLhOFqFUTodRCdQkRj4fg3w8AcwkeeZbcCrftU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ATnty0cM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED970C4CEC3;
	Mon, 21 Oct 2024 18:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729534687;
	bh=DelKPsg/gdkXW4pmPXHI8KyZww5jWxkQrb7liNX5VaY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ATnty0cMqXzG8VmkgP03ttLsT0VQ7xKbNohxlm+O4COifeiMK/EoqA6oWvOdYUXfS
	 zzy9D8mOAsp3gdazaSIFQSpP8gF6zDpdUL14KicK57erA2ivZu7wq7jtHAxojAKTSe
	 ly7r5PntMEHxEx+ZBcfWHlYJ2B/8DtkQWs7h0/99gXIC7A7Z9OGWSbkuPpe0rXTviV
	 jjm7NgycY0hsDeQwWICJyzuAqUY+CWuxoA/Pi5HBfADlqA6p8+UP2kYsZqXL34wi/x
	 xEW7DrYVe3Ki2rRfsFracgnBq/3ivV5R8YPQUhfBbTCIUoP04AnwOPR5IqXRwbteWV
	 BzLcRH4cE/0/A==
Date: Mon, 21 Oct 2024 23:48:03 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com,
	gregkh@linuxfoundation.org, peter.chen@kernel.org,
	herve.codina@bootlin.com, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
	jun.li@nxp.com
Subject: Re: [PATCH v8 1/3] phy: fsl-imx8mq-usb: add tca function driver for
 imx95
Message-ID: <Zxaa25TTIgDwOItL@vaman>
References: <20241015111018.2388913-1-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241015111018.2388913-1-xu.yang_2@nxp.com>

On 15-10-24, 19:10, Xu Yang wrote:

> @@ -359,6 +587,8 @@ static const struct of_device_id imx8mq_usb_phy_of_match[] = {
>  	 .data = &imx8mq_usb_phy_ops,},
>  	{.compatible = "fsl,imx8mp-usb-phy",
>  	 .data = &imx8mp_usb_phy_ops,},
> +	{.compatible = "fsl,imx95-usb-phy",
> +	 .data = &imx8mp_usb_phy_ops,},

Where is fsl,imx95-usb-phy documented?

-- 
~Vinod

