Return-Path: <linux-usb+bounces-1202-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 301E87BBB03
	for <lists+linux-usb@lfdr.de>; Fri,  6 Oct 2023 16:59:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 602611C20A6B
	for <lists+linux-usb@lfdr.de>; Fri,  6 Oct 2023 14:59:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02CD01CA9A;
	Fri,  6 Oct 2023 14:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="WxXjRL2I"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4123526E3C
	for <linux-usb@vger.kernel.org>; Fri,  6 Oct 2023 14:59:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55E65C43215;
	Fri,  6 Oct 2023 14:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1696604351;
	bh=jPD7LD0nZ0fW171kWWlLz2f5hqXrbFlaGKo9bdgLi7g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WxXjRL2IJEL9IaVcm+SLzhrboLT09GWXXrcbWuGPGFW5AlZ954cKwuNyNwaoKKq18
	 k7l0Ub8zrNbe+a5eUx9qCyl0kU5H25lzN89kEcQ5CmyOqEXyiwOh1UkLopOZvQYCei
	 FdwLJOERhDDdho140LyZ0jxtVn+UiwTdHNhzVcCg=
Date: Fri, 6 Oct 2023 16:59:08 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Hardik Gajjar <hgajjar@de.adit-jv.com>
Cc: s.hauer@pengutronix.de, jonathanh@nvidia.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, quic_linyyuan@quicinc.com,
	paul@crapouillou.net, quic_eserrao@quicinc.com,
	erosca@de.adit-jv.com
Subject: Re: [PATCH v2] usb: gadget: u_ether: Replace netif_stop_queue with
 netif_device_detach
Message-ID: <2023100657-immovably-bungee-f3a6@gregkh>
References: <20231006141231.7220-1-hgajjar@de.adit-jv.com>
 <20231006145332.8739-1-hgajjar@de.adit-jv.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231006145332.8739-1-hgajjar@de.adit-jv.com>

On Fri, Oct 06, 2023 at 04:53:32PM +0200, Hardik Gajjar wrote:
> This patch replaces the usage of netif_stop_queue with netif_device_detach
> in the u_ether driver. The netif_device_detach function not only stops all
> tx queues by calling netif_tx_stop_all_queues but also marks the device as
> removed by clearing the __LINK_STATE_PRESENT bit.
> 
> This change helps notify user space about the disconnection of the device
> more effectively, compared to netif_stop_queue, which only stops a single
> transmit queue.
> 
> Changes since version 1:
> 	- Correct Singed-off user name and e-mail

Nit, this goes below the --- line :(

