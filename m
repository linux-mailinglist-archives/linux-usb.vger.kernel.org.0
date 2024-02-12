Return-Path: <linux-usb+bounces-6240-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E25BC8513C9
	for <lists+linux-usb@lfdr.de>; Mon, 12 Feb 2024 13:48:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9CF9B280FB3
	for <lists+linux-usb@lfdr.de>; Mon, 12 Feb 2024 12:48:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D9A239FF5;
	Mon, 12 Feb 2024 12:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="EdRFzBOn"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9CED1E482;
	Mon, 12 Feb 2024 12:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707742102; cv=none; b=bV0nVCeaLEEdp1/DaGItHkTZfJQy3xexmRMFjd53vPtE7Dr8DXc76f4k4V8Aqcmj5WOFOV7VIJUKY8/xdH8GZXFWqkDBXV5DX06Ko0U7SreDMjN58fkISQxGpsdk/Y+qiWnA0hznMAeX2uI6qIzDwwhEpsdLGl40vVtO3QeK0T0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707742102; c=relaxed/simple;
	bh=b/ETvNH0QRXgyQ+Z96RbxU4jW5NVr2/e7WLbdFuf5H4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JcwL/iND+qnZeDUkJnfYzPU/zreRhO4JQJ9iHppXdXtGYeg9PhZSCxQnRRaj7aSgjxQ+DNZrPtSQwdZQFrtgbMPTddEPQ7jUqYXDyxB/EmJvYxRyQbZyncHmxdjRq+oPYdtbSWARWRy3MFNjDNMTDc86RApZ2RLZLRMwVAX41S8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=EdRFzBOn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D11AC433C7;
	Mon, 12 Feb 2024 12:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1707742101;
	bh=b/ETvNH0QRXgyQ+Z96RbxU4jW5NVr2/e7WLbdFuf5H4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EdRFzBOnTpS3rDSbuz7FiOBXtI6XSOgoSuWJK0FA4z60FXKMfDgtK/YYppokqwIaP
	 mfGv7m58H9u97aYa3U1lMUzGlHo4aQYRbqTj0N4GaY7H3AYQ1aiAMH6kc8ZGAMktli
	 RN/3FoKcmoVxYx7EckOkWb9BkTo5p0fXlKRyxOFA=
Date: Mon, 12 Feb 2024 13:48:18 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: fsa4480: Check if the chip is really there
Message-ID: <2024021210-bacteria-camping-7e48@gregkh>
References: <20240212-topic-fs4480_check-v1-1-d9969e4d6f9a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240212-topic-fs4480_check-v1-1-d9969e4d6f9a@linaro.org>

On Mon, Feb 12, 2024 at 01:01:30PM +0100, Konrad Dybcio wrote:
> Currently, the driver will happily register the switch/mux devices, and
> so long as the i2c master doesn't complain, the user would never know
> there's something wrong.
> 
> Add a device id check (based on [1]) and return -ENODEV if the read
> fails or returns nonsense.
> 
> Checking the value on a Qualcomm SM6115P-based Lenovo Tab P11 tablet,
> the ID mentioned in the datasheet does indeed show up:
>  fsa4480 1-0042: Found FSA4480 v1.1 (Vendor ID = 0)
> 
> [1] https://www.onsemi.com/pdf/datasheet/fsa4480-d.pdf
> 
> Fixes: 1dc246320c6b ("usb: typec: mux: Add On Semi fsa4480 driver")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  drivers/usb/typec/mux/fsa4480.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/usb/typec/mux/fsa4480.c b/drivers/usb/typec/mux/fsa4480.c
> index cb7cdf90cb0a..d622f4f3bd54 100644
> --- a/drivers/usb/typec/mux/fsa4480.c
> +++ b/drivers/usb/typec/mux/fsa4480.c
> @@ -13,6 +13,10 @@
>  #include <linux/usb/typec_dp.h>
>  #include <linux/usb/typec_mux.h>
>  
> +#define FSA4480_DEVICE_ID	0x00
> + #define DEVICE_ID_VENDOR_ID	GENMASK(7, 6)
> + #define DEVICE_ID_VERSION_ID	GENMASK(5, 3)
> + #define DEVICE_ID_REV_ID	GENMASK(2, 0)

Why the indent?

And those are _VERY_ generic #defines, please give a better name for
these so you don't conflict with other stuff in the kernel accidentally.

thanks,

greg k-h

