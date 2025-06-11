Return-Path: <linux-usb+bounces-24696-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F100EAD582F
	for <lists+linux-usb@lfdr.de>; Wed, 11 Jun 2025 16:12:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 904377AD8E0
	for <lists+linux-usb@lfdr.de>; Wed, 11 Jun 2025 14:10:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9151B29AB16;
	Wed, 11 Jun 2025 14:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="Xg5ZF+TE"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA35288CA0
	for <linux-usb@vger.kernel.org>; Wed, 11 Jun 2025 14:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749651128; cv=none; b=ueAAjFPVzQavtGIl/3vGrx8eACRciQ+bwWstJzrBnUeO9/z0K7F2pOSRnlF4n5eUsUGw4JTXftl19rnK6pBUwhZScRdOiQU87dqYfC6KIHfZ5BvcQwmrevssVJc5wzW3oUmOMDXprZFAzwPgkbdgAiN9Sq8t1K7BldvIZ66ONdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749651128; c=relaxed/simple;
	bh=BU1SQHbz5p7yIRR3u2cVQoI3rv3QL3LyjpzU0bCIxlE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IPfHWJ8ByVUZ1KCyKbrjQIBY+2vgEbM8XJxMOs9Is5cKnc5nulE1koPRSZWip+oByuVqIkXgENIFJRJ4OYAmQhw7RSTmrsVZdgpIdNy19D5mzrDSm76gwebxkKyTtuCQbwfZfmTDwjjDn8gfgc2XGvBWgeN9Ij/G+kUbChUihJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=Xg5ZF+TE; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6ecf99dd567so81305086d6.0
        for <linux-usb@vger.kernel.org>; Wed, 11 Jun 2025 07:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1749651125; x=1750255925; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tKNBSXIC3pUcb4prxvKtajAChUKnJxzgTWlpYZg0Yyk=;
        b=Xg5ZF+TEDVlGEYnEiyppkHkriOaq+vyc8qZN/C0Ko9A+FnA3p/QL0BLD25LCsIgVpU
         jEERQNB7MdUes96es7HnxqJQaSMTF6yudrLk7zXRhHlQ2xzL3CbJ8vjKbquD9LSY7a4a
         uM8BXMAVUGWr8X6TMMX54IP/gAPve1NZq0dmaSsbMXAjhTiwx5ujMaTr3RZZSbXh3y5X
         HVqcA9m/PFhzPyjs1XFKg/XWxwUHeNiizUsxKxZNBmZczNi9GmfuLQD4mgdKeAOb/59c
         qLMJS8y4uDFjc93muI9yV2Fhlrgc8Ews1daqzy4NdaeBUegpsQlkb+6jecAxxAdFjYia
         sl0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749651125; x=1750255925;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tKNBSXIC3pUcb4prxvKtajAChUKnJxzgTWlpYZg0Yyk=;
        b=ULvkb+uV9+H7qWnVz72WyldKqoBtbZDaMs6CDCFLvwrMcP4a4eJxjXVYZd0GaQkySs
         Bbb5JZp8pKt9rd/UCrnICFBKPqyQP7NeB8z6MJyJJMb2Q81VfSrKh5M6VT2rGWPXHI1w
         CPl1JC/zTtEi1jZg7oI1rnI8VT4vIDAUOreMAeDlC+ai8fYScM6pHeruW71pGZ1BNjqY
         9ULJZwESaR9lUUoQZ0Lnte1zOJ/wIAkXg1RXy+MDsBka3YH1YCtLH5LNsjP8MbHX57vS
         x4PdU0kbjTxjacYXN/53Ra/uJ6lZRwdwqSwMlr1499F8+kqxOWddgzYEFU+m7cHeLKeb
         av0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWSgHoIRAZ0k24/GbF7XkZbloyGFo5g91ohdWBzwI7Tvc10rPwav3eUkJ2l8Zk8E/03jLdttlMpQ8Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsfVN4DX+9es6vlUCCse+/9LGnQiGMoG5C4+/tHNIqk9hIgFau
	QlBdo3twdU9iQtEuVjSe62qafipik30leZ4r+7jyPP0fhdIX0tS3UoPRi4c4mMVhFw==
X-Gm-Gg: ASbGncumcJMoBNPkfwnz/NYuF2z529QzH46DrImHiblDInEEpzU37DQ+QxWU543bNA4
	2Eq5+TGt+xpVoF+Ubi3E0rGbCKVX3Qs7hnG1C4+QD24eU/SluqbF1kCs41Hvs8vZHIjyp5mgBML
	rQ2rEE0TNHobTW8Sx+e+Q3Qr82p2l8VVHpxkfUKMHHxbulLqyZdXDFJPxI9TeNyZptELIlNbCuo
	Per856n6ij9KXvATepDRjrkoTJ+Eav6sW++eFv+ZpDbRbD+VtyNA1tWS7ImNhsRdOg9nmU7GCer
	Qk9q5MnhiKAr01qNyJKU7GTOVonQeFpOWgA18R0nVPVqBd0P+l5gtYgwfzA/CMqECUPlX1vL4Qz
	ADtlU
X-Google-Smtp-Source: AGHT+IG2vW3k3qhQ1BJwguwzFkFBoRhcCp+cYZj+tgb0fudCLKixIcsxK+s6Ee8T8CkTeQOGYKR38g==
X-Received: by 2002:ad4:5c6c:0:b0:6fa:c55e:86a with SMTP id 6a1803df08f44-6fb2c365cc3mr63248786d6.28.1749651125331;
        Wed, 11 Jun 2025 07:12:05 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fb09ac83besm82563226d6.28.2025.06.11.07.12.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 07:12:04 -0700 (PDT)
Date: Wed, 11 Jun 2025 10:12:03 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Oliver Neukum <oneukum@suse.com>
Cc: gregKH@linuxfoundation.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: core: usb_submit_urb: downgrade type check
Message-ID: <efd8d1dd-e8d1-4f40-9124-f34ba39e3d93@rowland.harvard.edu>
References: <20250611135231.2380902-1-oneukum@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250611135231.2380902-1-oneukum@suse.com>

On Wed, Jun 11, 2025 at 03:52:25PM +0200, Oliver Neukum wrote:
> Checking for the endpoint type is no reason for a WARN,
> as that can cause a reboot. A driver not checking the
> endpoint type must not cause a reboot, as there is just
> no point in this.
> We cannot prevent a device from doing something incorrect
> as a reaction to a transfer. Hence warning for a mere
> assumption being wrong is not sensible.

Agreed.  On the other hand, we (or at least, I) don't want these 
messages to get lost because people haven't enabled dynamic debugging.
And even though we can't change the way the device behaves, we can alter 
the kernel's behavior.

How about using dev_warn_once() instead?

Alan Stern

> 
> Signed-off-by: Oliver Neukum <oneukum@suse.com>
> ---
>  drivers/usb/core/urb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/core/urb.c b/drivers/usb/core/urb.c
> index 5e52a35486af..acf74ad36326 100644
> --- a/drivers/usb/core/urb.c
> +++ b/drivers/usb/core/urb.c
> @@ -500,7 +500,7 @@ int usb_submit_urb(struct urb *urb, gfp_t mem_flags)
>  
>  	/* Check that the pipe's type matches the endpoint's type */
>  	if (usb_pipe_type_check(urb->dev, urb->pipe))
> -		dev_WARN(&dev->dev, "BOGUS urb xfer, pipe %x != type %x\n",
> +		dev_dbg(&dev->dev, "BOGUS urb xfer, pipe %x != type %x\n",
>  			usb_pipetype(urb->pipe), pipetypes[xfertype]);
>  
>  	/* Check against a simple/standard policy */
> -- 
> 2.49.0
> 
> 

