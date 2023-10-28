Return-Path: <linux-usb+bounces-2311-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 638257DA667
	for <lists+linux-usb@lfdr.de>; Sat, 28 Oct 2023 12:31:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 11FFE281360
	for <lists+linux-usb@lfdr.de>; Sat, 28 Oct 2023 10:31:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3847DDCD;
	Sat, 28 Oct 2023 10:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="xNv+sOq0"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C71514F95
	for <linux-usb@vger.kernel.org>; Sat, 28 Oct 2023 10:31:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77F0DC433C7;
	Sat, 28 Oct 2023 10:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1698489089;
	bh=DLYTQpYu8yL88OLQO/D4DceJpOvPWTl4um1X4nFwKS8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=xNv+sOq0/GmDJm+KZxMLh7Xk16HfEogFhS1Zkie3XunKSGmJwUtRQCOMnCE3iERKS
	 txvbPfyqZd835I4rQlmaRmb/GeTxKIv3mbduqD4T6c787Jiu+23E9MrfX252i/lBAh
	 V025nEy3EMdpIPACCCJ3/NrNVTplZJRjHnNdAO4k=
Date: Sat, 28 Oct 2023 12:31:26 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Avichal Rakesh <arakesh@google.com>
Cc: dan.scally@ideasonboard.com, etalvala@google.com, jchowdhary@google.com,
	laurent.pinchart@ideasonboard.com, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, m.grzeschik@pengutronix.de
Subject: Re: [PATCH v9 2/4] usb: gadget: uvc: Allocate uvc_requests one at a
 time
Message-ID: <2023102824-pegboard-sadness-29da@gregkh>
References: <73309396-3856-43a2-9a6f-81a40ed594db@google.com>
 <20231027201959.1869181-1-arakesh@google.com>
 <20231027201959.1869181-2-arakesh@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231027201959.1869181-2-arakesh@google.com>

On Fri, Oct 27, 2023 at 01:19:57PM -0700, Avichal Rakesh wrote:
>  	BUG_ON(video->req_size);
> +	BUG_ON(!list_empty(&video->ureqs));

Again, please do not add new BUG_ON() lines, the existing ones need to
be removed as well, but you can do that in later changes.  I can't take
changes that add new ones, sorry.

thanks,

greg k-h

