Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75110BE077
	for <lists+linux-usb@lfdr.de>; Wed, 25 Sep 2019 16:46:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438092AbfIYOqQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 25 Sep 2019 10:46:16 -0400
Received: from mga12.intel.com ([192.55.52.136]:54761 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2437125AbfIYOqQ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 25 Sep 2019 10:46:16 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 25 Sep 2019 07:46:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,548,1559545200"; 
   d="scan'208";a="191359855"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.170]) ([10.237.72.170])
  by orsmga003.jf.intel.com with ESMTP; 25 Sep 2019 07:46:14 -0700
Subject: Re: BUG report: usb: dwc3: Link TRB triggered an intterupt without
 IOC being setted
To:     alex zheng <tc0721@gmail.com>
Cc:     Felipe Balbi <felipe.balbi@linux.intel.com>,
        linux-usb@vger.kernel.org, xiaowei.zheng@dji.com
References: <CADGPSwj3aTJjjHvPSZVgxNRGikznL5i=-8Q2hOUb1LoLbWcRDA@mail.gmail.com>
 <87a7avh8uu.fsf@gmail.com>
 <CADGPSwjTn1KwMcxKdajNwxbLi09-SQ1Eu=1m57Z+LNnj0i2BeA@mail.gmail.com>
 <106544ca-7a01-0a86-e785-c7c520ebdc4b@linux.intel.com>
 <CADGPSwi87a5+3mCGAgptHgpBsQk9STQrEKs-kC6Nw55nPdRtOw@mail.gmail.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Message-ID: <5431a9df-3816-b525-c3bc-4e7462d0f38f@linux.intel.com>
Date:   Wed, 25 Sep 2019 17:48:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CADGPSwi87a5+3mCGAgptHgpBsQk9STQrEKs-kC6Nw55nPdRtOw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 24.9.2019 17.45, alex zheng wrote:
> Hi Mathias,
> 
> I try to ignore the DMA errors, then the transfer continues but it
> complete with data lost, it seems like these ERROR Transfer event
> should be right and must not be ignore.
> 
> test app show:
> "did not get enough data, received size:14410176/15000000"
> 
> kernel log show: (you can see more detail info in the attached log files)

Logs show your transfer ring has four segments, but hardware fails to
jump from the last segment back to first)

Last TRB (LINK TRB) of each segment points to the next segment,
last segments link trb points back to first segment.

In your case:
0x1d117000 -> 0x1eb09000 -> 0x1eb0a000 -> 0x1dbda000 -> (back to 0x1d117000)

For some reason your hardware doesn't treat the last TRB at the last segment
as a LINK TRB, instead it just issues a transfer event for it, and continues to
the next address instead of jumping back to first segment:

Transfer event for last TRB at last segment: 0x1dbda000 (TRB: 0x1dbdaff0):
This is a link TRB and should not generate transfer event:

xhci-hcd.0.auto: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 16 comp_code 1
xhci-hcd xhci-hcd.0.auto: Looking for event-dma 000000001dbdaff0 trb-start 000000001d117000 trb-end 000000001d117000 seg-start 000000001d117000 seg-end 000000001d10
xhci-hcd xhci-hcd.0.auto: Ignoring error

Next transfer event should be for TRB at fisrt segment (0x1d117000)
but event shows its trying to handle a event from TRB at 000000001dbdb000, which isn't even part of the ring.

xhci-hcd xhci-hcd.0.auto: process trans event : ep_index = 16, event_dma = 1dbdb000
xhci-hcd xhci-hcd.0.auto: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 16 comp_code 1
xhci-hcd xhci-hcd.0.auto: Looking for event-dma 000000001dbdb000 trb-start 000000001d117000 trb-end 000000001d117000 seg-start 000000001d117000 seg-end 000000001d10
xhci-hcd xhci-hcd.0.auto: Ignoring error

-Mathias
