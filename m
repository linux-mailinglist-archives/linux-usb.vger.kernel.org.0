Return-Path: <linux-usb+bounces-20693-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4975EA3747A
	for <lists+linux-usb@lfdr.de>; Sun, 16 Feb 2025 14:14:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7B80A188E77D
	for <lists+linux-usb@lfdr.de>; Sun, 16 Feb 2025 13:13:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEEA4190051;
	Sun, 16 Feb 2025 13:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="WS1qVa5f"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49F7781E
	for <linux-usb@vger.kernel.org>; Sun, 16 Feb 2025 13:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739711619; cv=none; b=cwUuUHwtWzvN4o8JquFyQ8i5qQerT0x04VrazDvQ7z52xT14XMX1nIoQkabb9rkJrOqRIKY+QTim1rKFvGPUbbW1mVlXCqHXLRQZreYKUt7QQEd8aVc1TLu5JZW2eh/Zi5E6QtO6JX308BHYEs/VRDj2MAqBfqR+6cfbYYH3iEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739711619; c=relaxed/simple;
	bh=9citAQzQpUkQ7Gx6479tj7D38+m7wjIlhaSsd1NdVzE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UpQK42e5/2pH1h9C0n+HSr3eT3Q6SgQuwCnF0keI5b4Fe+kA2m8N6BhBkhvu2HA1xzRLP7QCj1cQ8yAEONQgfTu01yIMd03V8frM1T7TwLu2+WGDRoTzXJ0V6RT0hTfFiAwdW8HiCy/ZrgFFYqHCeVasM0HuzBWKF3lg5RrC+iM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=WS1qVa5f; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2339C4CEDD;
	Sun, 16 Feb 2025 13:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1739711618;
	bh=9citAQzQpUkQ7Gx6479tj7D38+m7wjIlhaSsd1NdVzE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WS1qVa5fdxpXATiGuIsnMekvZmuFkegCMPUSyIZnt3OyS79atPVSf4GCNbYEMxwB2
	 DKRnEcxQfVRDgOG5w1tXjfVWvVaOq2maMAZb+G6uGAfYbx+BmSbnMTL8wfO20mmo2v
	 neLTJxFRKT/xR7u1Td6kzHHTK/UtHvxD70/8nXdg=
Date: Sun, 16 Feb 2025 14:13:30 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Suraj Patil <surajpatil522@gmail.com>
Cc: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: typec: displayport: Update outdated FIXME comment
Message-ID: <2025021653-activator-life-5765@gregkh>
References: <20250216001609.106616-1-surajpatil522@gmail.com>
 <20250216001609.106616-3-surajpatil522@gmail.com>
 <2025021610-tartness-doorstep-4439@gregkh>
 <CACuQ1FJPV7BNr6CKfzOUNDCtoygvNY3NuvnyNV0hCk_uFwLjmg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACuQ1FJPV7BNr6CKfzOUNDCtoygvNY3NuvnyNV0hCk_uFwLjmg@mail.gmail.com>

On Sun, Feb 16, 2025 at 04:03:47PM +0530, Suraj Patil wrote:
> Hi Greg,

Hi,

Please don't send html emails, or top-post, that way the message is not
dropped by the mailing list.  I'll be glad to respond if you can do so
so that everyone else can see it.

thanks,

greg k-h

