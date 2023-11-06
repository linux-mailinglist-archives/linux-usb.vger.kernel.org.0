Return-Path: <linux-usb+bounces-2578-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2651A7E1FBE
	for <lists+linux-usb@lfdr.de>; Mon,  6 Nov 2023 12:16:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 570611C20AD5
	for <lists+linux-usb@lfdr.de>; Mon,  6 Nov 2023 11:16:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7002418AE4;
	Mon,  6 Nov 2023 11:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="hBgTmseA"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1211156F4
	for <linux-usb@vger.kernel.org>; Mon,  6 Nov 2023 11:16:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4619C433C7;
	Mon,  6 Nov 2023 11:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1699269362;
	bh=SoF/S94flwFOY3+izonboY5kCu20hjnARgVVQs7pwYs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hBgTmseACJnpejjeiKlxL2lrdmM3YlClw3KVIkRk2RARTjlFKbNspctPy9Qk8OR2M
	 bZiXZouKCvxa8/nzLTRUCYvf89EhiRLs8sfI+v03v8peK7JSpcpYbWwMWY2rdC9MRU
	 Rkc9fw8K+TGX9dRxs6d41/kd5rL5nuGWn4jbDkIw=
Date: Mon, 6 Nov 2023 12:15:59 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Stanley Chang <stanley_chang@realtek.com>,
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH 0/3] Revert "usb: phy: add usb phy notify port status API"
Message-ID: <2023110623-pointing-stump-643d@gregkh>
References: <20231106110654.31090-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231106110654.31090-1-johan+linaro@kernel.org>

On Mon, Nov 06, 2023 at 12:06:51PM +0100, Johan Hovold wrote:
> The recently added Realtek PHY drivers depend on the new port status
> notification mechanism which was built on the deprecated USB PHY
> implementation and devicetree binding.
> 
> Specifically, using these PHYs would require describing the very same
> PHY using both the generic "phy" property and the deprecated "usb-phy"
> property which is clearly wrong.
> 
> We should not be building new functionality on top of the legacy USB PHY
> implementation even if it is currently stuck in some kind of
> transitional limbo.
> 
> Revert the new Realtek PHY drivers for now so that the port status
> notification interface can be reverted and replaced before we dig
> ourselves into an even deeper hole with this PHY mess.
> 
> Note that there are no upstream users of these PHYs and the drivers were
> only included in 6.6 so there should still be time to undo this.

No users of these phy drivers yet?  Why were they added?

> Preferably these should go in through Greg's tree for 6.7-rc1.

I'll be glad to take this if I can get an ack for it.

thanks,

greg k-h

