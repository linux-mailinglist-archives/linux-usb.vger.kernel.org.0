Return-Path: <linux-usb+bounces-28909-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 51BFABBE553
	for <lists+linux-usb@lfdr.de>; Mon, 06 Oct 2025 16:27:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4763E4E6D55
	for <lists+linux-usb@lfdr.de>; Mon,  6 Oct 2025 14:27:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 923992D593E;
	Mon,  6 Oct 2025 14:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="htMZl+Dh"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 727A66ADD
	for <linux-usb@vger.kernel.org>; Mon,  6 Oct 2025 14:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759760859; cv=none; b=g/Mft/TMBOh9khnYzlH3/kMHWRjk24lLA9hJ4lRn5SytxDxIqwP72y4daEssD4foKXbeME6Xpf0Op66y/kvsfzNIYmbeWDpPGK4mAsMtrW7ER26/Q5FMF8Nzc688flP/mMq8+gN0RvoUZiAIKBbRLXiBvxdt1z7U8f3vaAukisI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759760859; c=relaxed/simple;
	bh=XtbGRIF4gT5uM/n2mxz/cQrBhqED7sPvDwW1IjYpLuk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B1EaSBQwsHPcflLibz2qWYYjNhlPYHyFd2mWpska3OztLrP0gNi93uQNVIQmr1F8BU292WSTM+QrhwHrRbmm06t5sTaMcyGzknCn6Tk/51dfLXSq1Id7vzfP71df10w0Di5NF2iQlJArwEGFX5QjQEpG6sURzhG84Q7lGBySMPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=htMZl+Dh; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-859b2ec0556so520138885a.0
        for <linux-usb@vger.kernel.org>; Mon, 06 Oct 2025 07:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1759760856; x=1760365656; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oKuCXNlJxbIFYSKZrbgbsXO7VC1GY1uVsRjrnOFmk/o=;
        b=htMZl+Dhuv+UtCj5Xpu4JCn7Ikq6vh6vu27T22Ar/esPMFF6m2Xcnsm6YxS0ao4I5Q
         Fo4X3A4aDtuwALGQPXj0e8RdS2cLEG1j6tz7wOXUmjPizLAS2yuS8JfGleBBfXxzf5b9
         r1nqEGoh+HPPX/9s+y9xoIuf+9mJ5tiJtTTxp50rh4yhGJedp9c9if45NHn3LBzcUc8Y
         QWFYrDo+vDQrbXMId/SJcryLr7i7WMbPy2sd60vAW7mHVuICmlm+5bw3ftylC2J2ZuoH
         9dqGX09Wb0RBcr3QqddodxZZg0xBYFkpO4B+KEnC0vT3Oo3BzGyn9vILoA6Tjxc1e5/b
         apFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759760856; x=1760365656;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oKuCXNlJxbIFYSKZrbgbsXO7VC1GY1uVsRjrnOFmk/o=;
        b=qfIhaG/c2ofE1LVHmnfxLuNce77DYxXCdR+WxQFafKHku47EJ8g7A+3n0wSP/VjPKQ
         YbC4VFzphAjauPG/5pG9ERsOFbOHF96gJ6vJ14vFYpnydjChmycgnCwdUUNAjcPd9p0w
         oWUbCivnTC87I9Cox4mWjonq+kfrW9vWV6Dao/XXkQVQfRj0PwIKoevsnPXMUOKxjzxF
         hBIAHkaBI+P/uOr1cajEddPHsYFCb63zXdLAOhuiIdtW7lUGHyztpy3wrJI9TjRE+mlI
         i9K3nxljrZHqOoLJT2B+MvMOAceGvPQ7sMJdENf8aNd0VkIYTMAUZp4sHgYzFnP3H2wS
         nirg==
X-Forwarded-Encrypted: i=1; AJvYcCXZaigsUNOqbhXx8qs0nyirYV4edPURnfUnkg4FN1Ci/G+EuPZDJ8biGslz6rVUDXQch1RyYNjcOuk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh0vCLk4wkY4JSosVFlKqK3RpDv7DYle9tPu5/aD+VnVNMGVDH
	HDEV/Xu3h4QcdNDbAY176NuQ/0zjgxwkBRKUBs9ow49n4ct1hx2ZaoUaQEjQT7hmyQ==
X-Gm-Gg: ASbGncvZeKV4/CtEh7JJzX+Sband4ynM79ADGadbQgHOSqsCn1sKuMw9tK6PxfBJI/s
	72QVvEZpl24sqL5TXMAt2e1U1PdX6BP9eyoa8/yA6pNIae1sXDYbDgPVJEgVsd8Tu/aRq4lcz67
	77FSf+WIFSKqtb8SbLps/KKfCiXe3PFcDD4kUCrE3Svb1uvdAmRPt4MkjwBbfkcutKiSvC81MB1
	qzT12tJOkzU2lVtkS5eqT4AwJtXIUH+ZM9HiEDQdhlrNkMyqrHko+OoJvBWP+QHGRGi3Cfo8DZH
	YAzzvAOnPztsnO2vfP6wbDeBzg41bV51F4433ToaDzfHoi5VMgucY2kFiQkOYB3bYoZo2hheu/E
	FmQqOFFVyu9bEQ24dZ45uQXXFPjm3uUAuhVl+jK5gN0lKcqKY//2GMUmpeRtvQHWYtjd/URlo
X-Google-Smtp-Source: AGHT+IGJ1eNcdTcVqRN5asKLKh/FjiIP0AjK4POtkbQXsOZaVfRPmuAlzT2Hi7kcf2MSf6xzx2nHJQ==
X-Received: by 2002:a05:620a:4110:b0:858:f75a:c922 with SMTP id af79cd13be357-87a36778c74mr1730491285a.6.1759760856108;
        Mon, 06 Oct 2025 07:27:36 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8777865073esm1321704485a.35.2025.10.06.07.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 07:27:35 -0700 (PDT)
Date: Mon, 6 Oct 2025 10:27:33 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Pavel Zhigulin <Pavel.Zhigulin@kaspersky.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Peter Korsgaard <jacmet@sunsite.dk>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
Subject: Re: [PATCH] usb: c67x00 - fix potential division by zero in
 c67x00_end_of_data()
Message-ID: <4bfd6615-a0c0-4433-94d9-b9356bdcbffe@rowland.harvard.edu>
References: <20251006140631.1406643-1-Pavel.Zhigulin@kaspersky.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251006140631.1406643-1-Pavel.Zhigulin@kaspersky.com>

On Mon, Oct 06, 2025 at 05:06:30PM +0300, Pavel Zhigulin wrote:
> The function 'usb_maxpacket' relies on the value of 'epd->wMaxPacketSize',
> which can be zero if the device reports itself as an eUSB2 device
> (see 'usb_parse_endpoint' in drivers/usb/core/config.c). Under normal
> conditions everything works correctly, but if a broken or malformed
> device is handled by this module, a division by zero may occur.
> 
> Fix the division by zero by checking the result of the 'usb_maxpacket'
> call.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.

This should not be necessary.  usb_submit_urb() already checks whether 
the endpoint's maxpacket size is 0, and returns -EMSGSIZE if it is.

Alan Stern

> 
> Fixes: e9b29ffc519b ("USB: add Cypress c67x00 OTG controller HCD driver")
> Signed-off-by: Pavel Zhigulin <Pavel.Zhigulin@kaspersky.com>
> ---
>  drivers/usb/c67x00/c67x00-sched.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/usb/c67x00/c67x00-sched.c b/drivers/usb/c67x00/c67x00-sched.c
> index a09fa68a6ce7..3211843497cc 100644
> --- a/drivers/usb/c67x00/c67x00-sched.c
> +++ b/drivers/usb/c67x00/c67x00-sched.c
> @@ -868,6 +868,9 @@ static inline int c67x00_end_of_data(struct c67x00_td *td)
> 
>  	maxps = usb_maxpacket(td_udev(td), td->pipe);
> 
> +	if (unlikely(!maxps))
> +		return 1;
> +
>  	if (unlikely(act_bytes < maxps))
>  		return 1;	/* Smaller then full packet */
> 
> --
> 2.43.0
> 
> 

