Return-Path: <linux-usb+bounces-29859-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E1EC1D830
	for <lists+linux-usb@lfdr.de>; Wed, 29 Oct 2025 22:49:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 18F25401D57
	for <lists+linux-usb@lfdr.de>; Wed, 29 Oct 2025 21:49:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4CA335965;
	Wed, 29 Oct 2025 21:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="UpZPb28H"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B271A274FE8
	for <linux-usb@vger.kernel.org>; Wed, 29 Oct 2025 21:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761774565; cv=none; b=NiI/g5imcTPsJ2D1WiYB/HlWNFNFiq0fgNsouwBlEvRGFHLGaHnl5rezK9fJ0/OIwTEWW27aVFbf1oUgW4VrKEl6zcaR3VDeYdXZgwJdkxH5m0CSnh+KjqIpchgD6aHSCPh71GZsFRWpbW7UzCPRgUiLDac/YYMuUey/pmi5sbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761774565; c=relaxed/simple;
	bh=4y9V70WFBvxyqJjplO9V+cIfxz5Th6UpWFken6ZSSjE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rscq2NbKAw6cOWEGqyG88NG/JTnAmXyprVyGkgCc6RwAbh4F8Nbu/9+cNN7pKac8CulCTfEosnUFmfXiF0d+WNiAW/Vk67jwIY71Pw4AoxVb7AUY3LR0XUc83pyrRNGxpkW/J0Q34HfPxIA69OoEza8JoD4KMx0IHaPYtyy44go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=UpZPb28H; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-78f75b0a058so4080756d6.0
        for <linux-usb@vger.kernel.org>; Wed, 29 Oct 2025 14:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1761774561; x=1762379361; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rE1JyEMJ3v3jXraVaSIO/rQxseox2pYjQmRppVzrLvc=;
        b=UpZPb28H4f4dICsWtZ1LtUhJ+DoPAHLiDJIcEEkYOGZ528pFDB92iDL5Radi75VKvE
         m6At3BfLyakLSd4yM3n3tMZntsQIjT3X06GCqIrOxG+EDXHC0Aey1DrhjvfzTsER+YDV
         veu3YI2H+o25YXQFAUZ9u7D+XCj5wA+VRT+0pFn+RqJK8LARvLT2WStG8fQ426z0UWre
         vq42+qKqNCYntIZtm6Mfcs1yT4Up5wM7Awcbge5DdDihkdKC1xPHI6MF85qg1pIOeiAa
         CnffT7aYM9tUhPcVA9A9wqiQQ6JdRUrFRODnKOm6BuwWtav2e3GLdeiFT+VPansqYo8g
         wbBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761774561; x=1762379361;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rE1JyEMJ3v3jXraVaSIO/rQxseox2pYjQmRppVzrLvc=;
        b=bvRRPZEpL0/39kc9A7HWtZx6uKSbiwHZydqXLjsvnWA0J8pqOjzSGEEHu7bc0E7w0H
         YVzgCJ/hwf5OiYOM1wJNZS/zZbfZNpxR+2jyIRSp8vRqKpv/srC268rdLsZ7efxvIRjr
         gP8xBcvLVeWg/3Z1O7LgmbLcwhPMSEA0sajOzLB/OpoXPuuXlSFf/+9shFFwISBdppMO
         zQL7fgcpveJq9V06Rbwwgc6xc5xWCFhU+LXs90GcmCkHRxmKhiZSarMbQA+68ptExJdW
         6/t8JSPsMEZqQuEwkZ/Ui605uCF9qZH77BHin+JjCnuwaXkSUnkjEdunlApxCcLc6P2b
         4Rzw==
X-Forwarded-Encrypted: i=1; AJvYcCWCEbn+dhiRqgmm4S1PL93B5uLXr8yd5TGnJ9o+UbusrKXyncXtlpHHI5oA/5vyC7yoHnmv0bf5KYY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbbdBtIkyt91mKiiQ+iGrFCPtQwxrwOQEBfL6qXkLKI1mjDtqx
	vdrWJx95E9bevKwipSsDpfQybZvq3bY1fy2zg82POZpCFa+TzYr7rNta+g8wWlQuqKzFgyQnqlU
	CGQg=
X-Gm-Gg: ASbGncuXmP64z5k6ITUhMQ+iibUPi6Fz0QZkIbXLAxjAOf1x3Ft9ipnv/MnqjljPEn4
	XOnWqUqdBXePz7EeohnvXYQgW0AQaW8cvxL9SudgCB8pWT/CKgJen3ZcQ3c1v6+B2ykIuAfUAdi
	zm4lnc9dDbz9kN72VJeVMXO8DP2KspRHcQdsg+B0aUJjmq3WKLXz4dTFxHZQCw3YPL8Ehb2vBeQ
	e2PlhRAFqtZOBoYm6/4rjbC7dbSwD/lcLzwu/8cTRmBlgj9qYFrHjtqMuJdplwOcoOW8yX/MBWU
	ArKB4nx4xxtJGm2V058RJmDDNUawrUmftN1By0ugkdZ9e98qZw9foFm+9rMA70r/scQPmUCE9bp
	A+u6eGbUWvvPcFyI/fSAijRIR6Sy/xobU+XxksTlm56SN5FO7D/NDmKlbJJ3Fif4oiE4AqE3WHz
	Z0cQ==
X-Google-Smtp-Source: AGHT+IEia63DWtt3sJ/hE8wQB6V+RWNyg4QYX5RQRa/XSY65kZ2z6hDGlDeovmsAIVmEGP2Uj0ltIw==
X-Received: by 2002:a05:6214:29e2:b0:87c:2ba1:16b4 with SMTP id 6a1803df08f44-8801b2113camr15045546d6.46.1761774561522;
        Wed, 29 Oct 2025 14:49:21 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::ba76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87fc4944a84sm108980116d6.36.2025.10.29.14.49.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 14:49:20 -0700 (PDT)
Date: Wed, 29 Oct 2025 17:49:17 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Desnes Nunes <desnesn@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	gregkh@linuxfoundation.org, stable@vger.kernel.org
Subject: Re: [PATCH 1/2] usb: storage: Fix memory leak in USB bulk transport
Message-ID: <2ecf4eac-8a8b-4aef-a307-5217726ea3d4@rowland.harvard.edu>
References: <20251029191414.410442-1-desnesn@redhat.com>
 <20251029191414.410442-2-desnesn@redhat.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251029191414.410442-2-desnesn@redhat.com>

On Wed, Oct 29, 2025 at 04:14:13PM -0300, Desnes Nunes wrote:
> A kernel memory leak was identified by the 'ioctl_sg01' test from Linux
> Test Project (LTP). The following bytes were maily observed: 0x53425355.
> 
> When USB storage devices incorrectly skip the data phase with status data,
> the code extracts/validates the CSW from the sg buffer, but fails to clear
> it afterwards. This leaves status protocol data in srb's transfer buffer,
> such as the US_BULK_CS_SIGN 'USBS' signature observed here. Thus, this
> leads to USB protocols leaks to user space through SCSI generic (/dev/sg*)
> interfaces, such as the one seen here when the LTP test requested 512 KiB.
> 
> Fix the leak by zeroing the CSW data in srb's transfer buffer immediately
> after the validation of devices that skip data phase.
> 
> Note: Differently from CVE-2018-1000204, which fixed a big leak by zero-
> ing pages at allocation time, this leak occurs after allocation, when USB
> protocol data is written to already-allocated sg pages.
> 
> Fixes: a45b599ad808 ("scsi: sg: allocate with __GFP_ZERO in sg_build_indirect()")
> Cc: stable@vger.kernel.org
> Signed-off-by: Desnes Nunes <desnesn@redhat.com>
> ---
>  drivers/usb/storage/transport.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/usb/storage/transport.c b/drivers/usb/storage/transport.c
> index 1aa1bd26c81f..8e9f6459e197 100644
> --- a/drivers/usb/storage/transport.c
> +++ b/drivers/usb/storage/transport.c
> @@ -1200,7 +1200,17 @@ int usb_stor_Bulk_transport(struct scsi_cmnd *srb, struct us_data *us)
>  						US_BULK_CS_WRAP_LEN &&
>  					bcs->Signature ==
>  						cpu_to_le32(US_BULK_CS_SIGN)) {
> +				unsigned char buf[US_BULK_CS_WRAP_LEN];

You don't have to define another buffer here.  bcs is still available
and it is exactly the right size.

Alan Stern

> +
> +				sg = NULL;
> +				offset = 0;
> +				memset(buf, 0, US_BULK_CS_WRAP_LEN);
>  				usb_stor_dbg(us, "Device skipped data phase\n");
> +
> +				if (usb_stor_access_xfer_buf(buf, US_BULK_CS_WRAP_LEN, srb,
> +						&sg, &offset, TO_XFER_BUF) != US_BULK_CS_WRAP_LEN)
> +					usb_stor_dbg(us, "Failed to clear CSW data\n");
> +
>  				scsi_set_resid(srb, transfer_length);
>  				goto skipped_data_phase;
>  			}
> -- 
> 2.51.0
> 

