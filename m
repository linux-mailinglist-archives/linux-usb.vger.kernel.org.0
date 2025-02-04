Return-Path: <linux-usb+bounces-20123-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD55A276CC
	for <lists+linux-usb@lfdr.de>; Tue,  4 Feb 2025 17:06:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A3F4016539C
	for <lists+linux-usb@lfdr.de>; Tue,  4 Feb 2025 16:06:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A6C621518B;
	Tue,  4 Feb 2025 16:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hx60w7Gi"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D97052147F7
	for <linux-usb@vger.kernel.org>; Tue,  4 Feb 2025 16:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738685169; cv=none; b=i18KhUYIdIW8BUEe+lt9/w35Ja109DhzT78qX5cIi9UCUMXkWR4g4SVWkNAFZHDUTo6LYsL9DwTNNJqtfCm0VT1AMZJHsQausBDJiHW3KvzPQI5jVTwHWs2IFEncWCI95/ITOqLsylHH++23reL87obHc2BqGDlGZeyyewO2jV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738685169; c=relaxed/simple;
	bh=qQegIozjkH9TBP91F4jmFBgGUqOVqHPMNdVJCBtfoJQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RTFJ10cx4aMKXQ82fNrpu7yHLXSFojyBKqELdw4v8R8xR2AH66ES+XlcZZvCzLRekS42dr4uej9SPxQeERUmWwrTFpbHkdhHuTm5vYZ0IYnCW7hD5ShjONFx4e5HjgzY6HK5knTyxvIPB4+26866a1fxflNflr9rE/qNKpUKeHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hx60w7Gi; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738685168; x=1770221168;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=qQegIozjkH9TBP91F4jmFBgGUqOVqHPMNdVJCBtfoJQ=;
  b=Hx60w7Gi7jrxFoz7IFP5Tdsmxf8H5uE0/dQL3Oa9ZdD4LHv62xhpVW7z
   auGbweUZs4MvrQJYiXUExYD8A/eV8VOJVc1yT6oHTqjpB4vCljagCiJx0
   dFGlHnH5PHJK5CYmeKnulS8DXVPbljJ+4LIQLiUZFQSxqQEtB6y/ECREH
   IyogXzPoaY5fnmkQENdIosLdNOhh0UW1XZEP6Hg2u988AXZcsQtLpsJEp
   O5+aY5jHYbN1CIyLdD8w9l0TFLxnvsDaKBjhujD1A7yizXoIX7wqLnFDv
   KADpL7vJzOHRBH5Am7vjaAYt1E+fYSiatirBiTYV7ALXyx/8kO1/HuEiU
   Q==;
X-CSE-ConnectionGUID: /9LuTr3WRyG7A07kQLA2sA==
X-CSE-MsgGUID: 6catucB0QBCaXz7yDKrmCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39373476"
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; 
   d="scan'208";a="39373476"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 08:05:39 -0800
X-CSE-ConnectionGUID: OLj7Q36xTZym8MKxJNEdIA==
X-CSE-MsgGUID: tEOFmbr4S9GRoL+uNsQ50A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; 
   d="scan'208";a="141507140"
Received: from unknown (HELO [10.237.72.199]) ([10.237.72.199])
  by orviesa002.jf.intel.com with ESMTP; 04 Feb 2025 08:05:37 -0800
Message-ID: <3d52ea9a-7923-4f0f-9da8-507a554639fd@linux.intel.com>
Date: Tue, 4 Feb 2025 18:06:39 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] usb: xhci: set page size to the xHCI-supported
 size
To: Niklas Neronin <niklas.neronin@linux.intel.com>
Cc: michal.pecio@gmail.com, linux-usb@vger.kernel.org
References: <20250204124145.3998098-1-niklas.neronin@linux.intel.com>
 <20250204124145.3998098-3-niklas.neronin@linux.intel.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20250204124145.3998098-3-niklas.neronin@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4.2.2025 14.41, Niklas Neronin wrote:
> The current xHCI driver does not validate whether a page size of 4096
> bytes is supported. Address the issue by setting the page size to the
> value supported by the xHCI controller, as read from the Page Size
> register. In the event of an unexpected value; default to a 4K page size.
> 
> Additionally, this commit removes unnecessary debug messages and instead
> prints the supported and used page size once.
> 
> The xHCI controller supports page sizes of (2^{(n+12)}) bytes, where 'n'
> is the Page Size Bit. Only one page size is supported, with a maximum
> page size of 128 KB.
> 
> Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
> ---
> V3:
>   * Rename local variable 'page_shift' to 'page_size'.
> 
>   drivers/usb/host/xhci-mem.c | 34 ++++++++++++++++++----------------
>   drivers/usb/host/xhci.h     |  8 ++++----
>   2 files changed, 22 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
> index dc5bcd8db4c0..c2ee0d32f5cd 100644
> --- a/drivers/usb/host/xhci-mem.c
> +++ b/drivers/usb/host/xhci-mem.c
> @@ -1953,7 +1953,6 @@ void xhci_mem_cleanup(struct xhci_hcd *xhci)
>   	xhci->interrupters = NULL;
>   
>   	xhci->page_size = 0;
> -	xhci->page_shift = 0;
>   	xhci->usb2_rhub.bus_state.bus_suspended = 0;
>   	xhci->usb3_rhub.bus_state.bus_suspended = 0;
>   }
> @@ -2372,6 +2371,22 @@ xhci_create_secondary_interrupter(struct usb_hcd *hcd, unsigned int segs,
>   }
>   EXPORT_SYMBOL_GPL(xhci_create_secondary_interrupter);
>   
> +static void xhci_hcd_page_size(struct xhci_hcd *xhci)
> +{
> +	u32 page_size;
> +
> +	page_size = readl(&xhci->op_regs->page_size) & XHCI_PAGE_SIZE_MASK;
> +	if (!page_size || page_size & (page_size - 1)) {

is_power_of_2(page_size) does the same, and is easier to understand

-Mathias


