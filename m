Return-Path: <linux-usb+bounces-3216-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C07D27F52FA
	for <lists+linux-usb@lfdr.de>; Wed, 22 Nov 2023 23:07:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A8517B20E4C
	for <lists+linux-usb@lfdr.de>; Wed, 22 Nov 2023 22:07:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C8621DFCA;
	Wed, 22 Nov 2023 22:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="kaT6RmOH"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA0F41DFC0
	for <linux-usb@vger.kernel.org>; Wed, 22 Nov 2023 22:07:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA48BC433C7;
	Wed, 22 Nov 2023 22:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1700690837;
	bh=879KXznwiWs4VGcvpRH7TOoxpdcEDnzryeA43aJHal4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kaT6RmOHm1SuksgdO9VhP1QwTnHKvyx8n67Cii1r36lgGYVlDcNxr7FYHE35gVehs
	 xfyobqvZnZlB30qpmihQfFmaGsdPzR6aKL5xVXJGEkB9y3NbQP2QqSHceBd/DIk09b
	 ZrtrBxmS9TGT0BDxUb0y1nFPPuErhcScijaWpyvo=
Date: Wed, 22 Nov 2023 22:07:15 +0000
From: Greg KH <gregkh@linuxfoundation.org>
To: Roy Luo <royluo@google.com>
Cc: stern@rowland.harvard.edu, badhri@google.com, quic_kriskura@quicinc.com,
	francesco.dolcini@toradex.com, quic_eserrao@quicinc.com,
	ivan.orlov0322@gmail.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] USB: gadget: core: adjust uevent timing on gadget
 unbind
Message-ID: <2023112253-fresh-blazing-baae@gregkh>
References: <20231122220001.539770-1-royluo@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231122220001.539770-1-royluo@google.com>

On Wed, Nov 22, 2023 at 10:00:01PM +0000, Roy Luo wrote:
> The KOBJ_CHANGE uevent is sent before gadget unbind is actually
> executed, resulting in inaccurate uevent emitted at incorrect timing
> (the uevent would have USB_UDC_DRIVER variable set while it would
> soon be removed).
> Move the KOBJ_CHANGE uevent to the end of the unbind function so that
> uevent is sent only after the change has been made.
> 
> Signed-off-by: Roy Luo <royluo@google.com>
> ---
>  drivers/usb/gadget/udc/core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

What commit does this fix?



