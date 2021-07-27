Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EC6D3D7A4C
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jul 2021 17:57:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229720AbhG0P5c (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 27 Jul 2021 11:57:32 -0400
Received: from mga03.intel.com ([134.134.136.65]:64454 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229506AbhG0P5b (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 27 Jul 2021 11:57:31 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10057"; a="212505769"
X-IronPort-AV: E=Sophos;i="5.84,274,1620716400"; 
   d="scan'208";a="212505769"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2021 08:57:31 -0700
X-IronPort-AV: E=Sophos;i="5.84,274,1620716400"; 
   d="scan'208";a="505940917"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2021 08:57:27 -0700
Received: by lahna (sSMTP sendmail emulation); Tue, 27 Jul 2021 18:57:25 +0300
Date:   Tue, 27 Jul 2021 18:57:25 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Christian Kellner <ckellner@redhat.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>
Subject: Re: [PATCH] Revert "thunderbolt: Hide authorized attribute if router
 does not support PCIe tunnels"
Message-ID: <YQAs5R67XkAJSeYQ@lahna>
References: <20210727142501.27476-1-mika.westerberg@linux.intel.com>
 <YQAqnHL2E/QUHVnk@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YQAqnHL2E/QUHVnk@kroah.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jul 27, 2021 at 05:47:40PM +0200, Greg KH wrote:
> On Tue, Jul 27, 2021 at 05:25:01PM +0300, Mika Westerberg wrote:
> > This reverts commit 6f3badead6a078cf3c71f381f9d84ac922984a00.
> > 
> > It turns out bolt depends on having authorized attribute visible under
> > each device. Hiding it makes bolt crash as several people have reported
> > on various bug trackers. For this reason revert the commit.
> > 
> > Link: https://gitlab.freedesktop.org/bolt/bolt/-/issues/174
> > Link: https://bugzilla.redhat.com/show_bug.cgi?id=1979765
> > Link: https://bugs.archlinux.org/task/71569
> > Cc: stable@vger.kernel.org
> > Cc: Christian Kellner <ckellner@redhat.com>
> > Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> > ---
> >  drivers/thunderbolt/switch.c | 15 +--------------
> >  1 file changed, 1 insertion(+), 14 deletions(-)
> 
> Want me to take this in my "usb-linus" tree now to get it into the tree
> sooner?  Or will you have other thunderbolt fixes for me soon?

I don't have any other fixes ATM so it would be great if you can pick
this one directly :) Thanks!
