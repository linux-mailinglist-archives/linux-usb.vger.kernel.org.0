Return-Path: <linux-usb+bounces-18898-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD629FE5BE
	for <lists+linux-usb@lfdr.de>; Mon, 30 Dec 2024 13:01:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 50D253A2176
	for <lists+linux-usb@lfdr.de>; Mon, 30 Dec 2024 12:01:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 031421A76AC;
	Mon, 30 Dec 2024 12:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QRpJbCBi"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787301799B;
	Mon, 30 Dec 2024 12:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735560095; cv=none; b=O33zMFr8qupQaWvjCFbxeuG8MHQlg4DL5Ti1kd1UutzTWko+YLuNvOEiOw9sRDwjCWTn8JgRsK1KCCRbLgUlokFprqQuDocsPjgjS2e6K1+27DkSv2EL9eV69QHumeGgrzKKl6bCeFTYgtCu16nmpnLgIie8Z/dkKWt0I4MlJS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735560095; c=relaxed/simple;
	bh=WTE2i0IILfhzREqNgHQ162JPvI1XQnwJY7Sdg2XxOyg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fud4G08t/eEYB7pemaFB1YQWE0QWvj52hoJYN3a6JClW5mhg+7BsOGPw4JM59gRZ/RJpQj6aHfkn3IUF8h0sePiVcd+VePDGyWW+0cGpouvvAkovDQn+9f67FyE+KtSIUeRr2i9bDIVRGtePmcI8CE5OwwAmkeBe/yfu7dM3mME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QRpJbCBi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8EBBC4CED0;
	Mon, 30 Dec 2024 12:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735560094;
	bh=WTE2i0IILfhzREqNgHQ162JPvI1XQnwJY7Sdg2XxOyg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QRpJbCBiXN5Ha4azG7Xh8I0D8SaEnZcTYy4rz+KoOXteDcNM8umlDpQWZSTkf7dBC
	 1nSWgYZD4G4jPvV/PVrY16ZgFU5a9M1aLU0xb7XsKZ1jwxcNu+7wTT8j5WmM/1w7hH
	 N2fFXDYb/DnfNvCS2YPOA2GZYNufcUESInMMs3unFC4uj/LJp80vHdjrWLlUe8XLrO
	 SURunYMXZb6ijxixBVs7KGnewiqD1PwJklJ7+K5EMulo15u5RuwBe7FFCZUziDaUqp
	 LdVpXH9nHVgGFQYyKD61oWaoT1zMSWR403ipDaEzzEeM8ufpaskFSxhmanNDXk78jC
	 wSkEtw2VtoUzw==
Date: Mon, 30 Dec 2024 20:01:26 +0800
From: Peter Chen <peter.chen@kernel.org>
To: xiehongyu1@kylinos.cn
Cc: pawell@cadence.com, rogerq@kernel.org, frank.li@nxp.com,
	gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: cdns3: remove redundant if branch
Message-ID: <20241230120126.GA837002@nchen-desktop>
References: <20241230083855.52482-1-xiehongyu1@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241230083855.52482-1-xiehongyu1@kylinos.cn>

On 24-12-30 16:38:55, xiehongyu1@kylinos.cn wrote:
> From: Hongyu Xie <xiehongyu1@kylinos.cn>
> 
> cdns->role_sw->dev->driver_data gets set in routines showing bellow,

%s/bellow/below, others are okay for me.

> cdns_init
>   sw_desc.driver_data = cdns;
>   cdns->role_sw = usb_role_switch_register(dev, &sw_desc);
>     dev_set_drvdata(&sw->dev, desc->driver_data);
> 
> In cdns_resume,
> cdns->role = cdns_role_get(cdns->role_sw); //line redundant
>   struct cdns *cdns = usb_role_switch_get_drvdata(sw);
>     dev_get_drvdata(&sw->dev)
>       return dev->driver_data
> return cdns->role;
> 
> "line redundant" equals to,
> 	cdns->role = cdns->role;
> 
> So fix this if branch.
> 
> Fixes: 2cf2581cd229 ("usb: cdns3: add power lost support for system resume")
> Signed-off-by: Hongyu Xie <xiehongyu1@kylinos.cn>

Acked-by: Peter Chen <peter.chen@kernel.org>

> ---
>  drivers/usb/cdns3/core.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/cdns3/core.c b/drivers/usb/cdns3/core.c
> index 465e9267b49c..98980a23e1c2 100644
> --- a/drivers/usb/cdns3/core.c
> +++ b/drivers/usb/cdns3/core.c
> @@ -529,9 +529,7 @@ int cdns_resume(struct cdns *cdns)
>  	int ret = 0;
>  
>  	if (cdns_power_is_lost(cdns)) {
> -		if (cdns->role_sw) {
> -			cdns->role = cdns_role_get(cdns->role_sw);
> -		} else {
> +		if (!cdns->role_sw) {
>  			real_role = cdns_hw_role_state_machine(cdns);
>  			if (real_role != cdns->role) {
>  				ret = cdns_hw_role_switch(cdns);
> -- 
> 2.25.1
> 

