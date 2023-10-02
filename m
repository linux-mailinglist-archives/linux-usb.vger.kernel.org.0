Return-Path: <linux-usb+bounces-924-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9C37B51A1
	for <lists+linux-usb@lfdr.de>; Mon,  2 Oct 2023 13:45:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 9BDCA281AE7
	for <lists+linux-usb@lfdr.de>; Mon,  2 Oct 2023 11:45:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07C2A14285;
	Mon,  2 Oct 2023 11:45:42 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A798DEAD4
	for <linux-usb@vger.kernel.org>; Mon,  2 Oct 2023 11:45:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F9FBC433C8;
	Mon,  2 Oct 2023 11:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1696247141;
	bh=icjqlZr6yaJOEPjZSqxvz3sMh4fSbBUkJFEUP00JluY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=0kJq87fTCjDVun1Wf5/SoHnowBsa4oNHKsTHhAkI26pw6Da8Wq7zY+IopgN+bo/sm
	 +IMENEnmFQezs0ri6cCQZFzN/WqDxRw+qLIG8zZmPuWpIZNhrgAnXJAJlTCXROytMx
	 hRffJbL7O29f/TzmyMNX6gVQhSUgsvAsZCGvFHoA=
Date: Mon, 2 Oct 2023 13:45:37 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Minas Harutyunyan <hminas@synopsys.com>, Ben Dooks <ben@simtec.co.uk>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@suse.de>, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: dwc2: gadget: Fix a warning when compiling with W=1
Message-ID: <2023100226-cloak-tissue-7efa@gregkh>
References: <5cf603809388aa04c9a02bbfe3cf531c20bb043e.1695466447.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5cf603809388aa04c9a02bbfe3cf531c20bb043e.1695466447.git.christophe.jaillet@wanadoo.fr>

On Sat, Sep 23, 2023 at 12:54:24PM +0200, Christophe JAILLET wrote:
> In order to teach the compiler that 'hs_ep->name' will never be truncated,
> we need to tell it that 'epnum' is not negative.
> 
> 'epnum' comes from in a 'for' loop in dwc2_gadget_init(), starting at 0
> and ending at 255. (hsotg->num_of_eps is a char)
> 
> When building with W=1, this fixes the following warnings:
> 
>   drivers/usb/dwc2/gadget.c: In function ‘dwc2_hsotg_initep’:
>   drivers/usb/dwc2/gadget.c:4804:55: error: ‘%d’ directive output may be truncated writing between 1 and 11 bytes into a region of size 8 [-Werror=format-truncation=]
>    4804 |         snprintf(hs_ep->name, sizeof(hs_ep->name), "ep%d%s", epnum, dir);
>         |                                                       ^~
>   drivers/usb/dwc2/gadget.c:4804:52: note: directive argument in the range [-2147483645, 255]
>    4804 |         snprintf(hs_ep->name, sizeof(hs_ep->name), "ep%d%s", epnum, dir);
>         |                                                    ^~~~~~~~
>   drivers/usb/dwc2/gadget.c:4804:9: note: ‘snprintf’ output between 6 and 17 bytes into a destination of size 10
>    4804 |         snprintf(hs_ep->name, sizeof(hs_ep->name), "ep%d%s", epnum, dir);
>         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Fixes: 5b7d70c6dbf2 ("USB: Gadget driver for Samsung HS/OtG block")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Looks like the kernel test robot didn't like this one :(

