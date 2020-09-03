Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E59E725BE6B
	for <lists+linux-usb@lfdr.de>; Thu,  3 Sep 2020 11:27:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726679AbgICJ1N (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Sep 2020 05:27:13 -0400
Received: from mga12.intel.com ([192.55.52.136]:10270 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726025AbgICJ1M (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 3 Sep 2020 05:27:12 -0400
IronPort-SDR: pTG/UAG0iNRFMUWVYuxDdLxE6ISflK+rCCGSoSXrZO02Jl+iV12CRqzi8DIrJCuEG0M2AY0fbA
 j5jncwkAWe6Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9732"; a="137063824"
X-IronPort-AV: E=Sophos;i="5.76,386,1592895600"; 
   d="scan'208";a="137063824"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2020 02:27:12 -0700
IronPort-SDR: w34Jc5/sFUWlrtWI+Jb39yQLuOTDhxBqsNOokCKqrv8CsROvtCj+nFnfwsQEPlKyU5XVYIwKhw
 CmLRA+RgwEQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,386,1592895600"; 
   d="scan'208";a="405428646"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga001.fm.intel.com with SMTP; 03 Sep 2020 02:27:09 -0700
Received: by lahna (sSMTP sendmail emulation); Thu, 03 Sep 2020 12:27:08 +0300
Date:   Thu, 3 Sep 2020 12:27:08 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Gil Fine <gil.fine@intel.com>, Lukas Wunner <lukas@wunner.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 0/9] thunderbolt: Add debugfs support
Message-ID: <20200903092708.GE1375436@lahna.fi.intel.com>
References: <20200826110736.55186-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200826110736.55186-1-mika.westerberg@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Aug 26, 2020 at 02:07:27PM +0300, Mika Westerberg wrote:
> Hi all,
> 
> This series adds debugfs support to the driver. This is useful when
> debugging different hardware/software issues as the developer can dump
> different config spaces of the router including adapter, path and counters
> config spaces. Each connected router is exposed in debugfs under
> thunderbolt directory, and the naming follows what we have in sysfs.
> 
> This also adds a capability to write certain registers but that needs to be
> enabled through Kconfig option, not supposed to be enabled by distros (or
> regular users).
> 
> The series is based on top of my "Power Management improvements" patches
> which can be viewed in the below link:
> 
>   https://lore.kernel.org/linux-usb/20200819115905.59834-1-mika.westerberg@linux.intel.com/
> 
> Gil Fine (2):
>   thunderbolt: Introduce tb_switch_is_tiger_lake()
>   thunderbolt: Add debugfs interface
> 
> Mika Westerberg (7):
>   thunderbolt: Move struct tb_cap_any to tb_regs.h
>   thunderbolt: Introduce tb_port_next_cap()
>   thunderbolt: Introduce tb_switch_next_cap()
>   thunderbolt: Introduce tb_port_is_nhi()
>   thunderbolt: Check for Intel vendor ID when identifying controller
>   thunderbolt: Introduce tb_switch_is_ice_lake()
>   thunderbolt: No need to warn in TB_CFG_ERROR_INVALID_CONFIG_SPACE

All applied to thunderbolt.git/next.
