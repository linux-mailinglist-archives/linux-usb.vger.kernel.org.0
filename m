Return-Path: <linux-usb+bounces-29025-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C231BC4884
	for <lists+linux-usb@lfdr.de>; Wed, 08 Oct 2025 13:20:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E04413C5308
	for <lists+linux-usb@lfdr.de>; Wed,  8 Oct 2025 11:20:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F380A2EC54A;
	Wed,  8 Oct 2025 11:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="paipB72+"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 784F31D95A3
	for <linux-usb@vger.kernel.org>; Wed,  8 Oct 2025 11:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759922409; cv=none; b=eTDj0ti/QWTvDo2xyTRybTTdFtWFZk6+CBnLHOFYJWFwCDRfjvMGAAyNNx26rpl9ndg3bLQBTuz4Ne0i1oL8Fj6hweZA544vCPjaqABYIFk5xEJBA2ecnu5DjA//R5kwZbO19FOcCV/Sb/F3lbLWfrpyjnyaWP5m9ata8AXnSr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759922409; c=relaxed/simple;
	bh=OlgW0Sp5hUXbBm2b/ic/Z8tkKwO86XF+KibR2jtEOYA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iO1/43PJcvfE7Bbi28ywc+KbOCL030KM9mlPkLyS5MT4uis1h2HIcwXGRdVD8wQQ6/ePM3xsVbF2IOCP35AHbveIucCDh02TSstPSOC7HXid/7fIO8t3M1P8UHpbvzEgjbMqX5n4ASlhkTX/ZoxhP8EFab/xuqy1b5auTsIlHg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=paipB72+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E332DC4CEF4;
	Wed,  8 Oct 2025 11:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1759922409;
	bh=OlgW0Sp5hUXbBm2b/ic/Z8tkKwO86XF+KibR2jtEOYA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=paipB72+mZVP6FCS9AfegUgB5acDf+UxAiY5WAlfRyxFlxv5xSkb0ecu/MW17VVy/
	 Iyt6Bkr5h2SwNbrPmspx9c41/LfR6/S5wL+ONrTlc8qzERGW0CVTfnGwx+b9agJlHE
	 QvUYUS4BbU9yP3+lReKuz/FEF3q1CuOEV4TuKeDE=
Date: Wed, 8 Oct 2025 13:20:06 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: =?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 2/4] xhci: dbc: allow to set serial number through
 sysfs
Message-ID: <2025100821-turtle-breeder-302e@gregkh>
References: <20251007213902.2231670-1-ukaszb@google.com>
 <20251007213902.2231670-3-ukaszb@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251007213902.2231670-3-ukaszb@google.com>

On Tue, Oct 07, 2025 at 09:39:00PM +0000, Łukasz Bartosik wrote:
> From: Łukasz Bartosik <ukaszb@chromium.org>
> 
> Add code which allows to set serial number of a DbC
> device through sysfs.
> 
> Signed-off-by: Łukasz Bartosik <ukaszb@chromium.org>
> ---
>  .../testing/sysfs-bus-pci-drivers-xhci_hcd    | 13 +++++++
>  drivers/usb/host/xhci-dbgcap.c                | 36 +++++++++++++++++++
>  2 files changed, 49 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-pci-drivers-xhci_hcd b/Documentation/ABI/testing/sysfs-bus-pci-drivers-xhci_hcd
> index fc82aa4e54b0..071688dbd969 100644
> --- a/Documentation/ABI/testing/sysfs-bus-pci-drivers-xhci_hcd
> +++ b/Documentation/ABI/testing/sysfs-bus-pci-drivers-xhci_hcd
> @@ -85,3 +85,16 @@ Description:
>  		up to 5000. The default value is 64 ms.
>  		This polling interval is used while DbC is enabled but has no
>  		active data transfers.
> +
> +What:          /sys/bus/pci/drivers/xhci_hcd/.../dbc_iSerial
> +Date:          October 2025
> +Contact:       Łukasz Bartosik <ukaszb@chromium.org>
> +Description:
> +               The dbc_iSerial attribute allows to change the iSerial field
> +               presented in the USB device descriptor by xhci debug device.
> +               Value can only be changed while debug capability (DbC) is in
> +               disabled state to prevent USB device descriptor change while
> +               connected to a USB host.
> +               The default value is "0001".
> +               The field length can be from 1 to 63 characters.
> +
> diff --git a/drivers/usb/host/xhci-dbgcap.c b/drivers/usb/host/xhci-dbgcap.c
> index c2fecaffd6f3..7ad83548ba4d 100644
> --- a/drivers/usb/host/xhci-dbgcap.c
> +++ b/drivers/usb/host/xhci-dbgcap.c
> @@ -1200,6 +1200,40 @@ static ssize_t dbc_bcdDevice_store(struct device *dev,
>  	return size;
>  }
>  
> +static ssize_t dbc_iSerial_show(struct device *dev,
> +			    struct device_attribute *attr,
> +			    char *buf)
> +{
> +	struct xhci_hcd	*xhci = hcd_to_xhci(dev_get_drvdata(dev));
> +	struct xhci_dbc	*dbc = xhci->dbc;
> +
> +	return sysfs_emit(buf, "%s\n", dbc->str.serial);
> +}
> +
> +static ssize_t dbc_iSerial_store(struct device *dev,
> +			     struct device_attribute *attr,
> +			     const char *buf, size_t size)
> +{
> +	struct xhci_hcd	*xhci = hcd_to_xhci(dev_get_drvdata(dev));
> +	struct xhci_dbc	*dbc = xhci->dbc;
> +	size_t len;
> +
> +	if (dbc->state != DS_DISABLED)
> +		return -EBUSY;
> +
> +	len = strcspn(buf, "\n");

So you are requiring the \n to be there?  Why?  What tool will write it?
You don't document this in up in the documentation :)

> +	if (!len)
> +		return -EINVAL;
> +
> +	if (len > USB_MAX_STRING_LEN/2)
> +		return -E2BIG;
> +
> +	memcpy(dbc->str.serial, buf, len);
> +	dbc->str.serial[len] = '\0';

As you know that buf is zero terminated, you can do a strcpy instead of
this two-step process.  Ah, but that \n character, why not just zap it
out if it is present?

thanks,

greg k-h

