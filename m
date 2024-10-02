Return-Path: <linux-usb+bounces-15637-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1F898CD33
	for <lists+linux-usb@lfdr.de>; Wed,  2 Oct 2024 08:32:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 918372876E1
	for <lists+linux-usb@lfdr.de>; Wed,  2 Oct 2024 06:32:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9155412BF24;
	Wed,  2 Oct 2024 06:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="FflTJqSQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1858784D0E
	for <linux-usb@vger.kernel.org>; Wed,  2 Oct 2024 06:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727850757; cv=none; b=eTlR5QqwO/OHeGluI8S43NRpLTrd+bT0gWvVux9ljYApfOs0tCMfdf6dq7uQTFQ2RnH0sfntSgOXi2ZZqmT+e/B90aaZOFcgGGL2j0RYFtzdEAa4D3mtNXacQn6nvGQzvQ1TTRlzXW/f+0fJqwO1Mkyi/oJzuPgIt8Px7kDLiPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727850757; c=relaxed/simple;
	bh=NhFOQZiO18dudM+phToTEQ1WERZiBm6NbFz36JtcPCM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yxpn47EsFalG2M2vQmnzHLXULOsrysaezXgEpjYpFxVTnOYgC5yb4d8EiuC7CX5mfQN1wFaRfs85jcHxAHShLh+Lhuok/r16OMIQW7GGPfp+l+yJZdb7mofcZMEXdpJYVHbek9oPfUN+10rNMcJ3Y3kpns+HCOs9+v1pehQsdJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=FflTJqSQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C49BC4CEC5;
	Wed,  2 Oct 2024 06:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1727850756;
	bh=NhFOQZiO18dudM+phToTEQ1WERZiBm6NbFz36JtcPCM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FflTJqSQSiBgwBCAVDULQ31dlWnsGZ7xD42tSj67DSD5cRDVQcvJWrSo9gE2ox6uq
	 MsvHaoNWjY9LSXMCQYB2IoLISQue0gZkVGkZjGRrXKEHsZzrTeqBeZs9FLfC2qPDTL
	 d1GAk4C2NdMSzLxT322bvn9sk3Z+fxZEb7UTLrxU=
Date: Wed, 2 Oct 2024 08:32:34 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: mike Seo <mikeseohyungjin@gmail.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: [PATCH] r8152: Add MAPT for lg laptops
Message-ID: <2024100216-referee-upon-3e5d@gregkh>
References: <ZvyrfUYF8_I5df-7@mikeseo-0-1>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZvyrfUYF8_I5df-7@mikeseo-0-1>

On Wed, Oct 02, 2024 at 11:10:05AM +0900, mike Seo wrote:
> LG gram laptops support mac address pass-thru with its usb lan adapter
> using Realtek USB ethernet Vendor and Product IDs, rtl8153b-2.
> ACPI objects of the gram laptops are safisfied to -AD.
> Signed-off-by: mike Seo <mikeseohyungjin@gmail.com>

We need a blank line between your signed-off-by and the changelog text.
Please always use scripts/checkpatch.pl before sending a patch out.

Also use scripts/get_maintainer.pl to determine who to send it to.

thanks,

greg k-h

