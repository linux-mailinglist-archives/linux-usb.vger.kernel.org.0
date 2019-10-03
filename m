Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D13FC9C16
	for <lists+linux-usb@lfdr.de>; Thu,  3 Oct 2019 12:21:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726978AbfJCKVc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Oct 2019 06:21:32 -0400
Received: from mga11.intel.com ([192.55.52.93]:44549 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725892AbfJCKVc (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 3 Oct 2019 06:21:32 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 03 Oct 2019 03:21:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,251,1566889200"; 
   d="scan'208";a="195171894"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.170]) ([10.237.72.170])
  by orsmga003.jf.intel.com with ESMTP; 03 Oct 2019 03:21:30 -0700
Subject: Re: Regression: USB/xhci issues on some systems with newer kernel
 versions
To:     Bernhard Gebetsberger <bernhard.gebetsberger@gmx.at>,
        linux-usb@vger.kernel.org
References: <3edaf835-7cde-37d9-5a0a-5a9b21a02968@gmx.at>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Message-ID: <4dfc2bca-e333-4f05-e795-23cbe481d53e@linux.intel.com>
Date:   Thu, 3 Oct 2019 13:23:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <3edaf835-7cde-37d9-5a0a-5a9b21a02968@gmx.at>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2.10.2019 15.28, Bernhard Gebetsberger wrote:
> Hi,
> 
> There has been a regression in the xhci driver since kernel version 4.20, on some systems some usb devices won't work until the system gets rebooted.
> The error message in dmesg is "WARN Set TR Deq Ptr cmd failed due to incorrect slot or ep state", although for some reason there are some usb devices that are affected by this issue but don't throw the error message(including the device I'm using, I got the error in previous kernel versions though).
> It seems like this bug can also lead to system instability, one user reported in the bug tracker(https://bugzilla.kernel.org/show_bug.cgi?id=202541#c58) that he got a system freeze because of this when using kernel 5.3.1.
> 

Ok, lets take a look at this.
Some of the symptoms vary a bit in the report, so lets focus on ones that
show: "WARN Set TR Deq Ptr cmd failed due to incorrect slot or ep state"

> When looking at the responses in the bug tracker, it looks like it mostly affects Ryzen based systems with 300 series motherboards, although there are some other affected systems as well. It doesn't only affect wifi/bluetooth sticks, some users even got this issue when connecting their smartphone or their external hard drive to their PC.

> 
> I have uploaded the whole dmesg file and the tracing file to transfer.sh: https://transfer.sh/zYohl/dmesg and https://transfer.sh/KNbFL/xhci-trace

Hmm, trying to download these just shows "Not Found"

Could someone with a affected system enable tracing and dynamic debug on a
recent kernel, take logs and traces of one failing instance where the message
"WARN Set TR Deq Ptr cmd failed due to incorrect slot or ep state" is seen.

mount -t debugfs none /sys/kernel/debug
echo 'module xhci_hcd =p' >/sys/kernel/debug/dynamic_debug/control
echo 'module usbcore =p' >/sys/kernel/debug/dynamic_debug/control
echo 81920 > /sys/kernel/debug/tracing/buffer_size_kb
echo 1 > /sys/kernel/debug/tracing/events/xhci-hcd/enable

< Trigger the issue >

Send output of dmesg
Send content of /sys/kernel/debug/tracing/trace

> 
> The issues occur since commit f8f80be501aa2f10669585c3e328fad079d8cb3a "xhci: Use soft retry to recover faster from transaction errors". I think this commit should be reverted at least until a workaround has been found, especially since the next two kernel versions will be used by a lot of distributions(5.4 because it's a LTS kernel and 5.5 will probably be used in Ubuntu 20.04) so more users would be affected by this.
> 

There some time left before 5.4 is out, lets see if we can find the root cause first.

-Mathias

