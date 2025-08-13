Return-Path: <linux-usb+bounces-26799-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB2FB24B92
	for <lists+linux-usb@lfdr.de>; Wed, 13 Aug 2025 16:07:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F6CB5C096F
	for <lists+linux-usb@lfdr.de>; Wed, 13 Aug 2025 14:00:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AAC62F28F6;
	Wed, 13 Aug 2025 14:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="bhYjON0L"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8455C26A1B6
	for <linux-usb@vger.kernel.org>; Wed, 13 Aug 2025 14:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755093612; cv=none; b=D52KVzDY61iOeSLki96lBWTh5Kqa17HYJHyI9qzd8lA3/Hs6g+0Ckf/h2Sz0zIWWbhXyZi63ii24pARhoK5AOnm+E/nUE3KfniQFZHp+U6njLktgpN09XEBCYePD/2wyGA2OONvDzORTCapENS/7Yjk0u36v1M9mpisDeIgPeWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755093612; c=relaxed/simple;
	bh=kvnCEV4WqFaXfNRysDDum2pAVYP0csyhauHavN2akq0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I8JM1ERM/Ady1CKbuseKA+ayD2HEgHo+n1MFdsE5lVNev2IFTeVtG+PZa4kVCroIzo8/8livxuBvJYnaIZIcaV4/vvCB3Jdfxj+Qymf6k5r6z675fM+TlHzzaooVmPu4CBTqZYd+ORz3L343sYPQWpfdCs5xgd/QudgAOSKsx44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=bhYjON0L; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4b0fa7ed37dso8701281cf.0
        for <linux-usb@vger.kernel.org>; Wed, 13 Aug 2025 07:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1755093609; x=1755698409; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=14mqwiNGUnagTAT/uPS4H5UVASh274vbb++jcSI7i7I=;
        b=bhYjON0LL6pzAYrNm2J+TY275MQDRAA4Xru70eIOlwYic1d/H5jTD66TfpWD9pQwxe
         3WL7GusxIv9FErmD/dmANdx1tvc+I2ti0y62RlZeWFXn24SOmKiMm30txr/p9jXu8gFj
         k1C6R2tUuxwk+Fnhw5KgFGvO2ENzPQEHZ1eB65asw43ZN6oCkrCUZY06FoqFnomIiWVF
         jOqdtTFpufXv6ENomX0LMK3xoN1aTtmJFMOfnXHc19jcBJQGnGCIPgJahQCfQGQVy/Dv
         XU3DVAnm4cj811Aaw/H8X06rKBlBY2MNFsrpa01JJ7sdCk1E5FxraYkA52qPCxY7ndL9
         9ijQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755093609; x=1755698409;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=14mqwiNGUnagTAT/uPS4H5UVASh274vbb++jcSI7i7I=;
        b=fakJWZa31gOxJV3X9AGQwBK6ya+zaGVOokcIBGaUlojqmLnK9cjhhmSd6OUpHCL5GF
         L2RHh+ScA0rz/fFctgABm0Uj7qBFgQ9YMT0AwHRvolkW24hb9XuxTK26T7W0RnoUUOU/
         Ki9wDrZGuag7IiXsftQM+U99v97u4ApTj9cnQowltJo/+kgFi0Xn7IxQGTTxpU0keIRQ
         kRU65afjQ9thBQtrF7X+mz2g17t0KFmlLhr6c94fJ7X8ljlO2QC0ZtMPh2l6RTYLTnB2
         DqLsrIa7R2YETvGkCaDqPfG3nNFji1c4JeB3iG7VfAUsx8EQ5sldN1ZQzVBzh0RnSQm/
         lXuQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6jN4MIT9rHBIrR4i7uMkYuo+w1TICd0vl1n36H/7U6vd/IJT+2ppeUtsg8CnLe0AgkYCI0v7g0uc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3h4bk2pXoxgTnNl7uha+x5h6QAa7T9y+CjHiK9zz+75pkATE6
	LpzQ7aXE0hcglGsA9BEflqbH/5bugqLQzxeTtxtrQCYXTPmVPfTaJwaP+tREmXcyjJTyn9ZAAiR
	dGqk=
X-Gm-Gg: ASbGncti8YLmmbBtJa6qOAhOt7rGfd5NpULochwssQ7jf3dEeXYldSv98K1nKWJ8qPZ
	k+bW+hNzRzlgsplh3HjFbS/a34qC4/XkH4qgrcdTA3uWjoLtQi/jiv3CSwuE0Cr2Xnozaif/t21
	XfBuEWj4lmvwIgN9wcQyRtfZV7jKaNaBSzO+f3zKf3aEteZu0ps/wg923xFwlwlaIcC29zueere
	4E4RmKuLSoNdIpNYctOCuJhFNvXryEdmr35U7SWJEEx6vjHZSkkOpg1oHNv+Lj69Ecwigd/AywS
	18bwMYbZDpaak4yOZ/mMzHtnbzSy/2LOmoRrVEVP9j4i6Tet/m3AF3f8OwzGrFG+UAXqk3hZnGL
	srXjJCiqxB/yHWdKH2qcAjamAH+kpOFwwBr2ijKSRts1ClIjlxIU=
X-Google-Smtp-Source: AGHT+IH6F+o51vIa4VHXqfN5yGQvnR0IghUlwkjQkPziPu74HD7sjxO7q8kjYg+1UjaKvOvweHQdSQ==
X-Received: by 2002:a05:622a:5e16:b0:4b0:769e:42e8 with SMTP id d75a77b69052e-4b0fe2a8b99mr30085081cf.29.1755093609191;
        Wed, 13 Aug 2025 07:00:09 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b06ea8cec8sm137121811cf.25.2025.08.13.07.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 07:00:08 -0700 (PDT)
Date: Wed, 13 Aug 2025 10:00:06 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] usb: storage: realtek_cr: Simplify residue
 calculation in rts51x_bulk_transport()
Message-ID: <b0c0ed47-b524-48c8-84c9-7da02f7f7d30@rowland.harvard.edu>
References: <20250813101249.158270-2-thorsten.blum@linux.dev>
 <20250813101249.158270-4-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250813101249.158270-4-thorsten.blum@linux.dev>

On Wed, Aug 13, 2025 at 12:12:49PM +0200, Thorsten Blum wrote:
> Simplify the calculation of 'residue' in rts51x_bulk_transport() and
> avoid unnecessarily reassigning 'residue' to itself.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  drivers/usb/storage/realtek_cr.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/storage/realtek_cr.c b/drivers/usb/storage/realtek_cr.c
> index d2c3e3a39693..8a4d7c0f2662 100644
> --- a/drivers/usb/storage/realtek_cr.c
> +++ b/drivers/usb/storage/realtek_cr.c
> @@ -261,8 +261,8 @@ static int rts51x_bulk_transport(struct us_data *us, u8 lun,
>  	 * try to compute the actual residue, based on how much data
>  	 * was really transferred and what the device tells us
>  	 */
> -	if (residue)
> -		residue = residue < buf_len ? residue : buf_len;
> +	if (residue > buf_len)
> +		residue = buf_len;
>  
>  	if (act_len)
>  		*act_len = buf_len - residue;

Acked-by: Alan Stern <stern@rowland.harvard.edu>

