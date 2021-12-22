Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B54D947D396
	for <lists+linux-usb@lfdr.de>; Wed, 22 Dec 2021 15:21:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238457AbhLVOVQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Dec 2021 09:21:16 -0500
Received: from mga03.intel.com ([134.134.136.65]:10503 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S245742AbhLVOVF (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 22 Dec 2021 09:21:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640182865; x=1671718865;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Mt2CMclpG+04j3tI8xLSSPKoWRlisWxp6AWNGHB3zsw=;
  b=BEwbILft0JcppJimwlOixBbBsHvYWeVk/DP6bvWTnbP8Iu72Z/dB/GVA
   JK972CFNk+Ydl5Q1xyeqJwb7PxV+skxBumEC0PYvzyim/WLn1WBIQCaRx
   J9rjLxbk0PasV6OjiEE7hEr39l5iFi+RDTbfdMUsg81ehX/uh8IKc7Z3V
   pGFFAMFyBBkfSyrP8XVHO/f9Mquz5rtM9CMorkWTJ4DYOa8i9bf/NxA7g
   XvPyIjGraOBisuna4LFt65Poyg9A6bm3A5oyk8qRsFfrNT4vg3uiI8CSX
   kJ4YoX4j65uKVA2e12/2SelUEeNewhv0j3qrJLqurM2yQZXJYMCrI1YSr
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10205"; a="240578339"
X-IronPort-AV: E=Sophos;i="5.88,226,1635231600"; 
   d="scan'208";a="240578339"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2021 06:21:04 -0800
X-IronPort-AV: E=Sophos;i="5.88,226,1635231600"; 
   d="scan'208";a="617148515"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.162])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2021 06:21:02 -0800
Received: by lahna (sSMTP sendmail emulation); Wed, 22 Dec 2021 16:18:42 +0200
Date:   Wed, 22 Dec 2021 16:18:42 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Gil Fine <gil.fine@intel.com>
Cc:     andreas.noever@gmail.com, michael.jamet@intel.com,
        YehezkelShB@gmail.com, linux-usb@vger.kernel.org, lukas@wunner.de
Subject: Re: [PATCH v2 0/7] thunderbolt: CLx support for USB4 and Titan Ridge
Message-ID: <YcMzwjicgQlDYljP@lahna>
References: <20211217011644.21634-1-gil.fine@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211217011644.21634-1-gil.fine@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Gil,

On Fri, Dec 17, 2021 at 03:16:37AM +0200, Gil Fine wrote:
> v1 can be found here:
> 
>   https://lore.kernel.org/linux-usb/20211125143821.16558-1-gil.fine@intel.com/
> 
> Changes from v1:
> 
> * Fixed comment from Yehezkel
> * Fixed comments from Mika
> * Fixed commit messages
> * Fixed time-posting procedure to follow the USB4 Connection Manager Guide 1.0
>   (this resolves the time posting issue after resume from suspend-to-disk)
> * Fixed TMU config in bidirectional mode - disable unidirectional
> * Fixed TMU config in bidirectional mode - set HiFi rate for downstream router
> 
> Gil Fine (7):
>   thunderbolt: Add TMU unidirectional mode
>   thunderbolt: Add CL0s support for USB4
>   thunderbolt: Move usb4_switch_wait_for_bit() to switch.c
>   thunderbolt: Enable TMU for Titan Ridge device
>   thunderbolt: Rename Intel VSC capability
>   thunderbolt: Enable CL0s for Titan Ridge device
>   thunderbolt: Add kernel param for CLx disabling

I did some minor tweaks and applied to thunderbolt.git/next, thanks!
Please check that it still works for you.
