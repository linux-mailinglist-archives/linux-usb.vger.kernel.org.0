Return-Path: <linux-usb+bounces-24885-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 023E2ADEEF8
	for <lists+linux-usb@lfdr.de>; Wed, 18 Jun 2025 16:14:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4FC0C1BC2713
	for <lists+linux-usb@lfdr.de>; Wed, 18 Jun 2025 14:14:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D7FD2EB5D1;
	Wed, 18 Jun 2025 14:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="LgFvDucW"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549912EAB92
	for <linux-usb@vger.kernel.org>; Wed, 18 Jun 2025 14:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750256059; cv=none; b=F8Lwdapv6ozd4oEhyxYNIZ02/0pTIGrniR2o3zleUWsFxuYzlWe1Fj86f2Vjn9SJ+GdYc8Au4+Vjg+xDXtSGRpMEyYieDu57pL08h4RB5koT0f9JC9ncSaQvhyDFlyA80E55OJdXf6KLsoN27E1leiwt58s9jZsKMl23D6Z28SI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750256059; c=relaxed/simple;
	bh=jgVt/SVczRVLibj05dhADNEqt5586mqdr4CTTYtoNFQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i35XpQBy+6IbmUZnFcmP8EQTSGMdGxhkU0DJKh7J7MGFrh0AIh+4uAVlton+7cv0ky9lkdy0Wi6sw5JfhjXFdqUfR6V2JiFExWuBye54YdaMIWoS8DSseE2v+bHjKnu1BiJX2YO4d2NCt5dghMStDERfnDvfsRuRjHz2FPhoRGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=LgFvDucW; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4a58d95ea53so8295801cf.0
        for <linux-usb@vger.kernel.org>; Wed, 18 Jun 2025 07:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1750256055; x=1750860855; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=445YfBoLgx6LDox/kScDprx/fKxzHTT51XDkZHjyT1M=;
        b=LgFvDucWNS3hJwus3xKWv1vyBS2/bpGk+hvBZfypu13o26CumgRQLROc62ZgmTE59J
         zAxPgVQFv+/RK9DKqWieW55hlhTBLcrjDCmNnBbSKfT6wj63vT1iL1Xprh7U+V0q751l
         +sD3hlDmOpLA/UuGAAYo6NOUAHhWPTv8lraH47p3HEyO1sdnkreKQAH7IvkIWt/FLuWJ
         Yj+JP6p18ynBHb7K+1GHzu4WN7RBtszYatiVYfysa+HFjibqM/07u3i8vlg3npDYUPab
         c7fhflzuq0tejFNUX56pZ/+L7B1UwPyMx6gTp6eIcIYuFSX4WFASXwptcURkY23Or18v
         24Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750256055; x=1750860855;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=445YfBoLgx6LDox/kScDprx/fKxzHTT51XDkZHjyT1M=;
        b=oxHfDyIHAKW8h5SB7uZEWsSAAW+Cy4qb6K2IrATMxZlGE/4rjy32IDK/4whNZ/exgu
         7c66s7PpIHkXuTbNoX08OpbrDYlUH8/Bq1yATzSNfz/qjTusZlMUPqVAF+qC/g8edxtj
         OQdlQtSfTepuKAsjXObA319UhgSpfmFL8A+XzejVjRxI1Qv/ZHiyRuhnRCjAvFGfUlOp
         qstx9Wvg9rWW0QBNx5LFZXOM5JfItQGNyErnIvlNF8p14MQ40VPibmFGLLgyukbGOsb8
         dWyxJ21TYAq6yem1w3vFdcD5Qav55d5S8KQteYw0ETouo5hi8keKyOOosMiLulfW0TQ3
         jNxA==
X-Forwarded-Encrypted: i=1; AJvYcCXgtSWONRgvMsZgxRZ+Zperb/RSxX3+rshqHR7mZ0wjVrAFAYBoFzE2j+BUU+BW1CpMR+gKjCHxnY8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz6F7KIgUdwKAnmigoJfVuzcAvmtJhBfT6c9Ws8+g/nREL/HOW
	uPF5vg0pRlL9hp6LnYZVxRCz+RzvtoPdWrWmksJaRdRAtPUkPBfSjd2+MNXZ+BOqTg==
X-Gm-Gg: ASbGncsGPxmy3vt/QYZ7FZVcOkHJGTOKYcceFYXHBDLDyiVEbQ2E6/eD6QInOw32zHM
	9izGkTAPx3zqhBts5WijA4pte9t5SoV+3t4K5isTE5DGqs7Vp7vsvtGBbFSDyAAH6l64+Ni70In
	TDNLQaOtoxpY3pV4m8C3snv/VCBrsi+jVfWFTkzdiIvsYSQQtLQDwh+qOWVj5+MzxXcUNWBx3WC
	8XYgbeserckwdGeSb9OtXH+RqtZcy5tgwhcnjVSVU32VelhXLNiwOIjSO006/tQJHx3Gar3IZmB
	xVSe8DxC6szXMG6F7goUje+W8YDorJJo8TRc7W3vDTl9KDlQu3B5UT66uzyllQpL/lV06xd1fkb
	lPC4x
X-Google-Smtp-Source: AGHT+IHon8Mt+YsDs98sHoA4ASN+0uvnNj4bHx3zdDrXtra2R2s63h6+oRbtKgKxWOhcIXxSFRCvgg==
X-Received: by 2002:a05:622a:28e:b0:4a5:8387:8b8d with SMTP id d75a77b69052e-4a76458bc51mr42956371cf.21.1750256054965;
        Wed, 18 Jun 2025 07:14:14 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a72a4cfe51sm70916891cf.58.2025.06.18.07.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 07:14:14 -0700 (PDT)
Date: Wed, 18 Jun 2025 10:14:12 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Chen Ni <nichen@iscas.ac.cn>
Cc: gregkh@linuxfoundation.org, tglx@linutronix.de, andreyknvl@gmail.com,
	sylv@sylv.io, u.kleine-koenig@baylibre.com, yanzhen@vivo.com,
	namcao@linutronix.de, krzysztof.kozlowski@linaro.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: dummy_hcd: Use USB API functions rather
 than constants
Message-ID: <aec873ff-5d0a-4071-8043-fb901ece9141@rowland.harvard.edu>
References: <20250618065750.816965-1-nichen@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250618065750.816965-1-nichen@iscas.ac.cn>

On Wed, Jun 18, 2025 at 02:57:50PM +0800, Chen Ni wrote:
> Use the function usb_endpoint_num() rather than constants.
> 
> The Coccinelle semantic patch is as follows:
> 
> @@ struct usb_endpoint_descriptor *epd; @@
> 
> - (epd->bEndpointAddress & \(USB_ENDPOINT_NUMBER_MASK\|0x0f\))
> + usb_endpoint_num(epd)

You could make a similar change for usb_endpoint_dir_in() or 
usb_endpoint_dir_out().

Alan Stern

> 
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> ---
>  drivers/usb/gadget/udc/dummy_hcd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/gadget/udc/dummy_hcd.c b/drivers/usb/gadget/udc/dummy_hcd.c
> index 27c9699365ab..21dbfb0b3bac 100644
> --- a/drivers/usb/gadget/udc/dummy_hcd.c
> +++ b/drivers/usb/gadget/udc/dummy_hcd.c
> @@ -623,7 +623,7 @@ static int dummy_enable(struct usb_ep *_ep,
>  
>  	dev_dbg(udc_dev(dum), "enabled %s (ep%d%s-%s) maxpacket %d stream %s\n",
>  		_ep->name,
> -		desc->bEndpointAddress & 0x0f,
> +		usb_endpoint_num(desc),
>  		(desc->bEndpointAddress & USB_DIR_IN) ? "in" : "out",
>  		usb_ep_type_string(usb_endpoint_type(desc)),
>  		max, str_enabled_disabled(ep->stream_en));
> -- 
> 2.25.1
> 

