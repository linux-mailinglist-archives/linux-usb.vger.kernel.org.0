Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57EB63A3E40
	for <lists+linux-usb@lfdr.de>; Fri, 11 Jun 2021 10:46:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231243AbhFKIsL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 11 Jun 2021 04:48:11 -0400
Received: from mga09.intel.com ([134.134.136.24]:12628 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229584AbhFKIsK (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 11 Jun 2021 04:48:10 -0400
IronPort-SDR: h+0qJQ2M6WDx6GrDF2PczPRtJYNF6I3BROav82CdfAEqt/OF4y13EbwJZSfOftcms4K5kwHms+
 p+TBuEAdcALA==
X-IronPort-AV: E=McAfee;i="6200,9189,10011"; a="205447722"
X-IronPort-AV: E=Sophos;i="5.83,265,1616482800"; 
   d="scan'208";a="205447722"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2021 01:46:11 -0700
IronPort-SDR: uUlFai0CieQ9oUTyanx3csvOY6WgwGHm1eGytm1AwuwiXHYBaLDvU6NeLKbe0auxMVKjWrJDwV
 TZO7EQq5jhKQ==
X-IronPort-AV: E=Sophos;i="5.83,265,1616482800"; 
   d="scan'208";a="403154115"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2021 01:46:07 -0700
Received: by lahna (sSMTP sendmail emulation); Fri, 11 Jun 2021 11:46:05 +0300
Date:   Fri, 11 Jun 2021 11:46:05 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Yehezkel Bernat <yehezkelshb@gmail.com>
Cc:     linux-usb@vger.kernel.org, Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        kernel test robot <lkp@intel.com>,
        Gil Fine <gil.fine@intel.com>,
        Azhar Shaikh <azhar.shaikh@intel.com>
Subject: Re: [PATCH 0/5] thunderbolt: Support for Intel Alder Lake and
 improvements
Message-ID: <YMMizWEKEqqxPet5@lahna>
References: <20210607110030.38664-1-mika.westerberg@linux.intel.com>
 <CA+CmpXs3B-5KPzBjmyEtpY0or+0B_KHyeguFCqXuVitbqkHJug@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+CmpXs3B-5KPzBjmyEtpY0or+0B_KHyeguFCqXuVitbqkHJug@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jun 07, 2021 at 02:52:06PM +0300, Yehezkel Bernat wrote:
> On Mon, Jun 7, 2021 at 2:00 PM Mika Westerberg
> <mika.westerberg@linux.intel.com> wrote:
> >
> > Hi all,
> >
> > This series adds support for Intel Alder Lake which is the successor of
> > Tiger Lake. The integrated Thunderbolt/USB4 controller is pretty close to
> > the one found in Tiger Lake too.
> >
> > In addition there are few improvements for issues reported by Dan Carpenter
> > and kernel test robot.
> >
> > The series applies on top of thunderbolt.git/next.
> >
> > Azhar Shaikh (1):
> >   thunderbolt: Add support for Intel Alder Lake
> >
> > Gil Fine (1):
> >   thunderbolt: Poll 10ms for REG_FW_STS_NVM_AUTH_DONE to be set
> >
> > Mika Westerberg (3):
> >   thunderbolt: Bond lanes only when dual_link_port != NULL in alloc_dev_default()
> >   thunderbolt: Add device links only when software connection manager is used
> >   thunderbolt: No need to include <linux/acpi.h> in usb4_port.c
> >
> >  drivers/thunderbolt/icm.c       | 20 ++++++----
> >  drivers/thunderbolt/nhi.c       | 71 ++-------------------------------
> >  drivers/thunderbolt/nhi.h       |  2 +
> >  drivers/thunderbolt/tb.c        | 67 +++++++++++++++++++++++++++++++
> >  drivers/thunderbolt/test.c      | 22 +++++-----
> >  drivers/thunderbolt/usb4_port.c |  1 -
> >  6 files changed, 97 insertions(+), 86 deletions(-)
> >
> 
>  Reviewed-by: Yehezkel Bernat <YehezkelShB@gmail.com>

Thanks!

Applied all to thunderbolt.git/next.
