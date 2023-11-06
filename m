Return-Path: <linux-usb+bounces-2619-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3C17E3570
	for <lists+linux-usb@lfdr.de>; Tue,  7 Nov 2023 08:01:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DAE99B20C6F
	for <lists+linux-usb@lfdr.de>; Tue,  7 Nov 2023 07:01:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70E73C2CC;
	Tue,  7 Nov 2023 07:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="bvO/Z76c"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD570C15D
	for <linux-usb@vger.kernel.org>; Tue,  7 Nov 2023 07:01:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0F91C433C7;
	Tue,  7 Nov 2023 07:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1699340480;
	bh=PwZNo4H0+xJc5t0ME1zU4siHPtjo0n0x/hgKoJJp1Wg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bvO/Z76czVdugwXRRrUFDNfBthP/D12rTYBLpKCN+UGrmf+R9/mGKKmmUbRXr8hSw
	 e/REna7XTvcgMxQnjIiAyL/boIYfNbHSVH3EaVydchap1uEDHzUlYdXqML8gSasN2z
	 8Fa1rtL5eBYNPnr85IdktQc1KkR1ZXojJhdrKo/c=
Date: Mon, 6 Nov 2023 14:48:48 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Johan Hovold <johan@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Stanley Chang <stanley_chang@realtek.com>,
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH 0/3] Revert "usb: phy: add usb phy notify port status API"
Message-ID: <2023110636-illusive-widow-8c95@gregkh>
References: <20231106110654.31090-1-johan+linaro@kernel.org>
 <2023110623-pointing-stump-643d@gregkh>
 <ZUjNLj-sKBogTKcd@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZUjNLj-sKBogTKcd@hovoldconsulting.com>

On Mon, Nov 06, 2023 at 12:25:34PM +0100, Johan Hovold wrote:
> On Mon, Nov 06, 2023 at 12:15:59PM +0100, Greg Kroah-Hartman wrote:
> > On Mon, Nov 06, 2023 at 12:06:51PM +0100, Johan Hovold wrote:
> > > The recently added Realtek PHY drivers depend on the new port status
> > > notification mechanism which was built on the deprecated USB PHY
> > > implementation and devicetree binding.
> > > 
> > > Specifically, using these PHYs would require describing the very same
> > > PHY using both the generic "phy" property and the deprecated "usb-phy"
> > > property which is clearly wrong.
> > > 
> > > We should not be building new functionality on top of the legacy USB PHY
> > > implementation even if it is currently stuck in some kind of
> > > transitional limbo.
> > > 
> > > Revert the new Realtek PHY drivers for now so that the port status
> > > notification interface can be reverted and replaced before we dig
> > > ourselves into an even deeper hole with this PHY mess.
> > > 
> > > Note that there are no upstream users of these PHYs and the drivers were
> > > only included in 6.6 so there should still be time to undo this.
> > 
> > No users of these phy drivers yet?  Why were they added?
> 
> The devicetree bindings were also merged in 6.6 (and are left in place),
> but there are no devicetrees that actually use these new bindings in
> mainline yet.
> 
> > > Preferably these should go in through Greg's tree for 6.7-rc1.
> > 
> > I'll be glad to take this if I can get an ack for it.
> 
> They went in through your tree, but note that you may now get a conflict
> with 
> 
> 	7e909370a5cd ("phy: realtek: Replace of_device.h with explicit includes")
> 
> in the phy tree.

I fixed it up by hand, should be good now, thanks.

greg k-h

