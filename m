Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C82CC23BA40
	for <lists+linux-usb@lfdr.de>; Tue,  4 Aug 2020 14:23:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726820AbgHDMXz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 4 Aug 2020 08:23:55 -0400
Received: from mga02.intel.com ([134.134.136.20]:7366 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730120AbgHDLrW (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 4 Aug 2020 07:47:22 -0400
IronPort-SDR: f7soVae0dUonlP3OeFsGfxcBbCVVibF14bT4sWUYIdT+MwfnkvTpuyIhN2ubx9YQqOhdnIQZeR
 v6DY1eERqi6A==
X-IronPort-AV: E=McAfee;i="6000,8403,9702"; a="140210829"
X-IronPort-AV: E=Sophos;i="5.75,433,1589266800"; 
   d="scan'208";a="140210829"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2020 04:47:20 -0700
IronPort-SDR: 4x+OmTL0vxeYDr8xwZ/uODc8EFXTsEz33UgReiJz43H8ipHQctuDY6A+XLqEZK1gHZjuuy6p+h
 QWqH/sliOsnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,433,1589266800"; 
   d="scan'208";a="396549693"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga001.fm.intel.com with SMTP; 04 Aug 2020 04:47:17 -0700
Received: by lahna (sSMTP sendmail emulation); Tue, 04 Aug 2020 14:47:17 +0300
Date:   Tue, 4 Aug 2020 14:47:17 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Matt Turner <mattst88@gmail.com>
Cc:     Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        linux-usb@vger.kernel.org
Subject: Re: Thunderbolt hotplug fails on HP x360 13t-aw000/86FA with HP
 Thunderbolt 3 Dock
Message-ID: <20200804114717.GN1375436@lahna.fi.intel.com>
References: <20200731033620.GA4428@hp-x360.mattst88.com>
 <20200803105404.GQ1375436@lahna.fi.intel.com>
 <CAEdQ38FRBg_ptDWVr7yRwC4GCd5DxWkBzH+HyTJXL56v2cL4+Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEdQ38FRBg_ptDWVr7yRwC4GCd5DxWkBzH+HyTJXL56v2cL4+Q@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Aug 03, 2020 at 09:52:26AM -0700, Matt Turner wrote:
> On Mon, Aug 3, 2020 at 3:54 AM Mika Westerberg
> <mika.westerberg@linux.intel.com> wrote:
> > Can you try the patch here?
> >
> >   https://lore.kernel.org/patchwork/patch/1257708/
> 
> Thanks.
> 
> It looks like that doesn't fix the problem. I hotplugged the dock
> about 25 times this morning and it was only successful once, very
> early in the testing. I didn't think it was going to be that rare, so
> I didn't capture the log and now I can't reproduce it :(
> 
> Any other ideas or patches I should try?

Can you try so that you boot without device connected. Then plug in the
dock, and wait a bit for it to enumerate (you can check thunderbolt
related messages in dmesg).

Then send me full dmesg and output of command 'sudo lspci -vv'.

I also sugged to file a bug in kernel bugzilla
(https://bugzilla.kernel.org/) and add these logs there as well.
