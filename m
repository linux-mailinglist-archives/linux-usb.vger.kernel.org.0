Return-Path: <linux-usb+bounces-29209-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D04BD230C
	for <lists+linux-usb@lfdr.de>; Mon, 13 Oct 2025 11:01:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 152964EEEA3
	for <lists+linux-usb@lfdr.de>; Mon, 13 Oct 2025 09:01:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A37F72F9DBB;
	Mon, 13 Oct 2025 09:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="guM5ndLz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1689C2E975E
	for <linux-usb@vger.kernel.org>; Mon, 13 Oct 2025 09:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760346104; cv=none; b=Er7XZELjDFXAAFifywKUXRoeXW83dJ0Mh+liNbXIZ4RnIwodJ14RB2i4qNKJPHhG77S++btMMN2puC1P0C3jrPuGYA3MGxTlZiP6JavWpDy141hwJoyZbYBzVqNFxNMnFbUhB6ToTZXItpiRUBhXjip8mHCwque4A+LthBq2ixw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760346104; c=relaxed/simple;
	bh=aMZqlv/9EcGwi5jOAerpeCxJ3x90vJUiOq14psEud0Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zhb2N/c3JNd9hF9RSZNiHAaH8hEGEH3rMFJO7qVxE0z9eA743dYdyZdbZB4qZS2L6eeu8YChB5+fHi36NbM+bwQqXYTRd+9tjbTVyEq+vXhAI+gfuT5jKDm3yYzTdAAWh0R1Be4gZcNnvAPT9hzWpB9HTnN5TV78UWlXM9x3EnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=guM5ndLz; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760346102; x=1791882102;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=aMZqlv/9EcGwi5jOAerpeCxJ3x90vJUiOq14psEud0Y=;
  b=guM5ndLzWA+/NBQQHjK/1ewBF/hfbDMOlVlvkh01B743x6wy4XuOht17
   Qp8t6xfiM22igR9EROhH81NNCvhJBrgvp4GibKHM1sYJ5DSE5C1Bw46MP
   r0vUPC4fjG4ik0xQiK2ANnjH5rNSXd/DGTdaR44K8dyGelddF0u9CiUi8
   uebZqIyoCg6lSKYUdyspCUehNiHtVTAzx4+WRzl1DaHrRR53c0T/HIuz1
   Kx22S91BAWzcL5y3OwivTrG1yXd7rOEc82u1VCwjMA25o8rQzGzXeB2/G
   VL2RVHTuuvaGqRr/Y56tmtrAR9AsCEScwW7am9GpGk5DPxjYtsGs9Jq/h
   g==;
X-CSE-ConnectionGUID: J16sbjpHSASZtiPBrNBYdA==
X-CSE-MsgGUID: kTzp60oVSyu4ep66+MrQDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11580"; a="61685688"
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; 
   d="scan'208";a="61685688"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2025 02:01:41 -0700
X-CSE-ConnectionGUID: dVyeZaB2SKaGShqosdwBqQ==
X-CSE-MsgGUID: NdkeTBpnQ2W5zOclVx1OeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; 
   d="scan'208";a="212176282"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO [10.245.244.60]) ([10.245.244.60])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2025 02:01:39 -0700
Message-ID: <e73344be-0434-436b-be9b-e86f62d377a3@linux.intel.com>
Date: Mon, 13 Oct 2025 12:01:37 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] xhci: dbc: allow to set product name through sysfs
To: =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
References: <20251007213902.2231670-1-ukaszb@google.com>
 <20251007213902.2231670-4-ukaszb@google.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20251007213902.2231670-4-ukaszb@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/8/25 00:39, Łukasz Bartosik wrote:
> From: Łukasz Bartosik <ukaszb@chromium.org>
> 
> Add code which allows to set product name of a DbC
> device through sysfs.
> 
> Signed-off-by: Łukasz Bartosik <ukaszb@chromium.org>
> ---
>   .../testing/sysfs-bus-pci-drivers-xhci_hcd    | 11 ++++++
>   drivers/usb/host/xhci-dbgcap.c                | 36 +++++++++++++++++++
>   2 files changed, 47 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-pci-drivers-xhci_hcd b/Documentation/ABI/testing/sysfs-bus-pci-drivers-xhci_hcd
> index 071688dbd969..57ba37606f79 100644
> --- a/Documentation/ABI/testing/sysfs-bus-pci-drivers-xhci_hcd
> +++ b/Documentation/ABI/testing/sysfs-bus-pci-drivers-xhci_hcd
> @@ -98,3 +98,14 @@ Description:
>                  The default value is "0001".
>                  The field length can be from 1 to 63 characters.
>   
> +What:          /sys/bus/pci/drivers/xhci_hcd/.../dbc_iProduct
> +Date:          October 2025
> +Contact:       Łukasz Bartosik <ukaszb@chromium.org>
> +Description:
> +               The dbc_iProduct attribute allows to change the iProduct field
> +               presented in the USB device descriptor by xhci debug device.
> +               Value can only be changed while debug capability (DbC) is in
> +               disabled state to prevent USB device descriptor change while
> +               connected to a USB host.
> +               The default value is "Linux USB Debug Target".
> +               The field length can be from 1 to 63 characters.
> diff --git a/drivers/usb/host/xhci-dbgcap.c b/drivers/usb/host/xhci-dbgcap.c
> index 7ad83548ba4d..bc782f6b533e 100644
> --- a/drivers/usb/host/xhci-dbgcap.c
> +++ b/drivers/usb/host/xhci-dbgcap.c
> @@ -1200,6 +1200,40 @@ static ssize_t dbc_bcdDevice_store(struct device *dev,
>   	return size;
>   }
>   
> +static ssize_t dbc_iProduct_show(struct device *dev,
> +				 struct device_attribute *attr,
> +				 char *buf)
> +{
> +	struct xhci_hcd	*xhci = hcd_to_xhci(dev_get_drvdata(dev));
> +	struct xhci_dbc	*dbc = xhci->dbc;
> +
> +	return sysfs_emit(buf, "%s\n", dbc->str.product);
> +}
> +
> +static ssize_t dbc_iProduct_store(struct device *dev,
> +				  struct device_attribute *attr,
> +				  const char *buf, size_t size)
> +{
> +	struct xhci_hcd	*xhci = hcd_to_xhci(dev_get_drvdata(dev));
> +	struct xhci_dbc	*dbc = xhci->dbc;
> +	size_t len;
> +
> +	if (dbc->state != DS_DISABLED)
> +		return -EBUSY;
> +
> +	len = strcspn(buf, "\n");
> +	if (!len)
> +		return -EINVAL;
> +
> +	if (len > USB_MAX_STRING_LEN/2)
> +		return -E2BIG;
> +
> +	memcpy(dbc->str.product, buf, len);
> +	dbc->str.product[len] = '\0';
> +
> +	return size;
> +}
> +
>   static ssize_t dbc_iSerial_show(struct device *dev,
>   			    struct device_attribute *attr,
>   			    char *buf)
> @@ -1321,6 +1355,7 @@ static DEVICE_ATTR_RW(dbc);
>   static DEVICE_ATTR_RW(dbc_idVendor);
>   static DEVICE_ATTR_RW(dbc_idProduct);
>   static DEVICE_ATTR_RW(dbc_bcdDevice);
> +static DEVICE_ATTR_RW(dbc_iProduct);
>   static DEVICE_ATTR_RW(dbc_iSerial);
>   static DEVICE_ATTR_RW(dbc_bInterfaceProtocol);
>   static DEVICE_ATTR_RW(dbc_poll_interval_ms);
> @@ -1330,6 +1365,7 @@ static struct attribute *dbc_dev_attrs[] = {
>   	&dev_attr_dbc_idVendor.attr,
>   	&dev_attr_dbc_idProduct.attr,
>   	&dev_attr_dbc_bcdDevice.attr,
> +	&dev_attr_dbc_iProduct.attr,

Small naming thing again.

"dbc_idProduct" and dbc_iProduct" are a bit too similar.

Usb core uses "product" and "manufacturer" sysfs entries to show these strings.
I think dbc should use similar "dbc_product" and "dbc_manufacturer" naming.

the "iProduct" is a byte in device descriptor telling the index of the product string
descriptor.

Thanks
Mathias


