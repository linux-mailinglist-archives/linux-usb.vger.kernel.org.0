Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 28859B3B8C
	for <lists+linux-usb@lfdr.de>; Mon, 16 Sep 2019 15:40:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387478AbfIPNk0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 Sep 2019 09:40:26 -0400
Received: from mga04.intel.com ([192.55.52.120]:53651 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387440AbfIPNk0 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 16 Sep 2019 09:40:26 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 16 Sep 2019 06:40:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,512,1559545200"; 
   d="scan'208";a="185840360"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.170]) ([10.237.72.170])
  by fmsmga008.fm.intel.com with ESMTP; 16 Sep 2019 06:40:25 -0700
Subject: Re: Event ring is full when do iozone test on UAS storage
To:     Peter Chen <peter.chen@nxp.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
References: <20190916094305.GB21844@b29397-desktop>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Message-ID: <0aae13f2-04cf-f45a-e6ee-4bf9e515faba@linux.intel.com>
Date:   Mon, 16 Sep 2019 16:42:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190916094305.GB21844@b29397-desktop>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 16.9.2019 12.41, Peter Chen wrote:
> Hi Mathias,
> 
> I met "event ring full error" like below, this error is met when
> I do iozone test on UAS storage at v4.19.35 kernel, but not meet
> this error at linux-next tree (08/24). The same host and test
> UAS storage device are used. This issue is due to xhci_handle_event
> does not return 0 long time, maybe the xHC speed is fast enough
> at that time. If I force the xhci_handle_event only run 100 times
> before update ERST dequene pointer, it will not occur this error.
> I did not  see any changes for xhci_handle_event at the latest code,
> so in theory, it should have this issue too. Do you think if we need
> to improve xhci_handle_event to avoid event ring?

Possibly.

We need to check the details of what types of events the
ring is filled with, and why handling them takes so long.

does irqsoff tracing show anything blocking interrupts for long?

It's also possible that we don't get interrupts early enough.
Either if interupts are moderated, or event ring is filled with events that
don't generate interrupts (BEI flag set).

-Mathias

