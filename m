Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 930E98B5BB
	for <lists+linux-usb@lfdr.de>; Tue, 13 Aug 2019 12:37:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727039AbfHMKhd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 13 Aug 2019 06:37:33 -0400
Received: from mga11.intel.com ([192.55.52.93]:18283 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726086AbfHMKhd (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 13 Aug 2019 06:37:33 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 13 Aug 2019 03:37:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,381,1559545200"; 
   d="scan'208";a="167015994"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.164]) ([10.237.72.164])
  by orsmga007.jf.intel.com with ESMTP; 13 Aug 2019 03:37:31 -0700
Subject: Re: [PATCH] xhci: wait CNR when doing xhci resume
To:     Oliver Neukum <oneukum@suse.com>, Rick Tseng <rtseng@nvidia.com>,
        mathias.nyman@intel.com, gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org
References: <1565594692-23683-1-git-send-email-rtseng@nvidia.com>
 <1565597989.14671.3.camel@suse.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Message-ID: <47f0e5d6-145c-4542-362f-dbb4cccb514d@linux.intel.com>
Date:   Tue, 13 Aug 2019 13:39:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1565597989.14671.3.camel@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 12.8.2019 11.19, Oliver Neukum wrote:
> Am Montag, den 12.08.2019, 15:24 +0800 schrieb Rick Tseng:
>> From: Rick <rtseng@nvidia.com>
>>
>> NVIDIA 3.1 xHCI card would lose power when moving power state into D3Cold.
>> Thus we need to wait CNR bit to clear when xhci resmue as xhci init.
> 
> Should any controller have CNR set? Why is this specific to a vendor?
> 

Good point, always checking CNR in resume sounds like a good idea.

And use xhci_handshake() as Felipe pointed out, just like in xhci_reset():

ret = xhci_handshake(&xhci->op_regs->status, STS_CNR, 0, 10 * 1000 * 1000);

Rick, would you like to write a patch for this?

-Mathias


