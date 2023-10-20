Return-Path: <linux-usb+bounces-1950-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D55F7D0653
	for <lists+linux-usb@lfdr.de>; Fri, 20 Oct 2023 03:56:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BAC4C281147
	for <lists+linux-usb@lfdr.de>; Fri, 20 Oct 2023 01:56:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EE2B808;
	Fri, 20 Oct 2023 01:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mIm4hX1q"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBAD838F
	for <linux-usb@vger.kernel.org>; Fri, 20 Oct 2023 01:55:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A437AC433C8;
	Fri, 20 Oct 2023 01:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697766957;
	bh=TfoVQ04V/DyH8idpHC0lkA7yHOCLnTARSYc6R2lyKg4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mIm4hX1qfoL/lUHYOi8BOgAZAnZLnfHF6RPhX/EoK7TJSahGp8oBq/ONeFLaHjInK
	 WNAwRoxTo3IQEMqKklwVL8j2MdBo8zZ3p1o8WetIbc8v6p7U2KFowsojHO/LTe9QJO
	 pLwZ24G6YPugyDyLOnsSM76+TlLhS3HS2yJcoC2EdyExNz334wSYAICYxkYOXM0KDw
	 Ek5u0vEFY6+kYxaHw4wU45Sm4dNH9eHlWNz6dwuLyVELheqJ4m4ff9XDumhuGtUSLo
	 en5DXKhlip/aIZZH8LqqkeyXAfWRtu54Yk7OpRKxrcXOCxigZebX/VbdLW4VSBajQV
	 mrQXaD3OAdxyQ==
Date: Fri, 20 Oct 2023 09:55:47 +0800
From: Peter Chen <peter.chen@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	kernel test robot <lkp@intel.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: chipidea: Fix unused ci_hdrc_usb2_of_match warning
 for !CONFIG_OF
Message-ID: <20231020015547.GA1119400@nchen-desktop>
References: <20231019183015.841460-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231019183015.841460-1-robh@kernel.org>

On 23-10-19 13:30:15, Rob Herring wrote:
> Commit 14485de431b0 ("usb: Use device_get_match_data()") dropped the
> unconditional use of ci_hdrc_usb2_of_match resulting in this warning:
> 
> drivers/usb/chipidea/ci_hdrc_usb2.c:41:34: warning: unused variable 'ci_hdrc_usb2_of_match' [-Wunused-const-variable]
> 
> The fix is to drop of_match_ptr() which is not necessary because DT is
> always used for this driver.
> 
> Fixes: 14485de431b0 ("usb: Use device_get_match_data()")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202310131627.M43j234A-lkp@intel.com/
> Signed-off-by: Rob Herring <robh@kernel.org>

Acked-by: Peter Chen <peter.chen@kernel.org>

> ---
>  drivers/usb/chipidea/ci_hdrc_usb2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/chipidea/ci_hdrc_usb2.c b/drivers/usb/chipidea/ci_hdrc_usb2.c
> index 180a632dd7ba..97379f653b06 100644
> --- a/drivers/usb/chipidea/ci_hdrc_usb2.c
> +++ b/drivers/usb/chipidea/ci_hdrc_usb2.c
> @@ -119,7 +119,7 @@ static struct platform_driver ci_hdrc_usb2_driver = {
>  	.remove_new = ci_hdrc_usb2_remove,
>  	.driver	= {
>  		.name		= "chipidea-usb2",
> -		.of_match_table	= of_match_ptr(ci_hdrc_usb2_of_match),
> +		.of_match_table	= ci_hdrc_usb2_of_match,
>  	},
>  };
>  module_platform_driver(ci_hdrc_usb2_driver);
> -- 
> 2.42.0
> 

-- 

Thanks,
Peter Chen

