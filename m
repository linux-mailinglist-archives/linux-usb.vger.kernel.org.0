Return-Path: <linux-usb+bounces-3325-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D69B7F9241
	for <lists+linux-usb@lfdr.de>; Sun, 26 Nov 2023 11:34:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A61F1281203
	for <lists+linux-usb@lfdr.de>; Sun, 26 Nov 2023 10:34:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ED5C440C;
	Sun, 26 Nov 2023 10:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="AfUjISw2"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB8BCEC2
	for <linux-usb@vger.kernel.org>; Sun, 26 Nov 2023 10:34:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22798C433C8;
	Sun, 26 Nov 2023 10:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1700994872;
	bh=P/34EZh4uB3kuC67GjgvQ3qNX76o8UEsRZC9ofNhGlM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AfUjISw24DmjMgW0H+u8Td1m9qJjiNvAKvcnX0174x5rfkPcFxC9wH6tLkMaygFZr
	 qMpKtdisxMI5D4PmgNJW+jNPKj05CDqoNUDn5x/kDRmvr4aNENBRuFGicW2JAGf/u/
	 07qO/o9lP8wBq7tPnyzCBipyw7zFN7MbNZaQWFho=
Date: Sun, 26 Nov 2023 10:34:30 +0000
From: Greg KH <gregkh@linuxfoundation.org>
To: shitao <shitao@kylinos.cn>
Cc: justin.chen@broadcom.com, alcooperx@gmail.com,
	bcm-kernel-feedback-list@broadcom.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, k2ci <kernel-bot@kylinos.cn>
Subject: Re: [PATCH] usb: Correct misspelling comment word dynamic
Message-ID: <2023112610-curling-swinging-89cb@gregkh>
References: <20231123032245.2986309-1-shitao@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231123032245.2986309-1-shitao@kylinos.cn>

On Thu, Nov 23, 2023 at 11:22:45AM +0800, shitao wrote:
> The word 'dyanmic memory'is misspelled, fixed the word 'dyanmic'
> to 'dynamic',avoiding confusing other developers.
> 
> Reported-by: k2ci <kernel-bot@kylinos.cn>
> Signed-off-by: shitao <shitao@kylinos.cn>
> ---
>  drivers/usb/gadget/udc/bdc/bdc_core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

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

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot

