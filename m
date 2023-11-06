Return-Path: <linux-usb+bounces-2580-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B005D7E1FE4
	for <lists+linux-usb@lfdr.de>; Mon,  6 Nov 2023 12:24:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5CD60281113
	for <lists+linux-usb@lfdr.de>; Mon,  6 Nov 2023 11:24:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 303AB18E24;
	Mon,  6 Nov 2023 11:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jeONS6MK"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A3018B1B
	for <linux-usb@vger.kernel.org>; Mon,  6 Nov 2023 11:24:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C904C433C7;
	Mon,  6 Nov 2023 11:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699269890;
	bh=YkEv2EZkQXxEy3IB6Z8hqcYQpz7j5UfPVeWSu4+609Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jeONS6MKrztCYfQmThd6yaLlb5+OCEHxmsTOZ+KR45Ud3a+PBLw6pMOFZ5hsQbmlV
	 4uuY3IhQsnAPAFc/f8jdHratGJr/+itpyLAm/ezOGJWrImzPzGv3jfNZTywYhuQ4iA
	 C8ThKcYvqJGeUPAbERSsji7RNHzQXUKg5mFtZPOfMf5SGdJCo7kjBiULomxIbFSwQP
	 skJt/nYedGg1CKPicr1RI5UAKvlnVQe17zHD3/LYI6Cc2N9+vefA/OCjKtzBY5X0NX
	 Uwld7gfbPsukoJ980zxHOeuZTHMPRvM8Kxyox2/NWSt32csFcSNRmDdHGjfv/eg3XP
	 urNhL4m7CwxmA==
Date: Mon, 6 Nov 2023 16:54:45 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Stanley Chang <stanley_chang@realtek.com>,
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH 0/3] Revert "usb: phy: add usb phy notify port status API"
Message-ID: <ZUjM/VEliT5c8H4C@matsya>
References: <20231106110654.31090-1-johan+linaro@kernel.org>
 <2023110623-pointing-stump-643d@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2023110623-pointing-stump-643d@gregkh>

On 06-11-23, 12:15, Greg Kroah-Hartman wrote:
> On Mon, Nov 06, 2023 at 12:06:51PM +0100, Johan Hovold wrote:
> > The recently added Realtek PHY drivers depend on the new port status
> > notification mechanism which was built on the deprecated USB PHY
> > implementation and devicetree binding.
> > 
> > Specifically, using these PHYs would require describing the very same
> > PHY using both the generic "phy" property and the deprecated "usb-phy"
> > property which is clearly wrong.
> > 
> > We should not be building new functionality on top of the legacy USB PHY
> > implementation even if it is currently stuck in some kind of
> > transitional limbo.
> > 
> > Revert the new Realtek PHY drivers for now so that the port status
> > notification interface can be reverted and replaced before we dig
> > ourselves into an even deeper hole with this PHY mess.
> > 
> > Note that there are no upstream users of these PHYs and the drivers were
> > only included in 6.6 so there should still be time to undo this.
> 
> No users of these phy drivers yet?  Why were they added?

Not sure why, they didnt go thru phy ss!

> 
> > Preferably these should go in through Greg's tree for 6.7-rc1.
> 
> I'll be glad to take this if I can get an ack for it.

Pls do drop this:

Acked-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod

