Return-Path: <linux-usb+bounces-14793-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D846B96F6AB
	for <lists+linux-usb@lfdr.de>; Fri,  6 Sep 2024 16:28:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8DBA01F25A98
	for <lists+linux-usb@lfdr.de>; Fri,  6 Sep 2024 14:28:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 910DB1D0940;
	Fri,  6 Sep 2024 14:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="j8ac36Eb"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB9E1D048B
	for <linux-usb@vger.kernel.org>; Fri,  6 Sep 2024 14:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725632897; cv=none; b=GP6CJeazvQTChG/SaQUh5q5x/w/tXvuO8Gk88KQOpVu7GrCcqC1kKnKOY1j/0m7IRR5VArpg/YewgGX9cSmbhCHXD6KxSEqYC24BMt0JGI4ZwLq05igeoSjLVLQriFPLx6N/wGJQRRDcqXs8/DJ5wznhFmdOt8F2p3bK+nPBFz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725632897; c=relaxed/simple;
	bh=OMkJ8MDyk2DS5zAFJI6QLOdm/mfILbRwKQikdM8A9GI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qKFf65GhTAMSo0ddWcVK16DsTuVCSePy6/ugIHTaqOp20jbzkd+Lrx3AzUzSlzbZa2jpR83k4wnHIbE0yhnj1JsBHRbX4OUY+D1j08Rksf+Nz/Ld2qASOftE+ujSl5zwHQRRtY4MANh5zcy/7eHRaXBsX/X76NdGUFzCybCrZnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=j8ac36Eb; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6c35618056aso9452636d6.1
        for <linux-usb@vger.kernel.org>; Fri, 06 Sep 2024 07:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1725632894; x=1726237694; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fd8vrf+CGhXnOKcGX7cHb7W2deBIxR1gYTsL+B2njdY=;
        b=j8ac36EbcoXPAmlNAyle/e+tasjz0XFzIduUwEVaUbXFW1ErbXzhJRdnOSUgBfZvCg
         7jaSByCfcsqXWfjU624xCeXkNQxFacfdrVu1ntAgLutozEm2Ivls/H+5WmtJQxf2YlyV
         rAbSPIeqzcG22OpCo+3IfR7vbxbJhOR2iYYTOlYYCNjhe9Af3hYqn2JSfeQJNpMlMORV
         tQN+V9Uhr4AQoo5ENZe2GF9GQoQJSlyJ6N5NnsrBsbL78ZPLl2h1h8SoPp7tB2HglUY/
         QfJPcpyR4/jg0JkoWxxFik6jckAna3hhfefDk9+/FT9W4TFWBO/Op9eeqUUEaVe9sYme
         Rf9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725632894; x=1726237694;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fd8vrf+CGhXnOKcGX7cHb7W2deBIxR1gYTsL+B2njdY=;
        b=VtI7/BvH8DauTTYy3AaFGBGU7WMMr9lbweia4oYovoT6HVwydAMBlfrXCKweQKoCf7
         AHWV3xeC1F+ePQO2I+OYLOd2JD1phnavsZa5b29QL+w6iObyrmPBbiki1fcYdr49sYoo
         vhxbJqCABBVL7nfZRBgcnlMvpXGK4qwNuIjWrBmQnoBfX/7mXINJmC79Ai0JrxkGFwvz
         1lkkQMBF3F7m4Zvpk7KPYMGZnoGKY7gm+upWkLmpWYDbLQDCC/DVSIDZvqxsGIqQxhrW
         Bx+7LYYsQYtp4JZ557YfnMpIdcef6S2V5NSlCq68MN0YGeLlq97u0eW4omdIT+Q/ie7X
         ISBw==
X-Forwarded-Encrypted: i=1; AJvYcCVPV4FEQNfgutyYWyGaFW+bIXSijqqtM22pISHVNHPoaWHXCuOyec/TeXrYEfXSE9cb8CRvR/yr+Zk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3kpvyElGcajz9+7sVmE60OJO6sNx1vh3j8DXGy/gmTv+bfwIQ
	a6zHL7CvkxMO9JqS/e47cgp7MT41jm/h/dnJERga4w3KDN+N587FN2JVs/iX7Q==
X-Google-Smtp-Source: AGHT+IFLOJ30BAbDPove6N2EQT5RiwKHTKYOy61jJwIp8x9PszQWTHAxXwkSBghebLq7ownX01rKrw==
X-Received: by 2002:a05:6214:4293:b0:6c5:111e:8ff7 with SMTP id 6a1803df08f44-6c5283f60c9mr32121726d6.2.1725632894460;
        Fri, 06 Sep 2024 07:28:14 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::24a8])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6c5201dee9bsm17064496d6.5.2024.09.06.07.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2024 07:28:14 -0700 (PDT)
Date: Fri, 6 Sep 2024 10:28:11 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Edward Adam Davis <eadavis@qq.com>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	syzbot+9d34f80f841e948c3fdb@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH V2] USB: usbtmc: prevent kernel-usb-infoleak
Message-ID: <25d5853a-7156-4892-a383-4547e9c95472@rowland.harvard.edu>
References: <tencent_E8A0E926ED22CE20783A6EC02FC56C18950A@qq.com>
 <tencent_5E4FB78DACA5F90D97926A5DBE5D96993007@qq.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_5E4FB78DACA5F90D97926A5DBE5D96993007@qq.com>

On Fri, Sep 06, 2024 at 10:11:03PM +0800, Edward Adam Davis wrote:
> The syzbot reported a kernel-usb-infoleak in usbtmc_write.
> 
> The expression "aligned = (transfersize + (USBTMC_HEADER_SIZE + 3)) & ~3;"
> in usbtmcw_write() follows the following pattern:
> 
> aligned = (1 + 12 + 3) & ~3 = 16   // 3 bytes have not been initialized
> aligned = (2 + 12 + 3) & ~3 = 16   // 2 bytes have not been initialized
> aligned = (3 + 12 + 3) & ~3 = 16   // 1 byte has not been initialized
> aligned = (4 + 12 + 3) & ~3 = 16   // All bytes have been initialized
> aligned = (5 + 12 + 3) & ~3 = 20   // 3 bytes have not been initialized
> aligned = (6 + 12 + 3) & ~3 = 20   // 2 bytes have not been initialized
> aligned = (7 + 12 + 3) & ~3 = 20   // 1 byte has not been initialized
> aligned = (8 + 12 + 3) & ~3 = 20   // All bytes have been initialized
> aligned = (9 + 12 + 3) & ~3 = 24
> ...

What is the purpose of aligned?  Why doesn't the driver simply use
USBTMC_HEADER_SIZE + transfersize instead of rounding it up to a 
multiple of 4?

> Note: #define USBTMC_HEADER_SIZE      12
> 
> This results in the buffer[USBTMC_SEAD_SIZE+transfersize] and its
> subsequent memory not being initialized.
> 
> The condition aligned < buflen is used to avoid out of bounds access to
> the buffer[USBTMC_HEADER_SIZE + transfersize] when "transfersize = 
> buflen - USBTMC_HEADER_SIZE".
> 
> Fixes: 4ddc645f40e9 ("usb: usbtmc: Add ioctl for vendor specific write")
> Reported-and-tested-by: syzbot+9d34f80f841e948c3fdb@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=9d34f80f841e948c3fdb
> Signed-off-by: Edward Adam Davis <eadavis@qq.com>
> ---
>  drivers/usb/class/usbtmc.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/usb/class/usbtmc.c b/drivers/usb/class/usbtmc.c
> index 6bd9fe565385..faf8c5508997 100644
> --- a/drivers/usb/class/usbtmc.c
> +++ b/drivers/usb/class/usbtmc.c
> @@ -1591,6 +1591,10 @@ static ssize_t usbtmc_write(struct file *filp, const char __user *buf,
>  		goto exit;
>  	}
>  
> +	if (aligned < buflen && (transfersize % 4))

Shouldn't this be

	if (USBTMC_HEADER_SIZE + transfersize < aligned)

?

Alan Stern

> +		memset(&buffer[USBTMC_HEADER_SIZE + transfersize], 0,
> +			aligned - USBTMC_HEADER_SIZE - transfersize);
> +
>  	dev_dbg(&data->intf->dev, "%s(size:%u align:%u)\n", __func__,
>  		(unsigned int)transfersize, (unsigned int)aligned);
>  
> -- 
> 2.43.0

