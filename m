Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0C873389D8
	for <lists+linux-usb@lfdr.de>; Fri, 12 Mar 2021 11:18:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233065AbhCLKRv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 12 Mar 2021 05:17:51 -0500
Received: from mga07.intel.com ([134.134.136.100]:2242 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232861AbhCLKR1 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 12 Mar 2021 05:17:27 -0500
IronPort-SDR: LmtJrCf5OgU7pLpIWzaVDghvOVpZi+crqkvqls2N1E1+WhF0cbmMCQoOW+/1x7xfWYveizrYZd
 QASmF//xvBfA==
X-IronPort-AV: E=McAfee;i="6000,8403,9920"; a="252829475"
X-IronPort-AV: E=Sophos;i="5.81,243,1610438400"; 
   d="scan'208";a="252829475"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2021 02:17:21 -0800
IronPort-SDR: +Q82eKw8SHQaIOg/zZaybiphgADxmIFjjC3PjZptbbhJQ9sDJuj7fcZJbTC3LzF5zXB+n0yzic
 jZfWXj4sygHA==
X-IronPort-AV: E=Sophos;i="5.81,243,1610438400"; 
   d="scan'208";a="448583393"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2021 02:17:18 -0800
Received: by lahna (sSMTP sendmail emulation); Fri, 12 Mar 2021 12:17:15 +0200
Date:   Fri, 12 Mar 2021 12:17:15 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Gil Fine <gil.fine@intel.com>
Cc:     andreas.noever@gmail.com, michael.jamet@intel.com,
        YehezkelShB@gmail.com, linux-usb@vger.kernel.org, lukas@wunner.de
Subject: Re: [PATCH] thunderbolt: debugfs: Show all accessible dwords
Message-ID: <20210312101715.GX2542@lahna.fi.intel.com>
References: <20210309092330.5813-1-gil.fine@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210309092330.5813-1-gil.fine@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Mar 09, 2021 at 11:23:30AM +0200, Gil Fine wrote:
> Currently, when first failure occurs while reading of the block,
> we stop reading the block and jump to the next capability.
> This doesn't cover the case of block with "holes" of inaccessible
> dwords, followed by accessible dwords.
> This patch address this problem.
> In case of failure while reading the complete block in one transaction,
> (because of one or more dwords is inaccessible), we read the remaining
> dwords of the block dword-by-dword, one dword per transaction,
> till the end of the block.
> By doing this, we handle the case of block with "holes" of inaccessible
> dwords, followed by accessible dwords. The accessible dwords are shown
> with the fields: <offset> <relative_offset> <cap_id> <vs_cap_id> <value>
> E.g.:
> 0x01eb  236 0x05 0x06 0x0000d166
> While the inaccesible dwords are shown as: <offset> <not accessible>
> E.g.:
> 0x01ed <not accessible>
> 
> Signed-off-by: Gil Fine <gil.fine@intel.com>

Applied to thunderbolt.git/next, thanks!
