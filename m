Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98E2E26C8E3
	for <lists+linux-usb@lfdr.de>; Wed, 16 Sep 2020 20:59:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728266AbgIPS70 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Sep 2020 14:59:26 -0400
Received: from mga18.intel.com ([134.134.136.126]:31720 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727589AbgIPRvR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 16 Sep 2020 13:51:17 -0400
IronPort-SDR: 0JaD7tOnLhfcALd4F44pusE6bKBIewAp9kTBIlq64B9o/okyxzNM9XW4CblTQ+IizquUlyjcMB
 BIlVNDtAhuIg==
X-IronPort-AV: E=McAfee;i="6000,8403,9745"; a="147199881"
X-IronPort-AV: E=Sophos;i="5.76,432,1592895600"; 
   d="scan'208";a="147199881"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2020 05:03:35 -0700
IronPort-SDR: 0hIWXBRS8KA7DBrRdRJrMzF8/tmQZj5VX0gKY4j25qkPt2sVsOLOLOVQeD6MDgDfoerXrMxsWB
 XA63sYyTQGkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,432,1592895600"; 
   d="scan'208";a="409531429"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga001.fm.intel.com with SMTP; 16 Sep 2020 05:03:32 -0700
Received: by lahna (sSMTP sendmail emulation); Wed, 16 Sep 2020 15:03:31 +0300
Date:   Wed, 16 Sep 2020 15:03:31 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH 0/7] thunderbolt: Additional minor improvements
Message-ID: <20200916120331.GK2495@lahna.fi.intel.com>
References: <20200909110001.71603-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200909110001.71603-1-mika.westerberg@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Sep 09, 2020 at 01:59:54PM +0300, Mika Westerberg wrote:
> Hi all,
> 
> This series has some additional minor improvements and cleanups from my
> internal development tree. All of this is v5.10 material and apply on top
> of thunderbolt.git/next.
> 
> Mika Westerberg (7):
>   thunderbolt: Only stop control channel when entering freeze
>   thunderbolt: Allow KUnit tests to be built also when CONFIG_USB4=m
>   thunderbolt: Use "if USB4" instead of "depends on" in Kconfig
>   thunderbolt: Handle ERR_LOCK notification
>   thunderbolt: Log correct zeroX entries in decode_error()
>   thunderbolt: Correct tb_check_quirks() kernel-doc
>   thunderbolt: Capitalize comment on top of QUIRK_FORCE_POWER_LINK_CONTROLLER
> 
>  drivers/thunderbolt/Kconfig   |  6 ++++--
>  drivers/thunderbolt/Makefile  |  3 +--
>  drivers/thunderbolt/ctl.c     | 18 +++++++++++++++---
>  drivers/thunderbolt/domain.c  | 31 +++++++++++++++++++++++++++++++
>  drivers/thunderbolt/nhi.c     | 21 ++++++++++++++++++---
>  drivers/thunderbolt/quirks.c  |  2 +-
>  drivers/thunderbolt/tb.c      | 18 ++++++++++++++++++
>  drivers/thunderbolt/tb.h      | 16 +++++++++++++++-
>  drivers/thunderbolt/tb_msgs.h |  1 +
>  drivers/thunderbolt/test.c    | 13 ++++++++++++-
>  10 files changed, 116 insertions(+), 13 deletions(-)

All applied to thunderbolt.git/next.
