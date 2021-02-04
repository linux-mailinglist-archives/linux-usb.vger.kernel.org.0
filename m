Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF74C30ED9F
	for <lists+linux-usb@lfdr.de>; Thu,  4 Feb 2021 08:45:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234049AbhBDHpO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 4 Feb 2021 02:45:14 -0500
Received: from mga14.intel.com ([192.55.52.115]:3443 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230270AbhBDHpN (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 4 Feb 2021 02:45:13 -0500
IronPort-SDR: tW84a6UyPumtoy276wYax5UR+BGwAo9MqQwcON9EYHDh+r4LosKzzxek0uSSHBzQVAL9EpDtIF
 DI9FnlshEKCw==
X-IronPort-AV: E=McAfee;i="6000,8403,9884"; a="180415665"
X-IronPort-AV: E=Sophos;i="5.79,400,1602572400"; 
   d="scan'208";a="180415665"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2021 23:43:25 -0800
IronPort-SDR: buykJ/9aHzGCDuVIXP2y/ZHBM3M2OFJF/QupZk5PYidPdygIbG72BgsysGfomeGhRQo5qVfabn
 DAOQqQ+EN53g==
X-IronPort-AV: E=Sophos;i="5.79,400,1602572400"; 
   d="scan'208";a="433810483"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2021 23:43:23 -0800
Received: by lahna (sSMTP sendmail emulation); Thu, 04 Feb 2021 09:43:19 +0200
Date:   Thu, 4 Feb 2021 09:43:19 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Lukas Wunner <lukas@wunner.de>,
        Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 0/6] thunderbolt: Fix kernel-doc descriptions of
 non-static functions
Message-ID: <20210204074319.GN2542@lahna.fi.intel.com>
References: <20210201121629.76969-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210201121629.76969-1-mika.westerberg@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Feb 01, 2021 at 03:16:23PM +0300, Mika Westerberg wrote:
> Hi all,
> 
> This series was inspired by the patch series from Lee Jones that fixed a
> bunch of warnings with W=1 build:
> 
>   https://lore.kernel.org/linux-usb/20210127112554.3770172-1-lee.jones@linaro.org/
> 
> For non-static functions we fix missing kernel-doc descriptions
> accordingly. This fixes the rest of the warnings with W=1 build.
> 
> Applies on top of thunderbolt.git/next.
> 
> v1 can be found here:
> 
>   https://lore.kernel.org/linux-usb/20210128122934.36897-1-mika.westerberg@linux.intel.com/
> 
> Changes from v1:
> 
>   * Drop @ before port in patch 5/6.
>   * Added tags from Lee Jones.
>   * New patch that clarifies router/adapter USB4 terms in structs
>     tb_switch/port.
> 
> Mika Westerberg (6):
>   thunderbolt: ctl: Fix kernel-doc descriptions of non-static functions
>   thunderbolt: eeprom: Fix kernel-doc descriptions of non-static functions
>   thunderbolt: path: Fix kernel-doc descriptions of non-static functions
>   thunderbolt: nhi: Fix kernel-doc descriptions of non-static functions
>   thunderbolt: switch: Fix kernel-doc descriptions of non-static functions
>   thunderbolt: Add clarifying comments about USB4 terms router and adapter

All applied to thunderbolt.git/next.
