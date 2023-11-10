Return-Path: <linux-usb+bounces-2767-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F3CC37E79D7
	for <lists+linux-usb@lfdr.de>; Fri, 10 Nov 2023 08:47:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9439FB20FBD
	for <lists+linux-usb@lfdr.de>; Fri, 10 Nov 2023 07:47:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 151376FCD;
	Fri, 10 Nov 2023 07:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uBU4iTMx"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A036AA5
	for <linux-usb@vger.kernel.org>; Fri, 10 Nov 2023 07:47:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2439C433C8;
	Fri, 10 Nov 2023 07:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699602467;
	bh=eNPMLFSId0QrwBhmYQ8Tp1C473yK+iDSdTu+mEwhyjU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uBU4iTMx3DS8Yyjn8ht5Nc7BRgS29IkwuFzg6YNSP2o4BrnhmSc01w8MBEnT6S4VK
	 1N2CDcaE6LrEyUUr7JcnFBKeVX/svtqbHnTGE4XGk5SVxmClSzIdLdyVmrjdRqXU7S
	 sQniXG+0zlJ99NLBjuAma7TZwP+NQco3D0OAevhz+Tg1oOdPwP1+Pt3bPaGnK5iQD+
	 N9ikgeH0NI/u4I4vTJSXzfAg2x3MT6T7xFrEYirFo4VEVFtq3c5kb8CMAIZZpEjOz3
	 YyYg1Kb8zbx4Zf405nRZWfzpo+5msTg3ZCfVlkJmhJ314c3IO2IFe2/UFUN3PWHaPq
	 3HBR2KDdmdREQ==
Received: from johan by theta with local (Exim 4.96.2)
	(envelope-from <johan@kernel.org>)
	id 1r1MEv-0000TU-2N;
	Fri, 10 Nov 2023 08:47:41 +0100
Date: Fri, 10 Nov 2023 08:47:41 +0100
From: Johan Hovold <johan@kernel.org>
To: Stanley Chang <stanley_chang@realtek.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh@kernel.org>, Jinjie Ruan <ruanjinjie@huawei.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Yang Yingliang <yangyingliang@huawei.com>,
	Roy Luo <royluo@google.com>,
	Ricardo =?utf-8?Q?Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Flavio Suligoi <f.suligoi@asem.it>, linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 2/4] phy: realtek: usb: add new driver for the Realtek
 RTD SoC USB 2.0 PHY
Message-ID: <ZU3gHcugq9FxBG4P@hovoldconsulting.com>
References: <20231110054738.23515-1-stanley_chang@realtek.com>
 <20231110054738.23515-2-stanley_chang@realtek.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231110054738.23515-2-stanley_chang@realtek.com>

On Fri, Nov 10, 2023 at 01:45:13PM +0800, Stanley Chang wrote:
> Realtek DHC (digital home center) RTD SoCs support DWC3 XHCI USB
> controller. Added the driver to drive the USB 2.0 PHY transceivers.
> 
> Note: New driver,remove the port status notification on legacy USB PHY.
> Use the generic PHY to notify the usb device connect and disconnect.
> To avoid using these PHYs would require describing the very same
> PHY using both the generic "phy" property and the deprecated "usb-phy"
> property.
> 
> Signed-off-by: Stanley Chang <stanley_chang@realtek.com>
> ---
> v1 to v2 change:
>     rebase the driver to include the revert part on
>     7a784bcdd7e54f0599da3b2360e472238412623e
> v2 to v3 change:
>     remove MODULE_ALIAS

Don't send out a new version of a patch series immediately just to fix
something small like this.

In this case I'd suggest you wait at least until you've gotten feedback
on the new notification implementation.

Johan

