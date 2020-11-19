Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E97F2B957A
	for <lists+linux-usb@lfdr.de>; Thu, 19 Nov 2020 15:52:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728202AbgKSOsU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 19 Nov 2020 09:48:20 -0500
Received: from mga02.intel.com ([134.134.136.20]:58845 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727773AbgKSOsT (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 19 Nov 2020 09:48:19 -0500
IronPort-SDR: 9GYD2W97+7sbzeLFlsZSPDsLNphA/nsnusw+ynz7AOj7k7jr6p1xyaS0xG79Xl8f/nN4yHKzqp
 X9b797x8eggw==
X-IronPort-AV: E=McAfee;i="6000,8403,9809"; a="158331457"
X-IronPort-AV: E=Sophos;i="5.77,490,1596524400"; 
   d="scan'208";a="158331457"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2020 06:48:18 -0800
IronPort-SDR: UllQAD24P5nqQjTMGw3A+hxVHk0+wimBeiQXI6bT+70MoDy/qf3gd8jN3Y58eR3VvzMXudqdPh
 l4HMVeSi8h8Q==
X-IronPort-AV: E=Sophos;i="5.77,490,1596524400"; 
   d="scan'208";a="545033050"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2020 06:48:15 -0800
Received: by lahna (sSMTP sendmail emulation); Thu, 19 Nov 2020 16:48:12 +0200
Date:   Thu, 19 Nov 2020 16:48:12 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Paulian Bogdan Marinca <paulian@marinca.net>,
        Andreas Noever <andreas.noever@gmail.com>,
        Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH v2] thunderbolt: Fix use-after-free in
 remove_unplugged_switch()
Message-ID: <20201119144812.GL2495@lahna.fi.intel.com>
References: <20201119083429.71784-1-mika.westerberg@linux.intel.com>
 <X7YvrflfJf+I/5BX@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <X7YvrflfJf+I/5BX@kroah.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Nov 19, 2020 at 09:41:17AM +0100, Greg Kroah-Hartman wrote:
> On Thu, Nov 19, 2020 at 11:34:29AM +0300, Mika Westerberg wrote:
> > Paulian reported a crash that happens when a dock is unplugged during
> > hibernation:
> > 
> > [78436.228217] thunderbolt 0-1: device disconnected
> > [78436.228365] BUG: kernel NULL pointer dereference, address: 00000000000001e0
> > ...
> > [78436.228397] RIP: 0010:icm_free_unplugged_children+0x109/0x1a0
> > ...
> > [78436.228432] Call Trace:
> > [78436.228439]  icm_rescan_work+0x24/0x30
> > [78436.228444]  process_one_work+0x1a3/0x3a0
> > [78436.228449]  worker_thread+0x30/0x370
> > [78436.228454]  ? process_one_work+0x3a0/0x3a0
> > [78436.228457]  kthread+0x13d/0x160
> > [78436.228461]  ? kthread_park+0x90/0x90
> > [78436.228465]  ret_from_fork+0x1f/0x30
> > 
> > This happens because remove_unplugged_switch() calls tb_switch_remove()
> > that releases the memory pointed by sw so the following lines reference
> > to a memory that might be released already.
> > 
> > Fix this by saving pointer to the parent device before calling
> > tb_switch_remove().
> > 
> > Reported-by: Paulian Bogdan Marinca <paulian@marinca.net>
> > Fixes: 4f7c2e0d8765 ("thunderbolt: Make sure device runtime resume completes before taking domain lock")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> > ---
> 
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Thanks!

Applied to thunderbolt.git/fixes.
