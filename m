Return-Path: <linux-usb+bounces-2568-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 517197E1D85
	for <lists+linux-usb@lfdr.de>; Mon,  6 Nov 2023 10:52:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B2AE4B20E24
	for <lists+linux-usb@lfdr.de>; Mon,  6 Nov 2023 09:52:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B436D168DB;
	Mon,  6 Nov 2023 09:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T1m8kRbW"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 340EE168A6
	for <linux-usb@vger.kernel.org>; Mon,  6 Nov 2023 09:52:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9165C433C8;
	Mon,  6 Nov 2023 09:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699264345;
	bh=E4/L+LlFjPb2WwOsFdRog7Iics6lqBe9DHzObFZjQaQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T1m8kRbWZJn7jsk5RLHokR9jTw6xjTC7WAG3HzgnbzkI4rIjkbPbBe1xbsxTjC9ZG
	 bQD/OVdd2XWQfDScwPip752ciLnUAU9sTG4Nag+Il9hHmCU9wx92SirzX93CcAldqe
	 Q19vK4kZHziaINx+dpu1dRcaB6bAsL0Wdf4KQjiwM5zUMYDkShQatGQ5LnsMqpHI7E
	 666nsBMFCYw/naCOjZzJQbS2kPc6WDZs+la98bV6LFiUl6gf63uKDyxU8LB7HPsm8C
	 sG78jW0v8g6Kqw8NETlTVsiq0OCadkK47lKKpiQX3RgqkfhO4TpWxYkYUsiKenry3/
	 M0sR8hlOWTbGA==
Received: from johan by xi.lan with local (Exim 4.96)
	(envelope-from <johan@kernel.org>)
	id 1qzwIA-0007JB-2C;
	Mon, 06 Nov 2023 10:53:10 +0100
Date: Mon, 6 Nov 2023 10:53:10 +0100
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
Message-ID: <ZUi3hrDbseJbIsWZ@hovoldconsulting.com>
References: <20231103164323.14294-1-johan+linaro@kernel.org>
 <ZUY8cGrofUtPOMV8@eichest-laptop>
 <5a493e6fedb449bc93f83f31a682e5b9@realtek.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5a493e6fedb449bc93f83f31a682e5b9@realtek.com>

On Mon, Nov 06, 2023 at 06:53:23AM +0000, Stanley Chang[昌育德] wrote:
> > > On Fri, Nov 03, 2023 at 05:43:23PM +0100, Johan Hovold wrote:
> > > > Commits 7b8ef22ea547 ("usb: xhci: plat: Add USB phy support") and
> > > > 9134c1fd0503 ("usb: xhci: plat: Add USB 3.0 phy support") added
> > > > support for looking up legacy PHYs from the sysdev devicetree node
> > > > and initialising them.
> > > >
> > > > This broke drivers such as dwc3 which manages PHYs themself as the
> > > > PHYs would now be initialised twice, something which specifically
> > > > can lead to resources being left enabled during suspend (e.g. with
> > > > the usb_phy_generic PHY driver).
> > > >
> > > > As the dwc3 driver uses driver-name matching for the xhci platform
> > > > device, fix this by only looking up and initialising PHYs for
> > > > devices that have been matched using OF.

> > Tested-by: Stanley Chang <stanley_chang@realtek.com>

> I am sorry to notify you this patch is tested fail.

Hmm. Thanks for testing.

> I test the Realtek phy driver at drivers/phy/Realtek/phy-rtk-usb2.c again.
> But I can't get the phy in xhci.

> It is a dwc3 generic phy driver, and it is also a usb phy driver. 

That sounds broken (i.e. to be relying on both frameworks), but indeed
that seems to be the current state of the generic and legacy USB PHY
implementations.

What a mess.

> Base on you modified, I can't run on callback 
> rtk_phy->phy.notify_port_status = rtk_phy_notify_port_status;

Which dwc3 driver are you using? Unless I'm missing something this would
not be an issue unless you are doing something crazy like describing the
same PHY twice in the devicetree (i.e. both as a generic and legacy
PHY).

Apparently, there are no in-tree users of this particular realtek PHY so
I can't check the devicetree, but we do have other instances of such
abuse since at least a decade:

	6747caa76cab ("usb: phy: twl4030: use the new generic PHY framework")

And, yes, then this is sort of expected. The dwc3 driver has always
managed its own PHYs, but functionality has now been bolted on top so
that people may have started relying on it being managed *also* by xhci,
well at least for notifications like the one you just added:

	a08799cf17c2 ("usb: phy: add usb phy notify port status API")

Johan

