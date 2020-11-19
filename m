Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F299D2B8DC3
	for <lists+linux-usb@lfdr.de>; Thu, 19 Nov 2020 09:43:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726315AbgKSIkf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 19 Nov 2020 03:40:35 -0500
Received: from mail.kernel.org ([198.145.29.99]:52336 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726297AbgKSIkf (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 19 Nov 2020 03:40:35 -0500
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 27F7D246DC;
        Thu, 19 Nov 2020 08:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1605775233;
        bh=5sGdS93+NBVLFLQMTqvWfCrihjQcACl78AOSIX98xsI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=N/TzQ+b8oM73e5kxbtdfcQspSEh7F2zQCHfTNUSZgL/If6zPPKkHT8NkJhZDjmZ0e
         uNviTBQQWFEFPks4uFhxAUl94QwljrVhYFQTuKhC+UzNJKTSxG653KKqTwmMyhXILe
         qMWPE9H0i1uLAsxQouZXUlf+klbd77Y57EdZRGlk=
Date:   Thu, 19 Nov 2020 09:41:17 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-usb@vger.kernel.org, Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Paulian Bogdan Marinca <paulian@marinca.net>,
        Andreas Noever <andreas.noever@gmail.com>,
        Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH v2] thunderbolt: Fix use-after-free in
 remove_unplugged_switch()
Message-ID: <X7YvrflfJf+I/5BX@kroah.com>
References: <20201119083429.71784-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201119083429.71784-1-mika.westerberg@linux.intel.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Nov 19, 2020 at 11:34:29AM +0300, Mika Westerberg wrote:
> Paulian reported a crash that happens when a dock is unplugged during
> hibernation:
> 
> [78436.228217] thunderbolt 0-1: device disconnected
> [78436.228365] BUG: kernel NULL pointer dereference, address: 00000000000001e0
> ...
> [78436.228397] RIP: 0010:icm_free_unplugged_children+0x109/0x1a0
> ...
> [78436.228432] Call Trace:
> [78436.228439]  icm_rescan_work+0x24/0x30
> [78436.228444]  process_one_work+0x1a3/0x3a0
> [78436.228449]  worker_thread+0x30/0x370
> [78436.228454]  ? process_one_work+0x3a0/0x3a0
> [78436.228457]  kthread+0x13d/0x160
> [78436.228461]  ? kthread_park+0x90/0x90
> [78436.228465]  ret_from_fork+0x1f/0x30
> 
> This happens because remove_unplugged_switch() calls tb_switch_remove()
> that releases the memory pointed by sw so the following lines reference
> to a memory that might be released already.
> 
> Fix this by saving pointer to the parent device before calling
> tb_switch_remove().
> 
> Reported-by: Paulian Bogdan Marinca <paulian@marinca.net>
> Fixes: 4f7c2e0d8765 ("thunderbolt: Make sure device runtime resume completes before taking domain lock")
> Cc: stable@vger.kernel.org
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> ---

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
