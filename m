Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81907330C6B
	for <lists+linux-usb@lfdr.de>; Mon,  8 Mar 2021 12:31:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230047AbhCHLa6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 8 Mar 2021 06:30:58 -0500
Received: from mga12.intel.com ([192.55.52.136]:49487 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231922AbhCHLa4 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 8 Mar 2021 06:30:56 -0500
IronPort-SDR: VHqa5eTGAHlyyRLJt5jinovZl0bhaJX0OAi3p8JHQeGHMRnuazilZ2dvl6EpaX7VsMgefwl5bq
 UOFS3H2sIJyg==
X-IronPort-AV: E=McAfee;i="6000,8403,9916"; a="167282079"
X-IronPort-AV: E=Sophos;i="5.81,232,1610438400"; 
   d="scan'208";a="167282079"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2021 03:30:55 -0800
IronPort-SDR: lrdjbC+6g+EgiBCcxoAK+MUjSRWozglawC+ih1yx2IHrL530+06Ep+Ys8kBvjGoz3NdaldV7fN
 ljJB3lO+JpEA==
X-IronPort-AV: E=Sophos;i="5.81,232,1610438400"; 
   d="scan'208";a="402790084"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2021 03:30:52 -0800
Received: by lahna (sSMTP sendmail emulation); Mon, 08 Mar 2021 13:30:50 +0200
Date:   Mon, 8 Mar 2021 13:30:50 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH 1/2] thunderbolt: Initialize HopID IDAs in
 tb_switch_alloc()
Message-ID: <20210308113050.GF2542@lahna.fi.intel.com>
References: <20210303121310.80937-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210303121310.80937-1-mika.westerberg@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Mar 03, 2021 at 03:13:09PM +0300, Mika Westerberg wrote:
> If there is a failure before the tb_switch_add() is called the switch
> object is released by tb_switch_release() but at that point HopID IDAs
> have not yet been initialized. So we see splat like this:
> 
> BUG: spinlock bad magic on CPU#2, kworker/u8:5/115
> ...
> Workqueue: thunderbolt0 tb_handle_hotplug
> Call Trace:
>  dump_stack+0x97/0xdc
>  ? spin_bug+0x9a/0xa7
>  do_raw_spin_lock+0x68/0x98
>  _raw_spin_lock_irqsave+0x3f/0x5d
>  ida_destroy+0x4f/0x127
>  tb_switch_release+0x6d/0xfd
>  device_release+0x2c/0x7d
>  kobject_put+0x9b/0xbc
>  tb_handle_hotplug+0x278/0x452
>  process_one_work+0x1db/0x396
>  worker_thread+0x216/0x375
>  kthread+0x14d/0x155
>  ? pr_cont_work+0x58/0x58
>  ? kthread_blkcg+0x2e/0x2e
>  ret_from_fork+0x1f/0x40
> 
> Fix this by always initializing HopID IDAs in tb_switch_alloc().
> 
> Fixes: 0b2863ac3cfd ("thunderbolt: Add functions for allocating and releasing HopIDs")
> Cc: stable@vger.kernel.org
> Reported-by: Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Applied this and the 2/2 to thunderbolt.git/fixes.
