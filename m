Return-Path: <linux-usb+bounces-12580-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8AC93FD66
	for <lists+linux-usb@lfdr.de>; Mon, 29 Jul 2024 20:35:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3CC4F1F22E11
	for <lists+linux-usb@lfdr.de>; Mon, 29 Jul 2024 18:35:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D2E2187335;
	Mon, 29 Jul 2024 18:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="bse18pC/"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED66187326
	for <linux-usb@vger.kernel.org>; Mon, 29 Jul 2024 18:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722278093; cv=none; b=idD8K33owty2bZQNJH58B2Q38SWZ0KhLHBPASvX0k7mrfyJQMX9PXeDKMCvPgWoauSVwA77HQBNenn4GDgv1X2BokN7ZB9aYwtUcLOAQRLnWb5hn4VHAb6rRWWnYImVedUVGUknd1aRquS7NZXwPYogDiXtSuG1HrGapFOTpcq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722278093; c=relaxed/simple;
	bh=c/mwNpz4IjBPv3QCDjMFypfQNm0qufjOWYAErXQm1sg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BiYZxjfexaHl0Te87grB5br9shmje0gbjkj9v0xK8A251pG40vACN/IuKaW43eLzOovFXx3GKvCpOSuMkh0NuKe0SM8GSuB6Xqglf2H+7vxi8xfMJsvG3HuqjzToKfAQcYsIG7wwuGbvQSsUhrm376EPU5ZDNvdMxvEwDpxoEMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=bse18pC/; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=g.harvard.edu
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-5c6661bca43so2329812eaf.0
        for <linux-usb@vger.kernel.org>; Mon, 29 Jul 2024 11:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1722278091; x=1722882891; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=imNjbcelp3B6lXsHYN7XqqAWMw2+xVAXpWIJw514jNs=;
        b=bse18pC/Do+25jDX0s0qGeJ+/449XRoeD286HvatGp5jxbjD0FW6BTu0qkNCxTtH1i
         2avIgTk3t3iu9gD6TYjIZjTVmIpBYSFSafyPZsLuu9YvtaJhj1pzSea/eXqE/I/eIbKB
         yMKoIYC4TlCeXn8ry8QXHmfFyhPln2bhpSyqp3KE/HDXsoLQF2lBhgckfqUjuZhLjqSH
         oCegRaK/zrdwktzztXkYpMACxKeBGlcDp8Fl/4kO4lXk/w5Xu3mFDX6yblAERJ2wNUfH
         Q5DlnHirDjPtzIZUXALo/sAfUcUXz8fKl09bvOrzWB2dDoh/oWE2EHW6ml8t1TfevpTq
         N/lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722278091; x=1722882891;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=imNjbcelp3B6lXsHYN7XqqAWMw2+xVAXpWIJw514jNs=;
        b=g40+B1HDUEPM6arX3HCG3cvmrW1GAP1hANZ3ZRoLUthHphywlcUs4JMaZoyX6v0qXx
         e1USWokPtcTjO4zSmANHcmkJIegXm+m+uDoefzMw4OCFpUbUffDWFWk3Oc5EX7nXr9Kf
         VoeZlZpGoa0iYhnvNQVk0oTdfnoMHMHpE8Zoj6Wc8aEZ+mMn6REVVGRWQlu15W1W3sC6
         hgeR90KnNjPqHnOpEzBmxcg0VAKxRYOCw9P4ZDlMDhhVSxNnktBUog7PJt+fpP3j22kt
         RLb1vfYqYTfrb/K38kg5VHjrTxIDwSn9DxmWnnU3BCCrozXSyQHppOUChbGOSGIjAShn
         XwEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpBYgq4v94DqN+Hqorfyy0b6KXsm81Imoh117u4KTAKAMF5cGryr+cok6UyYj1dNr7fvo8QPFMmfwVlObrF1y/EbXu/ZNLYtON
X-Gm-Message-State: AOJu0YzOZQ19PFnKqUL8BuItysohGdiPSUrm9J7Hm9ahczP4bNQky9uD
	R8undRGIfuZxF0FqXgsIASGYHbGR9SmxxST5FVmFwCbRnkGLbyeAuRtEgF2MFQ==
X-Google-Smtp-Source: AGHT+IHDvNtdaAkP2OQ2xtY4UQLx6a1DPFIKYg0qRReFTzv6WHCfzOj611JnSF7iRNyfCz8VicFWDQ==
X-Received: by 2002:a05:6358:e924:b0:19e:fa9c:5ec9 with SMTP id e5c5f4694b2df-1adc0665bfdmr914934655d.9.1722278090607;
        Mon, 29 Jul 2024 11:34:50 -0700 (PDT)
Received: from rowland.harvard.edu (iolanthe.rowland.org. [192.131.102.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bb3f8fb75esm55530016d6.37.2024.07.29.11.34.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 11:34:50 -0700 (PDT)
Date: Mon, 29 Jul 2024 14:34:47 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Abhishek Tamboli <abhishektamboli9@gmail.com>
Cc: gregkh@linuxfoundation.org, usb-storage@lists.one-eyed-alien.net,
	linux-usb@vger.kernel.org, skhan@linuxfoundation.org,
	dan.carpenter@linaro.org, rbmarliere@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: storage: ene_ub6250: Fix right shift warnings
Message-ID: <040f84a0-f299-4165-b261-636f8c9c2060@rowland.harvard.edu>
References: <20240729182348.451436-1-abhishektamboli9@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240729182348.451436-1-abhishektamboli9@gmail.com>

On Mon, Jul 29, 2024 at 11:53:48PM +0530, Abhishek Tamboli wrote:
> Change bl_len from u16 to u32 to accommodate the necessary bit shifts.
> 
> Fix the following smatch warnings:
> 
> drivers/usb/storage/ene_ub6250.c:1509 ms_scsi_read_capacity() warn: right shifting more than type allows 16 vs 24
> drivers/usb/storage/ene_ub6250.c:1510 ms_scsi_read_capacity() warn: right shifting more than type allows 16 vs 16
> 
> Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>
> ---
>  drivers/usb/storage/ene_ub6250.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/storage/ene_ub6250.c b/drivers/usb/storage/ene_ub6250.c
> index 97c66c0d91f4..ab6718dc874f 100644
> --- a/drivers/usb/storage/ene_ub6250.c
> +++ b/drivers/usb/storage/ene_ub6250.c
> @@ -1484,7 +1484,7 @@ static int ms_scsi_mode_sense(struct us_data *us, struct scsi_cmnd *srb)
>  static int ms_scsi_read_capacity(struct us_data *us, struct scsi_cmnd *srb)
>  {
>  	u32   bl_num;
> -	u16    bl_len;
> +	u32    bl_len;
>  	unsigned int offset = 0;
>  	unsigned char    buf[8];
>  	struct scatterlist *sg = NULL;

Acked-by: Alan Stern <stern@rowland.harvard.edu>

