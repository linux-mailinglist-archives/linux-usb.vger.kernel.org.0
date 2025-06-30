Return-Path: <linux-usb+bounces-25311-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A232AEE050
	for <lists+linux-usb@lfdr.de>; Mon, 30 Jun 2025 16:16:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 86F5C173B59
	for <lists+linux-usb@lfdr.de>; Mon, 30 Jun 2025 14:16:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5DC227FB10;
	Mon, 30 Jun 2025 14:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="rhfBPB9v"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CC60217F29
	for <linux-usb@vger.kernel.org>; Mon, 30 Jun 2025 14:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751292996; cv=none; b=ekuPVS+k98OSCA6ovGiV/j/Qllo15WKOKJSkMsE1GLJwbB2Lin0tkc8/DG+bFuwKimQGTe6xtuyp6Lysnphq5pE+swjmwJQ2XowsrD6kin7QourAKSVbZ1XeJC5yQ1oPjSdMmIGtVO36xBesyP9hKev/OHhnJBftjVBSx+gvwO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751292996; c=relaxed/simple;
	bh=uU4NWYJg1V5Vn9H6OG3dYNvVtaH+6cljDRAzH8j8WGc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IMNftT2wSdddfYYN5lkrPHmtxdlXaLRDcyvp60AJaEk37+avp6fmEsKZIrg5Jr27jr6jHE49ynHsg59oL8yvjFo2+qq35ITy/RDHcK+E1QJF05t9yYhCA5ailYtD2fsePQ2h054Xczg0dKQLwPif2QpCurcB04DmR3z9hcSyZZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=rhfBPB9v; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6fd0a7d3949so67751866d6.0
        for <linux-usb@vger.kernel.org>; Mon, 30 Jun 2025 07:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1751292993; x=1751897793; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2s8kDcioPxvpOzyItFHoM4iqYzDE+tvgyvsTlB7SpgQ=;
        b=rhfBPB9vhQ0qfVtYh3kbeQQ2Nc3S6zC1q6fJbCmRneEz997tmu/S0tIauTuKEvaZG4
         Niab4xQ7P1YjMa+mvtFDlJmFOzv7t6n4bG2bKhLPB9A39RStkLYCGGckv19pCHQrFm8r
         LD42esuaxUAE7pavYND12NTwXHdGvxdnrqsPu7cs6HTby/gz/ABddT6BWGhl0ArWQMX2
         lkV+sSvMJTDFqnmNBVHy6FwcK3ynRx+SIS6GN/EI/k8dtcH/GBQR+3bRrledT8Te4Ens
         jAqIxyXG7E65e5o62o5EqKfl3eTCTefOalWOHar5V7km6qUeIsnGFrPJDZZYGoi68G1J
         wetA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751292993; x=1751897793;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2s8kDcioPxvpOzyItFHoM4iqYzDE+tvgyvsTlB7SpgQ=;
        b=vf/zoFLflT+IYzuWVVQRZR/a/5GoJ5l3bGfJ3e3no7eBRFqyjKkmiO4tElkbldy77v
         IfDUWur045e3i4F+XZtdBdLOaUEovfUDOCWOPyl7sx/mD9lUH3xxfMurJjf5O2hntBew
         xwATMtUfgvRY+lgDXzuJohUn3WLvrW86Xkd2Ayd27Pe/cOyWHAHAhAM4nPVZcQGc6jWA
         hTrKi4FaDqCaEcoov8mabltqW0yWuSqh/nW8wz0rYo3wy0Qbi3PjvBJY8qaIgklipUgg
         MT4dqFqXhZzfisxkBKHSz6nwwDpK+F3eCi0fzDaMy5s0l0Te7nE2kg7bxiHGMM95iJ2N
         Er7A==
X-Forwarded-Encrypted: i=1; AJvYcCV6vxEScTgx4VY5KRyX2YviaQjWrwJSVxxnXhYWODBnxQ3yURVD6tD+Pq22SIhn70LDrkpv4VfvJh0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQ7M8gdqCwDN5BuF+VsEJD9OTMUrRkvH4qfP/sTVlhQl1RLcRU
	TBNNUIe0PLLol3eN4FuNpWsMj1Z73uffvPVNjSjK6NqvuZCgx+mBjWOatvO840rkbA==
X-Gm-Gg: ASbGncvJwgsxEq7bLKa+TbzKTC+C8KooT8/+4wTZYg+s6YyH9p0Yu/rkSdZcM/DCTPI
	gg+08ZchWFtGOmjhQaHrH4eQqXHS6GjLyqt0YKDt8Z+KlMYj9Dqi7lOM8yCc0aL/c9CuShzmfeT
	v5EGBPL496tMVjbARYjvwvDWbT4t/4IKEaK3S/LeBn1AufkGcs7cS2rQUhowdwCUKH3ufoz1hVV
	WfSn6oGweNXyp4rbgPzXYfH8pTaU/50zZsJZFZESfb9P9/2rnxiNhKMDj9B98siuRTzKA0w+A2N
	Lo5lVa7xIXMv5RjNslcY7TztpTRycpieGS0Fw8iJIRYK1kzSUr8ljNecFvQc++Ao59hRlihgXe5
	6rjLo
X-Google-Smtp-Source: AGHT+IGaIIkTev/B5UEJVGSeX7xX1oX3gVRWMPdbwKe6ttPOQvsQWLp4rii4GvhcrE/sVorKmumxgw==
X-Received: by 2002:a05:6214:4b10:b0:701:894:2b91 with SMTP id 6a1803df08f44-70108942c74mr23152286d6.14.1751292993290;
        Mon, 30 Jun 2025 07:16:33 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd772fc8f3sm67860476d6.84.2025.06.30.07.16.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 07:16:32 -0700 (PDT)
Date: Mon, 30 Jun 2025 10:16:30 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Xu Yang <xu.yang_2@nxp.com>, Christoph Hellwig <hch@lst.de>
Cc: ezequiel@vanguardiasur.com.ar, mchehab@kernel.org,
	laurent.pinchart@ideasonboard.com, hdegoede@redhat.com,
	gregkh@linuxfoundation.org, mingo@kernel.org, tglx@linutronix.de,
	andriy.shevchenko@linux.intel.com, viro@zeniv.linux.org.uk,
	thomas.weissschuh@linutronix.de, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v2 1/3] usb: core: add dma-noncoherent buffer alloc and
 free API
Message-ID: <e908261b-2acd-46ac-b3ef-92691eb50f88@rowland.harvard.edu>
References: <20250627101939.3649295-1-xu.yang_2@nxp.com>
 <20250627101939.3649295-2-xu.yang_2@nxp.com>
 <1c4f505f-d684-4643-bf77-89d97e01a9f2@rowland.harvard.edu>
 <wddmyx4lccthln7mbngkd4zbh6y7mwetdba5e7ob6u4xevecmj@zopp65eqbeuu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <wddmyx4lccthln7mbngkd4zbh6y7mwetdba5e7ob6u4xevecmj@zopp65eqbeuu>

On Mon, Jun 30, 2025 at 04:18:51PM +0800, Xu Yang wrote:
> > Also, the material that this routine replaces in the uvc and stk1160 
> > drivers do not call flush_kernel_vmap_range().  Why did you add that 
> > here?  Was this omission a bug in those drivers?
> 
> According to dma-api.rst:
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/tree/Documentation/core-api/dma-api.rst?h=linux-6.15.y#n664
> 
> "Once a non-contiguous allocation is mapped using this function, the
> flush_kernel_vmap_range() and invalidate_kernel_vmap_range() APIs must
> be used to manage the coherency between the kernel mapping, the device
> and user space mappings (if any)."
> 
> Possibly the uvc and stk1160 missed calling it, but since they won't be
> the only user of the USB core, so we'd better call these APIs.

Documentation/core-api/cachetbl.rst says:

  ``void flush_kernel_vmap_range(void *vaddr, int size)``

       flushes the kernel cache for a given virtual address range in
       the vmap area.  This is to make sure that any data the kernel
       modified in the vmap range is made visible to the physical
       page.  The design is to make this area safe to perform I/O on.
       Note that this API does *not* also flush the offset map alias
       of the area.

  ``void invalidate_kernel_vmap_range(void *vaddr, int size) invalidates``

       the cache for a given virtual address range in the vmap area
       which prevents the processor from making the cache stale by
       speculatively reading data while the I/O was occurring to the
       physical pages.  This is only necessary for data reads into the
       vmap area.

So invalidate_kernel_vmap_range() is not needed for data writes, that 
is, for OUT transfers.  And ironically, flush_kernel_vmap_range() _is_ 
needed (but only for OUT transfers).

On the other hand, Christoph may think these call should be included 
regardless.  Let's see what he recommends.  Christoph?

(Actually, I would expect dma_sync_sgtable_for_cpu() and 
dma_sync_sgtable_for_device() to handle all of this for us 
automatically, but never mind...)

Alan Stern

