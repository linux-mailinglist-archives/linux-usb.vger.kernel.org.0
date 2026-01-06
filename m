Return-Path: <linux-usb+bounces-31960-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BB17ACF9833
	for <lists+linux-usb@lfdr.de>; Tue, 06 Jan 2026 18:01:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E2C93312EF52
	for <lists+linux-usb@lfdr.de>; Tue,  6 Jan 2026 16:54:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C36C8337680;
	Tue,  6 Jan 2026 16:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="bPflUsCs"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85930246BC6
	for <linux-usb@vger.kernel.org>; Tue,  6 Jan 2026 16:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767718406; cv=none; b=ir39f5f3He4PFJo7IT6n0gVjo/h7qqkmbLFntlrXYzIqTJFp/aI5YvykyUxkPuLZPsTu2SLJJD9G1gb3LR9B7KxmF3kzKwfC0kdMCsDOOs09eQYCWzqpW7K5FWflyv5VkR2KUVNL67szBDI4hQOUXWU3E0rWD+Fq4nCgrZLcaaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767718406; c=relaxed/simple;
	bh=XPNMe0grExdiOWkgUihKnUL2h1PhSrzxREhXLMYlovQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TFucFNipaIXWPyhMZWfsb8wv/8UZWT67rsPDskftZEjclrJ8nd2SfJ28Tzeo3L56QPOWHE9bsQsoXlb6p0xflcj2AEArfSXtZkC8Rj4CP3KCnKYZAw6vPa8h+FFNJR+q85srIjCIot6YzwBe8Z/bVADrhCedZg5qENMcml9/m0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=bPflUsCs; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4edb6e678ddso15364881cf.2
        for <linux-usb@vger.kernel.org>; Tue, 06 Jan 2026 08:53:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1767718403; x=1768323203; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SUIL9/lMGLnhlPnFT/AXOXdGRUs1Is7PNLSYdcBesMk=;
        b=bPflUsCsPhoBPDAy/y8TYVIHKejpFXOj2BiTHHrSxKsVXckpYXhe40W8ypRdZZqNGG
         kJySwlVbKnKkKYol+Ke2FgQ9uEhbGM7DJmsCD/D09Jj9+Zcf3oepb99D0PO+sxpZNitD
         faqUWp1b7/8fPjOuy2lDAVelQhQRT168+tCeNP/q/5lekIqHvDPwrDHp8vR14oo1sGWz
         eAMUfJc99fbYcOfpugdRr3NWegt4ze2vQ7YXnQQMfdJ7QXQX2RM9IVh1pIbGAT3KfF9S
         afw1UmOj5+fnC0g+/sPgHEJqu3FypQj458WQfmAl/WPTVEu/TNDTHoXWn1R52vXrQ8qh
         FucA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767718403; x=1768323203;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SUIL9/lMGLnhlPnFT/AXOXdGRUs1Is7PNLSYdcBesMk=;
        b=tXNr8caW8mQGHiYAnQOEzTqwLf8pUz5xTLfLEzkZxDxbWj222iTNaPUK9QJ6Xj6NKW
         IoaxEtu85XbtXsGl5/vAiTwzVbhG+T8mLYu3jxG1OHvPQQbF/HFcjgMvk3wteCJpZ1t/
         rjS+dJWzJ3UWAQm3xPSR9EsOzZGCX4AJENnkp1q+uNijZVwARl+j5hkd5/s3YLcISvBG
         KivynuVlSYJka1ZxsQ65YUQ4Zx/rgGqulvbAGAooKagFZGG4L1jUU7g+aQ6TAOkdb9W8
         YLkmXJJOSv/9A1UCbDSwxm90+p0tHFUM8owlioI4u2cs9KweDRD/c2+p2dZfPL7IWkUe
         beHw==
X-Forwarded-Encrypted: i=1; AJvYcCX2XV0NRfmxInkfBwEsS7YNB0KErzGNeKk/dgEMlp4CH4uh6IwG8QW6fkPWba+yGSnTA++crOdjpp8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfV9qAQIP5Yc9gsTrqQJBIR14q4mWHcBbYZFUL04RjuovPhXFH
	2rk/fvjjuI5iNJ62wzO9Achw+btSfhSL0d/BNZLCZLV+Oa2k/FxfpYU2iGX5WsgrvvwKAEmywwR
	KGC0=
X-Gm-Gg: AY/fxX6OeH+nrQvZEmx6CFnXDvLOfIUn8SgVKg1ms3ZDDUJuLg7J0BINhi8P0qqq6Zh
	C9a19w4ScYru+tYXUW36TARHz4Au1aGwMa7q5F08RKLGJb2RKuSxGLIxuUIx5hw/bKblSq+4pDN
	HXzzm21Uy06ZSMoAbgxP6DbsnOr/cUkUu4i0JOWiaJHEs0xTDfLCTBrGw/8RdzR2LZsrniIMEQi
	X5T7dQ8+qcEa1qn1pH5vqXcqVwLgsVAbSDbJgvuj95Gf5T6QGIxyHlW3t2SzBsxOb33FH16buld
	yrZrtdZVJlLAruSZrbHxE+K0hAEMdcNRQZjD+YJpjgrlbUy0f87hfcMPQxdozKDUhkvnktyvjIa
	8F0FDJd+Ci8UaDei36h9N29huhN7Gitqyk38E4/IK+ntR+cSxvjwPcOypSZ5YLueB59HVcF6jMA
	sl+8+7RCxmhR9g
X-Google-Smtp-Source: AGHT+IF9XTCm6sGGtVLstv83wlTOL2Tc3BkKeTvfk2JeqoSLgRM5yuUZmaD7H6zU8FmT/lTgQUgqow==
X-Received: by 2002:ac8:7d8f:0:b0:4ee:197a:e80a with SMTP id d75a77b69052e-4ffa7843387mr52196921cf.77.1767718403294;
        Tue, 06 Jan 2026 08:53:23 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::b72a])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8907724f06asm17387836d6.40.2026.01.06.08.53.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 08:53:22 -0800 (PST)
Date: Tue, 6 Jan 2026 11:53:19 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Udipto Goswami <udipto.goswami@oss.qualcomm.com>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org
Subject: Re: [RFC PATCH] usb: gadget: uvc: Prevent smmu fault in unstopped
 stream uvc teardown
Message-ID: <a9281a6c-0315-4657-b14c-ab68fc85fc40@rowland.harvard.edu>
References: <20260105050724.2041581-1-udipto.goswami@oss.qualcomm.com>
 <9101e538-022a-4802-8bec-891c14b221a9@rowland.harvard.edu>
 <CAMTwNXAECok2-4yO8sPtNgGE6u+qLALRSUnsbOfC7XfGKTJn0w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMTwNXAECok2-4yO8sPtNgGE6u+qLALRSUnsbOfC7XfGKTJn0w@mail.gmail.com>

On Tue, Jan 06, 2026 at 04:13:21PM +0530, Udipto Goswami wrote:
> On Mon, Jan 5, 2026 at 9:25 PM Alan Stern <stern@rowland.harvard.edu> wrote:
> >
> > On Mon, Jan 05, 2026 at 10:37:24AM +0530, Udipto Goswami wrote:
> > > When switching USB compositions while the camera is streaming, an SMMU
> > > fault can occur because dwc3_remove_requests() unmaps buffers via
> > > dwc3_gadget_giveback() while the controller hardware is still performing
> > > DMA operations on subsequent requests in the started_list.
> > >
> > > Fix this by adding a delay in uvc_video_complete() when handling the first
> > > -ESHUTDOWN event  (detected by checking !UVC_QUEUE_DISCONNECTED) to allow
> > > the controller to  complete in-flight DMA and drain its FIFO before
> > > dwc3_remove_requests()  proceeds to unmap remaining buffers,
> > > preventing the SMMU translation fault.
> >
> > Wouldn't it be better to wait for the in-flight URBs to complete, so
> > that you _know_ the controller is finished with them, instead of
> > delaying for some arbitrary and possibly too-short amount of time?
> >
> > Also, wouldn't it be better to avoid calling mdelay() while in interrupt
> > or atomic context?
> >
> > Alan Stern
> 
> Hi Alan,
> True, but i think we wouldn't know for ISOC eps whether the TRB got
> completed or not since CMDIOC isn't set for these,

Look, you know a lot more about what's going on here than I do.  
Describing the details to me won't help because I hardly understand 
anything about how these drivers work to begin with.  I'm just trying to 
prevent you from applying a bad fix.

Start by asking where the real problem begins.  Is the problem caused by 
the uvc driver skipping a step?  Or is there a bug in dwc3?  Either way, 
the problem should be cured at its source, not by adding some arbitrary 
delay later on.

> We also tried to address the same from the gadget.c dwc3_send_gadget_ep_cmd()
> Something like this:
> 
> - if (DWC3_DEPCMD_CMD(cmd) == DWC3_DEPCMD_ENDTRANSFER &&
> 
> -   !(cmd & DWC3_DEPCMD_CMDIOC))
> - mdelay(1);
> + if (DWC3_DEPCMD_CMD(cmd) == DWC3_DEPCMD_ENDTRANSFER &&
> +   !(cmd & DWC3_DEPCMD_CMDIOC)){
> +   if(usb_endpoint_xfer_isoc(desc))
> + mdelay(10);
> + else
> + mdelay(1);
> + }
> But this didn't help mitigate it.

Again, the details mean nothing to me.  But delays are always 
suspicious, especially when there's no indication of how the delay's 
length was chosen.

> mdelay is busy wait (without sleep) so I thought it should be fine,
> but yah if you see any risk with this I can try removing these.

It's okay in the sense that mdelay in interrupt or atomic context won't 
crash the kernel (whereas msleep() would), but it's still a bad idea 
unless it's totally unavoidable.  A delay causes the kernel to waste 
time when it could be busy doing something else -- not a good thing to 
do.  And if you really have no other choice, you should make sure that 
the delay is as short as possible -- say, no more than one or two 
milliseconds.  A 10-ms delay is pretty much unacceptable.

> Moreover our problem here is no one from the userspace or the upper
> layer called a streamoff which is why the requests are still in
> flight.

Then maybe the upper layer should be changed so that it does call 
streamoff?  While I'm not familiar with any of the details, it seems 
clear that an upper layer should tell a lower layer when it has finished 
using some resource that the lower layer provides.

> We do not see this issue if a disconnect had been performed while in
> flight, it seems there is a different approach which disconnect takes
> to handle this.

Probably a disconnect causes the transfer to be cancelled immediately 
rather than waiting around for it to finish by itself.

Alan Stern

