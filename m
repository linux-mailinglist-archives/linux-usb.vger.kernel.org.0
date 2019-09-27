Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 88E20BFF21
	for <lists+linux-usb@lfdr.de>; Fri, 27 Sep 2019 08:28:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725837AbfI0G2Z (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 27 Sep 2019 02:28:25 -0400
Received: from mga12.intel.com ([192.55.52.136]:52431 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725802AbfI0G2Z (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 27 Sep 2019 02:28:25 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 26 Sep 2019 23:28:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,554,1559545200"; 
   d="scan'208";a="193110324"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.170]) ([10.237.72.170])
  by orsmga003.jf.intel.com with ESMTP; 26 Sep 2019 23:28:23 -0700
Subject: Re: [PATCH] xhci: Increase STS_SAVE timeout in xhci_suspend()
To:     Kai-Heng Feng <kai.heng.feng@canonical.com>,
        mathias.nyman@intel.com, gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190926175722.2507-1-kai.heng.feng@canonical.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Message-ID: <ea4f345f-994b-7913-d445-3c64b8d3cd6f@linux.intel.com>
Date:   Fri, 27 Sep 2019 09:30:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190926175722.2507-1-kai.heng.feng@canonical.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 26.9.2019 20.57, Kai-Heng Feng wrote:
> After commit f7fac17ca925 ("xhci: Convert xhci_handshake() to use
> readl_poll_timeout_atomic()"), ASMedia xHCI may fail to suspend.
> 
> Although the algorithms are essentially the same, the old max timeout is
> (usec + usec * time of doing readl()), and the new max timeout is just
> usec, which is much less than the old one.
> 
> Increase the timeout to make ASMedia xHCI able to suspend again.
> 
> BugLink: https://bugs.launchpad.net/bugs/1844021
> Fixes: f7fac17ca925 ("xhci: Convert xhci_handshake() to use readl_poll_timeout_atomic()")
> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> ---

Thanks, adding to queue with stable tag for v5.2+ kernels

-Mathias
