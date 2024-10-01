Return-Path: <linux-usb+bounces-15611-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B9C98BDE7
	for <lists+linux-usb@lfdr.de>; Tue,  1 Oct 2024 15:36:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CC20F1C215C2
	for <lists+linux-usb@lfdr.de>; Tue,  1 Oct 2024 13:36:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB66F1C3F36;
	Tue,  1 Oct 2024 13:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="eKD1ssUu"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 547761C4606
	for <linux-usb@vger.kernel.org>; Tue,  1 Oct 2024 13:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727789751; cv=none; b=D0IsTL170i8Lu4hDLqFifr8eK1vl8j3bky/e2LcDWimAvcFdZS3Wv79zP4ACY4K4inAf29sW3wAtMwxEIv3g0US2lKd7GVuH1M/75neqvz23t0H7CZsdwNmPVCgPRFdAdLpxQ2GY8yno5Dr5FfIpPzEw+lrw9vqAYzkj68QG8I4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727789751; c=relaxed/simple;
	bh=U8pY5rep/DxZyRN/3K4NlXXTJfyp2pzoEXOGBzwi//k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VQFFiV0QMlRs4+5pjBhVSOD1vkpM6R3L5BVTSt3PicxjiDdIIxv11z/ZrwIPflIXpzlSPZg31sygN68uz+Rdge7aUa/xOyziE4HXT8vVyz+qVfL+ooBfB7hQNMpi6SEkNE3/HfX+B6QMJHz1UzdwdVQtQrkKAZSL6y7joejy85c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=eKD1ssUu; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-458366791aaso27294961cf.1
        for <linux-usb@vger.kernel.org>; Tue, 01 Oct 2024 06:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1727789748; x=1728394548; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BEopdWMDpCRUeGsoK3NceMIpTW9rD6Z+uCQDxg21ocg=;
        b=eKD1ssUu9Jf1OhaTfX7uJKOQ369znCxtHihp8TRH7o2YecD2LMwusjAxFCM++TR6fb
         Iwq6Xk8MVgldFaYcuvAyhvHMAlmfYNmxxyzWZC0hnywIWKjC9uRMMezifc4hzwjfD1pR
         TsLjjEVwjG0wZcwQ7Fl3oETtmZhg86wu1DaVdDZzpqg8QgP0RlRI+aukTeSxTrBJFrLW
         9tOkQnN/n6LxU48/hOpKGGzUjUxsS5n+eBHDhNPnA03zWf8SLfweL8SWnpLXzq45+puj
         lU9bDu79DGZxepxFTWy4CPOvo3GmzurVZZ9YO3DiuNZ8gRimEoIwkR2Gq70+hednY/Of
         9yzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727789748; x=1728394548;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BEopdWMDpCRUeGsoK3NceMIpTW9rD6Z+uCQDxg21ocg=;
        b=nhearv0PVxcQCS/7wq45+lEP4R68YWVvqq4mP1IFA4XOgyV0CrbnDymaGHyE47aLZN
         VCwTUqNNppjL2wMv7Yt+TAWOkjP9WhhifkDCXtxlSvOlsyNgUGmlXMRI0MQyFDd/80r2
         ZiYNaU0I/AWv5npraCewwTmUWDf6Ep+LR6AzJkFR5AvY6v+j/e5YMEzBnvPwLbSRx2iF
         PBaoLvMwUgBtw3Ury4g0GTHGQixPZ1OQlCCj9LDc6henIare+g7XTZMVydH4ONUbwSPI
         R6vDzl4+xtIsLXUyFTqWnE4aEnS+IRwmI4NUb1r0i9mG2ARETfF2ooqgZhrRwllo8byO
         u0Pw==
X-Forwarded-Encrypted: i=1; AJvYcCV0RUVkWw5SooMBWjAkAPXYdaxWJp2L2/B5JbUEPnvn1if92nvCPS0RJIA0atApBN7p6J2l7rGlk0k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+LwmFKWYMLxby+7HAy6n5tVkSVb1u5CmlJIW1I1qw8AviabaM
	9hVQoj6bStZVXL4DDmlU0QEOUxWVbtgkXI2bOF2bX2sfZMNV+PwQYrZUxjaJsQ==
X-Google-Smtp-Source: AGHT+IFhon3dVznzTI1PMzAnQix3pUVNFQbs135O2xwWuH6/TZXs3oH4K63Bz/B0EV10SolMHOyrOA==
X-Received: by 2002:a05:622a:4b0f:b0:45c:aa3c:6b21 with SMTP id d75a77b69052e-45caa3c6bcdmr179463541cf.19.1727789748037;
        Tue, 01 Oct 2024 06:35:48 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::5638])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45d7aad57c5sm4079281cf.63.2024.10.01.06.35.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 06:35:47 -0700 (PDT)
Date: Tue, 1 Oct 2024 09:35:44 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: storage: ignore bogus device raised by JieLi BR21
 USB sound chip
Message-ID: <5d5c516e-ad45-4533-912a-80cdf85aaed1@rowland.harvard.edu>
References: <20241001083407.8336-1-uwu@icenowy.me>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241001083407.8336-1-uwu@icenowy.me>

On Tue, Oct 01, 2024 at 04:34:07PM +0800, Icenowy Zheng wrote:
> JieLi tends to use SCSI via USB Mass Storage to implement their own
> proprietary commands instead of implementing another USB interface.

What a strange thing to do.  I wonder why they chose that approach?

> Enumerating it as a generic mass storage device will lead to a Hardware
> Error sense key get reported.
> 
> Ignore this bogus device to prevent appearing a unusable sdX device
> file.
> 
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> ---

Acked-by: Alan Stern <stern@rowland.harvard.edu>

>  drivers/usb/storage/unusual_devs.h | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/usb/storage/unusual_devs.h b/drivers/usb/storage/unusual_devs.h
> index fd68204374f2c..e5ad23d86833d 100644
> --- a/drivers/usb/storage/unusual_devs.h
> +++ b/drivers/usb/storage/unusual_devs.h
> @@ -2423,6 +2423,17 @@ UNUSUAL_DEV(  0xc251, 0x4003, 0x0100, 0x0100,
>  		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
>  		US_FL_NOT_LOCKABLE),
>  
> +/*
> + * Reported by Icenowy Zheng <uwu@icenowy.me>
> + * This is an interface for vendor-specific cryptic commands instead
> + * of real USB storage device.
> + */
> +UNUSUAL_DEV(  0xe5b7, 0x0811, 0x0100, 0x0100,
> +		"ZhuHai JieLi Technology",
> +		"JieLi BR21",
> +		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
> +		US_FL_IGNORE_DEVICE),
> +
>  /* Reported by Andrew Simmons <andrew.simmons@gmail.com> */
>  UNUSUAL_DEV(  0xed06, 0x4500, 0x0001, 0x0001,
>  		"DataStor",
> -- 
> 2.46.2
> 

