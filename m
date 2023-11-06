Return-Path: <linux-usb+bounces-2572-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 576217E1EA7
	for <lists+linux-usb@lfdr.de>; Mon,  6 Nov 2023 11:41:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 86C3C1C20AC6
	for <lists+linux-usb@lfdr.de>; Mon,  6 Nov 2023 10:41:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14B4416432;
	Mon,  6 Nov 2023 10:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QHr3gpay"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D6B1429F
	for <linux-usb@vger.kernel.org>; Mon,  6 Nov 2023 10:41:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC3C9C433CA;
	Mon,  6 Nov 2023 10:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699267299;
	bh=lk8OemT9/Tgr+wb+H9H8Ru9jGjmNq1ECVgVrgWwjRKI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QHr3gpay05l0pR9JDb6GN4xWET2ibO4tePjLzVjoy7VBgkofIN/GYBk20sRJO8v4H
	 4kqwBlYtW6N9IyJtDRhdts7ZpvEhQBlEgVih8kdUfZLcpeYuYxj/fFIWGa6cHB/Kow
	 jl7Z9jzMn9oqsegxvKXAt0XQh8oKm83Bl6j+6zkJ2LKpGbsyMvUlq0UkNiEwB+0KGL
	 djZ9E/vIfSTuBHBEnst0GlNmJoeTb1Bd+cVNY3hPTa9YYzeXSphsyI8bKOHAhB2oAZ
	 f5LdWATM81YEfJurRJ41cRpmdK/5U90hJ+4IeL0H6luEQzqJZljHEZpsdWm7ausbci
	 WHXihgwy9zK7w==
Received: from johan by xi.lan with local (Exim 4.96)
	(envelope-from <johan@kernel.org>)
	id 1qzx3o-0007op-1L;
	Mon, 06 Nov 2023 11:42:25 +0100
Date: Mon, 6 Nov 2023 11:42:24 +0100
From: Johan Hovold <johan@kernel.org>
To: Stanley =?utf-8?B?Q2hhbmdb5piM6IKy5b63XQ==?= <stanley_chang@realtek.com>
Cc: Stefan Eichenberger <eichest@gmail.com>,
	Johan Hovold <johan+linaro@kernel.org>,
	Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>,
	Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH] USB: xhci-plat: fix legacy PHY double inity
Message-ID: <ZUjDEC9M7zTsXIRp@hovoldconsulting.com>
References: <20231103164323.14294-1-johan+linaro@kernel.org>
 <ZUY8cGrofUtPOMV8@eichest-laptop>
 <5a493e6fedb449bc93f83f31a682e5b9@realtek.com>
 <ZUi3hrDbseJbIsWZ@hovoldconsulting.com>
 <b2f3db01ad7d43dbbb8ee11cfd1346ea@realtek.com>
 <ZUi9dgnvBT5f6wzo@hovoldconsulting.com>
 <bafbd60ac8134a0782a7ee27c01971ea@realtek.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bafbd60ac8134a0782a7ee27c01971ea@realtek.com>

On Mon, Nov 06, 2023 at 10:37:06AM +0000, Stanley Chang[昌育德] wrote:

> > > I use drivers/usb/dwc3/core.c and drivers/usb/dwc3/dwc3-rtk.c I
> > > describe the PHY as generic and legacy PHY in device tree.
> > 
> > That's not right. You should just use the generic PHY binding for new platforms.
> > 
> > > Our driver needs the API base on a08799cf17c2 ("usb: phy: add usb phy
> > notify port status API").
> > > But generic PHY driver is not support this.
> > 
> > Yes, but you added that interface yourself, and that I think merging that was a
> > mistake.
> > 
> > We should not be building functionality on top of the legacy USB PHY
> > implementation which is stuck in some transitional limbo.
> > 
> > Apparently, your PHY drivers which were merged for 6.6 are the only users of
> > this interface, and there are no upstream devicetrees that use these PHYs.
> > 
> > I think we should revert this mess before we dig ourselves into an even deeper
> > hole.
> 
> This is an interim method, as the current generic PHY framework does
> not support special operations on USB PHY.

Then you need to add that.

You can't add a new interface which is broken by design and can't be
used unless you abuse the devicetree and describe your PHYs using *both*
the generic 'phy' property and the *deprecated* 'usb-phy' property.

That's just broken.

> Now the generic PHY can't instead USB PHY in this stage.
> For example,
> drivers/phy/ti/phy-twl4030-usb.c
> drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c
> drivers/phy/ti/phy-omap-usb2.c

These should be fixed as well eventually.

Johan

