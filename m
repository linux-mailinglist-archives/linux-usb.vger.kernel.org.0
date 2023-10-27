Return-Path: <linux-usb+bounces-2263-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1666B7D95B4
	for <lists+linux-usb@lfdr.de>; Fri, 27 Oct 2023 12:56:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C46142823E8
	for <lists+linux-usb@lfdr.de>; Fri, 27 Oct 2023 10:56:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A789171DC;
	Fri, 27 Oct 2023 10:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Q3SZSOBx"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C743C8BF9
	for <linux-usb@vger.kernel.org>; Fri, 27 Oct 2023 10:55:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFD6DC433C8;
	Fri, 27 Oct 2023 10:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1698404159;
	bh=pp9XWSDKawl0nPkojRppEN59iTqfiee45EN0+pPOHT4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q3SZSOBxkJFlFbYl3NiXjgshVBHD8cZpLWMxhJvDdW6qtScQcJUsuGluFufQnc3Ar
	 AdTMTARU4GPyISNLJDQ5Jumu45TW4zBk9oS3bR3jzjj4SYEpE2xoF3n7lmwuxx607q
	 cQg4Xz6bCb78BlWt8bNtGl8Nh2SKlRePaHjhbzGY=
Date: Fri, 27 Oct 2023 12:55:56 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Shuzhen Wang <shuzhenwang@google.com>
Cc: laurent.pinchart@ideasonboard.com, balbi@kernel.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: uvc: Add missing initialization of ssp
 config descriptor
Message-ID: <2023102757-booting-cussed-ce58@gregkh>
References: <c2a62810-98b3-46d5-b557-2e98460729f7@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c2a62810-98b3-46d5-b557-2e98460729f7@google.com>

On Thu, Oct 26, 2023 at 11:31:38AM -0700, Shuzhen Wang wrote:
> In case the uvc gadget is super speed plus, the corresponding config
> descriptor wasn't initialized. As a result, the host will not recognize
> the devices when using super speed plus connection.
> 
> This patch initializes them to super speed descriptors.
> 
> Signed-off-by: Shuzhen Wang<shuzhenwang@google.com>
> ---
>  drivers/usb/gadget/function/f_uvc.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- Your patch is sent in HTML format, which for obvious reasons, does not
  work at all.  It also was rejected by the mailing list, which means
  that no one is able to refer to a public version of it on
  lore.kernel.org.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot

