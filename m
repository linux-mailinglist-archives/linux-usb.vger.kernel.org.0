Return-Path: <linux-usb+bounces-31040-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A55C928AE
	for <lists+linux-usb@lfdr.de>; Fri, 28 Nov 2025 17:14:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E9126353F27
	for <lists+linux-usb@lfdr.de>; Fri, 28 Nov 2025 16:11:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC425285406;
	Fri, 28 Nov 2025 16:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="D3kgIlyp"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20CE3287242
	for <linux-usb@vger.kernel.org>; Fri, 28 Nov 2025 16:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764346211; cv=none; b=rLxK0wqWMm6ygxiQh2c3vbo2X+zBMDOTFDi1FXzZy7b9em8YVpMUYugWEddg+0eHsxm8ulok8KXNPY1wC8wiONK04nYTKSxciCD/kzP8sAAIUI0nC/W+1b57/MlLJ9W4tcgmffcdS6sbsQNvfLFqy5N66cACmNZu2gT7ZARzCOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764346211; c=relaxed/simple;
	bh=xvHzgMjtnrMGgVpPLcdsX1Ir6uiXp1qQ/YJL5UDzBbU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KB8Q71ORjt6xB/xUQmUO4jy0NOiHVc8dl5vcq3UnWPCtVJmFsMK8gDdTobAdhbaTvcLfunLQ2iRIqJaXQRpO8ZQH4DJCOlayYUHBELC7hHXjD8KrD7n4ddIQP2VY2BpQ1P/nBmpgnHpCaaQ/v8X5xkbquenCWnFoYCgxCPsaqME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=D3kgIlyp; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-8b29ff9d18cso182299085a.3
        for <linux-usb@vger.kernel.org>; Fri, 28 Nov 2025 08:10:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1764346206; x=1764951006; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5WjCT7iygMPF2Z7ArXq0EF3Yp1Po9LOetp6MMrLKoyU=;
        b=D3kgIlyp+CStS4JE6Pox5VnivZMWZ98NEuWE3Me5fdqWEbdIOUNN8Nj3AILkn0fORu
         UJ+Gj2zoBktUgw5vcPuEiZxzy/aQkRVQXF9KruMzl8/M7b8aHasGZV+r2QOcKsLGtqHX
         mfGnC7lHAPvCXnFT2PD0Dma3iKY9lEppoExQPLDtnzxenBPqVxmoZ2nODVxv/HlgxOK4
         xLbCLmKpn7VwfP1gQ51RijfC65yy+8izwow5vQDirnaMBE5rVi1S4ayoVF7rVNUlrAsv
         95OniJ8CA4VH5LnxZlrNnA7WzX6/bfuJXfrDPaa6vV7xtc1tmfSKsrhVIH6A5p8T5oKd
         JNZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764346206; x=1764951006;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5WjCT7iygMPF2Z7ArXq0EF3Yp1Po9LOetp6MMrLKoyU=;
        b=dGCwiNpQkamXhHU8WI1cXHi7y6sQQ8KKksU28IeX2AX8TJP/Cz83HG1f+tPGHkJnRk
         kjprDjxLLMhRaXOWdbqhA/oK6q2u+i3TEOo8MiE6W93JpGXxf5jjvVbnhw6HM8rrIqg8
         21hbM0QQ8oaJwtE721mYM4ipiGo0tmHh/JsphsHgGiW7h4zfom3k1rWtDwFNwNHkVdlb
         4LN974qDSf1So8xc7Zn8E9Sb55m6yrFz8VwcLYE4KFIOM0XmKG7ovm39NQ4ZNZQEDg7w
         BzX4LNorHkfKSggzioXfdLUqtXPzUrrxotLGtoSrcjTnv2zDyK37yVQbTmccLB0JFfRD
         DexQ==
X-Gm-Message-State: AOJu0YxUWw7uaD0ewOS9PXfaZM7vc48Evk1tAfX+79U+FTcfbrnkZ/N6
	it++XYR5shBX++Am1vJfllaRcysSMbujAVHcBvBZfvCo5gaYew9XxRuV9ccha98SHA==
X-Gm-Gg: ASbGncvYwIUEWiIBgeFdTKcl7tTHL9dVC6IaNQ3Ex+5RYyKzDBH6LfW2xBwoPdfEZ5j
	MGMGo04rVZhEL8vN+C59q4rf7yE1hZITLuF30eb/AHksNYOek2rMFDgYkE72MvzJRWvgvLy9l9B
	WoXVMfpAfD7W4tt5Io2F6Awk/qdhZ2j3sSmVVv3aDkMGvTUR/+uYIGRbBXj2LooeNAMQSCxwXEK
	SfofWysPunZMAH02MAiqhkmfN6+T9XHdR6dsvRz+1DvRxFoHJt40NbC65HSHO11g4Mcr7idPywj
	GDIz0eibZEbkYNvSzoqkoauAG+sWeYZi1tvaKLEzRjsJJma51z9hGPNnSmSUqyKBaJ4p9bw0xvB
	XW2dUPTYjPZJEcMYOXzQ3/aRgmsq+1qUPB4Dwo5StchWe+lKABFehtRatfIV8s/JXWISJs8GSLV
	HlMGlynOmZPYQhHxbHkSUnriY=
X-Google-Smtp-Source: AGHT+IGA+RNZizSm9gVJLJSZ4RF7DwPaZ/g4jtlYxDL6fgEBs5t/RLNpEuUWGlL9o40GYFI5ACbo7Q==
X-Received: by 2002:a05:620a:1789:b0:89f:764b:a4aa with SMTP id af79cd13be357-8b33d1b124bmr3821591585a.18.1764346206053;
        Fri, 28 Nov 2025 08:10:06 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::61f4])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b52a1b759esm328994185a.31.2025.11.28.08.10.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 08:10:05 -0800 (PST)
Date: Fri, 28 Nov 2025 11:10:02 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Angelo Dureghello <angelo@kernel-space.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: testusb: epipe errors on test 9 and 10
Message-ID: <bcc4f76a-985b-4932-a455-b4fedcafcd97@rowland.harvard.edu>
References: <cbb3bbc1-e8c1-450b-a38f-7b3f4cda6006@kernel-space.org>
 <c17c0821-3dd8-47b3-b795-f42675fb0a75@rowland.harvard.edu>
 <d8aa2f1e-fc44-4bb9-8245-d6ac76047dc3@kernel-space.org>
 <9776c9fb-8fed-4e79-b312-0b1a872911b8@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9776c9fb-8fed-4e79-b312-0b1a872911b8@rowland.harvard.edu>

On Fri, Nov 28, 2025 at 10:20:25AM -0500, Alan Stern wrote:
> On Fri, Nov 28, 2025 at 03:20:35PM +0100, Angelo Dureghello wrote:
> > Hi Alan,
> > 
> > thanks a lot,
> > 
> > On 11/28/25 04:23, Alan Stern wrote:

> > > I think this is the expected behavior; g_zero does not support
> > > Get-Interface-Status.
> > ok, good to know. Btw, on this article seems all tests are passing
> > 
> > https://bootlin.com/blog/test-a-linux-kernel-usb-device-controller-driver-with-testusb/
> > 
> > but not really clear what what "test must pass" is.
> 
> It looks like something may have changed between the time when that 
> article was written and now.  I would expect g-zero to support 
> Get-Interface-Status, since it is a standard request.

This was wrong; I had forgotten that Get-Status requests are mostly 
handled by the UDC driver, not by the gadget drivers.  In your case, I 
guess that's dwc3?

In the current kernel, these requests are handled in 
drivers/usb/dwc3/ep0.c:dwc3_ep0_handle_status().  The problem is that 
this routine doesn't handle Get-Interface-Status requests at all; 
instead it passes them through to the composite core, which doesn't 
handle many of them either.  Other UDC drivers do a better job.

Fixing this should be pretty easy, but I'm not not an expert on dwc3.
The maintainer, Thinh Nguyen, will know what to do.

Alan Stern

