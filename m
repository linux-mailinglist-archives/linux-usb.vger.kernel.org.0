Return-Path: <linux-usb+bounces-1452-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF797C506F
	for <lists+linux-usb@lfdr.de>; Wed, 11 Oct 2023 12:44:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CE6031C20E99
	for <lists+linux-usb@lfdr.de>; Wed, 11 Oct 2023 10:44:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98D4B1097B;
	Wed, 11 Oct 2023 10:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XqW0yOyy"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5DD01078D
	for <linux-usb@vger.kernel.org>; Wed, 11 Oct 2023 10:44:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E74B4D7;
	Wed, 11 Oct 2023 03:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697021041; x=1728557041;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ipz21Xlmw/ON1nT/ixvE46/fPEfN4IYwwn+6e3cr5Ps=;
  b=XqW0yOyyNirvqT3nVk6d0jYwMIe8vJErPdVW7kAkzr0pgoF2unQ4VImT
   UvQGL0JrO7xUWX5Ro+iTJQJa4dCgMDLp6o3743NFyiaGLZ1p9rvS6sGbj
   0kgZ7o1iBkfRDGB4HpoouQGHnudO5oHTGl180QqeeJ1b5MglImUPV5Tqw
   Izzeig8Nbmwb1aN/QPtig92ir20UEEKOQp2Alb47drhLPlnG4V0OVb0LK
   FROmI9Fbeciik/0DFYs7fxmpXk0aYFUQimosTsr3ptz4StKcKPk6kCPTX
   3B51h1ZbOGpduVQGaocu5RLc9p+o0K1hio5uH++iBnBEXjaUZuxXTfHSG
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="387476637"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; 
   d="scan'208";a="387476637"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 03:44:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="703686099"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; 
   d="scan'208";a="703686099"
Received: from unknown (HELO smile.fi.intel.com) ([10.237.72.54])
  by orsmga003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 03:43:56 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC1)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1qqWgy-00000004b4y-3tkE;
	Wed, 11 Oct 2023 13:43:52 +0300
Date: Wed, 11 Oct 2023 13:43:52 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Wentong Wu <wentong.wu@intel.com>, gregkh@linuxfoundation.org,
	oneukum@suse.com, wsa@kernel.org, andi.shyti@linux.intel.com,
	broonie@kernel.org, bartosz.golaszewski@linaro.org,
	linus.walleij@linaro.org, linux-usb@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
	sakari.ailus@linux.intel.com, zhifeng.wang@intel.com,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v20 1/4] usb: Add support for Intel LJCA device
Message-ID: <ZSZ8aMAyncKvmLga@smile.fi.intel.com>
References: <1696833205-16716-1-git-send-email-wentong.wu@intel.com>
 <1696833205-16716-2-git-send-email-wentong.wu@intel.com>
 <ZSZ3IPgLk7uC5UGI@smile.fi.intel.com>
 <6a87b43a-0648-28d4-6c69-e0f684e44eb6@redhat.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a87b43a-0648-28d4-6c69-e0f684e44eb6@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Wed, Oct 11, 2023 at 12:37:51PM +0200, Hans de Goede wrote:
> On 10/11/23 12:21, Andy Shevchenko wrote:
> > On Mon, Oct 09, 2023 at 02:33:22PM +0800, Wentong Wu wrote:

...

> TL;DR: there is nothing to worry about here, but the commit message
> should be updated to reflect reality.

I have just sent the similar worry, but thanks that you have checked
the code and we don't need to worry too much.

-- 
With Best Regards,
Andy Shevchenko



