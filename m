Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B9A1F120722
	for <lists+linux-usb@lfdr.de>; Mon, 16 Dec 2019 14:28:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727859AbfLPN1s (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 Dec 2019 08:27:48 -0500
Received: from mga07.intel.com ([134.134.136.100]:46486 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727601AbfLPN1s (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 16 Dec 2019 08:27:48 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 16 Dec 2019 05:27:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,321,1571727600"; 
   d="scan'208";a="297693213"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.170]) ([10.237.72.170])
  by orsmga001.jf.intel.com with ESMTP; 16 Dec 2019 05:27:45 -0800
Subject: Re: Regression: USB/xhci issues on some systems with newer kernel
 versions
To:     Prashant Malani <pmalani@chromium.org>
Cc:     Bernhard Gebetsberger <bernhard.gebetsberger@gmx.at>,
        linux-usb@vger.kernel.org, Hayes Wang <hayeswang@realtek.com>,
        Grant Grundler <grundler@chromium.org>
References: <3edaf835-7cde-37d9-5a0a-5a9b21a02968@gmx.at>
 <4dfc2bca-e333-4f05-e795-23cbe481d53e@linux.intel.com>
 <485bd962-2a2d-1e15-54c6-3685fb7597a3@gmx.at>
 <50ecb110-8ab6-929b-e33e-025e04a12bc8@linux.intel.com>
 <CACeCKaezMBWH+cnmOdOc+hizW3SNU+Sb5h5PWXdt9f2GcOVfFQ@mail.gmail.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Message-ID: <06beef2f-e1e1-a95e-87d2-597566d1edd3@linux.intel.com>
Date:   Mon, 16 Dec 2019 15:29:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CACeCKaezMBWH+cnmOdOc+hizW3SNU+Sb5h5PWXdt9f2GcOVfFQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Prashant

On 5.12.2019 22.34, Prashant Malani wrote:
> Hi Mathias and Bernhard,
> 
> I was interested in knowing if this issue was resolved (sounded like
> this was deemed to be a hardware error, but I'm not sure).
> The reason I ask is that we've recently noticed a similar error
> popping up while using Realtek rtl8153a-based ethernet USB dongles
> (these use the r8152 driver) on kernel 4.19 :
> " hci_hcd 0000:00:14.0: WARN Set TR Deq Ptr cmd failed due to
> incorrect slot or ep state."
> This is generally followed by the dongle getting reset, and the
> process repeats itself continuously.

Sorry about the delay, your traces show a transaction error, and the port link
going to inactive error state.

xhci driver tries to recover from the transaction error with a soft retry
(endpoint reset), while hub thread will need to reset the whole device to recover
from the inactive link error state.

Can you try reverting commit:
"f8f80be501aa xhci: Use soft retry to recover faster from transaction errors"

If you still see "Transfer error for slot x ep y on endpoint" in dmesg,
but device is not reset and works normally, then it's possible that the soft retry
makes things worse.

If not, then the transaction error and the link inactive error are most likely symptoms
of some other cause.

The hci_hcd 0000:00:14.0: WARN Set TR Deq Ptr cmd failed due to incorrect slot or ep state."
is as in Bernhard's case due to xhci driver trying to issue a command for a slot in context error
state, this part needs to be fixed in the driver, but should not matter much. Device must be reset
anyway to recover from the link inactive error state.

-Mathias

