Return-Path: <linux-usb+bounces-28907-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D32BBE37D
	for <lists+linux-usb@lfdr.de>; Mon, 06 Oct 2025 15:47:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 96E051892E05
	for <lists+linux-usb@lfdr.de>; Mon,  6 Oct 2025 13:47:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCA822D24B6;
	Mon,  6 Oct 2025 13:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="WEwkwfV3"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E0B1280CC8
	for <linux-usb@vger.kernel.org>; Mon,  6 Oct 2025 13:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759758451; cv=none; b=kAL+yOeKbuM7He/oWr3POF4oLcEybujCRs3BPSGUr/a55UwQJOhF6X2FuW69n5drhBDeP4S6xJbiV9fw3Ot4IW8Vdn6E7VteXO+s+JzuoJa4rafiIsa1vjpK+/N10cFWL1rFyOa+729CR75g1HYuHBUYHjA1xaJa1hUP/2GDEhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759758451; c=relaxed/simple;
	bh=Z+H0gxnZYTkmFUuKyak+Ok12Zfm/sxdm9LqD/h4wYUQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=liVvRUFqp276rYMJgTqsv6j3fll9dRgLdgAbZAtUxXRJplEO/bfGT1UNuVlJaS2c3durU3Wp3oUEoMnK9aYjQz1hN460DxmTHwbtPySla5R8bc2HDZ7rx0U1NCog8zUSXmcMqkCLW165NRSCcSvVV/W+FpW2oAyakusruOYch24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=WEwkwfV3; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4de659d5a06so28230041cf.3
        for <linux-usb@vger.kernel.org>; Mon, 06 Oct 2025 06:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1759758448; x=1760363248; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wTkJngVsLJ0DgMkVkLpzP8oQTDP/g6ry9b6zkF0FP9k=;
        b=WEwkwfV3b1Wv8IyjhCiVbZYZaZfNhRfzQaAc0JZ7/7988cPRvO7rGzVaQ9iFsKw7Is
         1ko9XeCruijJSU7W5BgDt3h609uHCeg8wThgqNLQmw3Jtncm+YJM8FWch2Id1ukkC8Oi
         2tDf8E5HW4LnoYMo5/qTvmRqksvOOBpRDQ7M+YA3+/u9l4DL35X0RIBWRv/PSM2w4JHy
         dG+V9Kztpy76WqBz4VEziHgkWGwn4i/EgmMHOYi2xgCGMM2qjvRE/6LonHFo+V2nd59c
         vG50fLIW0p/wzlJYIqTeu0rjjMNCFFdSinpP6sItJ0NQlH34MLt468LUw+UQ3OVZZ36N
         GwvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759758448; x=1760363248;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wTkJngVsLJ0DgMkVkLpzP8oQTDP/g6ry9b6zkF0FP9k=;
        b=BtnVagZS2Aiv887gxkTIsF0TbyFbmWrbuJE06QKi4saAvFWiSYyxJorx3i45mPUY7I
         ygZyduldpIN2b6rAbnMH6zwgu9ZeH+2Hi0/w380cAIn8lnJK6ZlP/lTLcLaee4hmX8B3
         jAeKIs0oUWKm00A6DTQR4JIs3Z7gsYLiV3Zpn57m9UIP8xaUMwHUZSTliHLheSQrWfiF
         LsIbxyh0//Pyu4VpmN69AMKMbhQI6j2ez6JkKU2vnujU6RsoeBsyaDtTmVTNtOtATtM9
         jHEQ1lGY8GwgedYhC3hu7BHaA0/QrHi1LAdrrMqlCklaeBDIUdplGLlDU7V6xvhgfOXB
         pKkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXoLIN1gKkhtkbYvjYWEQOjzcXBNz2goUp8snq2ZGFUkKidIlob2VuLWWUe/ToMiJk9Yh8JGA67964=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1wyIaiYakhkHHFdRxsK69eQ0aq25xq+jHRqFOLg2sfgf45WPt
	Q2RGlU24xyLZYFaLGC1y/iAoXiqzGVcYoA2hGEFwdaykaigWSsI2ELEPMX592T1NhA==
X-Gm-Gg: ASbGncvuh3s1y0DcrisB7IX6Y+Z87HZcFMiuyFWkSyhv4g7jUvTxzaggfFj4gMp8wu0
	LlWW+yZuBQhZUWNIACH7i4NqhoLr7Qxks/5XKh7an54ib9dMkablS9DVUoZx+szL/BE9UpFXdL+
	DJ5bQn/J+w7/s/XXA8UUZqTMUGdwrkt7vf+RKiyESpfWAnyrPROd4wkRusP9T9CvqVWirThiCCl
	vZgGXKNwgRfPLPfdGKw80jug8f2qpbb3+/JIhBCB2HJUXArQSJ2WU9DLWzOwsWIlTWUgLm5Ca4E
	grffoDh01nqsL9Gf31CxXvk93ouvhhKGuiN8NMHiVtNEv+Z0aCEzRywCsOarCdaf+CJyq1ZVP8E
	IETCZABciELJ/x2L8gcL75bYUbL04ManEmnESAz2Gtgkc6Q1GFsrWeDm3+dZx6w7ifHf4lWR38q
	ktUPxebpE=
X-Google-Smtp-Source: AGHT+IGM9Rzt0Zc8JajspJm8NdIjKBEEWJCKaBlbUiaOyyduOhpnQKIc4EXPRXyKCKIjxmC/odKXMA==
X-Received: by 2002:ac8:7dd6:0:b0:4c0:5e82:86d3 with SMTP id d75a77b69052e-4e576a441famr159271851cf.1.1759758448268;
        Mon, 06 Oct 2025 06:47:28 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4e55a34b2c8sm115793521cf.1.2025.10.06.06.47.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 06:47:27 -0700 (PDT)
Date: Mon, 6 Oct 2025 09:47:25 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Shi Hao <i.shihao.999@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, shuah@kernel.org
Subject: Re: [PATCH v3] usb-storage: Protocol translation for scsi opcode
Message-ID: <db6b1fe6-4167-4d2f-85e5-4e160baffeed@rowland.harvard.edu>
References: <20251003104635.24998-1-i.shihao.999@gmail.com>
 <20251006123121.72461-1-i.shihao.999@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251006123121.72461-1-i.shihao.999@gmail.com>

On Mon, Oct 06, 2025 at 06:01:21PM +0530, Shi Hao wrote:
> Protocol translation for correct cmd_len for old legacy usb device
> subclasses  USB_SC_RBC,USB_SC_SCSI  and USB_SC_CYP_ATACB as per
> their scsi opcode.In the old code There was a 'FIXME' comment stating
> that there  was a  need to set up for a proper SCSI subclass
> protocol translation for those legacy usb subclasses .
> 
> Previous protocol translation is enough for modern usb subclasses
> but it is insufficient for old usb devices for which it had a
> 'FIXME' comment on it. Also it was  only padding to 6 or to 12 bytes
> leaving cmd_len value not properly set for those devices .
> 
> To avoid this  set proper SCSI  subclass protocol  translation based
> on their opcodes and determine correct cmd_len for proper command
> length translation as per their need .
> 
> Signed-off-by: Shi Hao <i.shihao.999@gmail.com>
> 
> ---
> 
> change v1:
> - update subjects for the commit
> - update commit  description
> - check checkpatch.pl script
> - update From:  and signed-off name
>  - wrap git commit changelog
> change v2:
> - check checkpatch.pl script
> - update verion history in the commit
> 
> ---
>  drivers/usb/storage/transport.c | 29 ++++++++++++++++++++++++-----
>  1 file changed, 24 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/usb/storage/transport.c b/drivers/usb/storage/transport.c
> index 1aa1bd26c81f..ed9f3b9292f3 100644
> --- a/drivers/usb/storage/transport.c
> +++ b/drivers/usb/storage/transport.c
> @@ -718,12 +718,31 @@ void usb_stor_invoke_transport(struct scsi_cmnd *srb, struct us_data *us)
>  
>  		scsi_eh_prep_cmnd(srb, &ses, NULL, 0, sense_size);
>  
> -		/* FIXME: we must do the protocol translation here */
> -		if (us->subclass == USB_SC_RBC || us->subclass == USB_SC_SCSI ||
> -				us->subclass == USB_SC_CYP_ATACB)
> -			srb->cmd_len = 6;
> -		else
> +		/* Protocol translation per scsi opcode group */
> +		switch (us->subclass) {
> +		case USB_SC_UFI:
> +		case USB_SC_8020:
> +		case USB_SC_8070:
> +		case USB_SC_QIC:

I think it's a bad idea to enumerate these subclasses here.  The 
original code only tests for RBC, SCSI, and ATACB; you should stick with 
that approach and replace the case labels above with "default:".

Or just keep the original "if" statement instead of using "switch" -- 
that would be even simpler.

>  			srb->cmd_len = 12;
> +			break;
> +		/* Determine cmd_len based on scsi opcode group */
> +		case USB_SC_RBC:
> +		case USB_SC_SCSI:
> +		case USB_SC_CYP_ATACB:
> +			if (srb->cmnd[0] <= 0x1F)
> +				srb->cmd_len = 6;
> +			else if (srb->cmnd[0] <= 0x7F)
> +				srb->cmd_len = 10;
> +			else if (srb->cmnd[0] <= 0x9F)
> +				srb->cmd_len = 16;
> +			else if (srb->cmnd[0] <= 0xBF)
> +				srb->cmd_len = 12;
> +			else if (srb->cmnd[0] <= 0xDF)
> +				srb->cmd_len = 16;
> +			else
> +
> +				break; }

srb->cmd_len needs to be set to _some_ reasonable value when cmnd[0] >= 
0xe0.  It looks like a line of code got left out and the "break" was 
indented too far.

Also, the placement of the closing '}' is wrong; it should be on 
a line of its own.

Alan Stern

>  
>  		/* issue the auto-sense command */
>  		scsi_set_resid(srb, 0);
> -- 
> 2.51.0
> 
> 

