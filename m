Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8321929F382
	for <lists+linux-usb@lfdr.de>; Thu, 29 Oct 2020 18:44:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727697AbgJ2Rn4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 29 Oct 2020 13:43:56 -0400
Received: from Galois.linutronix.de ([193.142.43.55]:35036 "EHLO
        galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726770AbgJ2Rnw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 29 Oct 2020 13:43:52 -0400
Date:   Thu, 29 Oct 2020 18:43:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1603993429;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Qz333/mnT6zwsHHHgIzhzmyCPc/onyc+Oj7SaMXj7Ro=;
        b=oSb5+LnIzbYAatm7Akr/OEdggzx6r7VjzY1q44oSsnA/unzmh3kage9a5tfwZ1sf9tjINn
        SlaA6wBRtftRdYKTj9XKQxD0EGDyaC1f/88Cil0pZ4DL3ELVQ6kqVXZYSo9ycRcI6gdfgN
        Pn51nP8B0FFsXUlvefAYw4n2XIeeGyxtfBLW95kSh+g8rtJMqNEmW53X6F4jWGQCgcklYw
        XTgw0c/pRqxcaAPOIvzIHoOTKbk26dtWH+nUwrAGKT2Xsws2B1r41L1LxuQk80+UIXqMPA
        N1oRzhOuDdXA2Xoz1lpErr6E//jwxhFApteM8OsXt0n+DOK4HMCoPNcQR02ezQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1603993429;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Qz333/mnT6zwsHHHgIzhzmyCPc/onyc+Oj7SaMXj7Ro=;
        b=eLaVTtpw94vZ2pJ1cJG68/e7QOyc8MIZV1eikiwyjq0raWwoLw91IC7ruLZWem4qE6L9wF
        Oy3vIQXKCeriqhAw==
From:   Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     Mike Galbraith <efault@gmx.de>, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
        Li Jun <jun.li@nxp.com>, Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 3/3] xhci: Don't create stream debugfs files with
 spinlock held.
Message-ID: <20201029174348.omqiwjqy64tebg5z@linutronix.de>
References: <20201028203124.375344-1-mathias.nyman@linux.intel.com>
 <20201028203124.375344-4-mathias.nyman@linux.intel.com>
 <1cbb8b7defb1db1d4747995c11ebebb3dd9a66ec.camel@gmx.de>
 <30dd5079-375d-a2a3-cab3-1b2740661ea8@linux.intel.com>
 <c8a67a65091404e528297ef5c6b9c59cdc03a2c9.camel@gmx.de>
 <a5d5a21c-d6ff-1097-b9ca-e0147658c8c6@linux.intel.com>
 <20201029113805.tdsissnjq4acemle@linutronix.de>
 <29cf8ca3-0fe7-da51-c8ae-ad5c67af4dde@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <29cf8ca3-0fe7-da51-c8ae-ad5c67af4dde@linux.intel.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2020-10-29 15:08:06 [+0200], Mathias Nyman wrote:
> 2. Lockdep issue #2, adding entries to radix tree during (stream) ring expansion with interrupts disabled and xhci->lock held.
>    Cause: unknown, probably a patch since we started using radix trees for finding streams
>    Fix: unknown.
>    Comment: Discovered by Mike when testing fix for issue#1. I suspect it can be reproduced on 5.9 but is 
>    probably really hard as it involves ring expansion.

So lockdep complains with this:
      CPU0                    CPU1
      ----                    ----
 lock(lock#2);
                              local_irq_disable();
                              lock(&xhci->lock);
                              lock(lock#2);
 <Interrupt>
   lock(&xhci->lock);

(https://lore.kernel.org/linux-usb/1cbb8b7defb1db1d4747995c11ebebb3dd9a66ec.camel@gmx.de/)

lockdep does not like that preload is used with disabled interrupts (in
non-interrupt context) and acquires lock#2 (the local_lock) which could
lead to a dead-lock as described above.
The flaw in the logic above is that lock#2 on CPU0 != CPU1.

We could make lockdep happy and remove what it observes on CPU1 by doing
this:

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 138ba4528dd3a..2cb8874c1c51f 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -197,12 +197,15 @@ static int xhci_insert_segment_mapping(struct radix_tree_root *trb_address_map,
 	if (radix_tree_lookup(trb_address_map, key))
 		return 0;
 
-	ret = radix_tree_maybe_preload(mem_flags);
-	if (ret)
-		return ret;
-	ret = radix_tree_insert(trb_address_map,
-			key, ring);
-	radix_tree_preload_end();
+	if (gfpflags_allow_blocking(mem_flags)) {
+		ret = radix_tree_maybe_preload(mem_flags);
+		if (ret)
+			return ret;
+	}
+	ret = radix_tree_insert(trb_address_map, key, ring);
+
+	if (gfpflags_allow_blocking(mem_flags))
+		radix_tree_preload_end();
 	return ret;
 }
 

There is no pre-load in GFP_ATOMIC case but it still acquires the
local_lock.
We might be able to drop radix_tree_maybe_preload(). I saw GFP_KERNEL
only during enumeration from xhci_alloc_streams(). Later, while
transfers were pending it came always from the scsi stack with disabled
interrupts and xhci->lock acquired.

> -Mathias

Sebastian
