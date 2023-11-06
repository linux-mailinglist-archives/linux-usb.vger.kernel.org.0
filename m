Return-Path: <linux-usb+bounces-2563-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2349B7E1BCF
	for <lists+linux-usb@lfdr.de>; Mon,  6 Nov 2023 09:20:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 534A01C209CD
	for <lists+linux-usb@lfdr.de>; Mon,  6 Nov 2023 08:20:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52E48FC1F;
	Mon,  6 Nov 2023 08:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lZIQMuJv"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1EF23C0F
	for <linux-usb@vger.kernel.org>; Mon,  6 Nov 2023 08:20:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19772C433C7;
	Mon,  6 Nov 2023 08:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699258804;
	bh=nPH/BnrNNKYu+SnYLgUUWF6lghiewNMl8ubSLajK9IM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lZIQMuJv3NM7DJO00UHZQll5WzsWNG2Gg4AjU1lM3QElF+mcuSYkt4W6dOkvN8AN9
	 r0x1iiDHpbuF26CFVKL6sq3G41WlTzyCgOWF9g2hp2l0k+sbbzd7sYgyBNDhXltvOv
	 EFPVGOlKSc8I05cEM6kAGZoX4hh6D6+92WkGUcOdwOnX9oXh6autCiM55zflO/6Yvi
	 6wjvOIHtVV609AD+hO3KrD+Gx6SdB1m5bx4CeOOUrmzkUt+dW1lKNWlsCrJxYAV/2p
	 ffPhrv1udeFM425zU0tG5gcJ05EgzST4v29c1WhdL2/3edgP6/dKEj5YWdGi6N6onB
	 DfDMNVBG56DLQ==
Received: from johan by xi.lan with local (Exim 4.96)
	(envelope-from <johan@kernel.org>)
	id 1qzuqm-0006gp-2p;
	Mon, 06 Nov 2023 09:20:48 +0100
Date: Mon, 6 Nov 2023 09:20:48 +0100
From: Johan Hovold <johan@kernel.org>
To: Stefan Eichenberger <stefan.eichenberger@toradex.com>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Felipe Balbi <balbi@ti.com>, Kishon Vijay Abraham I <kishon@ti.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: Re: [PATCH v1] USB: dwc3: only call usb_phy_set_suspend in
 suspend/resume
Message-ID: <ZUih4BJLkslLIMx5@hovoldconsulting.com>
References: <20231103102236.13656-1-francesco@dolcini.it>
 <ZUUkqeKFZmsubxu5@hovoldconsulting.com>
 <GV0P278MB0589921FFF5487D2F94D3FF2E8A4A@GV0P278MB0589.CHEP278.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <GV0P278MB0589921FFF5487D2F94D3FF2E8A4A@GV0P278MB0589.CHEP278.PROD.OUTLOOK.COM>

On Sat, Nov 04, 2023 at 11:51:22AM +0000, Stefan Eichenberger wrote:
> > From: Johan Hovold <johan@kernel.org>

> > When reviewing the driver I did find a bug in the xhci-plat driver which
> > is likely the cause for the imbalance you're seeing. I just sent a fix
> > here in case you want to give it a try:
> > 
> >         https://lore.kernel.org/lkml/20231103164323.14294-1-johan+linaro@kernel.org/
> 
> I tested it and it solves the issue we have. Thanks a lot for the fix!
> Before the use count for our regulator always went up to 2 and now it is
> 1 as expected.
> root@verdin-imx8mp-14773241:~# cat /sys/kernel/debug/regulator/CTRL_SLEEP_MOCI#/use_count
> 1
> 
> Also when going to suspend the regulator is turned off now. With the
> suspend patch applied from us the use count will be one more but
> everything still works as expected.

Thanks for testing.

> > But, also, why are you using legacy PHYs? Which platform is this for?
> 
> We have an external hub that we want to turn off when the system goes
> into suspend. For the i.MX8MM we use the phy-generic driver to achieve
> this. When I saw that the dwc3 driver would support the phy-generic via
> usb-phy, I thought we could use the same approach for the i.MX8MP and,
> in the future, the AM62. Maybe I misunderstood, would the right solution
> be to add a suspend function to the fsl,imx8mp-usb-phy driver and use
> vbus instead? But what would we do for the AM62, as it doesn't have a
> phy driver if I'm not mistaken.

That's not how the phy driver is supposed be used, and for on-board hubs
we now have:

	drivers/usb/misc/onboard_usb_hub.c

Have you tried using that one instead?

Johan

