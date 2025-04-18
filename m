Return-Path: <linux-usb+bounces-23227-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 159ECA93887
	for <lists+linux-usb@lfdr.de>; Fri, 18 Apr 2025 16:19:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B37B920710
	for <lists+linux-usb@lfdr.de>; Fri, 18 Apr 2025 14:19:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF73917A311;
	Fri, 18 Apr 2025 14:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="M7K2Msr4"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D3015852F
	for <linux-usb@vger.kernel.org>; Fri, 18 Apr 2025 14:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744985968; cv=none; b=AJAwdnRR8KoQKNZRdKjD/yIb6wFTYhD7MqnPXfHgxbNpcf3dej4j5dvDRwutyX6AS4YEGvbLNrsP80zXu9jUtaBjIbulckp6aLWovhcDkcSEsrbzUyATCwrX30NeY8owX+AEpArOHP0hbxuFDhIFDB6kng2RP6FuY/Kk9o8prVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744985968; c=relaxed/simple;
	bh=jWBJDIpfJCgwpkVZxllIxEJnCFehqOuTWUxpAXb/WfE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I+vt0PlzNsv03K79oL3hJgjKZAjT7aKyTlYx3Bw0n6aQ8HhXIYv7NprSjiHn8UJ1rt3ze3qRGYfsrCL4RxWAkjx9ugg8DA4ulSMX45gsouFqUoi9MlHjrOXJrJRuUwgFfmrGJguyiZ4uf1EzYVSJSvgf14IWKshJAOBwSssTmZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=M7K2Msr4; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7c5c815f8efso168323385a.2
        for <linux-usb@vger.kernel.org>; Fri, 18 Apr 2025 07:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1744985965; x=1745590765; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=w6APAAgkdwXx+GMRkpzxt50sUuE/lXDS+eMQx0vd1bc=;
        b=M7K2Msr4MjtkvvM28Tv8I+kWisIwMN0BrtZ2pktOhIRcmiYczptPXhkyWydkMeBcPx
         onhseyWABrALhE5ZU/icjMOTZTi81UOmzjYkrBUoRYjEhQRYi07dig564IJ/bxwGzPqi
         K+6d/pIuiAPzpPw1FIBl84CpeAfhw+5lJzE4+6S3M4KyqiC+/KZ0oDr+G+s6olFzwd9W
         Bl/qJrC5Idm+oOAbhWmUjQ7lHxm/xIK5Nsnl0viPcD8++gBlpPeBF4btaeM7SPjx3TLS
         PV19k5JoSUczSIfQzj5GGxsnKNY/Z8sqCqeGs466iur4R6Lt+E2IKYdmn60Eg0jpZGFX
         ui5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744985965; x=1745590765;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w6APAAgkdwXx+GMRkpzxt50sUuE/lXDS+eMQx0vd1bc=;
        b=Uwrp8hM3LZJyac6KnVnxzWRJjrYSOp5DCMsenidccEj/mLlINpOSZD3X3s/c837HxE
         vBMuwOSEpaW7oZ7WxW46CufCPIDss/uMlLfWxhlxMH4zLBW2MU6+6EkPWWg3GRU68aoq
         e2szAYTqMfEcwAKQTLynMf3WlWxnlItsbMM0XF2ulL8ot40FtJjdI7AbrhLDl55WtoL+
         AF2jEJNvfsyYWZFENL+YeFvYfTNA/Y+VmRfP+QG0cVwZE9ypKmLFhPivpf+stqDasx1Y
         cbP66hyA+pG/mtQVt7tq+N2YbeJ2FG6BO9+DeE+pO0KMPg7wtwRrYO88FqADoo30Jyqq
         UYuA==
X-Forwarded-Encrypted: i=1; AJvYcCU9b5MKPCHMMdEW69y46wq439qtAISVLXiGDrMeVwpTjqrNvQ7FbIp6sU6rb5NiVkKDaoKnM/SE7WI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsjeofKVQna6SPfOQlQ0c3Mfn2nABngnRXznsCrV0c3PgUrQf7
	VMMlpfJz6Mc3kBaIeQ3dgrvFwBj5SO2qpRGP7mFaKjcDEy3eAaNSJkqYpvFZ/Q==
X-Gm-Gg: ASbGncsKW2YwnbpPb+YFrSeN0fBvkclX/m3MVaOP032JXTdR3rGuEAMOst8yAXYGzl4
	GocfNMVGbbqIDUOIRGhIqdTdP0NnbUNkrSYzuDjr96nP8/Sjhw063R7yJ9N8+HfMxfBElV/rUp1
	6vm/lALyuwz2MrhcwFJY/kGXisXu9ICy0eauXJLZdZdq1N2cyXzRgvFhQyBBWykKraT9Se6QxwV
	9zSUB7/3ERdYMbtbgpSeLz3PEUIuch+Cj8Qb/ZosJU01C1e9NbxlJpocvA5+ZWpXNu70K94TYcJ
	UgDl8kIaZ9IAiHbeWTciiatrBWfki7/x/hgJHAoiGR5mvkLEWpR5Zal1Ka0=
X-Google-Smtp-Source: AGHT+IE8f6HsMD+WBgLjvzPKpK4xqq9qZvoM91B/zfoBpQsGcLkYXTAjkkZg1car0dsJqQrxiuo52Q==
X-Received: by 2002:a05:620a:29d5:b0:7c7:a55d:bd0 with SMTP id af79cd13be357-7c927f5944emr445043885a.5.1744985965485;
        Fri, 18 Apr 2025 07:19:25 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c925ac5472sm111387885a.63.2025.04.18.07.19.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 07:19:24 -0700 (PDT)
Date: Fri, 18 Apr 2025 10:19:22 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Chenyuan Yang <chenyuan0y@gmail.com>
Cc: gregkh@linuxfoundation.org, mathias.nyman@linux.intel.com,
	mika.westerberg@linux.intel.com, ribalda@chromium.org,
	rafael.j.wysocki@intel.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: acpi: Prevent null pointer dereference in
 usb_acpi_add_usb4_devlink()
Message-ID: <b886efd9-a611-4e0d-86dd-ae88ba53c3f6@rowland.harvard.edu>
References: <20250417195032.1811338-1-chenyuan0y@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417195032.1811338-1-chenyuan0y@gmail.com>

On Thu, Apr 17, 2025 at 02:50:32PM -0500, Chenyuan Yang wrote:
> As demonstrated by the fix for update_port_device_state,
> commit 12783c0b9e2c ("usb: core: Prevent null pointer dereference in update_port_device_state"), 
> usb_hub_to_struct_hub() can return NULL in certain scenarios, 
> such as during hub driver unbind or teardown race conditions, 
> even if the underlying usb_device structure exists.

Those are not the conditions addressed by that commit.  The commit was 
specifically meant to handle a bizarre situation created by the lvstest 
driver (a child device added "by hand" after deconfiguring the parent 
hub).

> Plus, all other places that call usb_hub_to_struct_hub() in the same file
> do check for NULL return values.
> 
> If usb_hub_to_struct_hub() returns NULL, the subsequent access to
> hub->ports[udev->portnum - 1] will cause a null pointer dereference.
> 
> Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
> Fixes: f1bfb4a6fed6 ("usb: acpi: add device link between tunneled USB3 device and USB4 Host Interface")
> 
> ---
>  drivers/usb/core/usb-acpi.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/usb/core/usb-acpi.c b/drivers/usb/core/usb-acpi.c
> index 935c0efea0b6..ea1ce8beb0cb 100644
> --- a/drivers/usb/core/usb-acpi.c
> +++ b/drivers/usb/core/usb-acpi.c
> @@ -165,6 +165,8 @@ static int usb_acpi_add_usb4_devlink(struct usb_device *udev)
>  		return 0;
>  
>  	hub = usb_hub_to_struct_hub(udev->parent);
> +	if (!hub)
> +		return 0;
>  	port_dev = hub->ports[udev->portnum - 1];

While this test may not be strictly necessary, it doesn't hurt since 
this isn't a hot path.

Acked-by: Alan Stern <stern@rowland.harvard.edu>

Alan Stern

