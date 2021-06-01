Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89D90396E3C
	for <lists+linux-usb@lfdr.de>; Tue,  1 Jun 2021 09:50:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233160AbhFAHwj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Jun 2021 03:52:39 -0400
Received: from mga07.intel.com ([134.134.136.100]:41120 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233098AbhFAHwj (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 1 Jun 2021 03:52:39 -0400
IronPort-SDR: 4Wrf02YY72uD4eN2ZHScN2v2P2/NKFkhFK7x+4+uk/cIefOxTnUIP8a1Fi7G5LH1VPE6RHzeII
 oGuQqV87Z7NQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10001"; a="267372988"
X-IronPort-AV: E=Sophos;i="5.83,239,1616482800"; 
   d="scan'208";a="267372988"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2021 00:50:57 -0700
IronPort-SDR: d8krQDitM6KS5G+I2AQBmaXKef2+ZJRtv7RTRMt4U6WM7PfHeqDcnK+GYeu0YkB923weKl+4/+
 moruDtMtaa8g==
X-IronPort-AV: E=Sophos;i="5.83,239,1616482800"; 
   d="scan'208";a="479179080"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2021 00:50:54 -0700
Received: by lahna (sSMTP sendmail emulation); Tue, 01 Jun 2021 10:50:52 +0300
Date:   Tue, 1 Jun 2021 10:50:52 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Gil Fine <gil.fine@intel.com>,
        Casey G Bowman <casey.g.bowman@intel.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH 0/8] thunderbolt: Add credit allocation for USB4 devices
Message-ID: <YLXm3F2+y9ct5TlO@lahna.fi.intel.com>
References: <20210518141002.63616-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210518141002.63616-1-mika.westerberg@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, May 18, 2021 at 05:09:54PM +0300, Mika Westerberg wrote:
> Hi all,
> 
> USB4 spec requires that routers expose their credit (buffer) allocation
> preferences through a special router operation. Furthermore the Connection
> Manager guide (as part of the USB4 spec bundle) provides some guidance how
> the credits should be allocated between different tunneled protocols. This
> series adds the credit allocation support for USB4 routers. For Intel
> Thunderbolt 1-3 devices we keep using the existing hard-coded scheme.
> 
> We also add some KUnit tests for the credit allocation.
> 
> Mika Westerberg (8):
>   thunderbolt: Make tb_port_type() take const parameter
>   thunderbolt: Move nfc_credits field to struct tb_path_hop
>   thunderbolt: Wait for the lanes to actually bond
>   thunderbolt: Read router preferred credit allocation information
>   thunderbolt: Update port credits after bonding is enabled/disabled
>   thunderbolt: Allocate credits according to router preferences
>   thunderbolt: Add quirk for Intel Goshen Ridge DP credits
>   thunderbolt: Add KUnit tests for credit allocation

All applied to thunderbolt.git/next.
