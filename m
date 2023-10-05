Return-Path: <linux-usb+bounces-1136-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B01F7B9DF9
	for <lists+linux-usb@lfdr.de>; Thu,  5 Oct 2023 15:59:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id C7439282052
	for <lists+linux-usb@lfdr.de>; Thu,  5 Oct 2023 13:59:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BCE7273CE;
	Thu,  5 Oct 2023 13:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Pv/AR6Jk"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7E21266D0
	for <linux-usb@vger.kernel.org>; Thu,  5 Oct 2023 13:59:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36419C116B6;
	Thu,  5 Oct 2023 13:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1696514369;
	bh=yjYdr6NMBB3N4qwB1LomEzfwhBRh5oJTamUwrfSI7OE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pv/AR6JkSGeFIqnlvX/drtjCXMOJLu7iGRRabEsczdjGjHPumeaL14UkUNumGcccb
	 IZfT7lvUQiSii+Qj50KUaQeE1RHc0J/khpg/N1wnp1QN6m70mZxWtWP6ye+vG4aXM9
	 kd3IHzcf78Vb+ZTlUNm0tg3hWRCbruWm8prlVHPU=
Date: Thu, 5 Oct 2023 15:59:26 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Zhang Shurong <zhang_shurong@foxmail.com>
Cc: Thinh.Nguyen@synopsys.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: dwc3: fix possible object reference leak
Message-ID: <2023100512-crayon-prowess-0f27@gregkh>
References: <tencent_6BA8EA125537CBB5D65B05605E1E960AA708@qq.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_6BA8EA125537CBB5D65B05605E1E960AA708@qq.com>

On Thu, Oct 05, 2023 at 09:49:46PM +0800, Zhang Shurong wrote:
> The of_find_device_by_node takes a reference to the struct device
> when find the match device,we should release it when fail.
> 
> Fix it by calling by calling platform_device_put when error returns.
> 
> Signed-off-by: Zhang Shurong <zhang_shurong@foxmail.com>
> ---

What commit id does this fix?

And how did you find this?  How was it tested?

thanks,

greg k-h

