Return-Path: <linux-usb+bounces-5858-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE98849243
	for <lists+linux-usb@lfdr.de>; Mon,  5 Feb 2024 02:54:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 711421F2210E
	for <lists+linux-usb@lfdr.de>; Mon,  5 Feb 2024 01:54:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AF1A3FF1;
	Mon,  5 Feb 2024 01:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fwzjh8/d"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E29137F;
	Mon,  5 Feb 2024 01:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707098056; cv=none; b=F8FS4gfhoD4JXqIffKDI0MLAczItlwpkdF3m66hmjlieV6v3Y2GcJqCwzJEzYnZ7vR3Q0m3iS0tN7fe4MQHkq8slGH82Jpe5fC++F/f11mYaNTCWWyycVkjOOO43BA182Cm98PVln0zY4u2LZnQlI2uO+K3S1cFNsq8C2cHOrpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707098056; c=relaxed/simple;
	bh=21mXyIhV46Fib1JjoyeF03LnuGb8n2KfIraWYewkkNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tvb0GrMth51um6OPEq27IBQrnKX+MPHmKL5rwVnmVck3FkFh333m32/iDRAxORDhEvs2X2bU0x5s9iS+dkuVvelky5mcxLgKpnBollleAKUOFtfnfhvBjmaSE+SiKZrI0SLFLkHHf+D9u20EJY50lwPNJ+eup9uN87GflMYbvzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fwzjh8/d; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE820C433C7;
	Mon,  5 Feb 2024 01:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707098055;
	bh=21mXyIhV46Fib1JjoyeF03LnuGb8n2KfIraWYewkkNQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fwzjh8/dx1KfDbYKkKyjkpqcE5ziWlst/2ujqUVbrkketMgm0nd54ADIqNJHdStu0
	 LcUfQ0ynk6sQrQJThE0+FA4zG37lrkmZWRLTAgrmEKT9USi07QK7OI/t8ShcSGFGte
	 cse8QBUPdAKnwncocZtaAZKz+sXWnCEh9U0yqg7CKTLtNsUNdVbeDb2JnFhMJcoReu
	 0lKRhIOdsiEQhm46EAMVZGZu2bMQ+6nK8IVn5jrWw/vBBV6gdxlZtYW8qDrYTke2mk
	 5ILyfOXKmslqLnCf7pWalpaVQi/uKd037StdLPsTuHf9FbUypWRWCtXh06vhGGhD1f
	 6MMPCSzMIZgrA==
Date: Mon, 5 Feb 2024 09:54:03 +0800
From: Peter Chen <peter.chen@kernel.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: gregkh@linuxfoundation.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, linux-imx@nxp.com, jun.li@nxp.com,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 8/8] usb: chipidea: ci_hdrc_imx: align usb wakeup
 clock name with dt-bindings
Message-ID: <20240205015403.GA1200221@nchen-desktop>
References: <20240131114324.3722428-1-xu.yang_2@nxp.com>
 <20240131114324.3722428-8-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240131114324.3722428-8-xu.yang_2@nxp.com>

On 24-01-31 19:43:24, Xu Yang wrote:
> The dt-bindings is going to use "usb_wakeup" as wakup clock name. This will
> align the change with dt-bindings.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> 
> ---
> Changes in v5:
>  - new patch
> ---
>  drivers/usb/chipidea/ci_hdrc_imx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
> index ae9a6a17ec6e..a17b6d619305 100644
> --- a/drivers/usb/chipidea/ci_hdrc_imx.c
> +++ b/drivers/usb/chipidea/ci_hdrc_imx.c
> @@ -212,7 +212,7 @@ static int imx_get_clks(struct device *dev)
>  		/* Get wakeup clock. Not all of the platforms need to
>  		 * handle this clock. So make it optional.
>  		 */
> -		data->clk_wakeup = devm_clk_get_optional(dev, "usb_wakeup_clk");
> +		data->clk_wakeup = devm_clk_get_optional(dev, "usb_wakeup");
>  		if (IS_ERR(data->clk_wakeup))
>  			ret = dev_err_probe(dev, PTR_ERR(data->clk_wakeup),
>  					"Failed to get wakeup clk\n");
> -- 
> 2.34.1
> 

Acked-by: Peter Chen <peter.chen@kernel.org>

-- 

Thanks,
Peter Chen

