Return-Path: <linux-usb+bounces-14866-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D5BC3971EFE
	for <lists+linux-usb@lfdr.de>; Mon,  9 Sep 2024 18:22:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8DA572855DF
	for <lists+linux-usb@lfdr.de>; Mon,  9 Sep 2024 16:22:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32FDC13B285;
	Mon,  9 Sep 2024 16:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alphanet.ch header.i=@alphanet.ch header.b="gnnNpxb+"
X-Original-To: linux-usb@vger.kernel.org
Received: from shakotay.alphanet.ch (shakotay.alphanet.ch [46.140.72.222])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D1313633B
	for <linux-usb@vger.kernel.org>; Mon,  9 Sep 2024 16:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.140.72.222
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725898938; cv=none; b=Ic0hCNs4M5DFrcOgJNZiaDyrlsTi1ZGpeEQrhhTJvakZMCiV81PRVCK2eWb5ICf/NFhXWdPuW4UYUi8VywwbaAEClae47C/fpsxXN1aGfVjbp0oNvxwfn6UbSMze63+Jv9nxRp3J3zHDo3f/t3UarKzHYzWr00Lu5U6BcrLoAN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725898938; c=relaxed/simple;
	bh=wvEWOhVd+uPhrkHaG9OQvwC3DWDjdtLGV0bvqny0UH4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HWnr+D6McJEk3HXqZi5vRcgO7aVVz2Jn+oTzUHFS36m9FMIwgnsJbs4N4kF3EErZNBoPH688zDDeDo7mgwdknUBhNDm1EPgYo/a+S+276uYE+UtIJBLaUvsSwuNFs8x8V7fJ1EcTgoBhY3xTimNC8+8If876kd9Zm9YqntlTNv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alphanet.ch; spf=pass smtp.mailfrom=alphanet.ch; dkim=pass (2048-bit key) header.d=alphanet.ch header.i=@alphanet.ch header.b=gnnNpxb+; arc=none smtp.client-ip=46.140.72.222
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alphanet.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alphanet.ch
Received: by shakotay.alphanet.ch (Postfix, from userid 1022)
	id 107A91240973; Mon,  9 Sep 2024 18:22:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alphanet.ch; s=mail;
	t=1725898926; bh=wvEWOhVd+uPhrkHaG9OQvwC3DWDjdtLGV0bvqny0UH4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gnnNpxb+i9Nl8+Tomoke4dZ/cHERBect96k1lPcV1b1iAmYnOC8BWgVlAUkGloqfF
	 obrrGpo9nV5+xmmI9ZBtdrf1d1VPGYprBH7xDH8U/zS5p+jXb+LA/IpYDgaA8jZcek
	 DdsWfC/mRaNgKxlB7s4+kyzcGG11ZXVDBba0WMXo5fY2mr2oTCTNGvN4wqDSERpV0j
	 iEbZMhp23FV3/ThlWxf7V9fmWW96VcopF3+7421bGq+kNVfpZMRBpNRcdJsFGvkE0H
	 Jb4JZXebBB5+uEORB1hZJG+MqULxgOTyFfbNF2sHFQynHC5EwJce8mki7s5Tn1MyW0
	 fykM/DUNdG6fQ==
Received: from reliant.alphanet.ch (reliant.alphanet.ch [192.168.1.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by shakotay.alphanet.ch (Postfix) with ESMTPS id 5B05E12418F8;
	Mon,  9 Sep 2024 18:21:38 +0200 (CEST)
Received: by reliant.alphanet.ch (Postfix, from userid 1000)
	id 4A0A776CDBE; Mon,  9 Sep 2024 18:21:38 +0200 (CEST)
Date: Mon, 9 Sep 2024 18:21:38 +0200
From: Marc SCHAEFER <schaefer@alphanet.ch>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Micha?? Pecio <michal.pecio@gmail.com>, linux-usb@vger.kernel.org
Subject: Re: Strange issues with UAS URB cancellation
Message-ID: <Zt8gkkRGMdgaEOXX@alphanet.ch>
References: <ZtcVXoI6jNM9Lqbl@alphanet.ch>
 <20240903174535.6e5e581b@foxbook>
 <ZtdmOiKN6hb2Y82I@alphanet.ch>
 <71c073de-8af5-4457-88eb-91a709c2d941@linux.intel.com>
 <ZtiMp39CWrI0e+GB@alphanet.ch>
 <e16c21cd-41f3-4191-9957-6e61ddfefd24@linux.intel.com>
 <ZtnHs8udyl6bfGdF@alphanet.ch>
 <ZtnI57FYnoz1xKxF@alphanet.ch>
 <ZtnpOfv2qXCUy5/i@alphanet.ch>
 <ecc97ef6-ae0f-44e3-ad6e-60a8df0b54a6@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ecc97ef6-ae0f-44e3-ad6e-60a8df0b54a6@linux.intel.com>

Hello,

On Mon, Sep 09, 2024 at 06:24:23PM +0300, Mathias Nyman wrote:
> > [ 4808.165397] xhci_hcd 0000:01:00.0: Cancel URB 00000000bcd65caa, dev 1.1.1, ep 0x85, stream_id 6 starting at offset 0xd9964960
> > [ 4808.439706] xhci_hcd 0000:01:00.0: Cancel URB 000000000d48b0aa, dev 1.1.4, ep 0x85, stream_id 6 starting at offset 0x12c7ef0
> > [ 4808.439981] xhci_hcd 0000:01:00.0: WARN Set TR Deq Ptr cmd invalid because of stream ID configuration
> > [ 4808.439984] xhci_hcd 0000:01:00.0: MN: Set TR Dequeue Pointer Command: deq 00000000012c7f02 stream 6 slot 12 ep 11 flags c
> > [ 4808.450328] xhci_hcd 0000:01:00.0: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 10 comp_code 3
> > [ 4808.450339] xhci_hcd 0000:01:00.0: Looking for event-dma 00000000012c7ef0 trb-start 00000000012c7f00 trb-end 0000000000000000 seg-start 00000000012c7000 seg-end 00000000012c7ff0
> > [ 4808.450342] xhci_hcd 0000:01:00.0: Looking for event-dma 00000000012c7ef0 trb-start 00000000012c6000 trb-end 00000000012c6700 seg-start 00000000012c6000 seg-end 00000000012c6ff0
> > [ 4808.450345] xhci_hcd 0000:01:00.0: MN: No TD found, fix halted ep
> 
> Thanks.
> 
> So the failed 'Set TR Deq' command is the start of the issue.
> 
> xHC host fails to move the past that cancelled transfer, but xhci driver gives
> back the URB anyway. Once ring continues running it starts from that cancelled
> transfer, triggering a babble error, pointing to that given back TD.
> 
> Still unclear why that 'Set TR Deq' command failed in the first place.
> 
> The 'Set TR Deq' command TRB looks fine. Stream ID is ok, (6) and Stream Context
> type (SCT) which is bits 3:1 of dequeue 00000000012c7f02 is looks fine (=1, which
> means  primary stream array with dequeue pointing to transfer ring)
> Maybe stream is dropped, or something else is messing with endpoint context
> MaxPSstream, or Linear Stream Address (LSA) fields before the 'Set TD Deq' command.
> That would trigger stream ID issues like this.
> 
> Can I ask you to add some select traces on top of the patch?
> They should show content of endpoint context:
> 
> as root:

I did that, however, even when mounting to /sys/kernel/debug/tracing, most of
the pseudo-files were actually at /sys/kernel/tracing and I had to fix the
path of the commands.

> Send content of /sys/kernel/debug/tracing/trace

root@video:~# more /tmp/a1
# tracer: nop
#
# entries-in-buffer/entries-written: 49/49   #P:8
#
#                                _-----=> irqs-off/BH-disabled
#                               / _----=> need-resched
#                              | / _---=> hardirq/softirq
#                              || / _--=> preempt-depth
#                              ||| / _-=> migrate-disable
#                              |||| /     delay
#           TASK-PID     CPU#  |||||  TIMESTAMP  FUNCTION
#              | |         |   |||||     |         |
          <idle>-0       [005] d.h2.  1209.080113: xhci_handle_command: CMD: Stop Ring Command: slot 7 sp 0 ep 11 flags C
          <idle>-0       [005] d.h2.  1209.080300: xhci_handle_command: CMD: Set TR Dequeue Pointer Command: deq 00000000d99f6c12 stream 3 slot 7 ep 11 flags C
          <idle>-0       [005] d.h2.  1209.080302: xhci_handle_cmd_set_deq: RS 00011 super-speed plus Ctx Entries 15 MEL 0 us Port# 1/0 [TT Slot 0 Port# 0 TTT 0 Intr 0] Addr 7 State configured
          <idle>-0       [005] d.h2.  1209.080303: xhci_handle_cmd_set_deq_ep: State stopped mult 1 max P. Streams 3 LSA interval 125 us max ESIT payload 0 CErr 3 Type Bulk IN HIDburst 15 maxp 1024 deq 00000000d9933100 avg trb len 0
          <idle>-0       [005] d.h2.  1209.210387: xhci_handle_command: CMD: Stop Ring Command: slot 12 sp 0 ep 11 flags C
          <idle>-0       [005] d.h2.  1209.210558: xhci_handle_command: CMD: Set TR Dequeue Pointer Command: deq 0000000001296853 stream 4 slot 12 ep 11 flags C
          <idle>-0       [005] d.h2.  1209.210560: xhci_handle_cmd_set_deq: RS 00041 super-speed plus Ctx Entries 15 MEL 0 us Port# 1/0 [TT Slot 0 Port# 0 TTT 0 Intr 0] Addr 12 State configured
          <idle>-0       [005] d.h2.  1209.210561: xhci_handle_cmd_set_deq_ep: State stopped mult 1 max P. Streams 3 LSA interval 125 us max ESIT payload 0 CErr 3 Type Bulk IN HIDburst 15 maxp 1024 deq 00000000d9933a00 avg trb len 0
          <idle>-0       [005] d.h2.  1209.222205: xhci_handle_command: CMD: Stop Ring Command: slot 11 sp 0 ep 11 flags C
          <idle>-0       [005] d.h2.  1209.222374: xhci_handle_command: CMD: Set TR Dequeue Pointer Command: deq 0000000001251d63 stream 1 slot 11 ep 11 flags C
          <idle>-0       [005] d.h2.  1209.222375: xhci_handle_cmd_set_deq: RS 00031 super-speed plus Ctx Entries 15 MEL 0 us Port# 1/0 [TT Slot 0 Port# 0 TTT 0 Intr 0] Addr 11 State configured
          <idle>-0       [005] d.h2.  1209.222376: xhci_handle_cmd_set_deq_ep: State stopped mult 1 max P. Streams 3 LSA interval 125 us max ESIT payload 0 CErr 3 Type Bulk IN HIDburst 15 maxp 1024 deq 00000000d9933700 avg trb len 0
          <idle>-0       [005] d.H2.  1209.229176: xhci_handle_command: CMD: Stop Ring Command: slot 11 sp 0 ep 11 flags C
          <idle>-0       [005] d.H2.  1209.229344: xhci_handle_command: CMD: Set TR Dequeue Pointer Command: deq 0000000001251d73 stream 1 slot 11 ep 11 flags C
          <idle>-0       [005] d.H2.  1209.229345: xhci_handle_cmd_set_deq: RS 00031 super-speed plus Ctx Entries 15 MEL 0 us Port# 1/0 [TT Slot 0 Port# 0 TTT 0 Intr 0] Addr 11 State configured
          <idle>-0       [005] d.H2.  1209.229346: xhci_handle_cmd_set_deq_ep: State stopped mult 1 max P. Streams 3 LSA interval 125 us max ESIT payload 0 CErr 3 Type Bulk IN HIDburst 15 maxp 1024 deq 00000000d9933700 avg trb len 0
          <idle>-0       [005] d.h2.  1209.365774: xhci_handle_command: CMD: Stop Ring Command: slot 9 sp 0 ep 11 flags C
          <idle>-0       [005] d.h2.  1209.365941: xhci_handle_command: CMD: Set TR Dequeue Pointer Command: deq 0000000001218983 stream 4 slot 9 ep 11 flags C
          <idle>-0       [005] d.h2.  1209.365943: xhci_handle_cmd_set_deq: RS 00021 super-speed plus Ctx Entries 15 MEL 0 us Port# 1/0 [TT Slot 0 Port# 0 TTT 0 Intr 0] Addr 9 State configured
          <idle>-0       [005] d.h2.  1209.365943: xhci_handle_cmd_set_deq_ep: State stopped mult 1 max P. Streams 3 LSA interval 125 us max ESIT payload 0 CErr 3 Type Bulk IN HIDburst 15 maxp 1024 deq 00000000d9933400 avg trb len 0
          <idle>-0       [005] d.h2.  1209.393909: xhci_handle_command: CMD: Stop Ring Command: slot 9 sp 0 ep 11 flags C
          <idle>-0       [005] d.h2.  1209.394076: xhci_handle_command: CMD: Set TR Dequeue Pointer Command: deq 000000000121a1e2 stream 5 slot 9 ep 11 flags C
          <idle>-0       [005] d.h2.  1209.394077: xhci_handle_cmd_set_deq: RS 00021 super-speed plus Ctx Entries 15 MEL 0 us Port# 1/0 [TT Slot 0 Port# 0 TTT 0 Intr 0] Addr 9 State configured
          <idle>-0       [005] d.h2.  1209.394077: xhci_handle_cmd_set_deq_ep: State stopped mult 1 max P. Streams 3 LSA interval 125 us max ESIT payload 0 CErr 3 Type Bulk IN HIDburst 15 maxp 1024 deq 00000000d9933400 avg trb len 0
          <idle>-0       [005] d.h2.  1809.115095: xhci_handle_command: CMD: Stop Ring Command: slot 7 sp 0 ep 11 flags C
          <idle>-0       [005] d.h2.  1809.115264: xhci_handle_command: CMD: Set TR Dequeue Pointer Command: deq 00000000d99f2bc2 stream 1 slot 7 ep 11 flags C
          <idle>-0       [005] d.h2.  1809.115265: xhci_handle_cmd_set_deq: RS 00011 super-speed plus Ctx Entries 15 MEL 0 us Port# 1/0 [TT Slot 0 Port# 0 TTT 0 Intr 0] Addr 7 State configured
          <idle>-0       [005] d.h2.  1809.115266: xhci_handle_cmd_set_deq_ep: State stopped mult 1 max P. Streams 3 LSA interval 125 us max ESIT payload 0 CErr 3 Type Bulk IN HIDburst 15 maxp 1024 deq 00000000d9933100 avg trb len 0
          <idle>-0       [005] d.h2.  1809.128672: xhci_handle_command: CMD: Stop Ring Command: slot 7 sp 0 ep 11 flags C
          <idle>-0       [005] d.h2.  1809.128843: xhci_handle_command: CMD: Set TR Dequeue Pointer Command: deq 00000000d99f2bd2 stream 1 slot 7 ep 11 flags C
          <idle>-0       [005] d.h2.  1809.128845: xhci_handle_cmd_set_deq: RS 00011 super-speed plus Ctx Entries 15 MEL 0 us Port# 1/0 [TT Slot 0 Port# 0 TTT 0 Intr 0] Addr 7 State configured
          <idle>-0       [005] d.h2.  1809.128845: xhci_handle_cmd_set_deq_ep: State stopped mult 1 max P. Streams 3 LSA interval 125 us max ESIT payload 0 CErr 3 Type Bulk IN HIDburst 15 maxp 1024 deq 00000000d9933100 avg trb len 0
          <idle>-0       [005] d.h2.  1809.303711: xhci_handle_command: CMD: Stop Ring Command: slot 12 sp 0 ep 11 flags C
          <idle>-0       [005] d.h2.  1809.303917: xhci_handle_command: CMD: Set TR Dequeue Pointer Command: deq 0000000001296782 stream 4 slot 12 ep 11 flags C
          <idle>-0       [005] d.h2.  1809.303919: xhci_handle_cmd_set_deq: RS 00041 super-speed plus Ctx Entries 15 MEL 0 us Port# 1/0 [TT Slot 0 Port# 0 TTT 0 Intr 0] Addr 12 State configured
          <idle>-0       [005] d.h2.  1809.303920: xhci_handle_cmd_set_deq_ep: State stopped mult 1 max P. Streams 3 LSA interval 125 us max ESIT payload 0 CErr 3 Type Bulk IN HIDburst 15 maxp 1024 deq 00000000d9933a00 avg trb len 0
          <idle>-0       [005] d.h2.  1809.375752: xhci_handle_command: CMD: Stop Ring Command: slot 11 sp 0 ep 11 flags C
          <idle>-0       [005] d.h2.  1809.375937: xhci_handle_command: CMD: Set TR Dequeue Pointer Command: deq 000000000125b3a3 stream 6 slot 11 ep 11 flags C
          <idle>-0       [005] d.h2.  1809.375939: xhci_handle_cmd_set_deq: RS 00031 super-speed plus Ctx Entries 15 MEL 0 us Port# 1/0 [TT Slot 0 Port# 0 TTT 0 Intr 0] Addr 11 State configured
          <idle>-0       [005] d.h2.  1809.375940: xhci_handle_cmd_set_deq_ep: State stopped mult 1 max P. Streams 3 LSA interval 125 us max ESIT payload 0 CErr 3 Type Bulk IN HIDburst 15 maxp 1024 deq 00000000d9933700 avg trb len 0
          <idle>-0       [005] d.H2.  1809.497074: xhci_handle_command: CMD: Stop Ring Command: slot 9 sp 0 ep 11 flags C
          <idle>-0       [005] d.h2.  1809.497243: xhci_handle_command: CMD: Set TR Dequeue Pointer Command: deq 0000000001217d62 stream 4 slot 9 ep 11 flags C
          <idle>-0       [005] d.h2.  1809.497245: xhci_handle_cmd_set_deq: RS 00021 super-speed plus Ctx Entries 15 MEL 0 us Port# 1/0 [TT Slot 0 Port# 0 TTT 0 Intr 0] Addr 9 State configured
          <idle>-0       [005] d.h2.  1809.497245: xhci_handle_cmd_set_deq_ep: State stopped mult 1 max P. Streams 3 LSA interval 125 us max ESIT payload 0 CErr 3 Type Bulk IN HIDburst 15 maxp 1024 deq 00000000d9933400 avg trb len 0
          <idle>-0       [005] d.h2.  1809.524165: xhci_handle_command: CMD: Stop Ring Command: slot 9 sp 0 ep 11 flags C
          <idle>-0       [005] dNH2.  1809.524235: xhci_handle_command: CMD: Set TR Dequeue Pointer Command: deq 0000000001219f22 stream 5 slot 9 ep 11 flags C
          <idle>-0       [005] dNH2.  1809.524236: xhci_handle_cmd_set_deq: RS 00021 super-speed plus Ctx Entries 15 MEL 0 us Port# 1/0 [TT Slot 0 Port# 0 TTT 0 Intr 0] Addr 9 State configured
          <idle>-0       [005] dNH2.  1809.524237: xhci_handle_cmd_set_deq_ep: State stopped mult 1 max P. Streams 3 LSA interval 125 us max ESIT payload 0 CErr 3 Type Bulk IN HIDburst 15 maxp 1024 deq 00000000d9933400 avg trb len 0
    kworker/5:1H-150     [005] d.h2.  1809.533666: xhci_handle_command: CMD: Reset Endpoint Command: ctx 0000000000000000 slot 9 ep 11 flags t:C
root@video:~# 

> And then send me both the trace and dmesg of triggered case.

[ 1809.518429] xhci_hcd 0000:01:00.0: WARN Set TR Deq Ptr cmd invalid because of stream ID configuration
[ 1809.518434] xhci_hcd 0000:01:00.0: MN: Set TR Dequeue Pointer Command: deq 0000000001219f22 stream 5 slot 9 ep 11 flags C
[ 1809.527627] xhci_hcd 0000:01:00.0: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 10 comp_code 3
[ 1809.527637] xhci_hcd 0000:01:00.0: Looking for event-dma 0000000001219f10 trb-start 0000000001219f20 trb-end 0000000000000000 seg-start 0000000001219000 seg-end 0000000001219ff0
[ 1809.527641] xhci_hcd 0000:01:00.0: Looking for event-dma 0000000001219f10 trb-start 000000000121a000 trb-end 000000000121a720 seg-start 000000000121a000 seg-end 000000000121aff0
[ 1809.527644] xhci_hcd 0000:01:00.0: MN: No TD found, fix halted ep
[ 1816.575134] sd 16:0:0:0: [sdc] tag#5 uas_eh_abort_handler 0 uas-tag 6 inflight: CMD 
[ 1816.575151] sd 16:0:0:0: [sdc] tag#5 CDB: ATA command pass through(12)/Blank a1 06 20 da 00 00 4f c2 00 b0 00 00
[ 1828.638347] xhci_hcd 0000:01:00.0: Cancel URB 000000008009522e, dev 1.1.2, ep 0x85, stream_id 5 starting at offset 0x1219f20
[ 1828.638390] usb 3-1.1.2: stat urb: no pending cmd for uas-tag 6
[ 1828.731237] xhci_hcd 0000:01:00.0: WARN Event TRB for slot 9 ep 10 with no TDs queued?
[ 1840.227417] sd 16:0:0:0: [sdc] tag#4 uas_eh_abort_handler 0 uas-tag 2 inflight: IN 
[ 1840.227426] sd 16:0:0:0: [sdc] tag#4 CDB: Read(16) 88 00 00 00 00 00 15 59 78 00 00 00 04 00 00 00
[ 1840.227433] xhci_hcd 0000:01:00.0: Cancel URB 0000000088ada5bf, dev 1.1.2, ep 0x85, stream_id 2 starting at offset 0x12134d0
[ 1840.228047] sd 16:0:0:0: [sdc] tag#2 uas_eh_abort_handler 0 uas-tag 4 inflight: CMD IN 
[ 1840.228058] sd 16:0:0:0: [sdc] tag#2 CDB: Read(16) 88 00 00 00 00 00 15 59 98 00 00 00 04 00 00 00
[ 1840.228072] xhci_hcd 0000:01:00.0: Cancel URB 00000000498a4d69, dev 1.1.2, ep 0x85, stream_id 4 starting at offset 0x1218d70
[ 1840.236069] sd 16:0:0:0: [sdc] tag#1 uas_eh_abort_handler 0 uas-tag 3 inflight: CMD IN 
[ 1840.236072] sd 16:0:0:0: [sdc] tag#1 CDB: Read(16) 88 00 00 00 00 00 15 59 90 00 00 00 04 00 00 00
[ 1840.236075] xhci_hcd 0000:01:00.0: Cancel URB 00000000ce78030e, dev 1.1.2, ep 0x85, stream_id 3 starting at offset 0x1216730
[ 1840.243820] sd 16:0:0:0: [sdc] tag#0 uas_eh_abort_handler 0 uas-tag 1 inflight: CMD IN 
[ 1840.243823] sd 16:0:0:0: [sdc] tag#0 CDB: Read(16) 88 00 00 00 00 00 15 59 94 00 00 00 04 00 00 00
[ 1840.243836] xhci_hcd 0000:01:00.0: Cancel URB 000000006af8d826, dev 1.1.2, ep 0x85, stream_id 1 starting at offset 0x1211590
[ 1840.258742] xhci_hcd 0000:01:00.0: WARN Event TRB for slot 9 ep 10 with no TDs queued?
[ 1840.283445] scsi host16: uas_eh_device_reset_handler start
[ 1840.283455] xhci_hcd 0000:01:00.0: Cancel URB 00000000ab683c42, dev 1.1.2, ep 0x87, stream_id 4 starting at offset 0x12064c0
[ 1840.283906] xhci_hcd 0000:01:00.0: Cancel URB 0000000084685914, dev 1.1.2, ep 0x87, stream_id 1 starting at offset 0xd9959d80
[ 1840.284415] xhci_hcd 0000:01:00.0: Cancel URB 0000000045b3d678, dev 1.1.2, ep 0x87, stream_id 3 starting at offset 0x1204ee0
[ 1840.375427] usb 3-1.1.2: reset SuperSpeed Plus Gen 2x1 USB device number 7 using xhci_hcd
[ 1840.423055] scsi host16: uas_eh_device_reset_handler success


Have a nice evening.

