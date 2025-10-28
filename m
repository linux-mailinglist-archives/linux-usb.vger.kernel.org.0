Return-Path: <linux-usb+bounces-29777-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 980D8C14F03
	for <lists+linux-usb@lfdr.de>; Tue, 28 Oct 2025 14:44:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 73F024F5EB7
	for <lists+linux-usb@lfdr.de>; Tue, 28 Oct 2025 13:41:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32C8A3346A0;
	Tue, 28 Oct 2025 13:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="BoPnMpb5"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B36238D54
	for <linux-usb@vger.kernel.org>; Tue, 28 Oct 2025 13:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761658863; cv=none; b=aP4YjVJBz8Z2Te31AXwZY4OaLKNIqSKCPcTscD8olzWXqsx7QvOoRbVndC/JIWbNmsHPnSKmbL5FGR9wNoer8FXHSWscL8vG01c632X0t7t6u8lHYA1dL+ukSW0/RdjEa+gxBPSMH4TBkrGqAxEIKFwih8i/Zke0QyO21MHxWRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761658863; c=relaxed/simple;
	bh=9maqMOor5qX14id5v4594cNwk7OdwIWkjbKvufoXkIE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YkEadts0LNiIt2js/hOTfUDv+YCUu2Q/9fD8Yt5um+Dt8UcduRNNLjbeLDcQLuAaTiFNXhlUm9qbmX/n6D0+AROzzKAp9KYRfpZhF3nmvBXa8nTlLrwUrqe5eFWcwrXDRpOa+nO1XI2MLAz1K5Ono/NkPv9ILJ/zFJOEULML8JE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=BoPnMpb5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15237C4CEE7;
	Tue, 28 Oct 2025 13:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1761658862;
	bh=9maqMOor5qX14id5v4594cNwk7OdwIWkjbKvufoXkIE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BoPnMpb5wPiKpPy8TAw6RkzLhSg52yGIn5BbtGv6RysWTyAiapq4l1W8s4NbofP6t
	 xjr6uNHeQkBlpYpsanZvPsSx+r/cFOdXE3Kw9/YweZcfwDvobW5MVu/ez3m47onnVQ
	 hOasAxrsisUSKr2UIqxiMjPb6o4bRwWMvk7Q2zok=
Date: Tue, 28 Oct 2025 14:32:44 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Oliver Neukum <oneukum@suse.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/1] uapi: cdc.h: cleanly provide for more interfaces and
 countries
Message-ID: <2025102858-doorframe-canola-e6c0@gregkh>
References: <20251028123254.1888303-1-oneukum@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251028123254.1888303-1-oneukum@suse.com>

On Tue, Oct 28, 2025 at 01:32:22PM +0100, Oliver Neukum wrote:
> The spec requires at least one interface respectively country.
> It allows multiple ones. This needs to be clearly said in the UAPI.
> 
> Signed-off-by: Oliver Neukum <oneukum@suse.com>
> ---
>  include/uapi/linux/usb/cdc.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/include/uapi/linux/usb/cdc.h b/include/uapi/linux/usb/cdc.h
> index 1924cf665448..5fcbce0be133 100644
> --- a/include/uapi/linux/usb/cdc.h
> +++ b/include/uapi/linux/usb/cdc.h
> @@ -105,7 +105,7 @@ struct usb_cdc_union_desc {
>  
>  	__u8	bMasterInterface0;
>  	__u8	bSlaveInterface0;
> -	/* ... and there could be other slave interfaces */
> +	__u8	bSlaveInterfaces[];

Can this be combined with bSlaveInterface0?  Feels odd to have 0 and
then "more".

Also, what determines how many, the overall length?

>  } __attribute__ ((packed));
>  
>  /* "Country Selection Functional Descriptor" from CDC spec 5.2.3.9 */
> @@ -116,7 +116,7 @@ struct usb_cdc_country_functional_desc {
>  
>  	__u8	iCountryCodeRelDate;
>  	__le16	wCountyCode0;
> -	/* ... and there can be a lot of country codes */
> +	__le16	wCountyCodes[];

same here.

thanks,

greg k-h

