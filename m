Return-Path: <linux-usb+bounces-19062-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9520A03C8F
	for <lists+linux-usb@lfdr.de>; Tue,  7 Jan 2025 11:36:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 98EE23A2D9B
	for <lists+linux-usb@lfdr.de>; Tue,  7 Jan 2025 10:36:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7CBC1E4938;
	Tue,  7 Jan 2025 10:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="W7pJfOQ/"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B438158D8B;
	Tue,  7 Jan 2025 10:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736246189; cv=none; b=NJNsiR1MVB37l/sZA3aot59AmfrpjDjOCoogzoApK4yuiAbszisCq8CGO6YbOH/WyWRNwHubmrDSsky4cyro1VO8Ourei1pHNo7s6CKQVobm1yNhCVfKoVHDQMJwQJ6fz0m2B7SxBx7Gkw9wob9kqUaHU+GLwG6P0l16U+aEDJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736246189; c=relaxed/simple;
	bh=hDqs0cGG8reTp0XS5abciFk9T5cvQlifcmxx+gN34t8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XrqKIXyk8X+cA/D3IlA+bCgvWZBkD+10BC8xZ26m5RT8R15e/mKRmu85HgHMJx+hfnqxGGXlojQoeGs6+NpeV4mgT62ELWrXdWJjE+Gh21vMqlSUkVS7M6Kd6bi6SFsBitsqqdOg6z6epHLjArlRZh6pDbdXld4ZfzDX32mxiEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=W7pJfOQ/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 001FCC4CEDD;
	Tue,  7 Jan 2025 10:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1736246185;
	bh=hDqs0cGG8reTp0XS5abciFk9T5cvQlifcmxx+gN34t8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W7pJfOQ/jkViSt4nVk7IPJrn9xWK0Jji95qGQwRvXnM3rgK66yegSRVCut8OgMHKE
	 Y4KoJeNaT5ws8lrCQ4bNbe3+MiGDNA0xnEBMn+UqYBXXy+jas4MWKvnYa5MgkbGkQj
	 bTXOIzOBMSa40H09d9zFnQ/8F64VCT0m8jkBcAcI=
Date: Tue, 7 Jan 2025 11:36:22 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: WangYuli <wangyuli@uniontech.com>
Cc: mathias.nyman@intel.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, niklas.neronin@linux.intel.com,
	quic_wcheng@quicinc.com, andriy.shevchenko@linux.intel.com,
	michal.pecio@gmail.com, guanwentao@uniontech.com,
	zhanjun@uniontech.com, bigeasy@linutronix.de, balbi@ti.com,
	sarah.a.sharp@linux.intel.com, hkallweit1@gmail.com,
	Xu Rao <raoxu@uniontech.com>
Subject: Re: [PATCH v2] usb: host: xhci-plat: Assign shared_hcd->rsrc_start
Message-ID: <2025010711-blush-glamorous-9498@gregkh>
References: <7ECE325975663D2D+20250104155111.100597-1-wangyuli@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7ECE325975663D2D+20250104155111.100597-1-wangyuli@uniontech.com>

On Sat, Jan 04, 2025 at 11:51:11PM +0800, WangYuli wrote:
> When inserting a USB device, examining hcd->rsrc_start can be
> helpful in identifying which hcd is mounted, as the physical
> address represented here is typically unique.
> 
> The following code snippet demonstrates this:
>   struct usb_hcd *hcd = bus_to_hcd(udev->bus);
>   unsigned long long usb_hcd_addr = (unsigned long long)hcd->rsrc_start;
> 
> However, this approach has limitations now. For USB hosts with an
> MMIO interface, the effectiveness of this method is restricted to
> USB 2.0.
> 
> Becase commit 3429e91a661e ("usb: host: xhci: add platform driver
> support") assigned res->start to hcd->rsrc_start. But
> shared_hcd->rsrc_start remains unassigned, which is also necessary
> in certain scenarios.
> 
> Co-developed-by: Xu Rao <raoxu@uniontech.com>
> Signed-off-by: Xu Rao <raoxu@uniontech.com>
> Signed-off-by: WangYuli <wangyuli@uniontech.com>
> --
> Changlog:
>   v1 -> v2: Move code changes for commit e0fe986972f5 ("usb: host:
> xhci-plat: prepare operation w/o shared hcd").
> ---

What commit id does this fix?

thanks,

greg k-h

