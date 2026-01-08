Return-Path: <linux-usb+bounces-32028-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D6085D00B57
	for <lists+linux-usb@lfdr.de>; Thu, 08 Jan 2026 03:42:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 38E6530B0EE6
	for <lists+linux-usb@lfdr.de>; Thu,  8 Jan 2026 02:37:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2BCD2236E9;
	Thu,  8 Jan 2026 02:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b="Z4/GnfD5"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA40320311;
	Thu,  8 Jan 2026 02:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767839847; cv=none; b=fMb9qrpkL8lRikO3ODxzV76TRiOCB4C/Bpb4X1hPmbXIxnk1j2lFxhr53CM+0b372kKLCTiazqls++OflmWB0/hAM2XZAxNLLYWcfB7+1eVeLLmSULgwDDVzAp7jZE6pQ4gTcwfkJmTbHlcP3fTYzhYtiTKuv6bdGIzviDBcyFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767839847; c=relaxed/simple;
	bh=uAq3srVZVi2Pvv/CPmsXXgRNsOrx1+acegzL7eUCL/8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XFbNEXyGSOLGDOqVqZLf+wBihcvXZhSkqAmsHBnXHP6jC34PV++sf0RuGAS0hVZVvn5FfRE+hzbkhmnGXJ4mkYXx+aM4Tls27t8N5olZLG+PFdqgeeswA7Vp+9s6/HrW+gd8H22sjEGoteA3fOwkOuiLsI+gS3hZggLvMx32qJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; spf=pass smtp.mailfrom=seu.edu.cn; dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b=Z4/GnfD5; arc=none smtp.client-ip=45.254.49.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seu.edu.cn
Received: from LAPTOP-N070L597.localdomain (unknown [58.241.16.34])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2fe228c5f;
	Thu, 8 Jan 2026 10:37:11 +0800 (GMT+08:00)
From: Zilin Guan <zilin@seu.edu.cn>
To: gregkh@linuxfoundation.org
Cc: jianhao.xu@seu.edu.cn,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	mathias.nyman@intel.com,
	zilin@seu.edu.cn
Subject: Re: [PATCH] usb: xhci: Fix memory leak in xchi_disable_slot()
Date: Thu,  8 Jan 2026 02:37:10 +0000
Message-Id: <20260108023710.539893-1-zilin@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <2026010723-earshot-staining-6e11@gregkh>
References: <2026010723-earshot-staining-6e11@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9b9b77167303a1kunm5a375bc824c5e
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDTUxNVk4ZQ0hJTkgaShlNS1YeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlOQ1VJT0pVSk1VSE9ZV1kWGg8SFR0UWUFZT0tIVUJCSU5LVUpLS1VKQktCWQ
	Y+
DKIM-Signature: a=rsa-sha256;
	b=Z4/GnfD5P8S/jaNMz1m0FeUf0pSD6zcJR6L+PfP5wrq5+F+HoztmxAFB4qDEhbPXqF8CLxlBgPO1dVjA7xgu0QXx0QYZACHMKZun/eT797tCFNJ6qTSA48/8XgOcYE3EhHNvto76T/Gzw8yB0wIqjHr8TiUAk9z0iW3sOOO/EfM=; s=default; c=relaxed/relaxed; d=seu.edu.cn; v=1;
	bh=eYpkigJfej22cePP7HRozqjbT4JtX8laymShYoOv1Ys=;
	h=date:mime-version:subject:message-id:from;

On Wed, Jan 07, 2026 at 04:04:43PM +0100, Greg KH wrote:
> On Thu, Dec 25, 2025 at 04:21:19PM +0000, Zilin Guan wrote:
> > xhci_alloc_command() allocates a command structure and, when the
> > second argument is true, also allocates a completion structure.
> > Currently, the error handling path in xhci_disable_slot() only frees
> > the command structure using kfree(), causing the completion structure
> > to leak.
> > 
> > Fix this by using xhci_free_command() instead of kfree(). This function
> > correctly frees both the command and the completion structure.
> > 
> > Fixes: cd3f1790b006d ("usb: xhci: Fix potential memory leak in xhci_disable_slot()")
> 
> No cc: stable?

My understanding is that the Cc: stable tag is primarily intended for 
severe bugs. I wasn't sure if this leak was critical enough to warrant 
backporting, especially since the amount of leaked memory is small. I 
decided to avoid adding unnecessary noise to the stable tree, but I am 
happy to include the tag if you advise doing so.

> And how was this found?  How was it tested?  

This issue was reported by our static analysis tool, but we manually verify 
the bugs.

We enforced a rigorous manual check to trace the code path and confirm 
the resource leak is genuine specifically to filter out any false 
positives from the tool.

> What tool created this fix?

We wrote patch manually.

Thanks,
Zilin Guan


