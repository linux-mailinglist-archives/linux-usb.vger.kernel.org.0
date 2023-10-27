Return-Path: <linux-usb+bounces-2256-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 748AA7D954E
	for <lists+linux-usb@lfdr.de>; Fri, 27 Oct 2023 12:34:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 29C28B2145A
	for <lists+linux-usb@lfdr.de>; Fri, 27 Oct 2023 10:34:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BD2A15AF7;
	Fri, 27 Oct 2023 10:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="MCEu82v6"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A35891A71D
	for <linux-usb@vger.kernel.org>; Fri, 27 Oct 2023 10:34:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D7EBC433C7;
	Fri, 27 Oct 2023 10:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1698402867;
	bh=Z69Iak1OZ6khdmyqVFeCCZ5rvCZc39XumyIBgPwnBAU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MCEu82v6BBCEwSrCNS80JvJeUystIGiQ8ix7rtiXLbCusg9qF6O7EcrIybEj8pqT4
	 +hfdJ4WQKx4Iw24FnTgBSDPSaDT8WCM8FfRl8Vap0Sl3w31vViR2+wbp7tUUzMWwGv
	 HgMkLAiRo8YjNeN2FLJrOmbdnD29dZB+4ndKD9tk=
Date: Fri, 27 Oct 2023 12:34:24 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Frank Wang <frank.wang@rock-chips.com>
Cc: sebastian.reichel@collabora.com, linux@roeck-us.net,
	heikki.krogerus@linux.intel.com, heiko@sntech.de,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org, huangtao@rock-chips.com,
	william.wu@rock-chips.com, jianwei.zheng@rock-chips.com,
	yubing.zhang@rock-chips.com, wmc@rock-chips.com
Subject: Re: [PATCH v3] usb: typec: tcpm: add get max power support
Message-ID: <2023102711-candle-untitled-05a7@gregkh>
References: <20230322093120.8686-1-frank.wang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230322093120.8686-1-frank.wang@rock-chips.com>

On Wed, Mar 22, 2023 at 05:31:20PM +0800, Frank Wang wrote:
> Traverse fixed pdos to calculate the maximum power that the charger
> can provide, and it can be get by POWER_SUPPLY_PROP_INPUT_POWER_LIMIT
> property.
> 
> Signed-off-by: Frank Wang <frank.wang@rock-chips.com>
> ---
>  drivers/usb/typec/tcpm/tcpm.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)

What ever happened to this change?  Can you rebase and resubmit it
please?

thanks,

greg k-h

