Return-Path: <linux-usb+bounces-32058-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 79EDAD02332
	for <lists+linux-usb@lfdr.de>; Thu, 08 Jan 2026 11:50:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ACD0D30D4658
	for <lists+linux-usb@lfdr.de>; Thu,  8 Jan 2026 10:40:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6B43329E40;
	Thu,  8 Jan 2026 09:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b="WXQDyQcv"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F7432A3D7;
	Thu,  8 Jan 2026 09:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767865746; cv=none; b=e9vG2gArEohvcyHQFQqcrPgqRiLCQvNp6+NYELtcYy9WvhV24booBKwebIr8CcaWZKqSsK4dpcRKc1hCEdHcJkixVaPqRkSJ/aM+RY3/y6B0E/QqrUlHK0W86HzE4AYS5mvgndT95/2qXGjIvS5RWQni0evldPXvCMn3VhjZwwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767865746; c=relaxed/simple;
	bh=l8P7mhKK/cZGUCQNk97geeLyK/csjYvRQn3h4NM8IFc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Li8Erzhef9viyQA3Ep4FwgfNfUtQtQqKqSz2LW5624fsyXwqRis4OlEbLMn3EQiLauehqDXdy91xBk1kVGc/nzgA7GLq/Z8m8jqLNPvMom9JOIaLPulW2/H/9nqX2UQ6ynAh1XgbXxs/RbavEmGtKNTni+PVIObJ159Q9SjmC34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; spf=pass smtp.mailfrom=seu.edu.cn; dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b=WXQDyQcv; arc=none smtp.client-ip=45.254.49.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seu.edu.cn
Received: from LAPTOP-N070L597.localdomain (unknown [58.241.16.34])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2ff176fa6;
	Thu, 8 Jan 2026 17:48:54 +0800 (GMT+08:00)
From: Zilin Guan <zilin@seu.edu.cn>
To: gregkh@linuxfoundation.org
Cc: jianhao.xu@seu.edu.cn,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	mathias.nyman@intel.com,
	zilin@seu.edu.cn
Subject: Re: [PATCH] usb: xhci: Fix memory leak in xchi_disable_slot()
Date: Thu,  8 Jan 2026 09:48:53 +0000
Message-Id: <20260108094853.821213-1-zilin@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <2026010835-footless-decrease-e72a@gregkh>
References: <2026010835-footless-decrease-e72a@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9b9d0253ad03a1kunmaef320e244265
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCSEhCVk1JTEIYGkMdGBpPH1YeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlOQ1VJT0pVSk1VSE9ZV1kWGg8SFR0UWUFZT0tIVUJCSU5LVUpLS1VKQktCWQ
	Y+
DKIM-Signature: a=rsa-sha256;
	b=WXQDyQcvNZe27OlFib5qH+7r/uenFlYcWSlKFN3Hm73T0IZmYOIbBdLsli6EMG/VOxdXj8Dqg2aw75P8u5GZ3UJuhM9cHQ2ZPfYP8bfCupln83Y0QYJEfxWmBRU68gixDRJSVxfXqbbUh+xF31FFz7it4CU7b8PqOthpGzeOBGg=; s=default; c=relaxed/relaxed; d=seu.edu.cn; v=1;
	bh=vzZ5uceTjw9GZ05SxMs1oF7+vekAHFJT2lIx/aHeKIE=;
	h=date:mime-version:subject:message-id:from;

On Thu, Jan 08, 2026 at 10:15:21AM +0100, Greg KH wrote:
> > The tool used is an experimental static analysis tool we are developing. 
> > It is based on the LLVM framework and specifically designed to detect 
> > memory management issues.
> > 
> > The tool is currently under active development, so we do not have a public 
> > repository link at this moment. However, we plan to open-source it once 
> > the associated research is published.
> 
> As per our documentation, you need to say all of this.  Please read:
> 	Documentation/process/researcher-guidelines.rst
> and follow that.
> 
> thanks,
> 
> greg k-h

Understood. I will include these details in v2 as per documentation.

Thanks,
Zilin Guan

