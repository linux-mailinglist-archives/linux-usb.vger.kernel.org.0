Return-Path: <linux-usb+bounces-32130-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B7AD0D450
	for <lists+linux-usb@lfdr.de>; Sat, 10 Jan 2026 10:54:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B63A8302D525
	for <lists+linux-usb@lfdr.de>; Sat, 10 Jan 2026 09:54:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAEB82D1936;
	Sat, 10 Jan 2026 09:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="XenWBPzR"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4513335965;
	Sat, 10 Jan 2026 09:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768038854; cv=none; b=JW1nI+ZjbYmB3YNMZF9GIWoCE9nounwIDC7J2YUbZonHIjDhufWJeAzL8wpGwyDifnMMvxvuYlKX+pe2rywFI3vhQVLvOkH9AafUwNF+Golm6x3F3W5FsR2FeJAQMlLWSlaSwXyXGvFJOI1OootV3MCaceegMtyAXwrw3sqBGIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768038854; c=relaxed/simple;
	bh=iSSHMYK2nBDA2gcA+p0KHjr5rlyEyTxUjQ1D+5YiHmk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lCwyTsfINMHuka4UFZvmBPd4dRqLdHB3i3FJ5TENGpc5rylCyxEAX2GmrTSXXCxSThmBAMk5zt2YspxRTJREQSKEJuFMaK0XR4kTUKg3X0QvAQoQLrJ5j/aOB1kbM33IBLklR2M8O2Wasw7CRPUu9l9JqFzk+T0qYoC+LODk/cU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=XenWBPzR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 760F2C4CEF1;
	Sat, 10 Jan 2026 09:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1768038853;
	bh=iSSHMYK2nBDA2gcA+p0KHjr5rlyEyTxUjQ1D+5YiHmk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XenWBPzRfMeQZnDkVw6u6a/jkSzHR80Fcr/uTNlRXbviCjH658U5jj2HHfLQPXAzN
	 IIRFYMCs+y8hhc0jxzNOQbGFqDLyZyr4YmhfZvB8peeUguB+KEiJ2ewe/G8A6XmyUF
	 IkxnjNmhrH6oqU819rYvoO+h8ybr1DbXfnKB+TxI=
Date: Sat, 10 Jan 2026 10:54:10 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: =?utf-8?B?6ZmI5Y2O5omN?= <chenhuacai@loongson.cn>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH] USB: HCD: remove logic about which hcd is loaded
Message-ID: <2026011037-kinfolk-serotonin-0b5d@gregkh>
References: <2026010739-diffuser-shelter-e31c@gregkh>
 <5f013d5a.3a686.19ba74f85dc.Coremail.chenhuacai@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5f013d5a.3a686.19ba74f85dc.Coremail.chenhuacai@loongson.cn>

On Sat, Jan 10, 2026 at 05:49:25PM +0800, 陈华才 wrote:
> 
> 
> 
> > -----原始邮件-----
> > 发件人: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
> > 发送时间:2026-01-07 23:25:40 (星期三)
> > 收件人: linux-usb@vger.kernel.org
> > 抄送: linux-kernel@vger.kernel.org, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Huacai Chen" <chenhuacai@loongson.cn>, "Alan Stern" <stern@rowland.harvard.edu>
> > 主题: [PATCH] USB: HCD: remove logic about which hcd is loaded
> > 
> > It turns out that warning about which USB host controller is loaded
> > before another one doesn't really matter.  All that really is needed is
> > the PCI softdep module loading logic, which has been present in the
> > kernel ever since commit 05c92da0c524 ("usb: ohci/uhci - add soft
> > dependencies on ehci_pci")
> > 
> > So remove the warning messages, they are not useful, not needed, and
> > only confuse people.  As can be seen in the discussion at
> > https://lore.kernel.org/r/20251230080014.3934590-1-chenhuacai@loongson.cn
> > 
> > Cc: Huacai Chen <chenhuacai@loongson.cn>
> > Suggested-by: Alan Stern <stern@rowland.harvard.edu>
> > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>
> 
> And it should be backported to stable branches?

It doesn't change any behavior, so why would it be needed anywhere else?
It's just removing a message that people have been ignoring for a very
very long time :)

thanks,

greg k-h

