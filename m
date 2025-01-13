Return-Path: <linux-usb+bounces-19234-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A51CA0B1F2
	for <lists+linux-usb@lfdr.de>; Mon, 13 Jan 2025 10:00:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A8E157A135C
	for <lists+linux-usb@lfdr.de>; Mon, 13 Jan 2025 09:00:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A96D23874D;
	Mon, 13 Jan 2025 09:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uJk6rTEY"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2CC5234998;
	Mon, 13 Jan 2025 09:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736758819; cv=none; b=gFWXDVFrOr+LMfWNUbzfxBXyYwafRieUX1iBepfkkTNaguPf7OjStqopIVbpStUd1VSkFZZ3OMXxfbqxwITCGH/lEjWfzP8QbU2tNpSWpZqTxNBNCPcYhXe0ER8XRu0/MKEpJsPLykAQCNv4lIJrf788vun/nC5t2P5HJeyL2i8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736758819; c=relaxed/simple;
	bh=ILSkIcsG3IW+X5zMbM/U952J0URWaGXk+wtZE7A3ElA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bg8qDxc7ik7kE7ixKXEdtPyjZhMY/skfiABZiE/bSx+t0ZFGG1ioUOe5nHP4Mf0BO1rfeCs9ODRKoNO6ROsAQpzEkykV8Ms8rsO8P9FFTzhe6zP2Pre96mI8lf0OFllTPPJoUVwPIIsIDmlOVIS74yW2oyhOnA69RLL/elCSLQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uJk6rTEY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 535B5C4CED6;
	Mon, 13 Jan 2025 09:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736758818;
	bh=ILSkIcsG3IW+X5zMbM/U952J0URWaGXk+wtZE7A3ElA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uJk6rTEYt0je+S/byX/1NghiJmQk/PyroCiNSb1cupia3T2x398NIwbGJSJhzkULA
	 7IRUkd9JWa0dfGK1GFEfEAulb918OeZfBQ2vm9XZ43KUE/rzVtfYNYmyCQvHCp/CLU
	 GMP9fDwBF0oJFgFEPWP3WUrkMHkqUent0kIsQSP9Y4DnLvxZG6AIqTpv+jxlk68zNp
	 hfmn54ToRcZGOvvbLW4GO0JCHxciUc89NZC3gXK52J5/AmACn8iHbsBlZB4NNxN0HH
	 GI6wlyuzJaYiwI2uj2goaKeKcXaGs/BZnqQapmPicitQFhifVV+jxb5xhq1qQ8m22d
	 qAUxkvQFtfkEw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tXGJ0-0000000006N-06ZS;
	Mon, 13 Jan 2025 10:00:18 +0100
Date: Mon, 13 Jan 2025 10:00:18 +0100
From: Johan Hovold <johan@kernel.org>
To: Qasim Ijaz <qasdev00@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: Fix null-ptr-deref in qt2_process_read_urb()
Message-ID: <Z4TWIs1fCmVLraBa@hovoldconsulting.com>
References: <Z4ORrl4sZBhPiu2p@qasdev.system>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z4ORrl4sZBhPiu2p@qasdev.system>

On Sun, Jan 12, 2025 at 09:55:58AM +0000, Qasim Ijaz wrote:
> This patch addresses a null-ptr-deref in qt2_process_read_urb() due to
> an incorrect bounds check in the following:

Thanks for the fix. This looks correct, but your patch is whitespace
damaged (tabs replaced with spaces) and does not apply.

Can you please fix your mail setup and resend a v3? (Make sure to send
it to yourself first.)

When doing so, please use the common patch prefix for this driver:

	USB: serial: quatech2:

> ""

You can drop these (markup?) quotes.

>        if (newport > serial->num_ports) {
>                dev_err(&port->dev,
>                        "%s - port change to invalid port: %i\n",
>                        __func__, newport);
>                break;
>        }
> ""
> 
> The condition doesn't account for the valid range of the serial->port
> buffer, which is from 0 to serial->num_ports - 1. When newport is equal
> to serial->num_ports, the assignment of "port" in the
> following code is out-of-bounds and NULL:
> 
> ""
>        serial_priv->current_port = newport;
>        port = serial->port[serial_priv->current_port];
> 
> ""
> 
> The fix checks if newport is greater than or equal to serial->num_ports
> indicating it is out-of-bounds.
> 
> Reported-by: syzbot <syzbot+506479ebf12fe435d01a@syzkaller.appspotmail.com>
> Closes: https://syzkaller.appspot.com/bug?extid=506479ebf12fe435d01a
> Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>

And please include a Fixes and CC stable tag:

	Fixes: f7a33e608d9a ("USB: serial: add quatech2 usb to serial driver")
	Cc: stable@vger.kernel.org	# 3.5

Johan

