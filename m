Return-Path: <linux-usb+bounces-25721-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C801B025DB
	for <lists+linux-usb@lfdr.de>; Fri, 11 Jul 2025 22:40:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C9ED43B0A08
	for <lists+linux-usb@lfdr.de>; Fri, 11 Jul 2025 20:40:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5608F211499;
	Fri, 11 Jul 2025 20:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ESyTlqpD"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D3CC1C84A1
	for <linux-usb@vger.kernel.org>; Fri, 11 Jul 2025 20:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752266445; cv=none; b=WBBEv48nGXti3bDJCDkMlDZ2O/iqaTMa6Bp2V2CgZyOs5XC6ZzkdTeI0OWWC+yNdwYIXhmN1VyM+Fg1sy8eHmAbD1K9kOI0D7h9shpfomefquUIoMHdxxiYJPiTqHTLszHEaCYdiu/M91v6qJkJ4BHZu4g/1ipZ9GiFQeTuV3oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752266445; c=relaxed/simple;
	bh=BUef1P1w0/U+Kyukr4lZGxc0gpaZoyw21Z7BU8ALwws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eq3/wgTq1TyPKxtw9UHzOoQJvaGeuXiShWdUEfhBdJ/d6l9m620WwITaqxtvbyB3amjeWhayskuNuSXv7a1N4L2m3KJhjgHsBeLJPp7TmBRAwvvSSTvOAVi7OAQVs5encPBBeVqH6d+rdhSQqzLWtCMeD9cg83qXgvwfLpqI+lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ESyTlqpD; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-748e63d4b05so1613637b3a.2
        for <linux-usb@vger.kernel.org>; Fri, 11 Jul 2025 13:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752266444; x=1752871244; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hOyN7zjdU8EtRk4awPMVtS0gWU07X0lbhTs0rtFKa1A=;
        b=ESyTlqpDMV6JobMmbJcx654Q9FDrhC4xVwh5xHskTeKl2w7TMmyST1NnIt8H3az6iv
         7K5ikw6nqqJk5Z328cZtDKUZOE5iW9TCGsdnmO7jCdJ1jEFx8zrQAtl1m6fsELHKC3X9
         R5hdTZQ0sj1ofTT0Aj++7ZIaz89ru8A7ktzv+Rr9xicHqy3mx10k+2eqBHDelM/BALJP
         uut25y1iz8s8cpBrzhGYR2VPWDJcvBY5cisD86h3dieBOmBXmh+Edtqo5nxkb25guAsF
         rmriS46DNcclykZ1T1ZK7YEiRnCGDTz6J8L3CgkpXQx344e5WOsvlwR5qAsn/Xa/A9Zo
         yfUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752266444; x=1752871244;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hOyN7zjdU8EtRk4awPMVtS0gWU07X0lbhTs0rtFKa1A=;
        b=ZwTV1ZGTVW5lsoGcPd+l9Ec8DvQZ0+lnfXLWanoyiExYQQ8o9uBW//7VIl7OJbeacz
         Szq5+hkhE65De8aYQvIO5ak0dkaOyB2fLEewIQwu1NQTCF7pZwTNPDvMKs4rUIp4y1jk
         9cq3VG3o8fJ4IFdB0sVoIXLMlhZJC+pnKXF2xqPSlhi5DEQvnBLy8aZk9ejYdVsUcpXq
         CvlYj6Zyz+eVrFsTVgoG3aDla3XCHJ/9Rgz+4pS5igDdpmeYlUS9XLQot+WvZy7czFpa
         jHn+n0PCLH1FmZwTziNBjHaf5Hmj/QDvSOVwH3t5ZGiU0EQzQkEIBUe+M8pILtQ9wTjL
         yrDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjTohBUykWlRsBw9Ma86m+TXu7EqZJ5YmRVbp0hsiMtGkdcL/Gj+Dl6YWysvpG6SaYbzI9zUWwtiE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxK7rYxopw8/U1uWrvANdUQVQDfH6FKM/qGG9ZdHYVsfAUrQ2f1
	bpb3WwkAQx9IfdDyaYB/mfV7TFzHYWuilshVWv0tCAjVfzk7UK1TBth7j28Qs+mW8g==
X-Gm-Gg: ASbGncshTFmh9jfmGqSnZxFA9su+YenucMZC5fBJHBekCCatycUeW4qCNTsCzFyD7Em
	/He4zpoZ7qm7zvQWu3LbMbXK8wRcwRZd4IewCkagbjNnMItWMHzp3SRDXy5vls3x8iwTTElntpb
	YXU6MlqKYcbIBI5nfMf3MIMKSh6/80AvH5rQHYMohiFo8z9lB/oPP1l6+l0tKLn7uZYcPKKK6+M
	LL8MPdU1ElrOJML9awAgCW9UXKjbtPzk+dPlWOgWY1ZS/bGrG1IzvHKSWcJ2zOAMjuZVJGYHFEr
	vYUdwsr6qyifkxm/dQToPBlMbAjOzlisQr3AS0DzwuhKMxHT1MVulmRYuXkSQP9sOFujcDn0PKa
	yIWZKxxNqpY530MBxezXL7h1FtHZMxIlZe4RiYR0T2DxUSYp+tCi2WO4bwzLl
X-Google-Smtp-Source: AGHT+IGKwyEiWIvNN5ljOOt5rhXv44UIeUvI/e+ufFqX9vvMzpakBy8GcdBfL2xk6ruLl+tI0VvWdA==
X-Received: by 2002:a05:6a21:69c:b0:204:4573:d855 with SMTP id adf61e73a8af0-23134a6a3c2mr6222085637.9.1752266443600;
        Fri, 11 Jul 2025 13:40:43 -0700 (PDT)
Received: from google.com (236.219.125.34.bc.googleusercontent.com. [34.125.219.236])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3bbe72912asm5645201a12.71.2025.07.11.13.40.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 13:40:42 -0700 (PDT)
Date: Fri, 11 Jul 2025 20:40:38 +0000
From: Benson Leung <bleung@google.com>
To: Jameson Thies <jthies@google.com>
Cc: abhishekpandit@chromium.org, ukaszb@chromium.org, bleung@chromium.org,
	heikki.krogerus@linux.intel.com, akuchynski@chromium.org,
	mattedavis@google.com, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v1] usb: typec: ucsi: Add poll_cci operation to
 cros_ec_ucsi
Message-ID: <aHF2xpf5LMTm1B8Q@google.com>
References: <20250711202033.2201305-1-jthies@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250711202033.2201305-1-jthies@google.com>

On Fri, Jul 11, 2025 at 08:20:33PM +0000, Jameson Thies wrote:
> cros_ec_ucsi fails to allocate a UCSI instance in it's probe function
> because it does not define all operations checked by ucsi_create.
> Update cros_ec_ucsi operations to use the same function for read_cci
> and poll_cci.
> 
> Signed-off-by: Jameson Thies <jthies@google.com>

Reviewed-by: Benson Leung <bleung@chromium.org>

> ---
>  drivers/usb/typec/ucsi/cros_ec_ucsi.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/typec/ucsi/cros_ec_ucsi.c b/drivers/usb/typec/ucsi/cros_ec_ucsi.c
> index 4ec1c6d22310..eed2a7d0ebc6 100644
> --- a/drivers/usb/typec/ucsi/cros_ec_ucsi.c
> +++ b/drivers/usb/typec/ucsi/cros_ec_ucsi.c
> @@ -137,6 +137,7 @@ static int cros_ucsi_sync_control(struct ucsi *ucsi, u64 cmd, u32 *cci,
>  static const struct ucsi_operations cros_ucsi_ops = {
>  	.read_version = cros_ucsi_read_version,
>  	.read_cci = cros_ucsi_read_cci,
> +	.poll_cci = cros_ucsi_read_cci,
>  	.read_message_in = cros_ucsi_read_message_in,
>  	.async_control = cros_ucsi_async_control,
>  	.sync_control = cros_ucsi_sync_control,
> 
> base-commit: b4b4dbfa96dea8e299a47ef877eb0cfe210a7291
> -- 
> 2.50.0.727.gbf7dc18ff4-goog
> 

