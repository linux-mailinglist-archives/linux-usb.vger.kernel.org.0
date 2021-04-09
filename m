Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FEEE359945
	for <lists+linux-usb@lfdr.de>; Fri,  9 Apr 2021 11:33:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231599AbhDIJd4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 9 Apr 2021 05:33:56 -0400
Received: from mga14.intel.com ([192.55.52.115]:35022 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230181AbhDIJdz (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 9 Apr 2021 05:33:55 -0400
IronPort-SDR: WXywM2oe2wXHdYU5zp5LShBeLPIxEpxzFay14LDnKbSBYhmjSyjO/ebFdqtwbs465hCS+VRehJ
 4GGVti9Xk/gw==
X-IronPort-AV: E=McAfee;i="6000,8403,9948"; a="193275960"
X-IronPort-AV: E=Sophos;i="5.82,209,1613462400"; 
   d="scan'208";a="193275960"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2021 02:33:42 -0700
IronPort-SDR: dYc3YdhqPPVN9UNd/ED6G6EefHle5UX7sXVTk1T/MevybQOBlkA3Up/QlXPoxYTwv3hZWeoQfa
 5MsDJ5FV2oig==
X-IronPort-AV: E=Sophos;i="5.82,209,1613462400"; 
   d="scan'208";a="530930898"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2021 02:33:38 -0700
Received: by lahna (sSMTP sendmail emulation); Fri, 09 Apr 2021 12:33:36 +0300
Date:   Fri, 9 Apr 2021 12:33:35 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Lukas Wunner <lukas@wunner.de>,
        Mario Limonciello <mario.limonciello@dell.com>,
        Christian Kellner <christian@kellner.me>,
        Benson Leung <bleung@google.com>,
        Prashant Malani <pmalani@google.com>,
        Diego Rivas <diegorivas@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v3 0/3] thunderbolt: Expose details about tunneling
Message-ID: <20210409093335.GO2542@lahna.fi.intel.com>
References: <20210329074150.62622-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210329074150.62622-1-mika.westerberg@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Mar 29, 2021 at 10:41:47AM +0300, Mika Westerberg wrote:
> Hello there,
> 
> There has been ask if we can expose more details about the connected
> devices and the tunneling to userspace, so it can then provide more
> detailed information to the user.
> 
> First we add uevent details for each device (USB4 router) that adds
> USB4_TYPE=host|device|hub and USB4_VERSION=1.0 (if the device actually is
> USB4). The host|device|hub definitions follow the USB4 spec.
> 
> Then for each device router we expose two new attributes: "usb3" and "dp"
> that if present mean that the device has corresponding adapter (USB 3.x
> upstream adapter and DP OUT adapter). The contents of the attributes then
> hold number of tunnels ending to this router. So if USB 3.x is tunneled
> "usb3" reads 1. Since there can be multiple DP OUT adaptes the "dp"
> attribute holds number of DP tunnels ending to this router. For PCIe
> tunneling the "authorized" attribute works the same way.
> 
> Previous versions can be found:
> 
>   v2: https://lore.kernel.org/linux-usb/20210323145701.86161-1-mika.westerberg@linux.intel.com/
>   v1: https://lore.kernel.org/linux-usb/20210309134818.63118-1-mika.westerberg@linux.intel.com/
> 
> Changes from v2:
> 
>   * Added missing sysfs_emit()
> 
> Changes from v1:
> 
>   * Added Greg's Reviewed-by tags for patch 1 and 2
>   * Use sysfs_emit()
>   * Drop the locking in the new attributes
>   * Drop the kobject_uevent()
> 
> Mika Westerberg (3):
>   thunderbolt: Add details to router uevent
>   thunderbolt: Hide authorized attribute if router does not support PCIe tunnels
>   thunderbolt: Expose more details about USB 3.x and DisplayPort tunnels

Applied the first two patches to thunderbolt.git/next. I'm dropping the
last one for now. We can revisit it later if really needed.
