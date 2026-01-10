Return-Path: <linux-usb+bounces-32136-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 670F3D0DD00
	for <lists+linux-usb@lfdr.de>; Sat, 10 Jan 2026 21:02:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A9709301099F
	for <lists+linux-usb@lfdr.de>; Sat, 10 Jan 2026 20:02:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A09828688D;
	Sat, 10 Jan 2026 20:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="JAWe6ijq"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E70296BD7;
	Sat, 10 Jan 2026 20:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768075333; cv=none; b=nW2qawBoH5LKLqZ6FNsPqqIddPfNcLT0/2HRJjEajpq7Qstg1pjWqxBAu0/FHufu0gGtiRBRxyOcu7w4DSKtmYUGtKl7DQaIjuoXbVW9BQBvehyshCdw7C8ffRrZLhGcP0XedrkBZ7gu2XkjuXMv+OsahtaO6MVFa8xt+IL97hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768075333; c=relaxed/simple;
	bh=fb1eSiLOj84j5O8j5V6Nd/7gyXHSZ5LF0WGivV7vYGs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GYes686vlKMDcDxiIjmQ6zVyeV1FSAW6UeKr2/UBxRbmQQ1QKxlP8oKqe5n30nvaAKzNaobTBED44l5fWndD6DRpl8kWe5DTfHWudpzqIzAPe7SEpnO9qqiPNgd4lIZDZa2dbx7CBAWV0QiSrHhzVyfioNXYy+wBAe1hhDYYLME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=JAWe6ijq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44C9EC4CEF1;
	Sat, 10 Jan 2026 20:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1768075332;
	bh=fb1eSiLOj84j5O8j5V6Nd/7gyXHSZ5LF0WGivV7vYGs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JAWe6ijqzk6SRAupR+/n85ifqRucB3HmXJH91/3vM2B3+S4bm1Don3fJUS2W5Mi5K
	 oyVaZjdeT6HbIEMSY4zdOhtKm4hzT3KI9JCXfVMW8AiTxyGJLqxatEnheOm+dHY4tO
	 4KigsbjTWLgz+bdu5I+XuFaapFw06BlgbUTKJxhg=
Date: Sat, 10 Jan 2026 21:02:09 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: pip-izony <eeodqql09@gmail.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>,
	Kyungtae Kim <Kyungtae.Kim@dartmouth.edu>,
	Reyad Attiyat <reyad.attiyat@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: xhci: fix potential divide-by-zero in
 xhci_urb_enqueue()
Message-ID: <2026011037-exception-street-60e6@gregkh>
References: <20260110183421.23758-1-eeodqql09@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260110183421.23758-1-eeodqql09@gmail.com>

On Sat, Jan 10, 2026 at 01:34:21PM -0500, pip-izony wrote:
> From: Seungjin Bae <eeodqql09@gmail.com>
> 
> The `xhci_urb_enqueue()` validates Bulk OUT transfers by checking if the
> buffer length is a multiple of the packet size. However, it doesn't check
> whether the endpoint's `wMaxPacketSize` is zero before using it as a
> divisor in a modulo operation.
> 
> If a malicious USB device sends a descriptor with `wMaxPacketSize` set to
> 0, it triggers a divide-by-zero exception (kernel panic). This allows an
> attacker with physical access to crash the system, leading to a Denial of
> Service.

Shouldn't such a device have been rejected before it got here?  When can
this happen, after a driver is bound to a device or before it?

thanks,

greg k-h

