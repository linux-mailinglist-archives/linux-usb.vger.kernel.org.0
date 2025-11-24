Return-Path: <linux-usb+bounces-30847-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 35342C7F27E
	for <lists+linux-usb@lfdr.de>; Mon, 24 Nov 2025 08:10:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 90168343C11
	for <lists+linux-usb@lfdr.de>; Mon, 24 Nov 2025 07:10:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BB362E1744;
	Mon, 24 Nov 2025 07:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="jn8gVZ0o"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF43C2EA;
	Mon, 24 Nov 2025 07:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763968238; cv=none; b=f7PA5O3e56lNdMmVxxFGnjsXojw2gG0K1hwvpYC7nYsEXuAU5t9nBLWie68c7S2CXGNLBCf2MUdMaFQOFWrjrVcyeeR5RzyK4YjMLCWLBDUMAEAMTYJkeNgQRI3uMhPNqsyqpUPmAkr8z/Ofs0RKw/LOPf7448uPt2syaW9Voxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763968238; c=relaxed/simple;
	bh=+YCaXkWU9YkNV0FRWVSw1NN872qKLHgrqDXqtDa6dJI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QVcrA7oErvaLsKBIzn5gft7Ke48Qqa079PNAC+8XNL10KbXCagO0EPQGsTLZYkpP9ij3BoXnNiMcFsbiEcVqFNC7mHUH1mZRWCTxMTq34ftBy0fQohUlLxGILPdE+5uTIDn6nlgHWRLmmqIQ93nYkarCPjfAdNobJxh/VwUdBiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=jn8gVZ0o; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62B46C4CEF1;
	Mon, 24 Nov 2025 07:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1763968237;
	bh=+YCaXkWU9YkNV0FRWVSw1NN872qKLHgrqDXqtDa6dJI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jn8gVZ0of5w9KSW/6XhTWgtPBbKeXjYsy1Tz7/knQXFS2NI1LeljWM4ESysUJV1fi
	 iM9S79mQ5WVSRrpzSFjw6zAsnP6v7VF2erwC/MmnM6UablSJzgwywhIQpLl+T3Wsdf
	 OHRxeObue89UUtbgEqb6NGnyZNBmz8pkePLuqF5A=
Date: Mon, 24 Nov 2025 08:10:33 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: Chaoyi Chen <kernel@airkyi.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Peter Chen <hzpeterchen@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Yubing Zhang <yubing.zhang@rock-chips.com>,
	Frank Wang <frank.wang@rock-chips.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Amit Sunil Dhamne <amitsd@google.com>,
	Dragan Simic <dsimic@manjaro.org>, Johan Jonker <jbx6244@gmail.com>,
	Diederik de Haas <didi.debian@cknow.org>,
	Peter Robinson <pbrobinson@gmail.com>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v10 01/11] usb: typec: Add notifier functions
Message-ID: <2025112402-unopposed-polio-e6e9@gregkh>
References: <20251120022343.250-1-kernel@airkyi.com>
 <20251120022343.250-2-kernel@airkyi.com>
 <2025112102-laurel-mulch-58e4@gregkh>
 <462ad1bd-7eec-4f26-b383-96b049e14559@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <462ad1bd-7eec-4f26-b383-96b049e14559@rock-chips.com>

On Mon, Nov 24, 2025 at 09:40:03AM +0800, Chaoyi Chen wrote:
> Hi Greg,
> 
> On 11/21/2025 10:07 PM, Greg Kroah-Hartman wrote:
> > On Thu, Nov 20, 2025 at 10:23:33AM +0800, Chaoyi Chen wrote:
> > > From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> > > 
> > > Some other part of kernel may want to know the event of typec bus.
> > Be specific, WHAT part of the kernel will need to know this?
> 
> For now, it is DRM.

Then say this.

> > And why a new notifier, why not just use the existing notifiers that you
> > already have?  And what is this going to be used for?
> 
> We have discussed this before, but the current bus notifier cannot achieve the expected notification [0].
> 
> [0] https://lore.kernel.org/all/aPsuLREPS_FEV3DS@kuha.fi.intel.com/

Then you need to document the heck out of this in the changelog text.
But I'm still not quite understanding why the bus notifier does not work
here, as you only want this information if the usb device is bound to
the bus there, you do not want to know this if it did not complete.

That thread says you want this not "too late", but why?  What is the
problem there, and how will you handle your code getting loaded after
the typec code is loaded?  Notifier callbacks don't work for that
situation, right?

> > Notifiers are a pain, and should almost never be added.  Use real
> > function calls instead.
> 
> In v6, I used direct function calls, but had to switch to notifiers because couldn't resolve the dependencies between DRM and Type-C [1]. Do you have any good ideas? Thank you.

Only allow this DRM code to be built if typec code is enabled, do NOT
use a select, use a depends in the drm code.

thanks,

greg k-h

