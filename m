Return-Path: <linux-usb+bounces-28781-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 681CFBA943C
	for <lists+linux-usb@lfdr.de>; Mon, 29 Sep 2025 15:00:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6639C1889D8F
	for <lists+linux-usb@lfdr.de>; Mon, 29 Sep 2025 13:01:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D066A3009C7;
	Mon, 29 Sep 2025 13:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="G+g7i4bY"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 533D026D4DE
	for <linux-usb@vger.kernel.org>; Mon, 29 Sep 2025 13:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759150848; cv=none; b=DYS0Ieqo17tW1Y1GGZ62tdb68dgIahrrfdhIW8JjKBT9b6sNjr0fxKWeyW/vBWLxhR8LJXE/9y2mwbFoNxN3q2HAY8a6CHzhokInDlF0f1sfYdz7MjnXZNBQrokZ4EXbgRpeq9SHMX4QP8qUy7Dx0UYYVF47boiG8cd1m+tZ6zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759150848; c=relaxed/simple;
	bh=GyQuvX4GXSC9y/eMZkue/sQOFMQuIoHO27+ZVP5I/AM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PGnSz3wef7V6j2Kmij4Jt9ZP76dtip6TU4sz0TmyE+G6j4fxo+Tv2qG4vWIg36NwweMPEQXwE+INf7j91pQxggC0Bk1vlcnpcMBQCupzu2+dN1E+HFCvbpPxz+1T5uJXqZIDbgK6iO+LIhMlFrxC4uGJRTNaJdjla4b2VeIJTa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=G+g7i4bY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EADDC4CEF4;
	Mon, 29 Sep 2025 13:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1759150846;
	bh=GyQuvX4GXSC9y/eMZkue/sQOFMQuIoHO27+ZVP5I/AM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G+g7i4bYtld2PSnkctG/SKNB6UJaVHyNKyJGu7jVNXDfNGtLf4aK72AfF2absmQuH
	 e1f70u6yg6rThkUh1f4bH/eaioumlevWebfF0sXipNlb5lzItwDjnisCEKGNq0cTrl
	 Z2mVnuAdg4l7HdtS0ffXJ/JnnFJFA/66ju9wDkaw=
Date: Mon, 29 Sep 2025 15:00:44 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: =?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v1 2/4] xhci: dbc: allow to set serial number through
 sysfs
Message-ID: <2025092924-nebulizer-overexert-4cfb@gregkh>
References: <20250929090206.423937-1-ukaszb@google.com>
 <20250929090206.423937-3-ukaszb@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250929090206.423937-3-ukaszb@google.com>

On Mon, Sep 29, 2025 at 09:02:04AM +0000, Łukasz Bartosik wrote:
> From: Łukasz Bartosik <ukaszb@chromium.org>
> 
> Add code which allows to set serial number of a DbC
> device through sysfs.
> 
> Signed-off-by: Łukasz Bartosik <ukaszb@chromium.org>
> ---
>  drivers/usb/host/xhci-dbgcap.c | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/drivers/usb/host/xhci-dbgcap.c b/drivers/usb/host/xhci-dbgcap.c
> index c2fecaffd6f3..5cc201afe8f4 100644
> --- a/drivers/usb/host/xhci-dbgcap.c
> +++ b/drivers/usb/host/xhci-dbgcap.c
> @@ -1200,6 +1200,36 @@ static ssize_t dbc_bcdDevice_store(struct device *dev,
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
> +
> +	if (dbc->state != DS_DISABLED)
> +		return -EBUSY;
> +
> +	if (size > USB_MAX_STRING_LEN/2+1)
> +		return -E2BIG;
> +
> +	memcpy(dbc->str.serial, buf, size);
> +	/* remove newline and terminate the string */
> +	dbc->str.serial[size-1] = '\0';

What if there is not a newline?

