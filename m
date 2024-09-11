Return-Path: <linux-usb+bounces-14946-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 751289753EC
	for <lists+linux-usb@lfdr.de>; Wed, 11 Sep 2024 15:31:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 377F22886FF
	for <lists+linux-usb@lfdr.de>; Wed, 11 Sep 2024 13:31:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AFD519F116;
	Wed, 11 Sep 2024 13:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="xy4JZe9I"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E5A519993B
	for <linux-usb@vger.kernel.org>; Wed, 11 Sep 2024 13:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726061324; cv=none; b=TV8YhNV8WbFiWxaLJHhjSynQY+Upqdcj+p/E7bGC59tW0J9BUNtOKy0U+5AgnLUrz6cP7at3lOmehNzbzauXl9r4thfoZzBxIrUNystv90bOGZljZ6Sd7h56vjV+5hFeFFpa6x5sWcKvjnvgvq/stWtaRY/N9lcqpeLT3+hPsCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726061324; c=relaxed/simple;
	bh=QBqmx65GxN/J5iKXe5FYo4qTto8iZq5+qS7B+IBKbEw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gJC9rVMbPv1yCiijjifRwhAwa0syOsT4s+xhNUDY+aVFPTfqbkzQ7Qp5wSKv2GExXJ8o0GEyjrBykv4VSFEo3KwFy3L7m3vIUq4OoIOjFG4YVyOC5g8oASXeO0ALj/WBga1LUns0JaaXz1h6xLOMs4QIX1E+mRz/h+zM7Zwv14c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=xy4JZe9I; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C5E2C4CEC5;
	Wed, 11 Sep 2024 13:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1726061324;
	bh=QBqmx65GxN/J5iKXe5FYo4qTto8iZq5+qS7B+IBKbEw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=xy4JZe9IGP5rPT3hu83tzCCJZnhgW42dlpF7/xD/GvE8da5FXDFr2qrMztvGJoN9s
	 /CwSBGA/qOhCjcnOKGEUI1GN8S5zEsBV68LIgeMu2Ju+Mr5hTxoiMFe31HMv2ISkZV
	 4qx6E6Xu2DafKK2QOTwXosZEI2DXtjjj99s4MJh8=
Date: Wed, 11 Sep 2024 15:28:41 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Hubert =?utf-8?Q?Wi=C5=9Bniewski?= <hubert.wisniewski.25632@gmail.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: u_ether: Use __netif_rx() in rx_callback()
Message-ID: <2024091116-wound-golf-9f03@gregkh>
References: <7d86b2ed20418cab986708e327adb4432f7078c2.camel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7d86b2ed20418cab986708e327adb4432f7078c2.camel@gmail.com>

On Fri, Sep 06, 2024 at 08:57:25PM +0200, Hubert Wiśniewski wrote:
> netif_rx() now disables bottom halves, which causes the USB gadget to be
> unable to receive frames if the interface is not brought up quickly enough
> after being created by the driver (a bug confirmed on AM3352 SoC).
> 
> Replacing netif_rx() with __netif_rx() restores the old behavior and fixes
> the bug. This can be done since rx_callback() is called from the interrupt
> context.
> 
> Signed-off-by: Hubert Wiśniewski <wiih@viessmann.com>

Doesn't match the "From:" line, so we can't take this :(

What commit id does this fix?

thanks,

greg k-h

