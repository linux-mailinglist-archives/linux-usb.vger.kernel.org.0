Return-Path: <linux-usb+bounces-703-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF567B1C67
	for <lists+linux-usb@lfdr.de>; Thu, 28 Sep 2023 14:29:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by ny.mirrors.kernel.org (Postfix) with ESMTP id 3EDB91C20B1E
	for <lists+linux-usb@lfdr.de>; Thu, 28 Sep 2023 12:29:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3506238DE1;
	Thu, 28 Sep 2023 12:29:08 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FDC42F2B
	for <linux-usb@vger.kernel.org>; Thu, 28 Sep 2023 12:29:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9926F199;
	Thu, 28 Sep 2023 05:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695904143; x=1727440143;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0KYhwDYEnO+BmRoWwn3CeYFTmyTlo/woYGLWaN3nURk=;
  b=Q850mc82TZZaiEaXD7ZkkXhymQdWPcCm/hzQ5yFXufYAFLPr4JnvibQT
   3Re5v/NumOGDv407ljnkEaEiNeYhBrJwHPg1OF5gU1cZEHwx9ztiajTSq
   InOKaipnaNTU/KH435fgXeDTpWn1RitE7+1V5z7KY/4mAatTzswbZODoL
   gS/D3+rTso/5Lc5cFBdqNFPhZqD1XOa2f21Kr1wzG12GLFuUQ2XiRxj6a
   i9m5Dc1Bmqb6e1GzK/ZQgXzGTYy8xCOTO2x8slrVNVoT1+bmX+5j2OCDf
   3iOM4CmT/dUriijDJvEUTfPZQ7bAR6TQehZBIUS6v16q69ZXQnPn6G8wR
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="362287057"
X-IronPort-AV: E=Sophos;i="6.03,184,1694761200"; 
   d="scan'208";a="362287057"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2023 05:29:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="743049082"
X-IronPort-AV: E=Sophos;i="6.03,184,1694761200"; 
   d="scan'208";a="743049082"
Received: from mnazleas-mobl.gar.corp.intel.com (HELO intel.com) ([10.213.37.197])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2023 05:28:47 -0700
Date: Thu, 28 Sep 2023 14:28:41 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Oliver Neukum <oneukum@suse.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Wentong Wu <wentong.wu@intel.com>, arnd@arndb.de, mka@chromium.org,
	lee@kernel.org, wsa@kernel.org, kfting@nuvoton.com,
	broonie@kernel.org, linus.walleij@linaro.org, maz@kernel.org,
	brgl@bgdev.pl, linux-usb@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-gpio@vger.kernel.org,
	andriy.shevchenko@linux.intel.com, heikki.krogerus@linux.intel.com,
	andi.shyti@linux.intel.com, sakari.ailus@linux.intel.com,
	bartosz.golaszewski@linaro.org, srinivas.pandruvada@intel.com,
	zhifeng.wang@intel.com
Subject: Re: [PATCH v19 0/4] Add Intel LJCA device driver
Message-ID: <ZRVxedVoCetvqGm3@ashyti-mobl2.lan>
References: <1694890416-14409-1-git-send-email-wentong.wu@intel.com>
 <2023091704-nape-coconut-af6c@gregkh>
 <f576c346-db6c-dded-1502-c87d5e58fa39@redhat.com>
 <95ce1e2f-eb60-46fc-bced-06b8a150cbfb@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <95ce1e2f-eb60-46fc-bced-06b8a150cbfb@suse.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Hi,

On Thu, Sep 28, 2023 at 12:18:50PM +0200, Oliver Neukum wrote:
> On 17.09.23 13:26, Hans de Goede wrote:
> > Note I did not ask for a new version to be send right away, but
> > I'm afraid there has been a bit of miscommunication and instead
> > of rebasing the next version based on further review Wentong has
> > send out a new rebased version immediately, sorry about that.
> 
> Hi,
> 
> what to do now? It's been ten days.
> I am sure this driver has been very thoroughly reviewed by now.
> We are dragging this out. Do we want the developer to do another release
> or do we ask Greg to take it as is?
> This is becoming almost comical, but that is not what we want driver
> submission to be.
> 
> As far as I am concerned on the USB side everything is fine now.
> Hans? Greg?

i2c is also good to go and the rest looks good, as well. I have
some concerns on patch 4 that looks like a mixture of many random
things.

Andi

