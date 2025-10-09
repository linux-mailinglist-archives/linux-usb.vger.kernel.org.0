Return-Path: <linux-usb+bounces-29091-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DC301BC9531
	for <lists+linux-usb@lfdr.de>; Thu, 09 Oct 2025 15:36:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EAD331A61FCD
	for <lists+linux-usb@lfdr.de>; Thu,  9 Oct 2025 13:36:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B32672E2DDC;
	Thu,  9 Oct 2025 13:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="GhsudpNK"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356AB2C21D9
	for <linux-usb@vger.kernel.org>; Thu,  9 Oct 2025 13:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760016958; cv=none; b=CqaVhx/KAo4M1N0mDJSib5VhQVQPAvsNZbDuK0VISuHELrdiVWjvvT+jWQOxCJtUQIq4C6XyKnA9ogcwu9cU6DnZyalWVp/nRCXLFZg+YAL6kRUgXX1NUJ7VCwuog9M/DZUORyv+o7eDfmj6oPazmC4e6zZPo/LxONoXKC343vM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760016958; c=relaxed/simple;
	bh=lunV8up2Ehcot5A+mPHmQtApgTlrRcAcjaKwvsgayMA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uN0oztedjp3YxxL+ZE76RBlA+ISX6EjRZP/v0B7pVkW++jstkPtgxgaDejKWc5eE1iZn6Vgq99DPBxIhfZCqGwXrLQr2gsGhT8ZkxcTw2/Xm3sQ2Jn1Awry2pZdOD7ESJZw4pqNZFxU2FXXq+5gSE05tFOWSzaUXB07ScTABh94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=GhsudpNK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59E9EC4CEE7;
	Thu,  9 Oct 2025 13:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1760016957;
	bh=lunV8up2Ehcot5A+mPHmQtApgTlrRcAcjaKwvsgayMA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GhsudpNKam29otPrqSsbYBMgjICpQcV1/vkNSUhlhjuiflc1xFQvknj5Gr3Xz/MCs
	 lTvpvfbuCiDeHkcNTh26SdQnnrX3Pvg8t3wbLL+bMF965Rbl1hfMiudMLv7XxiZ2Gl
	 7z3bJGxRgzvMZRB90OtZkKzX1opsUigYpOF+oS/g=
Date: Thu, 9 Oct 2025 15:35:55 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Pierre Tomon <pierretom+12@ik.me>
Cc: linux-usb@vger.kernel.org
Subject: Re: USB disconnection after mounting file system
Message-ID: <2025100905-gestation-founder-3e70@gregkh>
References: <4chgTL1WjjzCqn@smtp-3-0000.mail.infomaniak.ch>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4chgTL1WjjzCqn@smtp-3-0000.mail.infomaniak.ch>

On Wed, Oct 08, 2025 at 05:48:05PM -0000, Pierre Tomon wrote:
> 
> Hello,
> 
> On a new HD dock station I got USB disconnection intermittently, when
> filsystem is mounted only, after this it automatically reconnect. On
> this device, I use a C to A adapter to connect to the PC.
> I have another hard drive enclosure, that use the same HD, with A-B
> cable and this does not happen.

Sounds like the cable is the issue, this is an electrical issue where
the device disconnects from the host.  We can't control this in the
kernel.

> Kernel 6.16.9
> FS: ext4, does not happen with NTFS.

Perhaps ext4 pushes more data to the disk causing it to draw more power
and things flake out?

good luck!

greg k-h

