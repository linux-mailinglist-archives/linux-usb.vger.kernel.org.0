Return-Path: <linux-usb+bounces-1952-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AC6497D07B9
	for <lists+linux-usb@lfdr.de>; Fri, 20 Oct 2023 07:42:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3BD1FB214B1
	for <lists+linux-usb@lfdr.de>; Fri, 20 Oct 2023 05:42:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CE2679C4;
	Fri, 20 Oct 2023 05:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="F6ZQzqxA"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF54CA43
	for <linux-usb@vger.kernel.org>; Fri, 20 Oct 2023 05:42:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79219C433C7;
	Fri, 20 Oct 2023 05:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1697780541;
	bh=8k3PE1NFkxj9wPhoBUIveRHmdpO2uZTZ7oZXhJJ6Oz0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F6ZQzqxAiich4MNbE8MgIacE8EJJRhs2C1AUg+gRv1RU28Yoksc5Z1JNxMgdlhWs0
	 QjvqiuG/9Vy9yekRWZhcAvZ3wLV7uCLtgx+WizeyZdgLO85cmcbzla+j9dAvikhurb
	 NcaF7Of6B1it3Ni9QmKTih1dqtbQLvnvKbPlS86o=
Date: Fri, 20 Oct 2023 07:42:17 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jayant Chowdhary <jchowdhary@google.com>
Cc: "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
	balbi@kernel.org,
	"kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	linux-kernel@vger.kernel.org,
	"arakesh@google.com" <arakesh@google.com>,
	"etalvala@google.com" <etalvala@google.com>
Subject: Re: [PATCH] usb:gadget:uvc: Add super speed plus descriptors
Message-ID: <2023102014-reference-diabetes-f859@gregkh>
References: <4ca94f99-fe07-49c2-adc7-84df519792f5@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4ca94f99-fe07-49c2-adc7-84df519792f5@google.com>

On Thu, Oct 19, 2023 at 03:39:44PM -0700, Jayant Chowdhary wrote:
> Currently the UVC gadget driver doesn't support super speed
> plus connections since it doesn't advertise super speed plus descriptors.
> This patch re-uses the super speed descriptors for super-speed plus.
> As a result, hosts can recognize gadget devices when using a super
> speed plus connection.
> 
> Signed-off-by: Jayant Chowdhary <jchowdhary@google.com>
> ---
>  drivers/usb/gadget/function/f_uvc.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)

As this is obviously a copy of a previously posted patch, why did you
not credit the original author?

thanks,

greg k-h

