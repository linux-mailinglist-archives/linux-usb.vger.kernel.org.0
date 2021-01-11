Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9748C2F1822
	for <lists+linux-usb@lfdr.de>; Mon, 11 Jan 2021 15:25:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731497AbhAKOYu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 Jan 2021 09:24:50 -0500
Received: from mga02.intel.com ([134.134.136.20]:24227 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728070AbhAKOYt (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 11 Jan 2021 09:24:49 -0500
IronPort-SDR: re0w/xQO7P8MiF3eAvY5YBTjRwKvKVNkT473SFlR3oA4h4WBgeD1a67KB/njNNDKcHo/F6M8Sy
 lzCtxtRnrXtA==
X-IronPort-AV: E=McAfee;i="6000,8403,9860"; a="164951204"
X-IronPort-AV: E=Sophos;i="5.79,338,1602572400"; 
   d="scan'208";a="164951204"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2021 06:23:01 -0800
IronPort-SDR: B5TjygFGefN9FVfrELU2SAeYsEHkhVJO/QW2XaiFIS98paWfaA/Fo5AckIvjO6rydn5bprDHNy
 FkqZZfsc7l+g==
X-IronPort-AV: E=Sophos;i="5.79,338,1602572400"; 
   d="scan'208";a="464175188"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2021 06:22:58 -0800
Received: by lahna (sSMTP sendmail emulation); Mon, 11 Jan 2021 16:22:56 +0200
Date:   Mon, 11 Jan 2021 16:22:56 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Yehezkel Bernat <yehezkelshb@gmail.com>
Cc:     linux-usb@vger.kernel.org, Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Christian Kellner <christian@kellner.me>,
        Mario Limonciello <mario.limonciello@dell.com>
Subject: Re: [PATCH 1/2] thunderbolt: Start lane initialization after sleep
Message-ID: <20210111142256.GL968855@lahna.fi.intel.com>
References: <20210105092808.15817-1-mika.westerberg@linux.intel.com>
 <CA+CmpXuMD+OcNNJXHHc9oXUMkOjt8mt-UzrQrpe0mHXSmYvNrw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+CmpXuMD+OcNNJXHHc9oXUMkOjt8mt-UzrQrpe0mHXSmYvNrw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jan 05, 2021 at 03:35:27PM +0200, Yehezkel Bernat wrote:
> On Tue, Jan 5, 2021 at 11:28 AM Mika Westerberg
> <mika.westerberg@linux.intel.com> wrote:
> >
> > USB4 spec says that for TBT3 compatible device routers the connection
> > manager needs to set SLI (Start Lane Initialization) to get the lanes
> > that were not connected back to functional state after sleep. Same needs
> > to be done if the link was XDomain.
> >
> > Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> > ---
> >  drivers/thunderbolt/lc.c      | 35 +++++++++++++++++++++++++++++++++++
> >  drivers/thunderbolt/switch.c  | 27 ++++++++++++++++++++++++++-
> >  drivers/thunderbolt/tb.h      |  1 +
> >  drivers/thunderbolt/tb_regs.h |  1 +
> >  4 files changed, 63 insertions(+), 1 deletion(-)
> >
> 
> Acked-by: Yehezkel Bernat <YehezkelShB@gmail.com>

Applied to thunderbolt.git/next.
