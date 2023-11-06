Return-Path: <linux-usb+bounces-2579-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 601C47E1FE3
	for <lists+linux-usb@lfdr.de>; Mon,  6 Nov 2023 12:24:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8859DB20CF4
	for <lists+linux-usb@lfdr.de>; Mon,  6 Nov 2023 11:24:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44D4718B0B;
	Mon,  6 Nov 2023 11:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UaMZYp7a"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E5018043
	for <linux-usb@vger.kernel.org>; Mon,  6 Nov 2023 11:24:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6557CC433C8;
	Mon,  6 Nov 2023 11:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699269889;
	bh=mT8MYz/hw3XGXo1S9UTkvU5JcCYiuGY/Ocu62M/gtpI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UaMZYp7ab6jBn6ILZn9hw3b2gL485DAFB41hS97dDm1izt5S0I6BA91feLBww5KfU
	 UHRlCpgqrpxf+0b7IuAnsZ4e7FegOspROtjnCqJ+dPWQIMCQVc6SNkPlDPFeuaQcM7
	 Av0PaHoUECFwbHvFyqG0Ni87Q0mDj7J/4GvycRdjk50cLdYgg/vzGIguZlm80ZTNQ1
	 abaIrxQMShDsepBhk3DwE8BPI2ERLDO8ylOZN7sTQVmTXGEbYuw1AaQkcF6k3B+YRO
	 QGN0DBz3fPeajNqMmHgQFufBjia6QMygMKO1AiZ33ihL7VP15L6x2Ossn5wJLXdO7R
	 aBp65NDkbNIHQ==
Received: from johan by xi.lan with local (Exim 4.96)
	(envelope-from <johan@kernel.org>)
	id 1qzxja-00089V-2P;
	Mon, 06 Nov 2023 12:25:34 +0100
Date: Mon, 6 Nov 2023 12:25:34 +0100
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Johan Hovold <johan+linaro@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Stanley Chang <stanley_chang@realtek.com>,
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH 0/3] Revert "usb: phy: add usb phy notify port status API"
Message-ID: <ZUjNLj-sKBogTKcd@hovoldconsulting.com>
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

On Mon, Nov 06, 2023 at 12:15:59PM +0100, Greg Kroah-Hartman wrote:
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

The devicetree bindings were also merged in 6.6 (and are left in place),
but there are no devicetrees that actually use these new bindings in
mainline yet.

> > Preferably these should go in through Greg's tree for 6.7-rc1.
> 
> I'll be glad to take this if I can get an ack for it.

They went in through your tree, but note that you may now get a conflict
with 

	7e909370a5cd ("phy: realtek: Replace of_device.h with explicit includes")

in the phy tree.

Johan

