Return-Path: <linux-usb+bounces-20104-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 21084A272ED
	for <lists+linux-usb@lfdr.de>; Tue,  4 Feb 2025 14:37:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A83A21630F4
	for <lists+linux-usb@lfdr.de>; Tue,  4 Feb 2025 13:37:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AA9B211708;
	Tue,  4 Feb 2025 13:12:12 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C665C20E305
	for <linux-usb@vger.kernel.org>; Tue,  4 Feb 2025 13:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738674731; cv=none; b=fY1CnKOt+LA3lCcKm122dKsTFFC7CbrcWgYD6zXACJ8MaRyfApzr4py+PEPR2fMMyUaZGlNaFRKCOKUoeLWCmCECL+LG/AOqt3MWKAjyGX3c5E6zKmhVMcgAK9YFJBpYb6TenBDYejnoprwg9ACMXLGOOxtZYOpbxEhiYfwSxww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738674731; c=relaxed/simple;
	bh=3s2L8Qb+aHSB3a/0FR38Jtgc3jsohrsMc1837jly4jI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ObH16EK1DsftksSTACjVD2YBXl6dQptdA+XFHpTzLgIomJVkzoUEJfd9MBU0zzVlnZSNtgGAkwPyEj56iXbbXSG7dQDNqo8YAZfJj2nFZMWQ3xXl8iwp6tax68db4tGVaX6E5tGp78d7k9AnggRbE7DsbmNSjuMfVNSjlOgIUNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4943C4CEE2;
	Tue,  4 Feb 2025 13:12:10 +0000 (UTC)
Date: Tue, 4 Feb 2025 14:12:07 +0100
From: Greg KH <greg@kroah.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Use my kernel.org address for
 USB4/Thunderbolt work
Message-ID: <2025020456-wildfowl-washhouse-eb2c@gregkh>
References: <20250204124959.3998521-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250204124959.3998521-1-mika.westerberg@linux.intel.com>

On Tue, Feb 04, 2025 at 02:49:59PM +0200, Mika Westerberg wrote:
> Switch to use my kernel.org address for USB4/Thunderbolt work.
> 
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> ---
>  MAINTAINERS | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 896a307fa065..0c98d6c71372 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -23571,7 +23571,7 @@ F:	drivers/thunderbolt/dma_test.c
>  THUNDERBOLT DRIVER
>  M:	Andreas Noever <andreas.noever@gmail.com>
>  M:	Michael Jamet <michael.jamet@intel.com>
> -M:	Mika Westerberg <mika.westerberg@linux.intel.com>
> +M:	Mika Westerberg <westeri@kernel.org>
>  M:	Yehezkel Bernat <YehezkelShB@gmail.com>
>  L:	linux-usb@vger.kernel.org
>  S:	Maintained
> @@ -23582,7 +23582,7 @@ F:	include/linux/thunderbolt.h
>  
>  THUNDERBOLT NETWORK DRIVER
>  M:	Michael Jamet <michael.jamet@intel.com>
> -M:	Mika Westerberg <mika.westerberg@linux.intel.com>
> +M:	Mika Westerberg <westeri@kernel.org>
>  M:	Yehezkel Bernat <YehezkelShB@gmail.com>
>  L:	netdev@vger.kernel.org
>  S:	Maintained
> -- 
> 2.47.2
> 
> 

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

