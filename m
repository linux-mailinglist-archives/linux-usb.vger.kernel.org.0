Return-Path: <linux-usb+bounces-32137-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C19CD0DD06
	for <lists+linux-usb@lfdr.de>; Sat, 10 Jan 2026 21:03:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BFDEB30210E2
	for <lists+linux-usb@lfdr.de>; Sat, 10 Jan 2026 20:02:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3991C29E109;
	Sat, 10 Jan 2026 20:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="MUtDeJXL"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B635842050;
	Sat, 10 Jan 2026 20:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768075363; cv=none; b=bh84z7LfK/+RlyRaJiSbi0P9p1nzcckLT68HSelGH5TLPHC0uQdRR/VGKIK2COEJmEkqVP1Oy1eLF05Ne8fAih7RfrLc7AM01uARaiK1k9PVlPMxvbRvnZjegFGk7JD4YZOi6JrWj4wWRgR0s91+TaUw7wUtjfnR/USgNZzghcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768075363; c=relaxed/simple;
	bh=zc2PswxJHbG5rUDVpl9rh9XtDpCBQrU2uYzj5spl2Z4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IZ2o3/igTAL4/0u74E/9RZ8KGq8rbbJyfkqXdXWDYQbCl1Wxn0vkoa9IFb4URqd0GyxIAkZXZRj5wxMql4Zt2TnejFn7hIVBUa5+wCLSQ6/nnvA9ZQSzRss1Zw/QrfDi9mtE04dl1zL25mdtgERmk1AfnVQFQmbcKgph3Y+82mQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=MUtDeJXL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10361C4CEF1;
	Sat, 10 Jan 2026 20:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1768075363;
	bh=zc2PswxJHbG5rUDVpl9rh9XtDpCBQrU2uYzj5spl2Z4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MUtDeJXLF86afLtJHvhDNxH1EKGFAnaqNmioXAVxkc5aZDOP6WzUrOEDi1ho56GJB
	 iMrbzMhC0VnekhamiqMG4ov/64OlOE1n261xFORUq0274uFICzXOj/kRuf7x7sZYRn
	 thGEChVyvvjfThWOXEqC7fl282I8wI6adBUNqdMA=
Date: Sat, 10 Jan 2026 21:02:40 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: pip-izony <eeodqql09@gmail.com>
Cc: Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Kyungtae Kim <Kyungtae.Kim@dartmouth.edu>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: r8a66597-hcd: fix potential divide-by-zero in
 prepare_packet_read()
Message-ID: <2026011022-cosmos-consult-4c50@gregkh>
References: <20260110192233.31955-1-eeodqql09@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260110192233.31955-1-eeodqql09@gmail.com>

On Sat, Jan 10, 2026 at 02:22:33PM -0500, pip-izony wrote:
> From: Seungjin Bae <eeodqql09@gmail.com>
> 
> The `prepare_packet_read()` function calculates the number of packets
> required for a transfer by dividing the transfer buffer length by the
> maximum packet size (`td->maxpacket`). The `td->maxpacket` is
> initialized in `r8a66597_make_td()` function based on the endpoint
> descriptor. However, it does not validate whether `td->maxpacket` is
> zero before using it in the `DIV_ROUND_UP` macro.
> 
> If a malicious USB device sends a descriptor with `wMaxPacketSize` set to
> 0, it triggers a divide-by-zero exception (kernel panic).

Same here, when can this happen, before a device is bound to the device
or afterward?

thanks,

greg k-h

