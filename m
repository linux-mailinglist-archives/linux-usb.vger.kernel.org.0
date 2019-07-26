Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 083EA7614F
	for <lists+linux-usb@lfdr.de>; Fri, 26 Jul 2019 10:50:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725928AbfGZIuH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 26 Jul 2019 04:50:07 -0400
Received: from mga18.intel.com ([134.134.136.126]:34855 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725815AbfGZIuH (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 26 Jul 2019 04:50:07 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 26 Jul 2019 01:50:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,310,1559545200"; 
   d="scan'208";a="321984342"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.164]) ([10.237.72.164])
  by orsmga004.jf.intel.com with ESMTP; 26 Jul 2019 01:50:05 -0700
Subject: Re: xhci-hcd errors with Qualcomm based modem and Asmedia ASM1042A
To:     Daniele Palmas <dnlplm@gmail.com>,
        linux-usb <linux-usb@vger.kernel.org>
References: <CAGRyCJGg8Z6PO1tuWJr9NgXgVEVgxC5jsbN_qSdEDT-t+pHehA@mail.gmail.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Message-ID: <325d7934-092c-2e01-1e34-cd4ad06b7088@linux.intel.com>
Date:   Fri, 26 Jul 2019 11:51:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAGRyCJGg8Z6PO1tuWJr9NgXgVEVgxC5jsbN_qSdEDT-t+pHehA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 24.7.2019 22.09, Daniele Palmas wrote:
> Hello all,
> 
> I've a system with kernel 4.14.127 that is showing unexpected xhci-hcd
> (ASM1042A) errors with a Qualcomm based modem, when running the
> following test:
> 
> - signal strength qmi requests looping every few seconds on
> /dev/cdc-wdm (driver qmi_wwan)
> - iperf tcp data connection test on the modem network interface
> 
> The issue is showing also with kernel 5.0
> 
> The issues is showing in three different ways:
> 
> First one:
> 
> 2019-07-24 15:17:45.495293 kern.err kernel:xhci_hcd 0000:03:00.0:
> ERROR Transfer event TRB DMA ptr not part of current TD ep_index 28
> comp_code 13


> 2019-07-24 15:17:45.495392 kern.warning kernel:xhci_hcd 0000:03:00.0:
> Looking for event-dma 000000007725b420 trb-start 000000007725b400
> trb-end 000000007725b400 seg-start 000000007725b000 seg-end
> 000000007725bff0

The xhci driver expects events for transfers in the same order they were
queued. For some reason we get an event for the transfer block queued at
address b420 before we get events for transfers at b400 and b410.

xhci traces of a 5.0 kernel would show in more detail what's going on.
can be taken with:

mount -t debugfs none /sys/kernel/debug
echo 'module xhci_hcd =p' >/sys/kernel/debug/dynamic_debug/control
echo 'module usbcore =p' >/sys/kernel/debug/dynamic_debug/control
echo 81920 > /sys/kernel/debug/tracing/buffer_size_kb
echo 1 > /sys/kernel/debug/tracing/events/xhci-hcd/enable
< reproduce the issue >
Send output of dmesg
Send content of /sys/kernel/debug/tracing/trace

Note that the trace file can be huge

-Mathias
