Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B2DA20F477
	for <lists+linux-usb@lfdr.de>; Tue, 30 Jun 2020 14:21:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732863AbgF3MVT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 30 Jun 2020 08:21:19 -0400
Received: from mga11.intel.com ([192.55.52.93]:41080 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732803AbgF3MVS (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 30 Jun 2020 08:21:18 -0400
IronPort-SDR: UDMLQgg5MLC036FgGaiamcz6HSN3svZD4rXnm3C8+k1BOLE+HO4kVi6WP++fKezuMhI47XpUdo
 RqgBJvolVQwQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9666"; a="144397006"
X-IronPort-AV: E=Sophos;i="5.75,297,1589266800"; 
   d="scan'208";a="144397006"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2020 05:21:17 -0700
IronPort-SDR: oHlhPHoPkxqVdRRYhCjTIJ2uisb2flhequ53SiSzRt+7GIVWORYdcAf1mZ2QQ0lY9mL6lVj0++
 okCrwEcL4mig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,297,1589266800"; 
   d="scan'208";a="386682562"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga001.fm.intel.com with SMTP; 30 Jun 2020 05:21:14 -0700
Received: by lahna (sSMTP sendmail emulation); Tue, 30 Jun 2020 15:21:13 +0300
Date:   Tue, 30 Jun 2020 15:21:13 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Kranthi Kuntala <kranthi.kuntala@intel.com>,
        Rajmohan Mani <rajmohan.mani@intel.com>,
        Mario.Limonciello@dell.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH 0/6] thunderbolt: Add retimer NVM upgrade support
Message-ID: <20200630122113.GQ5180@lahna.fi.intel.com>
References: <20200616135617.85752-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200616135617.85752-1-mika.westerberg@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jun 16, 2020 at 04:56:11PM +0300, Mika Westerberg wrote:
> Hi all,
> 
> USB4 added standard means for accessing retimers on the link. This access
> is done through the side-band channel (two side-band wires in Type-C
> cable). The retimer specification is part of USB4 spec and can be
> downloaded here:
> 
>   https://www.usb.org/sites/default/files/USB4%20Specification_5.zip
> 
> On-board retimers are represented as devices and added under the router
> they belong to with names like <device>:<port>.<index>. We re-use some of
> the current NVM upgrade code for routers for retimers as well. Also we only
> expose these when software connection manager is used. It is not clear if
> firmware connection manager is going to support this (and what kind of
> messaging it needs).
> 
> The user-space interface is the same we have for routers so that should
> allow code re-use for tools such as fwupd.
> 
> Currently only Intel NVM format is supported but this will be relaxed once
> we learn format of other vendors.
> 
> This series applies on top of the tunneling improvements series here:
> 
>   https://lore.kernel.org/linux-usb/20200615142645.56209-1-mika.westerberg@linux.intel.com/
> 
> Kranthi Kuntala (1):
>   thunderbolt: Add support for on-board retimers
> 
> Mika Westerberg (4):
>   thunderbolt: Add Intel USB-IF ID to the NVM upgrade supported list
>   thunderbolt: Split common NVM functionality into a separate file
>   thunderbolt: Generalize usb4_switch_do_[read|write]_data()
>   thunderbolt: Retry USB4 block read operation
> 
> Rajmohan Mani (1):
>   thunderbolt: Implement USB4 port sideband operations for retimer access

Queued for v5.9.
