Return-Path: <linux-usb+bounces-28165-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AADBB59C6C
	for <lists+linux-usb@lfdr.de>; Tue, 16 Sep 2025 17:48:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 203A11747EA
	for <lists+linux-usb@lfdr.de>; Tue, 16 Sep 2025 15:48:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EF6B2765CD;
	Tue, 16 Sep 2025 15:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="wiOGfKu6"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A1E3239573
	for <linux-usb@vger.kernel.org>; Tue, 16 Sep 2025 15:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758037683; cv=none; b=ZzcyHPQxj8/JKz5askIFx1Dd29XleYpwPADcDNW3ojGGAr7Md8xnGd+uPyUDOdRvRaZPVLGv+++BgyC0nB3YA2O8yi7TPyjIY47Uj2M4/hHvvk4w5y8LuBuy+t1bwhQuBewZsGThBUTseW+/dlZBSz6EQITDM34F67ECw4VVlLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758037683; c=relaxed/simple;
	bh=5vmeuOQep/axLIESm0gMGf7FNHR8sSOeAgD3FaJZAjI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TvRn99CEr2Ixnt3m7x3BT3lf8CQzc02szwXtQVmffMXrxF9yv7NOTLHPh919vka85/4Nbp0MTCoT3/klfe+DUWw8T8WeTSzoME7Y2kJCHx4nkO4mBdbbn3kp2tOFny7GRUdBpMwzh8moFdHNVF2d65jUfZaAm+Nj7mIOgyU8u94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=wiOGfKu6; arc=none smtp.client-ip=209.85.222.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f193.google.com with SMTP id af79cd13be357-8275237837fso341560385a.2
        for <linux-usb@vger.kernel.org>; Tue, 16 Sep 2025 08:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1758037681; x=1758642481; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SmRV7y5RVjtRRykDfJzsy6QTbLlkodoS8n+eLseT97c=;
        b=wiOGfKu6v1zDczasHwIQP03QsEZ1p8C2BqSVbPUn5+/B/UumfCz526uny3femMJlC9
         6GfVFNxGQH+k4KZxSCHY28amgRW7RKoTgHLdTssHsiHLjiR7movuLjAAhetQt8D+Yf1m
         eOjSFTQEdKVvZ0sE2X4FVWgMrFAuiuVxbIKyhPZSTCgi/c3A5snCGfcLq28rSOffjf4C
         8nU+6zxaR+Aw3w7/ZsgHEimt9KYhn1moJoJ3bhIRLH/k+srTPS5SrsiZ68rfViMehLdm
         xEMsmyxcHxrYXg8pGQRoJyuvNWHaa+cY0ZPcuj934vAzdmqwsHpO4/tYzqVN11BDoMq0
         yK6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758037681; x=1758642481;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SmRV7y5RVjtRRykDfJzsy6QTbLlkodoS8n+eLseT97c=;
        b=M0YBBlzg8QPiylK9uwsn2v3JU0Yv7Udw0HAESwAU8uWgfouAhKc4TaDTSz6qRSzthv
         GtVFrYVxIzZrlx5ZZgWuiF6nzW7d9zkkxziZ6DOUsBQZMfo6SdNSuqLraYXpFMwWq2wG
         qSY1c1f38Nkv6iLZlIrm6FgBQkxqPWC+2/hXBFG0cDgczJLYaGrKhP31uYaQAvXq2l4d
         SM/pEDMnTBJbFqUxj/n2KzHCo+huaGIpDyJUFqcur8Jt47dCa52yaaZIf1n/I1baobYf
         DZ6+WcB06eO1nVDJ6RhOfSYIQzLm5BfVCu7hbpFI2B+KerxBKI4VsSzqbXqlBez3MNsm
         fEUw==
X-Forwarded-Encrypted: i=1; AJvYcCWZ9BE3hd921Xim6kDC33zdSAOygnifEglGTIit0NekdtQadmI2eH47jT07tAfSgSQlsPQSGO1S+Lk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvPdriEvHIqC64fMoC2DecOt3DfUwAwdwPCSHkOTUtSXsP/5Hi
	jpBFbNgg3fJnTibb9mU2PBOesyZV67V4jdWmAUFPmae2yxR8dYDXaZf18HFHOnzVwQ==
X-Gm-Gg: ASbGncu1ciTE9CHB31Wp047+PtRmjcb+P07Ujx6uWaZrMCUwQgjY+Mbc1Bcy0qKOAh/
	Q85UgHHAfwefEOCE2X4QJR3AxiA4ZsmEmTjfhKjZMsARsSwG85X67QF4S8e1E2CINPsb8oMW33Z
	vplMn2ZvYARnjOBSo7w6DwIRVrTsdAMcpyEI4YhfPSKPKPXml+yC2fPFMyhRvP7pIOdyCGATAX6
	r1lvOEXsqtKxGyIDSk7ZBRFt/x0XudB57DVdir8sIoZj0YOpL1u6rCAg8tk2awx6KV7JaxvR4iG
	PUsGl5LA/3BZYoqEyogHpUp2l/C7/MJxZv94EJISLpOnwx7ABll0zQh60nnvJ4qktJ58/OWtoEU
	iE+CAp6uxpfuDWrT1wrog0Sj1
X-Google-Smtp-Source: AGHT+IHHEf/KxYrGaKTUWfkkpxyRuBCTOhkh8z8aYBa5H4Ru1Ukx3upLhzLd3vbVwE1UnR0C68KKrw==
X-Received: by 2002:a05:620a:4628:b0:80b:981:a0e4 with SMTP id af79cd13be357-8240084e283mr1902714085a.70.1758037681099;
        Tue, 16 Sep 2025 08:48:01 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::bb27])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-820ce19d151sm954058385a.50.2025.09.16.08.47.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 08:47:59 -0700 (PDT)
Date: Tue, 16 Sep 2025 11:47:56 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Lizhi Xu <lizhi.xu@windriver.com>,
	Valentina Manea <valentina.manea.m@gmail.com>,
	Shuah Khan <shuah@kernel.org>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	syzbot+205ef33a3b636b4181fb@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH V2] usbip: Fix locking bug in RT-enabled kernels
Message-ID: <61e796d2-0139-4459-a4e3-f27892384de2@rowland.harvard.edu>
References: <4f7805f7-805a-4678-8844-c38a97650dda@rowland.harvard.edu>
 <20250916014143.1439759-1-lizhi.xu@windriver.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250916014143.1439759-1-lizhi.xu@windriver.com>

On Tue, Sep 16, 2025 at 09:41:43AM +0800, Lizhi Xu wrote:
> Interrupts are disabled before entering usb_hcd_giveback_urb().
> A spinlock_t becomes a sleeping lock on PREEMPT_RT, so it cannot be
> acquired with disabled interrupts.
> 
> Save the interrupt status and restore it after usb_hcd_giveback_urb().
> 
> syz reported:
> BUG: sleeping function called from invalid context at kernel/locking/spinlock_rt.c:48
> Call Trace:
>  dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
>  rt_spin_lock+0xc7/0x2c0 kernel/locking/spinlock_rt.c:57
>  spin_lock include/linux/spinlock_rt.h:44 [inline]
>  mon_bus_complete drivers/usb/mon/mon_main.c:134 [inline]
>  mon_complete+0x5c/0x200 drivers/usb/mon/mon_main.c:147
>  usbmon_urb_complete include/linux/usb/hcd.h:738 [inline]
>  __usb_hcd_giveback_urb+0x254/0x5e0 drivers/usb/core/hcd.c:1647
>  vhci_urb_enqueue+0xb4f/0xe70 drivers/usb/usbip/vhci_hcd.c:818
> 
> Reported-by: syzbot+205ef33a3b636b4181fb@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=205ef33a3b636b4181fb
> Signed-off-by: Lizhi Xu <lizhi.xu@windriver.com>
> ---
> V1 -> V2: fix it in usbip
> 
>  drivers/usb/usbip/vhci_hcd.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/usbip/vhci_hcd.c b/drivers/usb/usbip/vhci_hcd.c
> index e70fba9f55d6..eb6de7e8ea7b 100644
> --- a/drivers/usb/usbip/vhci_hcd.c
> +++ b/drivers/usb/usbip/vhci_hcd.c
> @@ -809,15 +809,15 @@ static int vhci_urb_enqueue(struct usb_hcd *hcd, struct urb *urb, gfp_t mem_flag
>  no_need_xmit:
>  	usb_hcd_unlink_urb_from_ep(hcd, urb);
>  no_need_unlink:
> -	spin_unlock_irqrestore(&vhci->lock, flags);
>  	if (!ret) {
>  		/* usb_hcd_giveback_urb() should be called with
>  		 * irqs disabled
>  		 */
> -		local_irq_disable();
> +		spin_unlock(&vhci->lock);
>  		usb_hcd_giveback_urb(hcd, urb, urb->status);
> -		local_irq_enable();
> +		spin_lock(&vhci->lock);
>  	}
> +	spin_unlock_irqrestore(&vhci->lock, flags);
>  	return ret;
>  }

This looks right to me; it's the same pattern that the other host 
controller drivers use.  However, the final decision is up to the usbip 
maintainers.

Also, there are several other places in the usbip drivers where 
usb_hcd_giveback_urb() gets called; shouldn't they all be changed to 
follow this pattern?

Alan Stern

