Return-Path: <linux-usb+bounces-2570-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DFB57E1E1E
	for <lists+linux-usb@lfdr.de>; Mon,  6 Nov 2023 11:17:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 16CE1B20E2F
	for <lists+linux-usb@lfdr.de>; Mon,  6 Nov 2023 10:17:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10C5A17753;
	Mon,  6 Nov 2023 10:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HvFQJqqX"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ADD44422
	for <linux-usb@vger.kernel.org>; Mon,  6 Nov 2023 10:17:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1DD0C433C7;
	Mon,  6 Nov 2023 10:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699265864;
	bh=56DOiJvzIsi7Obpg+U9KIIzKzZZh+cCT26ywVwVbTOY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HvFQJqqXXbFNiDd5C6P5JCFywSMtm6Pj46+T/tXynkOwiEqTvTQEjXAZIYOUSOZe+
	 oD0NK50DCUi3tMjfBBBtYdBX0x/ijO1nfz7HSyrY2NPZziVBApDa7m+b327GVtcTZw
	 bSlXACgKr/DY6cld1ssbNpk8NufZ1JK1K5vvmGZ20jGOtt2OWfTc0x8wiG/bnandTY
	 yO4N+9WoaxutrHwe4WfIx83bVygi7EzYWM6VRwXP22qVwhc86W3tjziCnVDzzso6Vk
	 DKtBzq3CrklsTsuoP7d7qqOCITux1ETWuARc3tOP4HyYGZfp6iUDaf2qpEGYy/7RlF
	 0hsJh3TPmt0fQ==
Received: from johan by xi.lan with local (Exim 4.96)
	(envelope-from <johan@kernel.org>)
	id 1qzwgg-0007WT-0W;
	Mon, 06 Nov 2023 11:18:30 +0100
Date: Mon, 6 Nov 2023 11:18:30 +0100
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
Message-ID: <ZUi9dgnvBT5f6wzo@hovoldconsulting.com>
References: <20231103164323.14294-1-johan+linaro@kernel.org>
 <ZUY8cGrofUtPOMV8@eichest-laptop>
 <5a493e6fedb449bc93f83f31a682e5b9@realtek.com>
 <ZUi3hrDbseJbIsWZ@hovoldconsulting.com>
 <b2f3db01ad7d43dbbb8ee11cfd1346ea@realtek.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b2f3db01ad7d43dbbb8ee11cfd1346ea@realtek.com>

On Mon, Nov 06, 2023 at 10:08:24AM +0000, Stanley Chang[昌育德] wrote:
> > On Mon, Nov 06, 2023 at 06:53:23AM +0000, Stanley Chang[昌育德] wrote:

> > > I test the Realtek phy driver at drivers/phy/Realtek/phy-rtk-usb2.c again.
> > > But I can't get the phy in xhci.
> > 
> > > It is a dwc3 generic phy driver, and it is also a usb phy driver.
> > 
> > That sounds broken (i.e. to be relying on both frameworks), but indeed that
> > seems to be the current state of the generic and legacy USB PHY
> > implementations.
> > 
> > What a mess.
> 
> > > Base on you modified, I can't run on callback
> > > rtk_phy->phy.notify_port_status = rtk_phy_notify_port_status;
> > 
> > Which dwc3 driver are you using? Unless I'm missing something this would not
> > be an issue unless you are doing something crazy like describing the same PHY
> > twice in the devicetree (i.e. both as a generic and legacy PHY).
> 
> I use drivers/usb/dwc3/core.c and drivers/usb/dwc3/dwc3-rtk.c
> I describe the PHY as generic and legacy PHY in device tree.

That's not right. You should just use the generic PHY binding for new
platforms.

> Our driver needs the API base on a08799cf17c2 ("usb: phy: add usb phy notify port status API").
> But generic PHY driver is not support this.

Yes, but you added that interface yourself, and that I think merging
that was a mistake.

We should not be building functionality on top of the legacy USB PHY
implementation which is stuck in some transitional limbo.

Apparently, your PHY drivers which were merged for 6.6 are the only
users of this interface, and there are no upstream devicetrees that use
these PHYs.

I think we should revert this mess before we dig ourselves into an even
deeper hole.

Johan

