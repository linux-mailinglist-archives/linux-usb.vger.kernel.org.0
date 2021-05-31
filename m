Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFABC3959D0
	for <lists+linux-usb@lfdr.de>; Mon, 31 May 2021 13:40:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231382AbhEaLmZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 31 May 2021 07:42:25 -0400
Received: from mga18.intel.com ([134.134.136.126]:22670 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231289AbhEaLmY (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 31 May 2021 07:42:24 -0400
IronPort-SDR: OV0jWb0ZsVQfhJ5EvXZXLiI8Hx5GhY5FC4QCLOf7PNVdpxj5hTMqmoAU5dtxu9rgWGy7oqNcun
 jnviDVZXBycw==
X-IronPort-AV: E=McAfee;i="6200,9189,10000"; a="190705631"
X-IronPort-AV: E=Sophos;i="5.83,237,1616482800"; 
   d="scan'208";a="190705631"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2021 04:40:44 -0700
IronPort-SDR: JIuD8j5ANh1cf8WC/mPF7FWMl6JCwqrF+ax/qirbgT0XH9bLdM4VoXvO4bKvqWzgk1Xo+zGukF
 QznkgemUxr5Q==
X-IronPort-AV: E=Sophos;i="5.83,237,1616482800"; 
   d="scan'208";a="482064312"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2021 04:40:41 -0700
Received: by lahna (sSMTP sendmail emulation); Mon, 31 May 2021 14:40:39 +0300
Date:   Mon, 31 May 2021 14:40:39 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Lukas Wunner <lukas@wunner.de>,
        Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH 0/3] thunderbolt: Cleanup ABI entries and update wakes
Message-ID: <YLTLNw27Ypq64thL@lahna.fi.intel.com>
References: <20210517130713.30005-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210517130713.30005-1-mika.westerberg@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, May 17, 2021 at 04:07:10PM +0300, Mika Westerberg wrote:
> Hi all,
> 
> The first patch just cleans up the documentation of the sysfs entrues. The
> following two patches add wake from DisplayPort (this is recent addition to
> the USB4 spec), and aligns the driver wake configuration with the USB4
> Connection Manager guide (which is part of the USB4 spec package).
> 
> Mika Westerberg (3):
>   Documentation / thunderbolt: Clean up entries
>   thunderbolt: Add wake from DisplayPort
>   thunderbolt: Align USB4 router wakes configuration with the CM guide
> 
>  .../ABI/testing/sysfs-bus-thunderbolt         | 44 +++++++++----------
>  drivers/thunderbolt/lc.c                      |  6 ++-
>  drivers/thunderbolt/switch.c                  |  3 +-
>  drivers/thunderbolt/tb.h                      |  1 +
>  drivers/thunderbolt/tb_regs.h                 |  3 ++
>  drivers/thunderbolt/usb4.c                    | 22 +++++++---
>  6 files changed, 47 insertions(+), 32 deletions(-)

All applied to thunderbolt.git/next.
