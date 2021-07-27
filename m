Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F3273D7ABA
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jul 2021 18:14:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229553AbhG0QOx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 27 Jul 2021 12:14:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:59256 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229529AbhG0QOw (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 27 Jul 2021 12:14:52 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6BE7861B7F;
        Tue, 27 Jul 2021 16:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1627402492;
        bh=EVwn9530j5XGI6WrLT40v6RTkEJ2TTHqAI1dvc2W7h0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tMWilGlnjiWMauKxXzcHR7TmQEsm8Kk7W6k9Hc/kgHvsmYY0mUygkO3vdqOiSsIp/
         o9KpKMTPjSNo1I6wv+PM4LLZQw+svtSKOKlFj/SB6ia7vcp/fSDR96j4FfI5Zyx9TZ
         2V9OiDWG89FxvNh3+gXwsIZs9WRS/NhSsFJ+gT8g=
Date:   Tue, 27 Jul 2021 18:14:50 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-usb@vger.kernel.org, Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Christian Kellner <ckellner@redhat.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>
Subject: Re: [PATCH] Revert "thunderbolt: Hide authorized attribute if router
 does not support PCIe tunnels"
Message-ID: <YQAw+kwnORnfvPmC@kroah.com>
References: <20210727142501.27476-1-mika.westerberg@linux.intel.com>
 <YQAqnHL2E/QUHVnk@kroah.com>
 <YQAs5R67XkAJSeYQ@lahna>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YQAs5R67XkAJSeYQ@lahna>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jul 27, 2021 at 06:57:25PM +0300, Mika Westerberg wrote:
> On Tue, Jul 27, 2021 at 05:47:40PM +0200, Greg KH wrote:
> > On Tue, Jul 27, 2021 at 05:25:01PM +0300, Mika Westerberg wrote:
> > > This reverts commit 6f3badead6a078cf3c71f381f9d84ac922984a00.
> > > 
> > > It turns out bolt depends on having authorized attribute visible under
> > > each device. Hiding it makes bolt crash as several people have reported
> > > on various bug trackers. For this reason revert the commit.
> > > 
> > > Link: https://gitlab.freedesktop.org/bolt/bolt/-/issues/174
> > > Link: https://bugzilla.redhat.com/show_bug.cgi?id=1979765
> > > Link: https://bugs.archlinux.org/task/71569
> > > Cc: stable@vger.kernel.org
> > > Cc: Christian Kellner <ckellner@redhat.com>
> > > Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> > > ---
> > >  drivers/thunderbolt/switch.c | 15 +--------------
> > >  1 file changed, 1 insertion(+), 14 deletions(-)
> > 
> > Want me to take this in my "usb-linus" tree now to get it into the tree
> > sooner?  Or will you have other thunderbolt fixes for me soon?
> 
> I don't have any other fixes ATM so it would be great if you can pick
> this one directly :) Thanks!

Done!
