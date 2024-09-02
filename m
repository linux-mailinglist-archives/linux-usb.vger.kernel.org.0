Return-Path: <linux-usb+bounces-14499-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A22968951
	for <lists+linux-usb@lfdr.de>; Mon,  2 Sep 2024 16:01:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4878D1F2268B
	for <lists+linux-usb@lfdr.de>; Mon,  2 Sep 2024 14:01:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5133D19E98B;
	Mon,  2 Sep 2024 14:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="gGZME4tD"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05DB413DDC3
	for <linux-usb@vger.kernel.org>; Mon,  2 Sep 2024 14:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725285660; cv=none; b=jTpXvCWiBibMOWGKg5zdiNXZLkfu2kEgwKnXmiZx6m5avxRwvvlaxab/J1kJySHjDpUsZGHgbkJQBkfbG7E9gKBlV6R7Cqf1YOr3K3IbUc7gTvAmpyQlInm2Z972MC/byILSXr57C4kr3ITVEjaKedCecXOrOr4oyhZZHxxnKk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725285660; c=relaxed/simple;
	bh=fNEoaT3kMGULEQ4aqXL/Sw0VeUP4dStFcedfO0K+6pE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j7iR/6E2JX5zgzwpfbrkuSH+vCHvmgG3lsrtZd/nWTkdri6YftlCFiDID6cOfs5MKUzwayvpgb2u4G1sONQjIIIbIpaIF2jf35cp1bGtUndS/CLUzeQyE2c4qWtoBMcpMAm8qV2ctLOTzQjAVxjHciLZfgQJlCytDvuuzlTXS3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=gGZME4tD; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=g.harvard.edu
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7093997dffdso1438942a34.2
        for <linux-usb@vger.kernel.org>; Mon, 02 Sep 2024 07:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1725285658; x=1725890458; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0roeCMsPCPCYSJ1TQMz2PHzVKmZewI8c9F9zOvS357s=;
        b=gGZME4tDpI+GKmeGUwUhAfklfIQweFRWCzDV3YUaW0FqypBFKUWd8TvOFMBGgehuFG
         XMrcyoK16/piOyW8kg5M2taf/yT16Bph8/mXH8M0JvVt6a4Ris6r0CfEQWADVMNxUoBt
         /RfrlZgoVr/9kR1R+qtnMuoEk4pzahIw6xU3x9THTVOptOVGhCu02aZHiAPUO2EZqtIb
         FIiZMv8cwrL4JNz30Hnp3TuCl0P1m8GnqDrKfB78ePoGwlGFIVWnu5F8TnKaP/DBSRL+
         L1on4g/ZJ0dIlUpPhzryAULqOsbHQhpcsdcUn3RBSDH9gQ/qq+nMheRQrUXsXdgqYBmv
         xKxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725285658; x=1725890458;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0roeCMsPCPCYSJ1TQMz2PHzVKmZewI8c9F9zOvS357s=;
        b=xSEc/FpTRfad4T8Sd98n7zjzVPoIBp/gceM+v7KE/Uq0wnTtWlJIKNDGpIbznbrfzR
         37UcZesKQEfBHax3Z6+Z5idavVXApqzkbNiqr58KRwvz0L9p5AUh7kDDjB3e1cqDGyWB
         fRPSypAccEKV/QYefjcROucRStaktSVjif7R3hwZf80gpSNz/ezwNS+a7LW392+9ru1v
         HaFp/9NNSylwLBJHeb0KNAEvPqHaPgRUZ53ucgrv3C96bzZOLEQax0cNuwHTn/Eznzer
         Ov+Ul3XuYbPVL571xuJ7Wo6UIgF0rBvyJoTjXPvj4zKGlv7Evc70jIXGOJqNHCRg2GPB
         wBHA==
X-Forwarded-Encrypted: i=1; AJvYcCW8vd5rGHjd7/MEEcHW2HKo31XSxiEDNCpHTOMszIzVZnvyFPjHECLd7bHYZvjU+0s9l6yC/2VJK+o=@vger.kernel.org
X-Gm-Message-State: AOJu0YxS/4pG2/U8IUEwIAWRPe1CeGbWTmr/S55Sob37oB+zrGuvRIwn
	0QTJbICJypWgrRtiNGt/W+q0cP/N39ZR5YT9hhG5NIQYu7OXnxYGsFS3mlmxqg==
X-Google-Smtp-Source: AGHT+IHH4bMbRP7AuAhZvDabUmP/TvrCiTKREZ0fRR1Xcl3YqR1l7TOQByXezfftW9T5KuEJPUbRhQ==
X-Received: by 2002:a05:6358:6f01:b0:1b5:fb5e:f2d9 with SMTP id e5c5f4694b2df-1b7e37f1299mr1310290655d.16.1725285657770;
        Mon, 02 Sep 2024 07:00:57 -0700 (PDT)
Received: from rowland.harvard.edu (wrls-249-137-9.wrls-client.fas.harvard.edu. [140.247.12.9])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a806c241bfsm424377685a.28.2024.09.02.07.00.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 07:00:57 -0700 (PDT)
Date: Mon, 2 Sep 2024 10:00:55 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Hongbo Li <lihongbo22@huawei.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH -next] usb: f_mass_storage: Make use of the helper macro
 kthread_run()
Message-ID: <b53f6b87-9e3a-4117-b668-6121a65d84a8@rowland.harvard.edu>
References: <20240902133024.3089400-1-lihongbo22@huawei.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240902133024.3089400-1-lihongbo22@huawei.com>

On Mon, Sep 02, 2024 at 09:30:24PM +0800, Hongbo Li wrote:
> Repalce kthread_create/wake_up_process() with kthread_run()
> to simplify the code.
> 
> Signed-off-by: Hongbo Li <lihongbo22@huawei.com>
> ---

Acked-by: Alan Stern <stern@rowland.harvard.edu>

>  drivers/usb/gadget/function/f_mass_storage.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/f_mass_storage.c b/drivers/usb/gadget/function/f_mass_storage.c
> index cfd712fd7452..e11d8c0edf06 100644
> --- a/drivers/usb/gadget/function/f_mass_storage.c
> +++ b/drivers/usb/gadget/function/f_mass_storage.c
> @@ -3050,7 +3050,7 @@ static int fsg_bind(struct usb_configuration *c, struct usb_function *f)
>  	if (!common->thread_task) {
>  		common->state = FSG_STATE_NORMAL;
>  		common->thread_task =
> -			kthread_create(fsg_main_thread, common, "file-storage");
> +			kthread_run(fsg_main_thread, common, "file-storage");
>  		if (IS_ERR(common->thread_task)) {
>  			ret = PTR_ERR(common->thread_task);
>  			common->thread_task = NULL;
> @@ -3059,7 +3059,6 @@ static int fsg_bind(struct usb_configuration *c, struct usb_function *f)
>  		}
>  		DBG(common, "I/O thread pid: %d\n",
>  		    task_pid_nr(common->thread_task));
> -		wake_up_process(common->thread_task);
>  	}
>  
>  	fsg->gadget = gadget;
> -- 
> 2.34.1
> 
> 

