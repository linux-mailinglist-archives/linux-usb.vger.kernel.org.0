Return-Path: <linux-usb+bounces-21042-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0903A443FF
	for <lists+linux-usb@lfdr.de>; Tue, 25 Feb 2025 16:11:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ADC6916459D
	for <lists+linux-usb@lfdr.de>; Tue, 25 Feb 2025 15:11:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 009C026BD86;
	Tue, 25 Feb 2025 15:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="OdcqWojO"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E5E267B9D
	for <linux-usb@vger.kernel.org>; Tue, 25 Feb 2025 15:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740496269; cv=none; b=j04Wi9PFp8NZLMDxrAIfNpavJyYIsmVKtuZquN4jM7z2x8awQf3MqgEk7XXelm4XdunJaO8/n9V2Zap+HfPvga1PHc72KLH5nfziHSxrwz1gJyYCYP8iyq1IfjbiH2fATlc0HqxMVV3Y10Ub+7IBwTa31Gu0t2eOgCBb1mS8/PM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740496269; c=relaxed/simple;
	bh=tkSmq7pnmmsOA5HbpEM7dnueRwC5y1v10Z0L0e+tnJs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m7EObpkZY1DbMIn7GIPzEeCsLd7EbDrIuAf99YUZRiY+ndfYtZC1MtObU+ef2v0ZwSQk9K+lr1zZYtMF2hjPbuOqaXBQ+9JBEjQHPfZQfULWQWc7tCGeQ7D8V52o2/web7P8pjSrQP6G4HrXxPiaDVi5DyRsiDn0ExvHqenrRV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=OdcqWojO; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6e67ce516efso45277986d6.3
        for <linux-usb@vger.kernel.org>; Tue, 25 Feb 2025 07:11:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1740496266; x=1741101066; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UuZd7P5DT0VbRPayAqAZRRBZvg2Yklr2Rd6Ruf/f2fY=;
        b=OdcqWojO+x/BoE8WpuLf8eMF5qLgHxwDg19zcAReilMWQ/5g5cEXsrseR66gABzkDX
         i2Mno5IiVE8Mb8xpIcS8vkp5Uaqc/Yh6a6gGsRZ9sZmtdWw0vQlAGTpUBDG5kcgFa57g
         CmK1H1EGB1K559gGCqBQIH+FsKPpU+0AMG+SgV1krjrVxxsGyFrMBgXYsxGrNWvD35QP
         xX/Nzef1P06NOoOuD4uxhdxOnrLKbsEQfRk1h+LF/Bhx/thQCcWuDAe5Zi9QhVHtV/pB
         bgSFx2M1pxpA6ZHGRJ3S9nOOWv1PJiftqF/WyQfUR8N+92DPV0UqTpY2tehkEftk+m+h
         bODA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740496266; x=1741101066;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UuZd7P5DT0VbRPayAqAZRRBZvg2Yklr2Rd6Ruf/f2fY=;
        b=tjmBEMO7kyZcNjQfoGNI1qeeG5XP1V5HmHnwjVeNwCALrd7eii6kPaDkwSx/upY3zz
         IkQKcDLoqP5J35fKh9kpXiUVbHpoZarEg8mmCxVTqsTLJ9z73+032wr9xxOMM/gkAD/K
         bI7vnsg+bhSxfeBVoqZh+eSDBI74f7zDLOCM1r1PivKNKYI1gNjZ9wxm0Ldin0vHlfRG
         Z0VlMH0tdPaBLoxeqCI6UXukzS0DcSUWQIFKk54R4HjRssHHsf3rBvl9OfGI9MvXqfkI
         uLsY4Lbb+XUcSAnXn+Y0AvjOaq0/uO3Xyg0sAw0raTDCk4YIY+/WO4tWt6PRVog3zzjJ
         2C4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWXi1xahY4rxcG5It8eEcUyHFYYXIg7nGjkn3mIUxGLR9bd4UG4DokzWpEWNYfZUmSSVY+it7KH21g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWWSxKl93khHCW0ejvvU/PcstnozTSEy+UkdgglcWjvQOy3LEs
	xxga0X4Kw5fSRlBT3eMY762/94lGyonEJnSB22EdBFkhBx0Nv2SsxlE2chtHUg==
X-Gm-Gg: ASbGnctkYDMImtt/btp6YlcWEWyvt6cad96rVbjMwPiAcafr31dqvHPN3+MBpwDhZhA
	0F3GBTxcCW52CQcoCRwp1l71XS7VA98AczL74azgPjVp1vUCpJr+7hj2duOE5z84d266HTiZGPS
	BSv3aMldr6QCoqn4qeEfow1O4rx0q/7rPFd8krzQ4cEWZMe87Xt/T51tLqaWeq69Bk9RBRx14d4
	BU7OU3XT5kR2R6cK0ZYtZF3eQ1Epzqt1NNWfLqSCLWIhGuJwNfvX1PP74FN4ozVPIhfPEYNI97R
	erHhzZepT4Fx+JcFezE2bp8ZO3c=
X-Google-Smtp-Source: AGHT+IG3zEgevegcgMopSAlehoPLE+jDUsXcWUX3ParBTGXTVTexOgk9CAmzQjvbJLn2aJ2pE8/Daw==
X-Received: by 2002:a05:6214:765:b0:6e6:683c:1e32 with SMTP id 6a1803df08f44-6e6ae7c9ee2mr254909256d6.8.1740496266092;
        Tue, 25 Feb 2025 07:11:06 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::2dc7])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e87b0a04ccsm10187616d6.68.2025.02.25.07.11.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 07:11:05 -0800 (PST)
Date: Tue, 25 Feb 2025 10:11:02 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: j.ne@posteo.net
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
	linux-kernel@vger.kernel.org,
	Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>
Subject: Re: [PATCH] usb: storage: jumpshot: Use const for constant arrays
Message-ID: <a4e81827-b506-491f-8087-204044705c42@rowland.harvard.edu>
References: <20250225-misc-const-v1-1-121ff3b86437@posteo.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250225-misc-const-v1-1-121ff3b86437@posteo.net>

On Tue, Feb 25, 2025 at 01:25:03PM +0100, J. Neuschäfer via B4 Relay wrote:
> From: "J. Neuschäfer" <j.ne@posteo.net>
> 
> These arrays are not modified. Make them const.

This does not explain _why_ you want to declare these arrays const.

> Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
> ---
> Signed-off-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>

There should not be two Signed-off-by lines for the same person.  You 
should keep only the one with the email address you used for sending the 
patch.  And it should have your full name, just like signing a legal 
document.

> ---
> 
> This change was compile-tested with ARCH=powerpc
> ---
>  drivers/usb/storage/jumpshot.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/usb/storage/jumpshot.c b/drivers/usb/storage/jumpshot.c
> index 39ca84d6859122903de4e64b13e697e8b7d4ab31..089c6f8ac85fbb683cca8b03a2ff06c0ca776167 100644
> --- a/drivers/usb/storage/jumpshot.c
> +++ b/drivers/usb/storage/jumpshot.c
> @@ -367,16 +367,16 @@ static int jumpshot_handle_mode_sense(struct us_data *us,
>  				      struct scsi_cmnd * srb, 
>  				      int sense_6)
>  {
> -	static unsigned char rw_err_page[12] = {
> +	static const unsigned char rw_err_page[12] = {
>  		0x1, 0xA, 0x21, 1, 0, 0, 0, 0, 1, 0, 0, 0
>  	};
> -	static unsigned char cache_page[12] = {
> +	static const unsigned char cache_page[12] = {
>  		0x8, 0xA, 0x1, 0, 0, 0, 0, 0, 0, 0, 0, 0
>  	};
> -	static unsigned char rbac_page[12] = {
> +	static const unsigned char rbac_page[12] = {
>  		0x1B, 0xA, 0, 0x81, 0, 0, 0, 0, 0, 0, 0, 0
>  	};
> -	static unsigned char timer_page[8] = {
> +	static const unsigned char timer_page[8] = {
>  		0x1C, 0x6, 0, 0, 0, 0
>  	};
>  	unsigned char pc, page_code;
> @@ -477,7 +477,7 @@ static int jumpshot_transport(struct scsi_cmnd *srb, struct us_data *us)
>  	int rc;
>  	unsigned long block, blocks;
>  	unsigned char *ptr = us->iobuf;
> -	static unsigned char inquiry_response[8] = {
> +	static const unsigned char inquiry_response[8] = {
>  		0x00, 0x80, 0x00, 0x01, 0x1F, 0x00, 0x00, 0x00
>  	};

There's nothing wrong with this.  However, several other source files in 
this directory also have static arrays that are never written to.  Why 
don't you change all of them?

If you do, it will be best to put the changes for each of the files in 
its own patch, and then submit them as a series of patches.

Alan Stern

