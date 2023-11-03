Return-Path: <linux-usb+bounces-2501-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3311B7E06FE
	for <lists+linux-usb@lfdr.de>; Fri,  3 Nov 2023 17:49:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2E9F61C210E5
	for <lists+linux-usb@lfdr.de>; Fri,  3 Nov 2023 16:49:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 414F01D550;
	Fri,  3 Nov 2023 16:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lpgef1h5"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD9F22D62F
	for <linux-usb@vger.kernel.org>; Fri,  3 Nov 2023 16:49:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8075FC433C8;
	Fri,  3 Nov 2023 16:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699030148;
	bh=bK5szjYqnKzg2e5qA8twFbx9jLZIyCqzgYrb3IVrWP8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lpgef1h5heeZxl7akPuloh05Pkugrt9CKExPytwzEz429kPlTZ9k0BVu8QxL5jGC6
	 eGCYGLSo7mjebJYpyyObu/mvFdQgT12GOPwtaAJ11sz3ATSprhSiy6ubbvWerOkZ+z
	 cF+d6S00MATvn1cBGAJua0fgMUVyXJl16r/+X+0rCOubSbm+HooOtbni0SSdCtSFra
	 zm6o98+FC/tPWORf7T9XnrqU9OjdUdPkVgrsJ3ElN+ILRa8+VN6sHT00OWSJclgIJu
	 WqqBrgy4G+MrqAjyjWxJ6pNOb9nv8hCSoAtJHyZLgrkqwsCKd4EjztHUbtPd9Sa0bq
	 6kRL25sjJrTPQ==
Received: from johan by xi.lan with local (Exim 4.96)
	(envelope-from <johan@kernel.org>)
	id 1qyxMf-0003lj-16;
	Fri, 03 Nov 2023 17:49:45 +0100
Date: Fri, 3 Nov 2023 17:49:45 +0100
From: Johan Hovold <johan@kernel.org>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Felipe Balbi <balbi@ti.com>, Kishon Vijay Abraham I <kishon@ti.com>,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: Re: [PATCH v1] USB: dwc3: only call usb_phy_set_suspend in
 suspend/resume
Message-ID: <ZUUkqeKFZmsubxu5@hovoldconsulting.com>
References: <20231103102236.13656-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231103102236.13656-1-francesco@dolcini.it>

On Fri, Nov 03, 2023 at 11:22:36AM +0100, Francesco Dolcini wrote:
> From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> 
> Currently we have the following two call chains:
> dwc3_probe -> dwc3_core_init -> dwc3_phy_init -> usb_phy_init
> dwc3_probe -> dwc3_core_init -> dwc3_phy_power_on -> usb_phy_set_suspend
> 
> If we look at phy-generic we see the following calls:
> usb_gen_phy_init -> regulator_enable
> usb_gen_phy_init -> clk_prepare_enable
> 
> If we call usb_phy_set_suspend we call the following in phy-generic:
> nop_set_suspend -> clk_prepare_enable
> and we sent a patch to also call:
> nop_set_suspend -> regulator_enable
> 
> Because clk_prepare_enable and regulator_enable do reference counting we
> increased the reference counter of the clock and regulator to two. If we
> want to put the system into suspend we only decrease the reference
> counters by one and therefore the clock and regulator stay on.

No, this does not seem to be a correct description of the current
implementation.

The driver always calls both usb_phy_set_suspend() and
usb_phy_init()/usb_phy_shutdown() so those usage counters would still be
balanced (e.g. see dwc3_core_init() and dwc3_core_exit()).

> This change fixes it by not calling usb_phy_set_suspend in
> dwc3_phy_power_on but only in dwc3_suspend_common.
 
>  static int dwc3_clk_enable(struct dwc3 *dwc)
> @@ -2018,6 +2009,9 @@ static int dwc3_suspend_common(struct dwc3 *dwc, pm_message_t msg)
>  		break;
>  	}
>  
> +	usb_phy_set_suspend(dwc->usb2_phy, 1);
> +	usb_phy_set_suspend(dwc->usb3_phy, 1);

This is also broken as you're now calling usb_phy_set_suspend() in paths
that do not expect it as well as after usb_phy_shutdown() in case
dwc3_core_exit() was called above.

The suspend implementation in this driver is indeed messy and probably
not tested much. It seems the expectation for the legacy PHY
implementation is to only call init()/shutdown() at probe/remove and
then use set_suspend() to handle the suspend state. The dwc3 driver is
for some reason calling both set_suspend() and shutdown() which should
not be needed. Care needs to be taken so that no one has started relying
on this behaviour if you want to change this.

When reviewing the driver I did find a bug in the xhci-plat driver which
is likely the cause for the imbalance you're seeing. I just sent a fix
here in case you want to give it a try:

	https://lore.kernel.org/lkml/20231103164323.14294-1-johan+linaro@kernel.org/

But, also, why are you using legacy PHYs? Which platform is this for?

Johan

