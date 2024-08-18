Return-Path: <linux-usb+bounces-13580-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA60955E7F
	for <lists+linux-usb@lfdr.de>; Sun, 18 Aug 2024 20:21:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 82A7AB20D61
	for <lists+linux-usb@lfdr.de>; Sun, 18 Aug 2024 18:21:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F5971509B3;
	Sun, 18 Aug 2024 18:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="CXi21t3a"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABFFE38DE4
	for <linux-usb@vger.kernel.org>; Sun, 18 Aug 2024 18:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724005252; cv=none; b=R5AIQKFZnfqb1KuKjjmki6BYSkuCU5f0RUTW67nc4aeMXMP2Y6gmhtNlSwBzNNa6OogqaI2KqmSoisnKQ0ojBdV7YGQ2rzLGNc55ce+E0gAAJpb6Q26XY6EGD3J3zz4zI3RkD+uqYcNAIJbRIzYLWrlxb/g269/1m97vNRQl3Wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724005252; c=relaxed/simple;
	bh=Pvjl3WgVUuDqfZ1Uvu7ysrrEkJnBzMyGdX+Q6ICQrVE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ReSoI2fjIniitV2IJiIItSNtolQlCm7Lax10QQwbRT9+sZXiRQeCGmg9qn7JFSL89QldUxY59ycnJNjHDARSripKbv7qSVmh8iylLRp7Q0f61lp9+gQQutWZ9neF4/LK1JgkKdkdb0YyIuvvjlDGRECpl0rbqzhL8gvneN58ofI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=CXi21t3a; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=g.harvard.edu
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e117059666eso3268349276.3
        for <linux-usb@vger.kernel.org>; Sun, 18 Aug 2024 11:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1724005247; x=1724610047; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jox7T9NtUsylEjcIyLm3wfHI0IexZSdvTQ1czCVm42w=;
        b=CXi21t3ayWNRUHKd+dwn9uJMkw4ZfV9IfXs7tmO1gPAT02985C8HhZGFjcz37Jo52E
         h+5KH98fwRQ1wDT+/sg3T87mDemIFGlsSnmz8bUz2ifjl6WXd9l25T2XVf6XrvpR2GuC
         f6kGgJVZ9pxnxmtBff6yrAn4kg5zO83nur/FyEN2nlnK+LB5dC86JYKPmpqXrg1SZBzx
         FZeLgu3sEBnJpGreqngoXIEmQtAKTznHt0TSe4hEZRn+F/O/gNW71vGNTr7HlvvDstDD
         /zrbZE9lscqJFrukk5F7I8kVW02hD11GKk5CSB3D3vk4GXtI4/KeRt61bPSSGdtMIib7
         f7BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724005247; x=1724610047;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jox7T9NtUsylEjcIyLm3wfHI0IexZSdvTQ1czCVm42w=;
        b=TVPOQQ7I1bbevcAIRNtChrySU30s0MvnrhM/xsDG/Jpw8wdv13ygMYqVeOwbsEo9Bz
         beXEiWf+cLadzSALT9SKFcBKXoIi7wwDzs195CsBPOaU/Cbr4wCQc22J1I/Il1aBed6G
         eV7qzKuPOErVx0z0H8YVT7/zQySOS6BSFv2wZrbxY5nkQGZuTAa+HJs4pOSdcYT8Ao7a
         +LnBfNrv5ZwnNuShFRt/8sA3TibSOQ3VSlSBpxyCFQYtF74X8ZVq+6TVL/L1gKsv7ZoQ
         QvNvoS1kwA33TamGQnYiLwyFe2RfnL+4h1VNM2kepAiq5CYGj2963ymXN1KPxwocl5c4
         V8Pw==
X-Forwarded-Encrypted: i=1; AJvYcCXACQwr4tKWuGaq0QQt3VGAQtr6ABd+YU4gM4adw5U24DflvyAvEx00eCgvxpCsndcmoaocUNiCd7pK1iaPZI8dOfq3UDR4PwaL
X-Gm-Message-State: AOJu0Yx4IHR8vgdEwGB3IHNarShj1e4seDT8vKS9npH+2r6Ez8um84i/
	vHq3yGcJM9Kqd/u2D10s/TvyEm0YTyFzzRHbJKYxH5k1Ba9gll+iIasahNlOoQ==
X-Google-Smtp-Source: AGHT+IFKGExb+ktmdEFnBMw0bmj29Mz0VltYqAunJK7XBt+i5y65MaxwS5GQ33CZbB2/HQmZB2ZlYw==
X-Received: by 2002:a05:690c:60c5:b0:61b:3304:b702 with SMTP id 00721157ae682-6b1b73a894amr97678307b3.5.1724005247611;
        Sun, 18 Aug 2024 11:20:47 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::3ed1])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a4ff0dcac4sm368196885a.84.2024.08.18.11.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Aug 2024 11:20:47 -0700 (PDT)
Date: Sun, 18 Aug 2024 14:20:44 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	syzbot <syzbot+85e3ddbf0ddbfbc85f1e@syzkaller.appspotmail.com>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] media/usb/siano: Fix endpoint type checking in smsusb
Message-ID: <1959a4fb-8bf2-456b-83b8-ea28d517debf@rowland.harvard.edu>
References: <4442a354-87f1-4f7c-a2b0-96fbb29191d1@rowland.harvard.edu>
 <0000000000009f6f85061e684e92@google.com>
 <51b854da-f031-4a25-a19f-dac442d7bee2@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <51b854da-f031-4a25-a19f-dac442d7bee2@rowland.harvard.edu>

Greg and Mauro:

Was this patch ever applied?  It doesn't appear in the current -rc 
kernel.  Was there some confusion about which tree it should be merged 
through?

Here's a link to the original submission:

https://lore.kernel.org/all/51b854da-f031-4a25-a19f-dac442d7bee2@rowland.harvard.edu/

Alan Stern

On Wed, Jul 31, 2024 at 01:29:54PM -0400, Alan Stern wrote:
> The syzbot fuzzer reports that the smsusb driver doesn't check whether
> the endpoints it uses are actually Bulk:
> 
> smsusb:smsusb_probe: board id=15, interface number 6
> smsusb:siano_media_device_register: media controller created
> ------------[ cut here ]------------
> usb 1-1: BOGUS urb xfer, pipe 3 != type 1
> WARNING: CPU: 0 PID: 42 at drivers/usb/core/urb.c:503 usb_submit_urb+0xe4b/0x1730 drivers/usb/core/urb.c:503
> ...
> Call Trace:
>  <TASK>
>  smsusb_submit_urb+0x288/0x410 drivers/media/usb/siano/smsusb.c:173
>  smsusb_start_streaming drivers/media/usb/siano/smsusb.c:197 [inline]
>  smsusb_init_device+0x856/0xe10 drivers/media/usb/siano/smsusb.c:477
>  smsusb_probe+0x5e2/0x10b0 drivers/media/usb/siano/smsusb.c:575
> 
> The problem can be fixed by checking the endpoints' types along with
> their directions.
> 
> Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
> Reported-by: syzbot+85e3ddbf0ddbfbc85f1e@syzkaller.appspotmail.com
> Tested-by: syzbot+85e3ddbf0ddbfbc85f1e@syzkaller.appspotmail.com
> Closes: https://lore.kernel.org/linux-usb/000000000000e45551061e558c37@google.com/
> Fixes: 31e0456de5be ("media: usb: siano: Fix general protection fault in smsusb")
> Cc: <stable@vger.kernel.org>
> 
> ---
> 
>  drivers/media/usb/siano/smsusb.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> Index: usb-devel/drivers/media/usb/siano/smsusb.c
> ===================================================================
> --- usb-devel.orig/drivers/media/usb/siano/smsusb.c
> +++ usb-devel/drivers/media/usb/siano/smsusb.c
> @@ -410,10 +410,10 @@ static int smsusb_init_device(struct usb
>  		struct usb_endpoint_descriptor *desc =
>  				&intf->cur_altsetting->endpoint[i].desc;
>  
> -		if (desc->bEndpointAddress & USB_DIR_IN) {
> +		if (usb_endpoint_is_bulk_in(desc)) {
>  			dev->in_ep = desc->bEndpointAddress;
>  			align = usb_endpoint_maxp(desc) - sizeof(struct sms_msg_hdr);
> -		} else {
> +		} else if (usb_endpoint_is_bulk_out(desc)) {
>  			dev->out_ep = desc->bEndpointAddress;
>  		}
>  	}

