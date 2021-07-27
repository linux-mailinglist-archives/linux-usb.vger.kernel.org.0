Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65C193D7A21
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jul 2021 17:47:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232641AbhG0Prn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 27 Jul 2021 11:47:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:52502 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229615AbhG0Prm (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 27 Jul 2021 11:47:42 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1D57561B5F;
        Tue, 27 Jul 2021 15:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1627400862;
        bh=T2OynXLQute/CObqcpAc6AwCb5VlWeu8sz1CRfPb59A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AEn/jux6OgifFmTTfOYSN3BaeRUwqiDjuv/Ytp1cKSQ2BBFP1/45VXvJH3RqbN/kq
         98sIFzpSxxj/7BuWdfKG+UQfI2Bnp/h2FR7SjE52xPlY1nOp8j6Dy9ZpF1SBbwTddS
         9u406fxplciVaG08kLaetZbPcU7tAiVXqZxUR5Oc=
Date:   Tue, 27 Jul 2021 17:47:40 +0200
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
Message-ID: <YQAqnHL2E/QUHVnk@kroah.com>
References: <20210727142501.27476-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210727142501.27476-1-mika.westerberg@linux.intel.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jul 27, 2021 at 05:25:01PM +0300, Mika Westerberg wrote:
> This reverts commit 6f3badead6a078cf3c71f381f9d84ac922984a00.
> 
> It turns out bolt depends on having authorized attribute visible under
> each device. Hiding it makes bolt crash as several people have reported
> on various bug trackers. For this reason revert the commit.
> 
> Link: https://gitlab.freedesktop.org/bolt/bolt/-/issues/174
> Link: https://bugzilla.redhat.com/show_bug.cgi?id=1979765
> Link: https://bugs.archlinux.org/task/71569
> Cc: stable@vger.kernel.org
> Cc: Christian Kellner <ckellner@redhat.com>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> ---
>  drivers/thunderbolt/switch.c | 15 +--------------
>  1 file changed, 1 insertion(+), 14 deletions(-)

Want me to take this in my "usb-linus" tree now to get it into the tree
sooner?  Or will you have other thunderbolt fixes for me soon?

thanks,

greg k-h
