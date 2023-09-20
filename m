Return-Path: <linux-usb+bounces-413-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E857F7A7790
	for <lists+linux-usb@lfdr.de>; Wed, 20 Sep 2023 11:31:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0935D1C20EB5
	for <lists+linux-usb@lfdr.de>; Wed, 20 Sep 2023 09:31:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E34EF15AF0;
	Wed, 20 Sep 2023 09:27:15 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D5DF15AF9
	for <linux-usb@vger.kernel.org>; Wed, 20 Sep 2023 09:27:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1D03C433C7;
	Wed, 20 Sep 2023 09:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1695202035;
	bh=184LulnXChUk8vYVE1Xgq+y+IncgcGuIQLYNhg9Uo4I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nuMwjWb9UoczeKt9iQdhK2HJwX2Ifa9zCGatw1QkfkZq18FppfyK8VEwe8uUpJxh3
	 LOFT4lmWvNL5f3rrAKZyAnQ7T0w2hRMKoXrFQqII82u+KiuaZL1C8KQ4LQA7EW4/t4
	 d6Niqp5L7ecCBNGEi9kzw9Rqsi1ESrPeCYRXQLiM=
Date: Wed, 20 Sep 2023 11:27:13 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Xiaolei Wang <xiaolei.wang@windriver.com>
Cc: peter.chen@kernel.org, pawell@cadence.com, pavel@denx.de,
	rogerq@kernel.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: cdns3: Modify the return value of
 cdns_set_active () to void when CONFIG_PM_SLEEP is disabled
Message-ID: <2023092039-helping-unselect-adb9@gregkh>
References: <20230920082856.1782284-1-xiaolei.wang@windriver.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230920082856.1782284-1-xiaolei.wang@windriver.com>

On Wed, Sep 20, 2023 at 04:28:56PM +0800, Xiaolei Wang wrote:
> The return type of cdns_set_active () is inconsistent
> depending on whether CONFIG_PM_SLEEP is enabled, so the
> return value is modified to void type.
> 
> Reported-by: Pavel Machek <pavel@denx.de>
> Closes: https://lore.kernel.org/all/ZP7lIKUzD68XA91j@duo.ucw.cz/
> Fixes: 2319b9c87fe2 ("usb: cdns3: Put the cdns set active part outside the spin lock")
> Cc: stable@vger.kernel.org
> Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
> Reviewed-by: Pavel Machek <pavel@denx.de>
> Reviewed-by: Roger Quadros <rogerq@kernel.org>
> 
> v2:
>  * Add Cc: stable@vger.kernel.org

The changes here need to go below the --- line as the documentation
asks.  Putting it here will just break things :(

v3 please?

thanks,

greg k-h

