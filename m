Return-Path: <linux-usb+bounces-15210-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DCBC97B77D
	for <lists+linux-usb@lfdr.de>; Wed, 18 Sep 2024 07:39:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 45D521F210F1
	for <lists+linux-usb@lfdr.de>; Wed, 18 Sep 2024 05:39:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D75A713D8A2;
	Wed, 18 Sep 2024 05:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="XjXiaTIJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4682C28EF
	for <linux-usb@vger.kernel.org>; Wed, 18 Sep 2024 05:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726637979; cv=none; b=TwR+eahOyYsp83S48tLoW7eccMtM3O1g9xk7skWL9VX1G8lqzCjCtQlAJDfBJC34qYsuEzqMsqoQdFCJw/pNTTiLvFqilGJue1H/ZO6tP6qYgbqkpZXLyW/bMjNycyxTw35mcUgHbNGRI9i/rZFJ4TM+8BBTt0waoKRDxQeTogc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726637979; c=relaxed/simple;
	bh=/9XocjqbdOTgQ1i5Ap5iJ3AeNxox5PoGl9ZNSCHahw0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pdun36Xq3+ab3C0gPeeGuDpmL33O4orN4ekvGvWq8yn9ZN7ij3fav9fDcQSKkpkFdibqPR2AYmbGPJOCn2yTs9VWe1yYRFpWEWZReBX0ZuMgtuEnwJFej8j+PvOzg9BuHZmHBQIHzRy+G41ba8QvRIi4yL1AAODqH/CtC6rRQu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=XjXiaTIJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E07FC4CEC3;
	Wed, 18 Sep 2024 05:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1726637978;
	bh=/9XocjqbdOTgQ1i5Ap5iJ3AeNxox5PoGl9ZNSCHahw0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XjXiaTIJ8ZRsxiOKufQrnQF3eRZIvkwfJ9ZT2gA8r1UQU3hgbYqVU7Bo2J78fsdXZ
	 twi87aVtZVPeIwi53XQasNj32xBaYaX6e9O6VBu/qWwYhbRd0HZd4CjhDFrpPjzdQe
	 ZkivsuqbjosXhkUTOK1jGJcC3VLbJUp0Hi2VG+tY=
Date: Wed, 18 Sep 2024 07:39:36 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jose Alberto Reguero <jose.alberto.reguero@gmail.com>
Cc: linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>
Subject: Re: PATCH: Fix problem with xhci resume from suspend
Message-ID: <2024091820-substance-ergonomic-9ea0@gregkh>
References: <CAKHHu8rQTrTQM4Bsst-6wdUPxkuNP1bCc9Gq4WsLnwP5j4wkYg@mail.gmail.com>
 <2024091756-gathering-ocean-ba9c@gregkh>
 <CAKHHu8paEWRs6qA9Y6v35z_JzcXGKdJwfCjQwOn90kJScAJoGw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKHHu8paEWRs6qA9Y6v35z_JzcXGKdJwfCjQwOn90kJScAJoGw@mail.gmail.com>

On Tue, Sep 17, 2024 at 11:35:53PM +0200, Jose Alberto Reguero wrote:
> Than you.  I resubmit the patch.
> 
> Jose Alberto Reguero
> 
> diff -ur linux-6.10.8/drivers/usb/host/xhci-pci.c
> linux-6.10.8.new/drivers/usb/host/xhci-pci.c
> --- linux-6.10.8/drivers/usb/host/xhci-pci.c    2024-09-04
> 13:30:16.000000000 +0200
> +++ linux-6.10.8.new/drivers/usb/host/xhci-pci.c        2024-09-12
> 19:37:14.378870385 +0200
> @@ -76,6 +76,7 @@
>  #define PCI_DEVICE_ID_ASMEDIA_1042A_XHCI               0x1142
>  #define PCI_DEVICE_ID_ASMEDIA_1142_XHCI                        0x1242
>  #define PCI_DEVICE_ID_ASMEDIA_2142_XHCI                        0x2142
> +#define PCI_DEVICE_ID_ASMEDIA_3042_XHCI                        0x3042
>  #define PCI_DEVICE_ID_ASMEDIA_3242_XHCI                        0x3242
> 
>  static const char hcd_name[] = "xhci_hcd";
> @@ -447,6 +448,10 @@
>                 pdev->device == PCI_DEVICE_ID_ASMEDIA_1042A_XHCI)
>                 xhci->quirks |= XHCI_ASMEDIA_MODIFY_FLOWCONTROL;
> 
> +       if (pdev->vendor == PCI_VENDOR_ID_ASMEDIA &&
> +               pdev->device == PCI_DEVICE_ID_ASMEDIA_3042_XHCI)
> +               xhci->quirks |= XHCI_RESET_ON_RESUME;
> +
>         if (pdev->vendor == PCI_VENDOR_ID_TI && pdev->device == 0x8241)
>                 xhci->quirks |= XHCI_LIMIT_ENDPOINT_INTERVAL_7;

Tabs are all stripped out :(


