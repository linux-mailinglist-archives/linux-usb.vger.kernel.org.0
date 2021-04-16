Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F5A53623BD
	for <lists+linux-usb@lfdr.de>; Fri, 16 Apr 2021 17:21:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343497AbhDPPUC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 16 Apr 2021 11:20:02 -0400
Received: from salscheider.org ([202.61.254.1]:35654 "EHLO
        mail.salscheider.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235877AbhDPPTX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 16 Apr 2021 11:19:23 -0400
Received: from [IPv6:2001:16b8:22e9:1800:3e0d:bbbf:473b:6aef] (200116b822e918003e0dbbbf473b6aef.dip.versatel-1u1.de [IPv6:2001:16b8:22e9:1800:3e0d:bbbf:473b:6aef])
        by mail.salscheider.org (Postfix) with ESMTPSA id 625A017F224;
        Fri, 16 Apr 2021 17:18:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salscheider.org;
        s=dkim; t=1618586337;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=KLS9jS/42Bz1Gs+KOGXHGVT8fuoKNSY9FF4fK71voaQ=;
        b=ZEF4l9xee8mwZvbo6KXIWNi0JojpYC7BQiTR4MBj1NVFA9u2DtoZ7il3CmNUTYfAeF3/Tp
        i1PONwWqeorkn1DKKpVFpweUNuNC0Tscoaqwcmcjcq3qnTJSYJfdyRppZ6eflp46Uod+bx
        4Ipykwg8TFR2DT1p7enEO2wXywFHHrw=
Subject: Re: [PATCH] [RFC] xhci: Add Link TRB sync quirk for ASM3142
To:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        linux-usb@vger.kernel.org
Cc:     Mathias Nyman <mathias.nyman@intel.com>
References: <20210416093729.41865-1-ole@salscheider.org>
 <9bf0060c-3427-a261-531c-c075054ae094@linux.intel.com>
From:   Ole Salscheider <ole@salscheider.org>
Message-ID: <5c92dd8c-c8b0-40b5-addb-2df360673462@salscheider.org>
Date:   Fri, 16 Apr 2021 17:18:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <9bf0060c-3427-a261-531c-c075054ae094@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Mathias.

On 16.04.21 14:09, Mathias Nyman wrote:
 > Hi Ole
 >
 > On 16.4.2021 12.37, Ole Salscheider wrote:
 >> This patch adds a quirk to the xhci driver so that link TRBs are only
 >> given to the host controller once it has processed all previous TRBs on
 >> this segment.
 >>
 >> This quirk is necessary for me on an ASMedia ASM3142 host controller.
 >> Without it, I get the following errors when accessing a SuperSpeed UVC
 >> camera:
 >>
 >> Transfer event TRB DMA ptr not part of current TD ep_index XX 
comp_code XX
 >>
 >> You can find more details in my previous mail about the problem:
 >> https://lkml.org/lkml/2021/3/31/355
 >>
 >> This patch fixes my problem, but it is probably terribly wrong. I am not
 >> even sure if I can rely on handle_tx_event being called before each link
 >> TRB in the segment. Some feedback would be very welcome.
 >
 > I think we need to look at the cause more closely.
 >
 > We normally only get events for the last TRB of a TD, or for short 
transfers like in your case.
 > So not every transfer TRB generates events.
 >
 > There are several things going on here that combined could cause this.
 >
 > Last transfer TRB of a segment has some alignment requirements which 
  might not be handled in the isoc case.
 > The amount of untransferred data is large, (16388 bytes) so the TRB 
causing the short packet
 > could be far from the last TRB we expect the event on.
 > Due to new segment and link trb maybe the stored last_trb for this TD 
is just set wrong
 >
 > Anyway, more detailed traces together with dynamic debug show us more:
 >
 > mount -t debugfs none /sys/kernel/debug
 > echo 'module xhci_hcd =p' >/sys/kernel/debug/dynamic_debug/control
 > echo 'module usbcore =p' >/sys/kernel/debug/dynamic_debug/control
 > echo 81920 > /sys/kernel/debug/tracing/buffer_size_kb
 > echo 1 > /sys/kernel/debug/tracing/events/xhci-hcd/enable
 > < trigger the issue >
 > Send output of dmesg
 > Send content of /sys/kernel/debug/tracing/trace
 >
 > trace accumulates pretty fast so try to copy it as soon as the issue 
is seen.

I have uploaded the dmesg output to
https://stuff.salscheider.org/dmesg_out
and the trace to
https://stuff.salscheider.org/trace_out

With the trace enabled, I did not get the DMA errors. Maybe it slowed 
down the computer enough. But still the camera stream froze after ~3 frames.

The log contains a recording with ffmpeg that gave a few frames (at 
second 83), then some where it hung completely. Then I re-plugged the 
camera and got a few more frames (at second 179) before it hung again.

I hope this is helpful. If you need a different log please tell me.

Best regards,

Ole
