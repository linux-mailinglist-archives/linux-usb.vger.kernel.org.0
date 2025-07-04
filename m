Return-Path: <linux-usb+bounces-25491-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A361DAF9489
	for <lists+linux-usb@lfdr.de>; Fri,  4 Jul 2025 15:47:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8AAEB3A32FC
	for <lists+linux-usb@lfdr.de>; Fri,  4 Jul 2025 13:47:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69644306DDF;
	Fri,  4 Jul 2025 13:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="LUXp7HwN"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AE96BE65
	for <linux-usb@vger.kernel.org>; Fri,  4 Jul 2025 13:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751636858; cv=none; b=GHx14ba6TIV9Ly0uRzaxNlomd8YQ7fDz0HLKlhSOjTYPOHzdWRnZKafeBav/bHJkOeaxdYOUKJd3BFAaP3p9nmfaS5M6DqNks6IVghAo6dt6qp0oV6xXB++5jWoadyH9LaWcdd0btgInL5bkGMAI/QLLz4+o/7DII/NPswWwOSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751636858; c=relaxed/simple;
	bh=HN01VSf9c4TVDyDhVbl5djO/TXNZ8jea5qMTYo6ai9g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PohipmIyT+iFRwDyuPcBwZ2/zdEJ1YV1/SaFhcA1NhKaacFIlol0FFylpq+K3/5H2+zA/MNsFlbnfS0Y+wD1jOKQmTXtPQDEJ+Z84QMqYR8IYJIY9aMxHOBhIEJymDkpAyq8YvvOdSsrfnbNjlo02CFh2NKvZscTCATFzFLl1HY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=LUXp7HwN; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7d5d1feca18so109979885a.2
        for <linux-usb@vger.kernel.org>; Fri, 04 Jul 2025 06:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1751636854; x=1752241654; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=s+Mj/zcITxndpNinPY/DINby1Bgp9brjcf+mBjGfOCc=;
        b=LUXp7HwNxpf79hj0T5qQ75a4widwokZ2lur8JDLwyw0UIlCg3L8vhFSXNRgIyy/GZu
         HDdxzcXGlr70S3nKoxQvv6/AZuRPCODEx6kYcgLkXlmmv5jPybhP0xSnIyzUJiCrNaQP
         KOSC6dfGyBs1fJUpGQkdysBXbyOf0NF4KGYGsrG9K4wAa+CYSMM+rBif8Wt5daJw7qYE
         Nkc14dtg6eznnywGu0giw7nnr2rq3WHlx/6wD2d9NGPvqszCwra2cL9RiZnxXNhvMVyU
         2ofzhGfUSF/eEzQ5MgXUrDzQzRq64qzRxmalVJLHja5ub8XSmfJvfIlZ39uOk/pIOYG3
         auoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751636854; x=1752241654;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s+Mj/zcITxndpNinPY/DINby1Bgp9brjcf+mBjGfOCc=;
        b=goqw+X0Swkp/Wa3OCB1PZquGdlh7oMJrmh3eSCIXt07ahJ8RJzQpe4PDtOSbfDLQrE
         pXwYUe9udCCY+udE+D9QCywQzZ3TY9x050kbdoy6Txx6FPwStaMSkaASeH8eZmvcr2e/
         kH8qN1h6lt6atJUXxceAje37UehPpbFhaqEefhk0ehsyvhJD5l8A5hnHHjlRdDtEQ38A
         j6wNRfhdvUxW0FJmDZKwToFxIa0Fj+8rMT5dBAcVgXUvaFbngihkHHAwWH3HV4xH9TPc
         1rLVy2rZOVNVfDOCkuvf/rtGZGQLUif6RhNd/5ewkONIxVwt5bf3osoG7uzhMIxOZJTK
         J84g==
X-Forwarded-Encrypted: i=1; AJvYcCXJmZYuS2lZL1BElrpBPTnDaeSUKOEo2o9rqTrIfPWqObIKRdiW6hTvluixA2u5dkfrZHxvs9X7V+4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxaCuLHKiX3oTophJt3pKOrXZHoDf9U+gK7+RjDZLl0so9PR8JA
	3EFuUX1Xt2T2m33Y+rRFrlO1K/f+YBdWNWCcdRTnuzkla/yhNJuuy/BjqFPf5X1CwA==
X-Gm-Gg: ASbGncuoSTpxOhi0cNZOWkCVdNi02H0hhLLeQ7q3YXq8FeTswkQ+D+Z6JIQSxOfdhYu
	AQlnEmQrm2wu82HHMROPEtbjqfYxw6h/hT+HpWMaXrGjfMn1NUqgoYWUF06uRcGel9NI+AkOQGh
	wzVYPz48Kie9OfCvc5vbydlNW+NGHRLM2XwjxBpDq+Yb3b3WMhhJsK9O60zcd0wkvmze4b2Kjzc
	bjhzqkOKX9N1i2Vs0PxPn/JFy0P9NdDLR2kDhUl1LeTM77uhbYaJF5AreozSsdWZHGhs1eJ+BMy
	vWmMRiBbSuKi4u/6olGqauUEnHahashyGK3qnZCgB2Z44Ua7HEZhuLcFoJ2ucqY=
X-Google-Smtp-Source: AGHT+IEZOPduoa4mNlId43xodqDF+iiwFhQogS5daJ16oNacslKPTR7VPv3e98DZS7jEtd8HuDPb1A==
X-Received: by 2002:a05:620a:29c6:b0:7d2:1458:964e with SMTP id af79cd13be357-7d5df13c5eemr209664385a.28.1751636854185;
        Fri, 04 Jul 2025 06:47:34 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::4179])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d5dbe7c52csm144416185a.66.2025.07.04.06.47.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 06:47:33 -0700 (PDT)
Date: Fri, 4 Jul 2025 09:47:30 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Srikanth Chary Chennoju <srikanth.chary-chennoju@amd.com>
Cc: gregkh@linuxfoundation.org, Thinh.Nguyen@synopsys.com,
	m.grzeschik@pengutronix.de, Chris.Wulff@biamp.com, tiwai@suse.de,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	punnaiah.choudary.kalluri@amd.com
Subject: Re: [PATCH 2/3] usb: gadget: f_sourcesink support for maxburst for
 bulk transfers
Message-ID: <cf2940e3-5430-4e84-916b-608c33028a7c@rowland.harvard.edu>
References: <20250704114013.3396795-1-srikanth.chary-chennoju@amd.com>
 <20250704114013.3396795-3-srikanth.chary-chennoju@amd.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704114013.3396795-3-srikanth.chary-chennoju@amd.com>

On Fri, Jul 04, 2025 at 05:10:12PM +0530, Srikanth Chary Chennoju wrote:
> This patch supports bulk_maxburst. Without this change
> we are not able to achieve performance for super speed plus device.
> Without this fix, we confirmed through lecroy that it is sending
> packets with NumP always equal to 1.
> 
> Signed-off-by: Srikanth Chary Chennoju <srikanth.chary-chennoju@amd.com>
> ---
>  drivers/usb/gadget/function/f_sourcesink.c | 14 ++++++++++++++
>  drivers/usb/gadget/function/g_zero.h       |  2 ++
>  2 files changed, 16 insertions(+)
> 
> diff --git a/drivers/usb/gadget/function/f_sourcesink.c b/drivers/usb/gadget/function/f_sourcesink.c
> index ec5fd25020fd..84f3b3bc7669 100644
> --- a/drivers/usb/gadget/function/f_sourcesink.c
> +++ b/drivers/usb/gadget/function/f_sourcesink.c

> @@ -341,6 +346,14 @@ sourcesink_bind(struct usb_configuration *c, struct usb_function *f)
>  	if (!ss->out_ep)
>  		goto autoconf_fail;
>  
> +	/*
> +	 * Fill in the SS bulk descriptors from the module parameters.
> +	 * We assume that the user knows what they are doing and won't
> +	 * give parameters that their UDC doesn't support.
> +	 */

That's not such a great assumption; people make mistakes like this quite 
a lot.  If checking and adjusting the parameters isn't terribly 
difficult, you should do it.

Alan Stern

