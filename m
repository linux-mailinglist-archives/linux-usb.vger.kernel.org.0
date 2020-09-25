Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 905492792E5
	for <lists+linux-usb@lfdr.de>; Fri, 25 Sep 2020 23:05:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726559AbgIYVFV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 25 Sep 2020 17:05:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726309AbgIYVFV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 25 Sep 2020 17:05:21 -0400
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05E07C0613CE
        for <linux-usb@vger.kernel.org>; Fri, 25 Sep 2020 14:05:21 -0700 (PDT)
Received: by mail-oi1-x243.google.com with SMTP id 185so4171219oie.11
        for <linux-usb@vger.kernel.org>; Fri, 25 Sep 2020 14:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=NhGblQg5E2ne/zRdnEf3DdyT8Pxnoigkc/MJ11C+hJg=;
        b=d3IEvm80W8KzFnh/+uc7alPUv+cngdVv6CbJ7GEzGxbmQBZLiBjUkX8+JxGTyOtJaN
         cLhgJ5PusJVWzuOiy0B8jPa0e3PmoH6pzobAg/D7bnS3UsH98yzmotSOdUztnmmTYROX
         DIROO4ehX7jsgs+kwTiFfskHTtTssksc0N8yMGcLksaqXPUxPWCqtz5gE2eeUEmnb2dI
         upqyF3ZMphccPdWwbuv4fH8PVsYtbDW2S9O6A6byo5oblu7DqaemlOT2hTqTzSOgUuQp
         /VNeTKVBPelx9ZObdlO4fbVN6nWinOIg81yjpYMNN3cOXKDnfx64LXueQKDf+wPluCV7
         mYBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=NhGblQg5E2ne/zRdnEf3DdyT8Pxnoigkc/MJ11C+hJg=;
        b=l3rU8qMzP5QV2vDYkbpYqmvsmg7Xi9Sfv9QTnn7PCR8jVvctGKU6pNgL5QcFpTcU5j
         SrQBcbR5t3HsWrcevJCDM5e3Wwxu/FCaEV3LLUn8KuaK/UdthMe/jSrNwOto6fJpAyO8
         aXLn4xhe9hZx2xLN7ESRkwXouc4vb9UBRqIRrTie/NYy0kBZCRK838Tw7yzAGoSpa6yd
         zHpa2wx46m5GSCCOSJehoUAdS8m2Hm7p0AdySUxJMBo3euR9jg5/DC7AAr/80iP4iMI4
         kBC5JWPCRua810AhP7PJtP6t2uu8gL8q9T+CQ0tyWkcL5yH07AVJumzBlgZ+cI9ub2hl
         BREQ==
X-Gm-Message-State: AOAM531pXCo1fLKF7c5kMrihqrdlaDr9x2coNX2Clx8/RXbaZY1KZttk
        2V34sY2fc1EbyThd2AdXzuV9+8xnRuZ7ufXD
X-Google-Smtp-Source: ABdhPJyVhx+8CTjlkdvEwbxN/lGm4T4SXDTluGHlN+DjJT7aI+OCmO5IX/JfiUzfuYjiB0xQjOHdzQ==
X-Received: by 2002:aca:5b09:: with SMTP id p9mr288673oib.68.1601067919922;
        Fri, 25 Sep 2020 14:05:19 -0700 (PDT)
Received: from google.com ([2601:285:8380:9270::a07d])
        by smtp.gmail.com with ESMTPSA id l4sm863908oie.25.2020.09.25.14.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2020 14:05:19 -0700 (PDT)
Date:   Fri, 25 Sep 2020 15:05:17 -0600
From:   Ross Zwisler <zwisler@google.com>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "kernel@collabora.com" <kernel@collabora.com>
Subject: Re: xhci problem -> general protection fault
Message-ID: <20200925210517.GA4487@google.com>
References: <65ac3a73-ca57-c3e8-561b-9ba5c15b3c65@collabora.com>
 <a6364bd9-58d9-e66e-5595-7d887a8f3fc9@linux.intel.com>
 <8230c2a2-719c-ef81-e85d-5921bf8e98e6@collabora.com>
 <133c123e-e857-7f83-d146-f39c00afe39f@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <133c123e-e857-7f83-d146-f39c00afe39f@linux.intel.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Sep 25, 2020 at 04:40:29PM +0300, Mathias Nyman wrote:
> On 18.9.2020 17.20, Andrzej Pietrasiewicz wrote:
> > Hi Mathias,
> > 
> > W dniu 18.09.2020 o 12:50, Mathias Nyman pisze:
> >> On 17.9.2020 18.30, Andrzej Pietrasiewicz wrote:
> >>> Dear All,
> >>>
> >>> I have encountered a problem in xhci which leads to general protection fault.
> >>>
> >>> The problem is triggered by running this program:
> >>>
> >>> https://gitlab.collabora.com/andrzej.p/bulk-cancel.git
> >>>
> >>> $ sudo ./bulk-cancel -D /dev/bus/usb/002/006 -i 1 -b 1
> >>>
> >>> where /dev/bus/usb/002/006 is a Gadget Zero:
> >>>
> >>> It takes less than a minute until the crash happens.
> >>> The DMAR (iommu) errors don't happen always, i.e. there are crashes
> >>> when they are not reported in the system log. In either case the
> >>>
> >>> "WARN Cannot submit Set TR Deq Ptr"
> >>> "A Set TR Deq Ptr command is pending."
> >>> "WARN Set TR Deq Ptr cmd failed due to incorrect slot or ep state."
> >>>
> >>> messages do appear.
> >>>
> >>
> >> Nice testcase and report, thanks.
> >>
> >> I started looking at issues in this area some time ago, and wrote a couple patches but
> >> it was left hanging. The two patches (now rebased on 5.9-rc3) can be found in my tree in the
> >> fix_invalid_context_at_stop_endpoint branch
> >>
> >> git://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git fix_invalid_context_at_stop_endpoint
> >>
> >> https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git/log/?h=fix_invalid_context_at_stop_endpoint
> >>
> >> If you could give those a try and see if they help I'd be grateful.
> > 
> > No, it doesn't help, albeit the errors are slightly different:
> > 
> > xhci_hcd 0000:00:14.0: WARN Cannot submit Set TR Deq Ptr
> > xhci_hcd 0000:00:14.0: A Set TR Deq Ptr command is pending.
> > dmar_fault: 44 callbacks suppressed
> > DRHD: handling fault status reg 3> DMAR: [DMA Write] Request device [00:14.0] PASID ffffffff fault addr ffcda000 [fault reason 05] PTE Write access is not set
> > DMAR: DRHD: handling fault status reg 3
> 
> Ok, thanks, the DMA problems make sense to me now.
> 
> If a transfer ring stops on a transfer request (TRB) that should be canceled (manual cancel,
> or error) it's not enough to just turn the  TRB to a no-op.
> HW has most likely cached the TRB, and we need to move the transfer ring dequeue pointer past this TRB.
> Moving deq also clears controller cache.
> 
> We do all this, but if we fail to queue the Set TR Deq command the TRB (with DMA  pointers) will stay on the ring,
> and controller will access the TRB DMA  address once it continues running. At this point xhci driver has already
> given back the canceled/erroneous TRB, and is probably unmapped already.
> Hence the DMAR entries.  
> 
> Looks like this part of the code needs a more extensive rewrite, on top of this we are not handling
> races between endpoints halted due errors, and endpoints stopped by driver to cancel URBs. 
> 
> -Mathias

I'm chasing a similar problem which is also most easily reproduced using
Andrzej's bulk-cancel program, though we have seen it in the field many times
as well with normal usage.

The symptom is that we get the following errors in dmesg:

 xhci_hcd 0000:00:14.0: Mismatch between completed Set TR Deq Ptr command & xHCI internal state.
 xhci_hcd 0000:00:14.0: ep deq seg = 000000001141d6a0, deq ptr = 00000000ebd28dcf
 xhci_hcd 0000:00:14.0: WARNING: Host System Error
 DMAR: DRHD: handling fault status reg 2
 DMAR: [DMA Read] Request device [00:14.0] PASID ffffffff fault addr 0 [fault reason 06] PTE Read access is not set
 xhci_hcd 0000:00:14.0: xHCI host not responding to stop endpoint command.
 xhci_hcd 0000:00:14.0: USBSTS: HCHalted HSE EINT
 xhci_hcd 0000:00:14.0: xHCI host controller not responding, assume dead
 xhci_hcd 0000:00:14.0: HC died; cleaning up

The xhci USB stack loses all attached devices, and on my system at least has
only been recoverable by rebooting.

Full dmesg and trace after 'echo 1 > /sys/kernel/debug/tracing/events/xhci-hcd/enable'
can be found here:

https://gist.github.com/rzwisler/531b926e3d160609ead371c23fc15b55
https://gist.github.com/rzwisler/4621f805737993fec30b5ae23bfd8289

One interesting bit from the trace is that we observe the ep_ctx->deq pointer
being 0 in xhci_handle_cmd_set_deq():

 xhci_inc_enq: CMD 000000000b6352e0: enq 0x00000000ffffe0c0(0x00000000ffffe000) deq 0x00000000ffffe090(0x00000000ffffe000) segs 1 stream 0 free_trbs 251 bounce 0 cycle 0
 xhci_ring_host_doorbell: Ring doorbell for Command Ring 0
 xhci_urb_giveback: ep7in-bulk: urb 000000003c80b7a8 pipe 3221455744 slot 2 length 0/256 sgs 0/0 stream 0 flags 00010200
 xhci_inc_deq: CMD 000000000b6352e0: enq 0x00000000ffffe0c0(0x00000000ffffe000) deq 0x00000000ffffe0a0(0x00000000ffffe000) segs 1 stream 0 free_trbs 252 bounce 0 cycle 0
 xhci_inc_deq: EVENT 00000000b5c6e6a2: enq 0x00000000ffffc000(0x00000000ffffc000) deq 0x00000000ffffc1b0(0x00000000ffffc000) segs 1 stream 0 free_trbs 254 bounce 0 cycle 1
 xhci_handle_event: EVENT: TRB 00000000ffffe0a0 status 'Success' len 0 slot 4 ep 0 type 'Command Completion Event' flags e:C
 xhci_handle_command: CMD: Set TR Dequeue Pointer Command: deq 00000000fff296a1 stream 0 slot 4 ep 3 flags c
 xhci_handle_cmd_set_deq: RS 00000 full-speed Ctx Entries 15 MEL 0 us Port# 13/0 [TT Slot 0 Port# 0 TTT 0 Intr 0] Addr 4 State configured
 xhci_handle_cmd_set_deq_ep: State stopped mult 1 max P. Streams 0 interval 125 us max ESIT payload 0 CErr 3 Type Bulk IN burst 0 maxp 64 deq 0000000000000000 avg trb len 0
																	  ^^^^^^^^^^^^^^^^^^^^
 xhci_dbg_cancel_urb: Successful Set TR Deq Ptr cmd, deq = @00000000
						     ^^^^^^^^^^^^^^^

In successful completions they are real values:

 xhci_ring_ep_doorbell: Ring doorbell for Slot 4 ep1in
 xhci_inc_deq: CMD 000000000b6352e0: enq 0x00000000ffffe0c0(0x00000000ffffe000) deq 0x00000000ffffe0b0(0x00000000ffffe000) segs 1 stream 0 free_trbs 253 bounce 0 cycle 0
 xhci_inc_deq: EVENT 00000000b5c6e6a2: enq 0x00000000ffffc000(0x00000000ffffc000) deq 0x00000000ffffc1c0(0x00000000ffffc000) segs 1 stream 0 free_trbs 254 bounce 0 cycle 1
 xhci_handle_event: EVENT: TRB 00000000ffffe0b0 status 'Success' len 0 slot 2 ep 0 type 'Command Completion Event' flags e:C
 xhci_handle_command: CMD: Set TR Dequeue Pointer Command: deq 00000000fff86551 stream 0 slot 2 ep 15 flags c
 xhci_handle_cmd_set_deq: RS 00000 full-speed Ctx Entries 15 MEL 0 us Port# 11/0 [TT Slot 0 Port# 0 TTT 0 Intr 0] Addr 2 State configured
 xhci_handle_cmd_set_deq_ep: State stopped mult 1 max P. Streams 0 interval 125 us max ESIT payload 0 CErr 3 Type Bulk IN burst 0 maxp 16 deq 00000000fff86551 avg trb len 0
																	  ^^^^^^^^^^^^^^^^^^^^
 xhci_dbg_cancel_urb: Successful Set TR Deq Ptr cmd, deq = @fff86550
						     ^^^^^^^^^^^^^^^

I've noticed that I have to have CONFIG_INTEL_IOMMU_DEFAULT_ON=y for this
clean repro case, else the system still fails but I don't always (ever?) see
the failure to read at address 0.  

Mathias, do you think that your above explanation also covers my failure case?  
Are we just failing to enqueue a Set TR Deq command, and the HC is processing
a stale TRB?  Or does the fact that ep_ctx->deq == 0 not fit with that
explanation?

Other tidbits that I've disovered along the way:

1) We first started noticing this in the field with v4.19 based kernels, but
   I've been able to reproduce it using bulk-cancel with a v4.18 kernel
   without much trouble, so I'm pretty sure it's an old issue.

2) This definitely looks like a race which is very sensitive to timing.  If I
   put a single trace_printk() line in xhci_handle_cmd_set_deq() function, the
   issue is 10x harder to repro (on average 3 seconds to on average 30
   seconds).  Similarly, when we turned on tracing in the field to try and get
   logs the issue reproduces much less frequently.  I also tried to bisect,
   and it turns out that whether or not it reproduced on my system with older
   kernels was dependent on how tracing functions were inlined (!!).

   I think that we started seeing this in the field with v4.19 based kernels
   purely because of a timing change.

3) I did run with your patches from
   https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git/log/?h=fix_invalid_context_at_stop_endpoint
   and it didn't change anything for me.

I'm reading up more on xhci and trying to understand this race, but would
appreciate any help or direction that you're able to provide.

Thanks,
- Ross
