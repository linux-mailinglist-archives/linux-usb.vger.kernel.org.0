Return-Path: <linux-usb+bounces-32144-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E297D0E90E
	for <lists+linux-usb@lfdr.de>; Sun, 11 Jan 2026 11:23:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3F82430049DF
	for <lists+linux-usb@lfdr.de>; Sun, 11 Jan 2026 10:23:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C88E43314A4;
	Sun, 11 Jan 2026 10:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="af4IkcS0"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD632FFF94;
	Sun, 11 Jan 2026 10:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768126997; cv=none; b=GT6nHMXDX0vp2m3jaSvzmJ/Ze/WQWD6PFaatqFqHRNbd9whXrus01EtZJpRBt7mrtGhUzgckOwRr1rMRhS2IC+f71jnWMY10j2vojHxpBG8+MVnrnfpxju1TBvS+dEsJ/1zybvtTxnskfuW4k5CyxB4x1D4q7S28O94FQUGvd9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768126997; c=relaxed/simple;
	bh=wIo57OR6Mb97q4AGxkYsWCbgAzp85yRtpsrhKCgkrq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pu7MM35+NCNig7WKrkJlt8d/fVIKL0oS+cb1KvzydiOnVFe7RazMvV6AFCPFusGi0qRKzm605cd5PcrDIPEr+HLtumslsa9YwUXAXwkA1AR9U31pj2VymOseVJMS1l23CCAmGIuUlB6bT6KfK/czpaF0kY1Up/HnnPYpOgx6NMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=af4IkcS0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81BFAC4CEF7;
	Sun, 11 Jan 2026 10:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1768126996;
	bh=wIo57OR6Mb97q4AGxkYsWCbgAzp85yRtpsrhKCgkrq8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=af4IkcS0OHNDoyoN26mvK/VMXVQLJiD04AIPqNAluYK4wU0Yckppe3XAp6pkYwFAi
	 zInE2RQ/1jfX+JRyC1mMI4EnRt3wFKjlknOvx+vChWN7r+cDp8WTvifHoJv0Krg2Dl
	 hUDHzkIDCNxrdXWMNpgvsD0qDDFLz67bjtFFqH2g=
Date: Sun, 11 Jan 2026 11:23:13 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: =?utf-8?B?6ZmI5Y2O5omN?= <chenhuacai@loongson.cn>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	Alan Stern <stern@rowland.harvard.edu>
Subject: Re: Re: [PATCH] USB: HCD: remove logic about which hcd is loaded
Message-ID: <2026011100--cd5b@gregkh>
References: <2026010739-diffuser-shelter-e31c@gregkh>
 <5f013d5a.3a686.19ba74f85dc.Coremail.chenhuacai@loongson.cn>
 <2026011037-kinfolk-serotonin-0b5d@gregkh>
 <7e7ef90b.3a68c.19ba761c225.Coremail.chenhuacai@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7e7ef90b.3a68c.19ba761c225.Coremail.chenhuacai@loongson.cn>

On Sat, Jan 10, 2026 at 06:09:20PM +0800, 陈华才 wrote:
> 本邮件及其附件含有龙芯中科的商业秘密信息，仅限于发送给上面地址中列出的个人或群组。禁止任何其他人以任何形式使用（包括但不限于全部或部分地泄露、复制或散发）本邮件及其附件中的信息。如果您错收本邮件，请您立即电话或邮件通知发件人并删除本邮件。 
> This email and its attachments contain confidential information from Loongson Technology , which is intended only for the person or entity whose address is listed above. Any use of the information contained herein in any way (including, but not limited to, total or partial disclosure, reproduction or dissemination) by persons other than the intended recipient(s) is prohibited. If you receive this email in error, please notify the sender by phone or email immediately and delete it. 

Now deleted.

