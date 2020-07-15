Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A9CA220A0A
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jul 2020 12:33:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731157AbgGOKbq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Jul 2020 06:31:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731155AbgGOKbq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Jul 2020 06:31:46 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29557C061755
        for <linux-usb@vger.kernel.org>; Wed, 15 Jul 2020 03:31:46 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id k6so2015221wrn.3
        for <linux-usb@vger.kernel.org>; Wed, 15 Jul 2020 03:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=davidgf-net.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=RzIboguu3JJyFfg1u1hEOeuju+I6gjvcRyGEFx9D3y8=;
        b=goFToWi44iau5GtuUXQtVrTTVRyMNYUC1xSU9oQem6mwmJYZwD8l0M+Sc+Tw5unIRl
         pCOZC63/pqgeH1ZMmnaEgIH/hLaqnsUQpLi0bbhmvm3b9pMBHEiUbDBHMq0iNc1wNQgc
         CBv7N8VgqwmN0B+MIE/u8f9c5ImjiqYoByasmZPBy101OGcYKq+tj3QBFZij3e0q7ard
         D9MtGBD1MHJj8W9OLxOThB8XB3VzQfnbqYC4ayOMBDLa3fKdHbgZBk0Z05dV3Njm1YEf
         DnnD27N7Wsf8aaytqEPuvuULWrgakI7yeWpnE70WHEcGnTTnj+Pk1KTMjgl2McZD3hfF
         pXyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=RzIboguu3JJyFfg1u1hEOeuju+I6gjvcRyGEFx9D3y8=;
        b=CvZb0+lCpUML7TWlmkgPWDHCdoR/BrPUp30yFXQvGyivF16tSVMqYVT5J5oOFtByHR
         NxfaE4KEbt+Kto4DjJqs8h/iKP/9X5KM5TCjsnbyMV9SUEmsEIXiQPO/bP40xCO/Rsem
         sEP851RDuQBZxgXR3tECVaXQALNTtrfJGumGLFtZHArtjgHnmEIA2UKaVVbeFuHyQxfx
         /QimA6QBc8xVZrrRMuqHI7CrU2uv2q86tduR/XVovnoGhCQHbSs5NfB373zDm/UZLBkH
         QYBclMKP40MV4s5OYBHZHMQ/ClN2ley0pKFK8+OzLpYkHgMlIbdZP2wGvE3yP7b97jld
         pKwA==
X-Gm-Message-State: AOAM531bhdPGkfJIuNCvQwQtTNsY5hGoHGRsUMWmjyomaC+27i5b3jwf
        DSd4L1TNXGxGevK5vaO/f89s6qo+GDR/
X-Google-Smtp-Source: ABdhPJzTauXqJU+HNOojOXxHaZlRlLAlvp5omjWOCpE1u2MuCA3e9JDRMNGA5m7MAhKIy1KE0uMsyA==
X-Received: by 2002:a5d:420b:: with SMTP id n11mr10536429wrq.91.1594809104775;
        Wed, 15 Jul 2020 03:31:44 -0700 (PDT)
Received: from linux-2.fritz.box (85-195-242-113.fiber7.init7.net. [85.195.242.113])
        by smtp.gmail.com with ESMTPSA id u17sm2910421wrp.70.2020.07.15.03.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2020 03:31:43 -0700 (PDT)
Message-ID: <867592c41350b09a0cb67e9a3924f8a2f758d79a.camel@davidgf.net>
Subject: Re: System crash/lockup after plugging CDC ACM device
From:   David Guillen Fandos <david@davidgf.net>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Date:   Wed, 15 Jul 2020 12:31:42 +0200
In-Reply-To: <20200715093029.GB2759174@kroah.com>
References: <9778f9b8a8604e2c13979ea6909678c23cd286cb.camel@davidgf.net>
         <20200715093029.GB2759174@kroah.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3 (3.36.3-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 2020-07-15 at 11:30 +0200, Greg KH wrote:
> On Wed, Jul 15, 2020 at 10:58:03AM +0200, David Guillen Fandos wrote:
> > Hello linux-usb,
> > 
> > I think I might have found a kernel bug related to the USB
> > subsystem
> > (cdc_acm perhaps).
> > 
> > Context: I was playing around with a device I'm creating,
> > essentially a
> > USB quad modem device that exposes four modems to the host system.
> > This
> > device is still a prototype so there's a few bugs here and there,
> > most
> > likely in the USB descriptors and control requests.
> > 
> > What happens: After plugging the device the system starts spitting
> > warnings and BUGs and it locks up. Most of the time some CPUs get
> > into
> > some spinloop and never comes back (you can see it being detected
> > by
> > the watchdog after a few seconds). Generally after that the USB
> > devices
> > stop working completely and at some point the machine freezes
> > completely. In a couple of ocasions I managed to see a bug in dmesg
> > saying "unable to handle page fault for address XXX" and
> > "Supervisor
> > read access in kernel mode" "error code (0x0000) not present page".
> > I
> > could not get a trace for that one since the kernel died completely
> > and
> > my log files were truncated/lost.
> > 
> > Since it is happening to my two machines (both Intel but rather
> > different controllers, Sunrise Point-LP USB 3.0 vs 8 Series/C220)
> > and
> > with different kernel versions I suspect this might be a bug in the
> > kernel.
> > 
> > I have 4 logs that I collected, they are sort of long-ish, not sure
> > how
> > to best send them to the list.
> 
> Send the crashes with the callback list, that should be quite small,
> right?  We don't need the full log.
> 
> The first crash is the most important, the others can be from the
> first
> one and are not reliable.
> 
> thanks,
> 
> greg k-h

Ok then, here comes one of the logs, I selected some bits only

[  147.302016] WARNING: CPU: 3 PID: 134 at kernel/workqueue.c:1473
__queue_work+0x364/0x410
[...]
[  147.302322] Call Trace:
[  147.302329]  <IRQ>
[  147.302342]  queue_work_on+0x36/0x40
[  147.302353]  __usb_hcd_giveback_urb+0x9c/0x110
[  147.302362]  usb_giveback_urb_bh+0xa0/0xf0
[  147.302372]  tasklet_action_common.constprop.0+0x66/0x100
[  147.302382]  __do_softirq+0xe9/0x2dc
[  147.302391]  irq_exit+0xcf/0x110
[  147.302397]  do_IRQ+0x55/0xe0
[  147.302408]  common_interrupt+0xf/0xf
[  147.302413]  </IRQ>
[...]
[  184.771172] watchdog: BUG: soft lockup - CPU#3 stuck for 23s!
[kworker/3:2:134]


The other machines:

Jul 15 01:22:16 localhost kernel: WARNING: CPU: 0 PID: 0 at
kernel/workqueue.c:1473 __queue_work+0x342/0x3e0
[...]
Jul 15 01:22:16 localhost kernel: Call Trace:
Jul 15 01:22:16 localhost kernel: <IRQ>
Jul 15 01:22:16 localhost kernel: queue_work_on+0x36/0x40
Jul 15 01:22:16 localhost kernel: __usb_hcd_giveback_urb+0x6f/0x120
Jul 15 01:22:16 localhost kernel: usb_giveback_urb_bh+0xa0/0xf0
Jul 15 01:22:16 localhost kernel:
tasklet_action_common.isra.0+0x5b/0x100
Jul 15 01:22:16 localhost kernel: __do_softirq+0xee/0x2ff
Jul 15 01:22:16 localhost kernel: irq_exit+0xe9/0xf0
Jul 15 01:22:16 localhost kernel: do_IRQ+0x55/0xe0
Jul 15 01:22:16 localhost kernel: common_interrupt+0xf/0xf
Jul 15 01:22:16 localhost kernel: </IRQ>

Pretty similar as well. This is the first crash, the other ones mention
the cdc-acm but the first ones do not.

In one occasion the first crash seems different, here goes:

[   46.713823] ------------[ cut here ]------------
[   46.713827] refcount_t: underflow; use-after-free.
[   46.713884] WARNING: CPU: 2 PID: 33 at lib/refcount.c:28
refcount_warn_saturate+0xa6/0xf0
[...]
[   46.714148] Call Trace:
[   46.714166]  acm_disconnect+0x198/0x280 [cdc_acm]
[   46.714188]  usb_unbind_interface+0x8a/0x270
[   46.714198]  __device_release_driver+0x15c/0x210
[   46.714204]  device_release_driver+0x24/0x30
[   46.714209]  bus_remove_device+0xdb/0x140
[   46.714218]  device_del+0x16f/0x3f0
[   46.714227]  usb_disable_device+0xd6/0x290
[   46.714234]  usb_disconnect.cold+0x7e/0x205
[   46.714242]  hub_event+0xbfa/0x1810
[   46.714257]  process_one_work+0x1b4/0x380
[   46.714264]  worker_thread+0x53/0x3e0
[   46.714269]  ? process_one_work+0x380/0x380
[   46.714276]  kthread+0x115/0x140
[   46.714284]  ? __kthread_bind_mask+0x60/0x60
[   46.714293]  ret_from_fork+0x35/0x40

Let me know if you need more relevant/complete logs. Will be glad to
send them over.

Thanks
David

