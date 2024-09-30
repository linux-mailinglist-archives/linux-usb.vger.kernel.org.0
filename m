Return-Path: <linux-usb+bounces-15594-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EAF298A3CF
	for <lists+linux-usb@lfdr.de>; Mon, 30 Sep 2024 15:00:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9B5A0B2204C
	for <lists+linux-usb@lfdr.de>; Mon, 30 Sep 2024 12:59:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A16B7190492;
	Mon, 30 Sep 2024 12:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q0ozn14j"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 265D819004D
	for <linux-usb@vger.kernel.org>; Mon, 30 Sep 2024 12:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727701026; cv=none; b=B2pJz6pzWPUA80ifUAxCpCv6DNXER877IiYE5pbErUcQmVXw3CrK0vD1NLaNdUg0IePXpWkf8DJ7MnrJv58Bhd8t7GzwzQv7Otgi0PqcgL8MH8fkzOgu8KGJ84p4vDw5/dRekzVWSfuYIWpTsFagaP+WeqatEAg5W+5i84Fxe6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727701026; c=relaxed/simple;
	bh=FCzXZbiv7JAbKlIcFbVoq6HXziBfR/EDqwLCGmgYJaw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i+u5+9eTacmcGgOxTGhILmpxXk2pnJD6m5Foe2E0mUA0x/DqvXqGHo/+lCmhpvF97+SYCpCR5FGL58bhecd5/wownUlEpbyXvzLYHkH7mAcjA/Ap4A97e696p2SSezYkWqMMrqIlcVOyGPN5SPE0w9SPd/SJWP3gz5ZQ2IzvKcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q0ozn14j; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0370BC4CEC7;
	Mon, 30 Sep 2024 12:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727701026;
	bh=FCzXZbiv7JAbKlIcFbVoq6HXziBfR/EDqwLCGmgYJaw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q0ozn14jH9a+JVgkoLmPlaeCoDnSSoj4rKZCvvBYHGfnE/c4LAyD26o61tmBPEDRo
	 YycTr2VBonmzkTYTc1Tdx2Yy7MkDg7RbIDmRk+uY5hby+AlMoujZVqUnsFwfd2bMrD
	 iMz4+K8v+/flP1/i9K+mkG4N3ZG93/hQklFioM3lWnjlUsONMMSB6QZjokqVgml3se
	 ptssREL7YETR5XUNSkB9G5sYVIpi/pbcYTWbcicBni8uKHBv++PaOg+VjDCjoF5iYx
	 dy9P2evNgZeE9qLKGGeq4PSJAXGK2D+6IaYpBC0cmunzcG/VGkK/7jQZOJN+tUnFV7
	 EIho/9DWFn/3A==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1svFxY-000000003yE-1jwd;
	Mon, 30 Sep 2024 14:57:04 +0200
Date: Mon, 30 Sep 2024 14:57:04 +0200
From: Johan Hovold <johan@kernel.org>
To: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Cc: mathias.nyman@intel.com, gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [PATCH] xhci: Change pm_runtime_forbid to pm_runtime_disable
Message-ID: <ZvqgINVgkYf_r6hY@hovoldconsulting.com>
References: <20240925161520.2736895-1-Basavaraj.Natikar@amd.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240925161520.2736895-1-Basavaraj.Natikar@amd.com>

On Wed, Sep 25, 2024 at 09:45:20PM +0530, Basavaraj Natikar wrote:
> Change pm_runtime_forbid to pm_runtime_disable to disable RPM on
> platforms that don't support runtime D3, as re-enabling it through sysfs
> auto power control may cause the controller to malfunction. This can lead
> to issues such as hotplug devices not being detected due to failed
> interrupt generation.
> 
> Fixes: a5d6264b638e ("xhci: Enable RPM on controllers that support low-power states")
> Suggested-by: Mario Limonciello <mario.limonciello@amd.com>
> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
> ---
>  drivers/usb/host/xhci-pci.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
> index dc1e345ab67e..39ab32fed3f4 100644
> --- a/drivers/usb/host/xhci-pci.c
> +++ b/drivers/usb/host/xhci-pci.c
> @@ -635,7 +635,7 @@ static int xhci_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
>  	pm_runtime_put_noidle(&dev->dev);
>  
>  	if (pci_choose_state(dev, PMSG_SUSPEND) == PCI_D0)
> -		pm_runtime_forbid(&dev->dev);
> +		pm_runtime_disable(&dev->dev);

This looks broken. Runtime PM enable/disable should always be balanced,
and unlike forbid(), disable() doesn't make sure that the device is
actually active.

If you want to prevent the device from runtime suspending you can just
increment the usage counter here in probe() and drop it in remove().

>  	else if (xhci->quirks & XHCI_DEFAULT_PM_RUNTIME_ALLOW)
>  		pm_runtime_allow(&dev->dev);

NAK.

Johan

