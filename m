Return-Path: <linux-usb+bounces-23918-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D603AB570C
	for <lists+linux-usb@lfdr.de>; Tue, 13 May 2025 16:26:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C890616AF2D
	for <lists+linux-usb@lfdr.de>; Tue, 13 May 2025 14:26:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2655A2BE100;
	Tue, 13 May 2025 14:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="EaOsQlFk"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E232BE0F7
	for <linux-usb@vger.kernel.org>; Tue, 13 May 2025 14:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747146356; cv=none; b=uTN3plGc4B0fRUFJO5FdQXNDoMD+Djbpi7NacLZczmzRjnjaYpUtfwNK+UqGWP1ekKqwnfFqHpP5n6beOznNLcd8I7pylfNGLfLeGjT5U65p7Bgwpk/gZiFyjp3jjQzBe9p3/ssSr8OzaGpcdvaniaFo+zVnDBvkJqX74tA+2Qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747146356; c=relaxed/simple;
	bh=HXRQwuROw8MKPijyfUq6N7s7cAR/L7i+mxofui1ruJo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BFGbTqotGjAb6vSe3PVW419V2XOhW+mSU614rwinmcK+EPZYQ8NVr+PbivZIfHjIzgQJmErQthdnV0mHcrTpZgj5ZBAXM8/SvKQPzU6ey3PRzDNraShcWB1jEu/vRC1Sxppjglf/dP46jIEjCHqWhSzLl8x2sGn1TI6n208ytbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=EaOsQlFk; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6f0ad74483fso64114106d6.1
        for <linux-usb@vger.kernel.org>; Tue, 13 May 2025 07:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1747146354; x=1747751154; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9cLoF/O57LNlYc+iwyGRZeR5b650X2MnqJnqGtm8eH8=;
        b=EaOsQlFk2VwkdoXjMn0xqOBGWmlTY2/V9bAQTXhT9e8m8fH70Ixgg6eC15T6afJx9+
         kOzs43BUV12otvR0zQ1Co3L8JwvWiu55aiJxZaId17fhgIEYZh5Mnox4Up6R6gz/Abr1
         TDHrrANG6JLOtm51/4115PM45o38TylIudb2jxlA2SSDgePsB7RtBCxC5EUbQs2zHtmW
         /guXxE+CpHIa+2F6GxK9RtbJ4zs+zsvo9YchHldC3pFCOW5+kCXYxeJgUqtAfvGucsJh
         DRS1G/AzzjrXR5QP3Mh8CzBISUG6+v2DagEQsANvsPl5Mua5vi6MJHLGofPX2ibj3B1b
         CRHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747146354; x=1747751154;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9cLoF/O57LNlYc+iwyGRZeR5b650X2MnqJnqGtm8eH8=;
        b=Ff7GdtcNFZcFUo3HF/HlMyY3Qn6eacNVMUfp8xi7KzXdkv1y+BM5HXubBZ3Bz2RUfi
         sWGTZQOi4qHfrKe/EYULI0a992e0gg6RGSiJ7NLvXi0RRX1qsEJu5bIeSCLbl6AIEZW1
         5fbqmPfilbCOB8BXzX4mcIGW1q89vzYtFf2E4wHYb0PYfxYK/y7X86Cg5Qih0A0iuxcw
         Rgxgw2Y4l7mA5dZc3KfnmQSNy48nN8F12xifg8ZhtmutB0wKS68d9UU+7TTpf5CkhAN6
         /8m5fbIoZeLwk+5TLBlk+2s2VHa+LEyw/soE+DwZ4LgTIQRMO5OGgLM/zaOqcxUVYErT
         TRnA==
X-Forwarded-Encrypted: i=1; AJvYcCUJnDOst3S8xMtyKCBNFJoWZussYyWfdyrPHk6/1qjnZ2uuzIwJNiiELxnco+8iZ8m5APM5oLjMFKI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/JM+gTy8ySkyveRkHae8dT97hzsbui2sIPiyDmS7aNJfVDa3t
	Dn3TIrMI3fjT7/Y6mtH+zC+nAEgMd6O+MwdrN7zT6w6Sf1OxalOfBr5rgQ4+Gw==
X-Gm-Gg: ASbGncuwREmDU3OzzCqlWue4yVMU4WCvL1SMro0fyImOpip0VBMMuenZ+B5CWbjGrqU
	Wn2jHlw8SirNTADz/93jHk7ZVSuCilFzFNU0m1zsoBOlrfCAHG2DkJTDryav1we0mzKvUyGiepf
	QRqjV3lU/7sXn/522z9tcmNef2s/EH4cy2yMRPMUDqNkRj9mHGxHiDUo4HvVnildz8U1bTRukXL
	oYbRoAxaRrLHYB28+6PsC1qU1wNtW+7oESZkXxUv3wvkhRiiI7BCK/IxmOc8v/DTOTFb7t9QAPA
	B8yTZmdauvqgmdw6arNyvyc5XDcp6ajNFT1rFfuHxY0AGuiuIpSA8uQ+csbhTmfXSRlSFg==
X-Google-Smtp-Source: AGHT+IHJfcnXh9oYA31injeuwlKCu3XfVe0Yr+B5+cVM0kreyrVuVJNaR+vnji5+fhQz+vprtI6mGg==
X-Received: by 2002:ad4:5aa5:0:b0:6f5:436:9e46 with SMTP id 6a1803df08f44-6f6e47c77eemr266308656d6.15.1747146353639;
        Tue, 13 May 2025 07:25:53 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f6e39f4d78sm67586836d6.40.2025.05.13.07.25.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 07:25:53 -0700 (PDT)
Date: Tue, 13 May 2025 10:25:50 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: David Wang <00107082@163.com>
Cc: mathias.nyman@intel.com, gregkh@linuxfoundation.org, oneukum@suse.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] USB: core: add a memory pool to urb for
 host-controller private data
Message-ID: <8c963ad0-a38f-4627-be11-80ccb669d006@rowland.harvard.edu>
References: <20250512150724.4560-1-00107082@163.com>
 <20250513113817.11962-1-00107082@163.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250513113817.11962-1-00107082@163.com>

On Tue, May 13, 2025 at 07:38:17PM +0800, David Wang wrote:
> ---
> Changes:
> 1. Use caller's mem_flags if a larger memory is needed.
> Thanks to Oliver Neukum <oneukum@suse.com>'s review.
> ---
> URB objects have long lifecycle, an urb can be reused between
> enqueue-dequeue loops; The private data needed by some host controller
> has very short lifecycle, the memory is alloced when enqueue, and
> released when dequeue. For example, on a system with xhci, several
> minutes of usage of webcam/keyboard/mouse have memory alloc counts:
>   drivers/usb/core/urb.c:75 [usbcore] func:usb_alloc_urb 661
>   drivers/usb/host/xhci.c:1555 [xhci_hcd] func:xhci_urb_enqueue 424863
> Memory allocation frequency for host-controller private data can reach
> ~1k/s and above.
> 
> High frequent allocations for host-controller private data can be
> avoided if urb take over the ownership of memory, the memory then shares
> the longer lifecycle with urb objects.
> 
> Add a mempool to urb for hcpriv usage, the mempool only holds one block
> of memory and grows when larger size is requested.
> 
> Signed-off-by: David Wang <00107082@163.com>

It should be possible to do what you want without touching the USB core 
code at all, changing only xhci-hcd.  That's what Mathias is suggesting.

Instead of having an URB keep ownership of its extra memory after it 
completes, xhci-hcd can put the memory area onto a free list.  Then 
memory areas on the free list can be reused with almost no overhead when 
URBs are enqueued later on.

This idea can become more elaborate if you maintain separate free lists 
for different devices, or even for different endpoints, or sort the free 
list by the size of the memory areas.  But the basic idea is always the 
same: Don't change usbcore (including struct urb), and make getting and 
releasing the extra memory areas have extremely low overhead.

Alan Stern

