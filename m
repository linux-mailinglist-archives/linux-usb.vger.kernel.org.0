Return-Path: <linux-usb+bounces-31033-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B059C90E62
	for <lists+linux-usb@lfdr.de>; Fri, 28 Nov 2025 06:52:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A84FF35055F
	for <lists+linux-usb@lfdr.de>; Fri, 28 Nov 2025 05:52:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2A1629BD9A;
	Fri, 28 Nov 2025 05:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="DzlZDRzj"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F7C83B1B3;
	Fri, 28 Nov 2025 05:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764309120; cv=none; b=b4krqezZhdAseZz0R0a9cBj9kOX2Gb1gcz0l3MNMtVNBWQRm5zE9wG6umC1rMWM0E3/HVHpyANrh1UxJ++mf//fzxODUrXDconOQLhyAInt4g8YDlqr8oJ55ReBlut1wd+Xe7kfje4W9OqvTSRnCLZP0vk4zZuXFYIA9C5ANMA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764309120; c=relaxed/simple;
	bh=rOKG7zIx8s+aemPW1HN//6XrEdrArtLP34zx1Rj/gDo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JIal5m07FUpC3jgLLBPTu0U3P7jgqlfE0pFuXmrpMZuZ3oUWPZTdVyIgNtIczwaQs4H+cMyyYl9qPTEd6bLAGEQrrX0f9afzk6B5gRQSQBRj6eLpZnUE2rPkDoxpgCi+ESASTF8Cxg3qe8JVc0Clfvh7iuebXr1C4PSfoDIjVFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=DzlZDRzj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4075FC4CEF1;
	Fri, 28 Nov 2025 05:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1764309119;
	bh=rOKG7zIx8s+aemPW1HN//6XrEdrArtLP34zx1Rj/gDo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DzlZDRzjofDJMmkUGxSJ6QmjoNMH0U/JaI36kLkIseZ4OeEijKfp73hi5Qp4Z9WYU
	 uRBIauyxvs7tMH0ygcKt8vqm6G0jm8LuGP4sSvRENhhDnuaU05R3wSVex1URwXptA6
	 RV4WP0uyd4P+ND5o0qzZ+izh3gIwgTBRAcRLKWYU=
Date: Fri, 28 Nov 2025 06:51:56 +0100
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
Subject: Re: [PATCH v11 01/11] usb: typec: Set the bus also for the port and
 plug altmodes
Message-ID: <2025112846-italicize-handled-84ff@gregkh>
References: <20251128020405.90-1-kernel@airkyi.com>
 <20251128020405.90-2-kernel@airkyi.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251128020405.90-2-kernel@airkyi.com>

On Fri, Nov 28, 2025 at 10:03:55AM +0800, Chaoyi Chen wrote:
> From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> 
> The port and plug altmodes can't be bound to the altmode
> drivers because the altmode drivers are meant for partner
> communication using the VDM (vendor defined messages), but
> they can still be part of the bus. The bus will make sure
> that the normal bus notifications are available also with
> the port altmodes.
> 
> The previously used common device type for all alternate
> modes is replaced with separate dedicated device types for
> port, plug, and partner alternate modes.
> 
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> ---

You forgot to sign off on this :(

