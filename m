Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E278A12FAB2
	for <lists+linux-usb@lfdr.de>; Fri,  3 Jan 2020 17:42:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728065AbgACQmZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Jan 2020 11:42:25 -0500
Received: from mga01.intel.com ([192.55.52.88]:28374 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727817AbgACQmZ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 3 Jan 2020 11:42:25 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 03 Jan 2020 08:42:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,391,1571727600"; 
   d="scan'208";a="302283694"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.170]) ([10.237.72.170])
  by orsmga001.jf.intel.com with ESMTP; 03 Jan 2020 08:42:24 -0800
Subject: Re: [RFC PATCH 1/4] usb: xhci: Synopsys xHC consolidate TRBs
To:     Tejas Joglekar <Tejas.Joglekar@synopsys.com>,
        linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>
Cc:     John Youn <John.Youn@synopsys.com>
References: <cover.1576848504.git.joglekar@synopsys.com>
 <08d08f2fd6da50e382852d014a08e371f2182382.1576848504.git.joglekar@synopsys.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Message-ID: <3b09e3ef-d322-f8c8-f00a-34341509c350@linux.intel.com>
Date:   Fri, 3 Jan 2020 18:44:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <08d08f2fd6da50e382852d014a08e371f2182382.1576848504.git.joglekar@synopsys.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20.12.2019 15.39, Tejas Joglekar wrote:
> The Synopsys xHC has an internal TRB cache of size TRB_CACHE_SIZE for
> each endpoint. The default value for TRB_CACHE_SIZE is 16 for SS and 8
> for HS. The controller loads and updates the TRB cache from the transfer
> ring in system memory whenever the driver issues a start transfer or
> update transfer command.
> 
> For chained TRBs, the Synopsys xHC requires that the total amount of
> bytes for all TRBs loaded in the TRB cache be greater than or equal to 1
> MPS. Or the chain ends within the TRB cache (with a last TRB).
> 
> If this requirement is not met, the controller will not be able to send
> or receive a packet and it will hang causing a driver timeout and error.
> 
> This can be a problem if a class driver queues SG requests with many
> small-buffer entries. The XHCI driver will create a chained TRB for each
> entry which may trigger this issue.
> 
> This patch adds logic to the XHCI driver to detect and prevent this from
> happening.
> 
> For every (TRB_CACHE_SIZE - 2) TRBs, we check the total buffer size of
> the TRBs and if the chain continues and we don't make up at least 1 MPS,
> we create a bounce buffer to consolidate up to the next (4 * MPS) TRBs
> into the last TRB.
> 
> We check at (TRB_CACHE_SIZE - 2) because it is possible that there would
> be a link and/or event data TRB that take up to 2 of the cache entries.
> And we consolidate the next (4 * MPS) to improve performance.
> 
> We discovered this issue with devices on other platforms but have not
> yet come across any device that triggers this on Linux. But it could be
> a real problem now or in the future. All it takes is N number of small
> chained TRBs. And other instances of the Synopsys IP may have smaller
> values for the TRB_CACHE_SIZE which would exacerbate the problem.
> 
> We verified this patch using our internal driver and testing framework.

If I understand the problem correctly you need to make sure the data pointed
to by 16 (SS) or 8 (HS) chained TRBs must be equal to, or more than max packet size.

So in theory this should only be a problem for scatter gather buffers, right?

This should already be handled by usb core unless no_sg_constraint flag is set,
usb core it makes sure each sg list entry length is max packet size divisible, also
meaning it needs to be at least max packet size. (or 0, but not an issue here)

see include/linux/usb.h: struct urb
  
* @sg: scatter gather buffer list, the buffer size of each element in
*      the list (except the last) must be divisible by the endpoint's
*      max packet size if no_sg_constraint isn't set in 'struct usb_bus'"

which is checked in drivers/usb/core/urb.c: usb_submit_urb()

for_each_sg(urb->sg, sg, urb->num_sgs - 1, i)
	if (sg->length % max)
		return -EINVAL;

So it seems all you need to do it make sure that the no_sg_constraint isn't set
for this host controller vendor.

This patch is too intrusive, its a very fine grained and complex solution to a
vendor specific issue that has not caused any real life issues in Linux.
It adds a new spinlock and list of bounce buffer to every transfer descriptor.

-Mathias

