Return-Path: <linux-usb+bounces-29929-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B9528C22E9E
	for <lists+linux-usb@lfdr.de>; Fri, 31 Oct 2025 02:48:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DDD574E97C9
	for <lists+linux-usb@lfdr.de>; Fri, 31 Oct 2025 01:48:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFD82264FB5;
	Fri, 31 Oct 2025 01:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="XAB9vnQY"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9764223707
	for <linux-usb@vger.kernel.org>; Fri, 31 Oct 2025 01:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761875316; cv=none; b=gUn2zxtIqEYBhuDXA1daTVrMRuk3/P9DeKDf4w4Qy7sbHbWNbwQjPGR1WmuYsf0/CAvotUw9fylvJ+ElWIbukaUk1OnjyJDBN2PqaNvG0uWF7+/w/KrLUtfIKj029yDQ/fIadF9Jl5fHJ/nrM88C4itIP4mh53jMbQDES8hmt1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761875316; c=relaxed/simple;
	bh=CGQoH/JE7RMcpARc0jVV3Qw00UqxSIi0see9VSUJ5T0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pHIHodJAGVvQxkWZW/oIrM2ski34t0AHfhxlGhbjFJd/7AiySZJl6r9VNHayA+UqJ6p9lZAC7+SAvnAVUFwwPXi+W7tW61CCqLygjAcKWzs+SwtpbMoq1Ylgx/TxkLpML4YqbhFACbiUvrvBBlJCjdIFK7bGGuUAfzN6LW5S+iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=XAB9vnQY; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-8a3eac7ca30so125757285a.2
        for <linux-usb@vger.kernel.org>; Thu, 30 Oct 2025 18:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1761875313; x=1762480113; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5Nw7ZJvHJNNjuGTUIlC/U+5S3zQdlNMXANqVv6299UA=;
        b=XAB9vnQYsOIjtQK2Fj2G77Dc621PcYfLDJ2H15bSau7Fj6E0YLlvt5gj+ZN30HaAT0
         xZW7hEU28J0lYonxoiUkWahKn38dCHgYk/z+amSQb8wtgwUT1mBeQJPsKHJJd4teko+V
         ftOE2wSyVuECwNL2wGu8EXh4s4eXlU94ATUGreKMgyYvgHC0lwjL/5aftQXNAx8v5O45
         ZE1c3XkLJFeKDxcX9Fbckxtwy13LL1oV/0sIUjOnp4oVIqJiqBjRMDN/N+HnTwfLyA7T
         tq7ZQUn5mesYGQj0cbjyVUwHzPT0Slf+hKIzwgWc7h2lN4VYNpOMRBggg+2uJG7l3gNj
         kmJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761875313; x=1762480113;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Nw7ZJvHJNNjuGTUIlC/U+5S3zQdlNMXANqVv6299UA=;
        b=gKSSakBnfMyzuZZmMh/8kZipcTe5W0oPIIJEYlopbVNqNMq3JTA38L9+EIoU+zi+Kw
         3IKxkDHen5v1n4Qvocynvn93ODOtZvWArZVINuAdSVi5NpHyNqcUms59S7WgPbGjTKBt
         g6s0GF35HgGwk8Jn59Be1XdLWny7yETdgH9ybktgX2MSa5B36bzKdt8WUt/mv/kZ6ibU
         wi7D1c+x8nwFCKGXbrlBODZKY7gAVDKcsivo/3Svw9qC4WZjOjcRVMoKjV8D7ey2pMNI
         8gRHj3lZ7fIlBPlRhDzR7DpqbyokykbxFT2LE6LMkmn0FioHoSjfjm5ysvkbGi7ncXcc
         TwOg==
X-Forwarded-Encrypted: i=1; AJvYcCXPic5PXwQvEa3BQlnKUMc9VkYuK6w78bdnuD+/9DE89hFp5AddnTOb7UamApcjSw1zxjzA5LidWWs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7AqhOeadqkX8ahtTFshLB5oOJbGIuB4B+d1iBYCyxqZt+KkBp
	HMf2jeFled/PFVGOUdzsBsOuDVrd5hYuZbqSMnqeEBt71LmdKTW5KcUXT30BKVXnbw==
X-Gm-Gg: ASbGnctpUf25fQoaWB/yjifdhTiuYooIIdkZmKYbEFIep/QhI8gCPAVdXHQQqObznIJ
	J+VV9LJ8+1NQKlB5keESeVl8OaTiGmTAe7yfY4JWufG2VzP6tlnpnbCeXSepnjXkXN1tJEjQYUX
	2+pY5Os7+FD0yyTwKDIQ2231SrGPsqG+fJdb3LBUYwpq6TofJU5AcA4bebNksm1T4upco87aUO6
	wJE+nl3ypyx8T/mVct34caWqCx/bh0RzT2fjNuNZzxfVklG5KuNm+jX3ryjF4q9zHNwDESGKWvK
	orha+Uw2LCLJbLLG5zPQbudMDvuJchdX8Mq7LttYOcgaGYbEoVs84YOFESyNz+Q3T9uMc6yB8QY
	Ze7s/8ywwXuixu8ka+kMKYK63s2zd+EWfUvOMp5qk4F7IRqlLrUHJpbyQEMjeaLwtT9kUHkeDqL
	Oyrg==
X-Google-Smtp-Source: AGHT+IFPRF3nHMnMN4v7NDKYZrDBxuPNtmp9qyChBVjZlNRHuaz6ttavXZv9Tap/e+QcijC+0d5oUA==
X-Received: by 2002:a05:620a:1a1f:b0:850:b7ad:c978 with SMTP id af79cd13be357-8ab9b2b6238mr209085385a.49.1761875313404;
        Thu, 30 Oct 2025 18:48:33 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::db9a])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8ac02f85391sm19200085a.29.2025.10.30.18.48.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 18:48:32 -0700 (PDT)
Date: Thu, 30 Oct 2025 21:48:29 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Desnes Nunes <desnesn@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	gregkh@linuxfoundation.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] usb: storage: Fix memory leak in USB bulk transport
Message-ID: <b2ec533d-9f87-4d65-a20f-99488ffe56e9@rowland.harvard.edu>
References: <20251030214833.44904-1-desnesn@redhat.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251030214833.44904-1-desnesn@redhat.com>

On Thu, Oct 30, 2025 at 06:48:33PM -0300, Desnes Nunes wrote:
> A kernel memory leak was identified by the 'ioctl_sg01' test from Linux
> Test Project (LTP). The following bytes were mainly observed: 0x53425355.
> 
> When USB storage devices incorrectly skip the data phase with status data,
> the code extracts/validates the CSW from the sg buffer, but fails to clear
> it afterwards. This leaves status protocol data in srb's transfer buffer,
> such as the US_BULK_CS_SIGN 'USBS' signature observed here. Thus, this can
> lead to USB protocols leaks to user space through SCSI generic (/dev/sg*)
> interfaces, such as the one seen here when the LTP test requested 512 KiB.
> 
> Fix the leak by zeroing the CSW data in srb's transfer buffer immediately
> after the validation of devices that skip data phase.
> 
> Note: Differently from CVE-2018-1000204, which fixed a big leak by zero-
> ing pages at allocation time, this leak occurs after allocation, when USB
> protocol data is written to already-allocated sg pages.
> 
> v2: Use the same code style found on usb_stor_Bulk_transport()

Minor nit: The version information is supposed to go below the "---" 
line.  It's not really part of the patch; when people in the future see 
this patch in the git history, they won't care how many previous 
versions it went through or what the changes were.

> 
> Fixes: a45b599ad808 ("scsi: sg: allocate with __GFP_ZERO in sg_build_indirect()")
> Cc: stable@vger.kernel.org
> Signed-off-by: Desnes Nunes <desnesn@redhat.com>
> ---
>  drivers/usb/storage/transport.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/usb/storage/transport.c b/drivers/usb/storage/transport.c
> index 1aa1bd26c81f..ee6b89f7f9ac 100644
> --- a/drivers/usb/storage/transport.c
> +++ b/drivers/usb/storage/transport.c
> @@ -1200,7 +1200,19 @@ int usb_stor_Bulk_transport(struct scsi_cmnd *srb, struct us_data *us)
>  						US_BULK_CS_WRAP_LEN &&
>  					bcs->Signature ==
>  						cpu_to_le32(US_BULK_CS_SIGN)) {
> +				unsigned char buf[US_BULK_CS_WRAP_LEN];
> +
> +				sg = NULL;
> +				offset = 0;
> +				memset(buf, 0, US_BULK_CS_WRAP_LEN);
>  				usb_stor_dbg(us, "Device skipped data phase\n");

Another nit: Logically the comment belongs before the three new lines, 
because it notes that there was a problem whereas the new lines are part 
of the scheme to then mitigate the problem.  It might also be worthwhile 
to add a comment explaining the reason for overwriting the CSW data, 
namely, to avoid leaking protocol information to userspace.  This point 
is not immediately obvious.

> +
> +				if (usb_stor_access_xfer_buf(buf,
> +						US_BULK_CS_WRAP_LEN, srb, &sg,
> +						&offset, TO_XFER_BUF) !=
> +							US_BULK_CS_WRAP_LEN)

Yet another nit: Don't people recommend using sizeof(buf) instead of 
US_BULK_CS_WRAP_LEN in places like these?  Particularly in memset()?

> +					usb_stor_dbg(us, "Failed to clear CSW data\n");
> +
>  				scsi_set_resid(srb, transfer_length);
>  				goto skipped_data_phase;
>  			}

Regardless of the nits:

Reviewed-by: Alan Stern <stern@rowland.harvard.edu>

Alan Stern

