Return-Path: <linux-usb+bounces-19639-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F036DA19622
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jan 2025 17:09:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 28B9A3A466F
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jan 2025 16:08:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46161214A97;
	Wed, 22 Jan 2025 16:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="vv8AC3XB"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A08214816
	for <linux-usb@vger.kernel.org>; Wed, 22 Jan 2025 16:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737562119; cv=none; b=UKG9lM7kaGpHwPQFd6E4fR7rEqCOsSvMVdNaVhbnshwaGDjKh5C2+31VPdt32hEaqaEwtD+sUsNw7Ln7SqaD5301w8sjPndZK3hf4a6UnLpCYva+3/Yo/RhqKw6Tn67ZGlgYLKfZy+wy5F3ex9q19K+pOyN4Dfm9waPKUNKVR14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737562119; c=relaxed/simple;
	bh=8ARDN42ccl9D0U4sMIaMe3NCZiNzaT/A03oNGvQX3CI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q4YssvLHp8aSGlC75fO6AvVQqJ9YdIx3uTtcTp+m0v8VbcKRjXWvrBsSY2jCDabEiI4uvV60IjITewo3aB1rdj0qazlw1zNwLwP7YkAX24vXedjV+opLqrsDtpLtX+OuuAKQHhbF+ARtO8RPElPMZ+5NGbmr7yIyYFl4L/E+4OA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=vv8AC3XB; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7b6e5c74cb7so575423385a.2
        for <linux-usb@vger.kernel.org>; Wed, 22 Jan 2025 08:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1737562116; x=1738166916; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JNjZd3VN5jtb/3hBZDREUAioJ5EhzwEQZzkAVM5i/Fs=;
        b=vv8AC3XByAKwK8vLhBmkxHKyhBXvuKv66DZD5sDNZUGk4fvYGwvLaIj69yUFuAZIts
         thml9yQ8vHUeQPUrUhXQ4am+83NOlNdSIxdTcjiS4WlpTJje4Sg++u5qtBncgk1Tu3NA
         v8Rvn7AEH7UWyScIQsiUixO/KkSwQqI+P7SfMyBN+D8JcKmOeeZGHkVP76V/CZs3W3vY
         9XI8ttxe1q4emKDbItokS1DEg6CrCDc+NcMw0a7wxAyq1BMcghatvWMlbuNZITEBdeFk
         GX2s2DzooCZIu8J5zA/ENMhH7hyexwfwZdG/mJ/saASKvy/lLnzu+/Fm79tUdLRNKt8k
         gH/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737562116; x=1738166916;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JNjZd3VN5jtb/3hBZDREUAioJ5EhzwEQZzkAVM5i/Fs=;
        b=RILDqI/GaC4jMb0Hih+HbDb5DnykC3tXgsedHF5upEnR9hPwiOwQzCeZsn5Z2vqhOS
         tWg4T28s7RXsx74GYGOfwpBtfzfbJoWLYd8qdO6f46Jv3WsMDk6t7h0fRuiKqF27ez1k
         MRUAiUmLUz0JMS5aknoisHfhjPRjg99xtSOqGVd9Awx8X8g6Dd4zDe4OP8HqCyxD0l+w
         QUbDQn77KvuUWcklygMOvSeAdPUMzNzRiGhZC4fcSKbREKdEMZUd1pihLgJoTmjdL25M
         28ZgRKz9rZwN+/OCuAd8R6ZwmL4+18vMZ9gEY1wHkVL6o4/7K9Da6uzV/dABVgBD10Si
         697g==
X-Forwarded-Encrypted: i=1; AJvYcCXw15ligHYmzDBpTs9gU0Vou3BzjD7dXoU/A8o8MsPCzCN1P3BmalWQjISAPILsV6BeIKe0TzPzifs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzU1N6ZYzTPhbRvjVhVJxB1E9dKLchceaAAtIKhUAfM72IKy1Aa
	kaBiBNPBLU7cZJiV4ISOLwFwByuowCNJQoCKEX2E8n09NvpX6ZRN2TjpXesRHQ==
X-Gm-Gg: ASbGncvJsHiHC0oXq9egUORC07vyxpORr+ftIrzk0IcfzjE91tPcSeRuIdChMulgYbk
	ZOr8zKKBPOxYHUpsRHvP1qrVJUytv2eS66GerW11nMkMmFSXcXqpj+8cQ94YWT3yxTyWnQjfqcb
	mPppk63sTgXHpF984fIgPvgu/r1925IWFcxPBD/txct07FCw3qf+BBRljwPXd1bGOGQLDqpp9MB
	IRl1Ki4/30KqDeGk5R9eqpKSHayNxNHGvu0pHwpixHBN84pgyoxMc1rEfpYNhmyorg1iLMFqd7v
	j/YFj4zRQwQD
X-Google-Smtp-Source: AGHT+IEHq7T+B36pH4TvWXSbVcPG+d22seuSliTIr9GWEmy2Oe4+UQ+HpRuzzBbfkrXxEaeT4jyJmg==
X-Received: by 2002:a05:620a:4513:b0:7b6:dd9c:fac1 with SMTP id af79cd13be357-7be63287ac7mr3956224085a.49.1737562115686;
        Wed, 22 Jan 2025 08:08:35 -0800 (PST)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46e104337cfsm65211781cf.74.2025.01.22.08.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 08:08:35 -0800 (PST)
Date: Wed, 22 Jan 2025 11:08:33 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Qasim Ijaz <qasdev00@gmail.com>
Cc: valentina.manea.m@gmail.com, shuah@kernel.org, i@zenithal.me,
	gregkh@linuxfoundation.org, sergei.shtylyov@gmail.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	syzbot <syzbot+83976e47ec1ef91e66f1@syzkaller.appspotmail.com>
Subject: Re: [PATCH v3] USB: usbip: fix null-ptr-deref in status_show_vhci()
Message-ID: <8f65d5d0-5142-400e-9486-34efe9a0ca47@rowland.harvard.edu>
References: <20250122125857.25157-1-qasdev00@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250122125857.25157-1-qasdev00@gmail.com>

On Wed, Jan 22, 2025 at 12:58:57PM +0000, Qasim Ijaz wrote:
> If usb_add_hcd() fails in vhci_hcd_probe() (i.e., a probe failure),
> the error path calls usb_remove_hcd() and also sets 
> pdev->dev.driver_data to NULL.
> 
> Consequently, any subsequent call to platform_get_drvdata(pdev) 
> (which returns pdev->dev.driver_data) may yield NULL, causing a 
> crash if that pointer is dereferenced.

If usb_add_hcd() fails during probe then it should not be possible to 
have any subsequent calls to platform_get_drvdata(pdev).

> Fix this by adding a sanity check to ensure "hcd" is non-NULL
> before proceeding with further operations.
> 
> Reported-by: syzbot <syzbot+83976e47ec1ef91e66f1@syzkaller.appspotmail.com>
> Closes: https://syzkaller.appspot.com/bug?extid=83976e47ec1ef91e66f1
> Tested-by: syzbot <syzbot+83976e47ec1ef91e66f1@syzkaller.appspotmail.com>
> Fixes: 03cd00d538a6 ("usbip: vhci-hcd: Set the vhci structure up to work")
> Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>
> ---
> v3:
> - Added this section to comply with patch format requirements
> - Removed the extra newline after `hcd = platform_get_drvdata(pdev);`
> 
>  drivers/usb/usbip/vhci_sysfs.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/usb/usbip/vhci_sysfs.c b/drivers/usb/usbip/vhci_sysfs.c
> index d5865460e82d..d4a1aa6d06b2 100644
> --- a/drivers/usb/usbip/vhci_sysfs.c
> +++ b/drivers/usb/usbip/vhci_sysfs.c
> @@ -76,6 +76,9 @@ static ssize_t status_show_vhci(int pdev_nr, char *out)
>  	}
>  
>  	hcd = platform_get_drvdata(pdev);
> +	if (!hcd)
> +		return 0;

In this case, for example, the status sysfs attribute file should never 
have been created in the first place if probing failed.

This seems more like a synchronization or logic error, not something to 
be solved with a simple check for a NULL pointer

Alan Stern

> +
>  	vhci_hcd = hcd_to_vhci_hcd(hcd);
>  	vhci = vhci_hcd->vhci;
>  
> -- 
> 2.39.5
> 
> 

