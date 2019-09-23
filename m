Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2166BB64C
	for <lists+linux-usb@lfdr.de>; Mon, 23 Sep 2019 16:13:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407466AbfIWON0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 23 Sep 2019 10:13:26 -0400
Received: from mga17.intel.com ([192.55.52.151]:49448 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404847AbfIWON0 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 23 Sep 2019 10:13:26 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 23 Sep 2019 07:13:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,540,1559545200"; 
   d="scan'208";a="188154197"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.170]) ([10.237.72.170])
  by fmsmga008.fm.intel.com with ESMTP; 23 Sep 2019 07:13:25 -0700
Subject: Re: [PATCH v2] xhci: Prevent deadlock when xhci adapter breaks during
 init
To:     Bill Kuzeja <William.Kuzeja@stratus.com>,
        linux-usb@vger.kernel.org, torez@redhat.com
References: <1569247119-32708-1-git-send-email-William.Kuzeja@stratus.com>
From:   Mathias Nyman <mathias.nyman@intel.com>
Message-ID: <c1a2211e-f71b-5fac-8e55-0780b40301e6@intel.com>
Date:   Mon, 23 Sep 2019 17:15:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1569247119-32708-1-git-send-email-William.Kuzeja@stratus.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 23.9.2019 16.58, Bill Kuzeja wrote:
> The system can hit a deadlock if an xhci adapter breaks while initializing.
> The deadlock is between two threads: thread 1 is tearing down the
> adapter and is stuck in usb_unlocked_disable_lpm waiting to lock the
> hcd->handwidth_mutex. Thread 2 is holding this mutex (while still trying
> to add a usb device), but is stuck in xhci_endpoint_reset waiting for a
> stop or config command to complete. A reboot is required to resolve.
> 
> It turns out when calling xhci_queue_stop_endpoint and
> xhci_queue_configure_endpoint in xhci_endpoint_reset, the return code is
> not checked for errors. If the timing is right and the adapter dies just
> before either of these commands get issued, we hang indefinitely waiting
> for a completion on a command that didn't get issued.
> 
> This wasn't a problem before the following fix because we didn't send
> commands in xhci_endpoint_reset:
> 
> commit f5249461b504 ("xhci: Clear the host side toggle manually when
>      endpoint is soft reset")
> 
> With the patch I am submitting, a duration test which breaks adapters
> during initialization (and which deadlocks with the standard kernel) runs
> without issue.
> 
> Fixes: f5249461b504 ("xhci: Clear the host side toggle manually when
>      endpoint is soft reset")
> 
> Cc: Mathias Nyman <mathias.nyman@intel.com>
> Cc: Torez Smith <torez@redhat.com>
> 
> Signed-off-by: Bill Kuzeja <william.kuzeja@stratus.com>
> Signed-off-by: Torez Smith <torez@redhat.com>
> ---

Thanks, adding to queue

-Mathias

