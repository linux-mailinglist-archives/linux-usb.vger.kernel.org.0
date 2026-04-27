Return-Path: <linux-usb+bounces-36543-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UF7pFyNx72n6BQEAu9opvQ
	(envelope-from <linux-usb+bounces-36543-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 16:22:27 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B34D047440B
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 16:22:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9F99030179C0
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 14:19:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEF4E3D34B2;
	Mon, 27 Apr 2026 14:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="uAALyfzY"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29893192D8A
	for <linux-usb@vger.kernel.org>; Mon, 27 Apr 2026 14:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777299555; cv=none; b=G7WNkuRygvLKajjiYBoLi6elVUzOgr/cZsa5AORWd43j0gKnNNFuKjpUfXZM1f8idihiOr3eUpkujWomqPveMXcgcaM1g7qaasaAj6QK9QvTmo7ioq7o0mahHJHOWn0tFrHZRnnF6HdwDw0tz1nxIm6SEwiTEASYIw2FZ8rIpr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777299555; c=relaxed/simple;
	bh=xUiOTJo3FEgtPBYHEotQix1zIYNtFdt7dW6QDyu9s3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JW9Dxk9Jn7IQd/8WQEw0h4SACnlwn1l+SS97QeRF/ropPH0MelH2IvvV4Xnuf4mKL6sG9nJXmBAhXPjERj4mMm1pM0Wll0I7jpNA1N47ECOlcxWHQNQ43dddCzzWN07yh1w8HKpe/1O6aty9H/kvIixs+OZUDN8DWELlH1H+wV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=uAALyfzY; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-8b1f2b7f1bcso86449316d6.1
        for <linux-usb@vger.kernel.org>; Mon, 27 Apr 2026 07:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1777299553; x=1777904353; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TuVlfvU2cHqE/g27rGq3IT6bxhIGMtW+AkOFkZmKPt8=;
        b=uAALyfzYlDniWU5L0rUwK3Xkk7HQWXNxFkGod9p+4vVNOVi2kL/cLyEjXdTtEJZ+C2
         hHWJwRJJPEIKWO/qMGdHPow2bkfRQhzP0ueh4RZq0cxRDl+pBKUIrawcbqVf0sEBtcDp
         Ofk796YQiJQqRuGAOf/QFRwVULYDbcfko6H/zPBylDJuFnGHIklbISF5Tcpr7xTjRLB3
         8p3FGVpBm/M/YxpAWkHhgul1ptvo53caXaLxLY0uVLRhedj88Yfg9RmaVkXU2sz9FH+M
         mATdJAg3ggON0L2XFLZbhpCd+x5/mJ3ZrhBSbK0YkgZTfqLBMXTM4e2nWHY5RM3oux+o
         sTEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777299553; x=1777904353;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TuVlfvU2cHqE/g27rGq3IT6bxhIGMtW+AkOFkZmKPt8=;
        b=d7hqMog6+/pprNlvtTmsH8ttwpKyzeoXDWdQ2T7gqziuy1pw/U8OK70rMLjvzjEZC3
         tOgzt5pLHeU7cGMt90vmd3PFxuIXWMPhEbOh+QR+pczNDecWZS74r+AQe1stgl8AcW7x
         VaXXtWFvOLbu6kwPHJ89MVXtJ0H2r8vTvaAyK9IqlDW8wzyDxHjgT2rWs88Dv7/TOuxn
         qG1nuN6R4KIHed1+j0/CTb/MP0Karw9DvNSDL+eerXgkd30x4lPqMzBQQKkXqFBRCPQW
         Fc/XZRrmGL0g4bGKzeHRSISZUsv1vm3RXduUSTscs7NQplh0BwjhTd1RYZkvP4h8we/o
         /oxg==
X-Forwarded-Encrypted: i=1; AFNElJ/2i6fvxcnHU/0qnWxE9RSZswS3Oi2mgk4kWn1hUGHx8oo+4YSrV6BOAlyPNJZKDvhOX2NOKYKF7W0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRzTuI/WnsP59kARRxNS0RyZzV7fIpADPHqr41RYFfW7g9MAHY
	CQU9FVqMknUvqjie5ODw1kKgCZw+axxkIBbi+sHCVEz3bL9j5XeeB5nOttLoswJhlg==
X-Gm-Gg: AeBDies3kfyeepB3c65Sa4K7NKSBusGV9ISI4xj/Isn7XsjyC0PLTaFRtFYaGa54aBt
	NAZozMOESZYPS/iX4DnqLTZWNkFbbuh+liHJFCpCKOuZYfV/5DCJM+TJy0eT7Mb6Jq7UnHb7o+b
	DneIL+p44M5j+0fsj5VeTB0Gccr8Dxe83Si/JDUV/Y9TGFU/88E5UmCi3319JA3U4h59h0Tlho7
	w6UNM0XlpzgMO3l86XSWnkGSYiTIojtbdgnA7Vri5imJu4062sXwIASYJKwHLXw30+qwrLHF+zr
	+RSO7puPXE1uEvKEf8f8QpFg2N0hcnGPBzjI5alZvgBsvWGoOIAQFfkc0rz2h2/hZx7jTiogxvK
	nRG4zeZxoZGZ5jF9d2kC6T1L9pfuDb8XPPdUrYhaqxINAVMq78diQMsR36fKAVcSk40U2nJB1gg
	x+vzbHsx8q9x3+0vuTn0jyuI4IVtdFGGHYUpbXIeoa3mXP0mwVdz2Y
X-Received: by 2002:a05:6214:ac2:b0:8ac:ac91:f421 with SMTP id 6a1803df08f44-8b0282f13c2mr587234016d6.1.1777299552916;
        Mon, 27 Apr 2026 07:19:12 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b205cc0353sm177660296d6.10.2026.04.27.07.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 07:19:12 -0700 (PDT)
Date: Mon, 27 Apr 2026 10:19:10 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Oliver Neukum <oneukum@suse.com>
Cc: syzbot <syzbot+2afd7e71155c7e241560@syzkaller.appspotmail.com>,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [usb?] memory leak in hub_event (4)
Message-ID: <bb39abcf-aefd-42f6-b9e3-e576dbb5fc37@rowland.harvard.edu>
References: <69ec231a.a00a0220.7773.000c.GAE@google.com>
 <9fea44a5-83de-41ed-9531-11e5d471dca4@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9fea44a5-83de-41ed-9531-11e5d471dca4@suse.com>
X-Rspamd-Queue-Id: B34D047440B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36543-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,appspotmail.com:email,rowland.harvard.edu:dkim,rowland.harvard.edu:mid];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,2afd7e71155c7e241560];
	SUBJECT_HAS_QUESTION(0.00)[]

On Mon, Apr 27, 2026 at 01:40:02PM +0200, Oliver Neukum wrote:
> On 25.04.26 04:12, syzbot wrote:
> 
> #syz test: git://repo/address.git dd6c438c3e64

> From 001175f4d2e1c2ceac98b4af2521fc4d0253d0c8 Mon Sep 17 00:00:00 2001
> From: Oliver Neukum <oneukum@suse.com>
> Date: Mon, 27 Apr 2026 13:35:38 +0200
> Subject: [PATCH] usb: core: fix memory of error case in usb_get_configuration
> 
> Prior allocations need to be reversed if subsequent
> allocations fail.
> 
> Fixes: dd2057e544dc9 ("USB: core: drop OOM message")
> Signed-off-by: Oliver Neukum <oneukum@suse.com>
> Reported-by: syzbot+2afd7e71155c7e241560@syzkaller.appspotmail.com
> ---
>  drivers/usb/core/config.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/core/config.c b/drivers/usb/core/config.c
> index 417140b012bb..67475ff81641 100644
> --- a/drivers/usb/core/config.c
> +++ b/drivers/usb/core/config.c
> @@ -944,11 +944,11 @@ int usb_get_configuration(struct usb_device *dev)
>  	length = ncfg * sizeof(char *);
>  	dev->rawdescriptors = kzalloc(length, GFP_KERNEL);
>  	if (!dev->rawdescriptors)
> -		return -ENOMEM;
> +		goto bailout2;
>  
>  	desc = kmalloc(USB_DT_CONFIG_SIZE, GFP_KERNEL);
>  	if (!desc)
> -		return -ENOMEM;
> +		goto bailout;
>  
>  	for (cfgno = 0; cfgno < ncfg; cfgno++) {
>  		/* We grab just the first descriptor so we know how long
> @@ -1012,6 +1012,15 @@ int usb_get_configuration(struct usb_device *dev)
>  	dev->descriptor.bNumConfigurations = cfgno;
>  
>  	return result;
> +
> +bailout:
> +	kfree(dev->rawdescriptors);
> +	dev->rawdescriptors = NULL;
> +bailout2:
> +	kfree(dev->config);
> +	dev->config = NULL;
> +
> +	return -ENOMEM;
>  }

This is not needed.  dev->rawdescriptors and dev->config are deallocated 
in usb_destroy_configuration(), which gets called when the usb_device 
structure is released.

The memory leak must have a different cause.

Alan Stern

