Return-Path: <linux-usb+bounces-19473-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DF95AA1498C
	for <lists+linux-usb@lfdr.de>; Fri, 17 Jan 2025 07:12:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1764716A588
	for <lists+linux-usb@lfdr.de>; Fri, 17 Jan 2025 06:12:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E52C1F76A5;
	Fri, 17 Jan 2025 06:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="D29eoPTy"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D05BB25A63A;
	Fri, 17 Jan 2025 06:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737094360; cv=none; b=aATF2LkDTnHsXAnyE2l0xeotSXUsNpVDlIJTX5DY0R6CBZ7h6nwoTzVgTp68vOmHBfYTzFUE56drefoMVDj8IjUcHSer8jdAQCGfYlge6BXtHKSAXBeb55ROqX1vutDab0SYZ6dvAbgEXQlgVH9jB/Kbgi5RBNGZlHe9yjWIU8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737094360; c=relaxed/simple;
	bh=8CJK+160rE4Qn8/SK/47XzjEZ+zlU/1NiXQDcwY9OCU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CO5qqQzReCgrrHZjOCNQwuNcCC8yS9R6oZVLPPH3ehjTvWjWXgcH1RK5HJ0FNx6JwT4UbuUimeSys1ABWtI/C2RmushWFHPAa+o8AVDlhNwK4c3chMDQitASHS+kHBDSjB8UtkPIX6Xy8KIg2vkfvK8TgMpICfEmN1rpqPom+70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=D29eoPTy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC909C4CEE0;
	Fri, 17 Jan 2025 06:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1737094360;
	bh=8CJK+160rE4Qn8/SK/47XzjEZ+zlU/1NiXQDcwY9OCU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D29eoPTyAD+dyT88yJSR6dV+EyUMVv6ZemknQWygRau6t6rk58q55Z/nPqdkxYB5O
	 KZSVDL4FclBUCQjfMmzj4bAc3l3i9/ZzajxRlBxtqbZV/straOa5WFpXM8aPxQIL8w
	 1Xkj14P9+unaJ1wkgtWVkZfj4fMzEYjqwYw8qmTY=
Date: Fri, 17 Jan 2025 07:11:46 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] usb: hcd: Bump local buffer size in rh_string()
Message-ID: <2025011714-catalyst-aide-418b@gregkh>
References: <20250116160543.216913-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250116160543.216913-1-andriy.shevchenko@linux.intel.com>

On Thu, Jan 16, 2025 at 06:05:43PM +0200, Andy Shevchenko wrote:
> GCC is not happy about the buffer size:
> 
> drivers/usb/core/hcd.c:441:48: error: ‘%s’ directive output may be truncated writing up to 64 bytes into a region of size between 35 and 99 [-Werror=format-truncation=]
>   441 |                 snprintf (buf, sizeof buf, "%s %s %s", init_utsname()->sysname,
>       |                                                ^~
>   442 |                         init_utsname()->release, hcd->driver->description);
>       |                         ~~~~~~~~~~~~~~~~~~~~~~~
> 
> Bump the size to get it enough for the possible strings.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/usb/core/hcd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
> index 0b2490347b9f..a75cf1f6d741 100644
> --- a/drivers/usb/core/hcd.c
> +++ b/drivers/usb/core/hcd.c
> @@ -415,7 +415,7 @@ ascii2desc(char const *s, u8 *buf, unsigned len)
>  static unsigned
>  rh_string(int id, struct usb_hcd const *hcd, u8 *data, unsigned len)
>  {
> -	char buf[100];
> +	char buf[160];
>  	char const *s;
>  	static char const langids[4] = {4, USB_DT_STRING, 0x09, 0x04};

Worst case it's properly truncated so why do we need to worry about this
"warning"?  And what compiler version is giving that, I don't see that
here in my build testing.

thanks,

greg k-h

