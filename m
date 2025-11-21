Return-Path: <linux-usb+bounces-30796-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C5EC9C7A1C2
	for <lists+linux-usb@lfdr.de>; Fri, 21 Nov 2025 15:19:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id 8FA182B6E8
	for <lists+linux-usb@lfdr.de>; Fri, 21 Nov 2025 14:19:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9788534D389;
	Fri, 21 Nov 2025 14:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="OGcTmQSf"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAAE234C9B5;
	Fri, 21 Nov 2025 14:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763734718; cv=none; b=ZAyLW9h52V6nfQw9ppiCufNZUo3Xi93Y8AqMEg8EDmdE4Pi7fOXxNMOObLeaktO/6pgCQWdXl0DMGSyHdyW0Z/1szHTDHWOXpYunkD5aq36HeZBSzfncd2THoiFCi48i+y1OFQbEBb6FRACliUZSRiUdcciWyV56BwFQvxn24sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763734718; c=relaxed/simple;
	bh=/ps74yrhCFbWWi/ubw8fCfzRCAKntOmoNTx1vsMerDQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GM4ppfO5LBpn7MbrG4/CxtjClJwWz6kv95y2QKHCgLi9BSbUiRb2+MLFB0nT9QN5J6abYvYXaO+8PJRw2ehdyFF4pPWfOdUtEEW9HwEGtgEgtA882/yHq1IoOAT+Ax7XZqGI7cQi1KPY6sPUZczseNeEfTOOLOX/tYzBvaIoYwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=OGcTmQSf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0A0CC4CEFB;
	Fri, 21 Nov 2025 14:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1763734717;
	bh=/ps74yrhCFbWWi/ubw8fCfzRCAKntOmoNTx1vsMerDQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OGcTmQSfjh4TKUz+J+VEEhlgvbvjQ09TxO8tHZfEjnB6WQdIeCIeG6knH3oECln+H
	 CW+XBYS+NLaUBseaNPRyk7itTziZolu23Uk34EE59/BYOPD+0aQDW+UoxkLk7mu8MV
	 7WE9TFOwN9+GDZZRYLMipUB0KUk1CPuwrZX53MO8=
Date: Fri, 21 Nov 2025 15:07:30 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Chaoyi Chen <kernel@airkyi.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
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
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Dragan Simic <dsimic@manjaro.org>, Johan Jonker <jbx6244@gmail.com>,
	Diederik de Haas <didi.debian@cknow.org>,
	Peter Robinson <pbrobinson@gmail.com>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v10 02/11] usb: typec: Export all typec device types
Message-ID: <2025112109-glacial-outmatch-add7@gregkh>
References: <20251120022343.250-1-kernel@airkyi.com>
 <20251120022343.250-3-kernel@airkyi.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251120022343.250-3-kernel@airkyi.com>

On Thu, Nov 20, 2025 at 10:23:34AM +0800, Chaoyi Chen wrote:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> 
> Export all typec device types for identification.

I do not understand what this means.  Who is going to use these symbols,
and for what exactly?

Be specific please.

thanks,

greg k-h

