Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAB06460EC0
	for <lists+linux-usb@lfdr.de>; Mon, 29 Nov 2021 07:32:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240262AbhK2Gf1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 Nov 2021 01:35:27 -0500
Received: from mga02.intel.com ([134.134.136.20]:51004 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238716AbhK2Gd1 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 29 Nov 2021 01:33:27 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10182"; a="223132681"
X-IronPort-AV: E=Sophos;i="5.87,272,1631602800"; 
   d="scan'208";a="223132681"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2021 22:30:10 -0800
X-IronPort-AV: E=Sophos;i="5.87,272,1631602800"; 
   d="scan'208";a="600093239"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2021 22:30:06 -0800
Received: by lahna (sSMTP sendmail emulation); Mon, 29 Nov 2021 08:27:55 +0200
Date:   Mon, 29 Nov 2021 08:27:55 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Lukas Wunner <lukas@wunner.de>
Cc:     linux-usb@vger.kernel.org, Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Gil Fine <gil.fine@intel.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Andreas Noever <andreas.noever@gmail.com>
Subject: Re: [PATCH 2/6] thunderbolt: Tear down existing tunnels when
 resuming from hibernate
Message-ID: <YaRy6+3rwJx6YcKn@lahna>
References: <20211125073733.74902-1-mika.westerberg@linux.intel.com>
 <20211125073733.74902-3-mika.westerberg@linux.intel.com>
 <20211126200150.GA21796@wunner.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211126200150.GA21796@wunner.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Fri, Nov 26, 2021 at 09:01:50PM +0100, Lukas Wunner wrote:
> On Thu, Nov 25, 2021 at 10:37:29AM +0300, Mika Westerberg wrote:
> > If the boot firmware implements connection manager of its own it may not
> > create the paths in the same way or order we do. For example it may
> > create first PCIe tunnel and the USB3 tunnel. When we restore our
> > tunnels (first de-activating them) we may be doing that over completely
> > different tunnel and that leaves them possible non-functional. For this
> > reason we re-use the tunnel discovery functionality and find out all the
> > existing tunnels, and tear them down. Once that is done we can restore
> > our tunnels.
> 
> Hm, what if the system is running from a Thunderbolt-attached drive?
> Will the mount points survive tearing down and re-establishing the
> tunnels to that drive?

Yes, they should. PCI is waiting for the TBT to resume so it should not
notice this, and all the data is at point still synced out to the disks.
