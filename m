Return-Path: <linux-usb+bounces-269-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A3A7A3536
	for <lists+linux-usb@lfdr.de>; Sun, 17 Sep 2023 12:42:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1237A281478
	for <lists+linux-usb@lfdr.de>; Sun, 17 Sep 2023 10:42:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97E64256D;
	Sun, 17 Sep 2023 10:42:32 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73CA11848
	for <linux-usb@vger.kernel.org>; Sun, 17 Sep 2023 10:42:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3296DC433C8;
	Sun, 17 Sep 2023 10:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1694947352;
	bh=uSfg3tER6+j89axfxvuCcnowTaPBQHQ2GJjcyGYRnkA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IXk8MWP8NSwV8W1RA0pAxzE5jt3FFUT6pZSAfJdmJ8naj/ptEj63YJ/JbgSGEklU6
	 pVUtYck8vQukBf9Y4pqXYYFIEfA9oOb7/XQIoSrTTCniEoXKRYPR9+zzzQEu0/iAd7
	 vgwaDP2b2YvQC8qHHcTV37GdaDotSpi014kpUET4=
Date: Sun, 17 Sep 2023 12:42:24 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Wentong Wu <wentong.wu@intel.com>
Cc: arnd@arndb.de, mka@chromium.org, oneukum@suse.com, lee@kernel.org,
	wsa@kernel.org, kfting@nuvoton.com, broonie@kernel.org,
	linus.walleij@linaro.org, hdegoede@redhat.com, maz@kernel.org,
	brgl@bgdev.pl, linux-usb@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-gpio@vger.kernel.org,
	andriy.shevchenko@linux.intel.com, heikki.krogerus@linux.intel.com,
	andi.shyti@linux.intel.com, sakari.ailus@linux.intel.com,
	bartosz.golaszewski@linaro.org, srinivas.pandruvada@intel.com,
	zhifeng.wang@intel.com
Subject: Re: [PATCH v19 0/4] Add Intel LJCA device driver
Message-ID: <2023091704-nape-coconut-af6c@gregkh>
References: <1694890416-14409-1-git-send-email-wentong.wu@intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1694890416-14409-1-git-send-email-wentong.wu@intel.com>

On Sun, Sep 17, 2023 at 02:53:32AM +0800, Wentong Wu wrote:
> Add driver for Intel La Jolla Cove Adapter (LJCA) device. This
> IO-expander adds additional functions to the host system such
> as GPIO, I2C and SPI with USB host interface. We add 4 drivers
> to support this device: a USB driver, a GPIO chip driver, a I2C
> controller driver and a SPI controller driver.
> 
> ---
> v19:
>  - add v17's change which v18 doesn't apply

I don't understand this changelog line at all, what do you mean?

> v18:
>  - rebase patch set on top of Linus' master branch (57d88e8a5974644039fbc47806bac7bb12025636)

Why?  What required this?

As Marc says, you are sending this way too often.  I'm going to move
this to the bottom of my pile and get to it in a week or so as with the
constant resends, there are way more changes that were sent before yours
that need to be reviewed.

thanks,

greg k-h

