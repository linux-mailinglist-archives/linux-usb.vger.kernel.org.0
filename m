Return-Path: <linux-usb+bounces-1694-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 856307CB1BE
	for <lists+linux-usb@lfdr.de>; Mon, 16 Oct 2023 19:59:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0F424B20EF8
	for <lists+linux-usb@lfdr.de>; Mon, 16 Oct 2023 17:59:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D40F328CA;
	Mon, 16 Oct 2023 17:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="WLiBB2Pe"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C941F61D
	for <linux-usb@vger.kernel.org>; Mon, 16 Oct 2023 17:58:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6DCCC433C8;
	Mon, 16 Oct 2023 17:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1697479135;
	bh=nJdAek3aZycrgMRdKYtUObmKFrKh7KF0eBAThEzF7Ho=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WLiBB2PeXGi7MHr1L86TAUfGDT3KusatDeMchxwb3O1l72p3IXnbY5RLcp3gZ1rLh
	 WS0jHxrmNqgqAG16XmdgHtl3UHsXnswRR1XWE6PeK54gaygsOQCrUkJA7/q3kKMe98
	 2Ij+QrDEgkyeDDiyPFmLGwL6f/y2V9R3hBnaamD4=
Date: Mon, 16 Oct 2023 19:47:41 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Zhang Shurong <zhang_shurong@foxmail.com>
Cc: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: retimer: Check dev_set_name() return value
Message-ID: <2023101630-tiger-sizable-050f@gregkh>
References: <tencent_A06A37B6A0C0643DEC1524501525866FAC09@qq.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_A06A37B6A0C0643DEC1524501525866FAC09@qq.com>

On Sat, Oct 14, 2023 at 05:24:53PM +0800, Zhang Shurong wrote:
> It's possible that dev_set_name() returns -ENOMEM.
> We fix this by catching the error and handling it.
> 
> Fixes: ddaf8d96f93b ("usb: typec: Add support for retimers")
> Signed-off-by: Zhang Shurong <zhang_shurong@foxmail.com>
> ---
>  drivers/usb/typec/retimer.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)

How was this found?

How was this tested?

