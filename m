Return-Path: <linux-usb+bounces-32047-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AFFBD021C1
	for <lists+linux-usb@lfdr.de>; Thu, 08 Jan 2026 11:26:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 29E6D33308BB
	for <lists+linux-usb@lfdr.de>; Thu,  8 Jan 2026 09:39:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D4E43AEF28;
	Thu,  8 Jan 2026 09:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b="j8scEZyn"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA743A7DFB;
	Thu,  8 Jan 2026 09:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767863151; cv=none; b=nvc7m2/C/vagZ03l08KIdPejiHURZl9XO0ZXl3+n721Tdh1TNeXQ8Pz3jiZD6dAwJMzNOvRbcKyipLNf1EKPRSUXKzZtdLN1L7j+4eBCESC25Rz53adfakCxyOg9zrgqwFbkJjg2wswmnps4OF7K1husnd16fG/Kipmn7r+HVno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767863151; c=relaxed/simple;
	bh=akzA/w0vNN+AceWHrXiPpydYgcRXSngJWXiBIPMPCkE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OfspeOqY9NKCIW/w4OJmBf74XzW/I1f5OnSj7p5173NzSr6afRLGVppGqz4oEdvL4WttLbSyDXBAHi5pnNtbc5DHLZtnko7DyjwLm43IsfTC9s/VHSoapHjUImKav0ZTsNQK3+mvQvith4y9gynVehzQ0cIIkcoetC174pw+ZNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; spf=pass smtp.mailfrom=seu.edu.cn; dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b=j8scEZyn; arc=none smtp.client-ip=45.254.49.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seu.edu.cn
Received: from LAPTOP-N070L597.localdomain (unknown [222.191.246.242])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2ff02e48b;
	Thu, 8 Jan 2026 17:05:33 +0800 (GMT+08:00)
From: Zilin Guan <zilin@seu.edu.cn>
To: gregkh@linuxfoundation.org
Cc: jianhao.xu@seu.edu.cn,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	mathias.nyman@intel.com,
	zilin@seu.edu.cn
Subject: Re: [PATCH] usb: xhci: Fix memory leak in xchi_disable_slot()
Date: Thu,  8 Jan 2026 09:05:31 +0000
Message-Id: <20260108090531.788192-1-zilin@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <2026010804-commuting-hardly-0204@gregkh>
References: <2026010804-commuting-hardly-0204@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9b9cdaa4ff03a1kunmb7e7063b40b0a
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaHR9PVk0eQ0NMQhhMSxpJQlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJSUlVSkJKVUlPTVVJT0lZV1kWGg8SFR0UWUFZT0tIVUJCSU5LVUpLS1VKQk
	tCWQY+
DKIM-Signature: a=rsa-sha256;
	b=j8scEZynWk07LbK0KA0igI0nYSXCsOtmFvjWmqSsQk7kMgwlYkxKyhIgbFOZrI7eQc0q3+Vu2WOpdG04h2NhDSqZguvdMAYuUaq5k4VM/V3nQo4QYz34SY00rdl1d9E0K1kYK0Ezr2ak2rKjUOxLZ+aRKUQGs35DFahb3Zs0Efk=; s=default; c=relaxed/relaxed; d=seu.edu.cn; v=1;
	bh=k+9OG0AB4YIbUSXWJjhjI0caeY0oLdDZz16CZJL/8pU=;
	h=date:mime-version:subject:message-id:from;

On Thu, Jan 08, 2026 at 06:42:51AM +0100, Greg KH wrote:
> As per our documentation, you need to describe the tool being used,
> please read and follow that, otherwise we have no idea of what is
> happening here.
> 
> thanks,
> 
> greg k-h

The tool used is an experimental static analysis tool we are developing. 
It is based on the LLVM framework and specifically designed to detect 
memory management issues.

The tool is currently under active development, so we do not have a public 
repository link at this moment. However, we plan to open-source it once 
the associated research is published.

We performed build testing on x86_64 with allyesconfig using GCC=11.4.0. 
Since triggering these error path in xhci_disable_slot() requires specific 
hardware conditions or abnormal state, we were unable to construct a test 
case to reliably trigger these specific error path at runtime.

I will send a v2 patch with the tool description included in the commit
message, and I'll further clarify why the proposed fix is safe. Do you
think there's anything else to add?

Thanks,
Zilin Guan

