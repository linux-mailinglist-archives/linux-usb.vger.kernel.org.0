Return-Path: <linux-usb+bounces-1697-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 258EE7CB216
	for <lists+linux-usb@lfdr.de>; Mon, 16 Oct 2023 20:05:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8F0CFB21139
	for <lists+linux-usb@lfdr.de>; Mon, 16 Oct 2023 18:05:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62940328CC;
	Mon, 16 Oct 2023 18:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="tKCpH5A6"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C713631A9E
	for <linux-usb@vger.kernel.org>; Mon, 16 Oct 2023 18:05:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D10DEC433C8;
	Mon, 16 Oct 2023 18:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1697479512;
	bh=SdI4cW6IdAR+m+AKlxnTXoAmqsYctXX8yb4Xfq0mSbU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tKCpH5A6EHzeEXjUyaeNlztQaHDeQbpCKyjoMtuXlmB+5nNzBlkdkQvxsn7ZCMpWk
	 0j+i+1dcXtlwu7wng9pcmwPbNzXqlUwC8ZxheW+mUUXeO0FVN6BKelumLjRf5Oye/t
	 Xt/Bu/gao22w+AnUaJydPs2v8ornMYYSn8dSDBcE=
Date: Mon, 16 Oct 2023 20:05:09 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Douglas Gilbert <dgilbert@interlog.com>,
	USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] usbutils: lsusb-t: print entries for devices with no
 interfaces
Message-ID: <2023101648-reconcile-catcall-ff01@gregkh>
References: <feeb9f88-b72c-4a37-88ac-4bb28f4bfd3a@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <feeb9f88-b72c-4a37-88ac-4bb28f4bfd3a@rowland.harvard.edu>

On Fri, Oct 13, 2023 at 11:22:12AM -0400, Alan Stern wrote:
> Not all USB devices have interfaces.  This is true in particular of
> the STMicroelectronics STEVAL-USBC2DP Type-C to DisplayPort adapter,
> as well as possibly other USB-C devices.
> 
> As a result these devices do not show up in the output from "lsusb -t",
> because the logic in print_tree_dev_interface() lists interfaces, not
> devices (as implied by the function's name).  This means that the
> output from "lsusb -t" can be inconsistent with the output from
> "lsusb", since some devices are omitted.
> 
> To fix the problem, we make the subroutine call print_usbdevice() at
> least once even if the device has no interfaces, and make the latter
> routine print a minimal description of such devices (anything that does
> not require access to the interface descriptor).
> 
> Reported-and-tested-by: Douglas Gilbert <dgilbert@interlog.com>
> Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
> Link: https://lore.kernel.org/linux-usb/70c563f1-847c-32a1-cf4d-6bf9802017ab@interlog.com/

Now applied, thanks!  I'll do a new release in a few days to get this
out to the world.

greg k-h

