Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0ABA913AD0B
	for <lists+linux-usb@lfdr.de>; Tue, 14 Jan 2020 16:05:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729174AbgANPFi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 Jan 2020 10:05:38 -0500
Received: from mga17.intel.com ([192.55.52.151]:46632 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726450AbgANPFh (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 14 Jan 2020 10:05:37 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 14 Jan 2020 07:05:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,433,1571727600"; 
   d="scan'208";a="305168940"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.170]) ([10.237.72.170])
  by orsmga001.jf.intel.com with ESMTP; 14 Jan 2020 07:05:34 -0800
Subject: Re: [PATCH 1/3] xhci: Ensure link state is U3 after setting
 USB_SS_PORT_LS_U3
To:     Kai-Heng Feng <kai.heng.feng@canonical.com>
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        AceLan Kao <acelan.kao@canonical.com>,
        USB list <linux-usb@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
References: <20200103084008.3579-1-kai.heng.feng@canonical.com>
 <607e395f-21ce-3c9f-eff7-2fa6aaa74595@linux.intel.com>
 <CAAd53p5a2RFpZuHGvuNO_9kgv4dGhHCYU0jeq44FtKJv0Ky8uA@mail.gmail.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Message-ID: <7719f382-e36d-7d31-024c-459ca0fcd91b@linux.intel.com>
Date:   Tue, 14 Jan 2020 17:07:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAAd53p5a2RFpZuHGvuNO_9kgv4dGhHCYU0jeq44FtKJv0Ky8uA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 13.1.2020 11.10, Kai-Heng Feng wrote:
> On Fri, Jan 10, 2020 at 5:33 PM Mathias Nyman
> <mathias.nyman@linux.intel.com> wrote:
>>> @@ -1316,9 +1317,17 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
>>>                        msleep(20); /* wait device to enter */
>>>                        spin_lock_irqsave(&xhci->lock, flags);
>>>
>>> -                     temp = readl(ports[wIndex]->addr);
>>> -                     if (link_state == USB_SS_PORT_LS_U3)
>>> +                     if (link_state == USB_SS_PORT_LS_U3) {
>>> +                             retval = xhci_handshake(ports[wIndex]->addr, PORT_PLS_MASK, XDEV_U3, 80 * 1000);
>>> +                             if (retval)
>>> +                                     xhci_dbg(xhci, "polling XDEV_U3 on port %d-%d timeout\n", hcd->self.busnum, wIndex + 1);
>>
>> In worst case we are busylooping for 80ms here, keeping the cpu busy.
>> It should be ok to sleep here, so how about just reading the register
>> every 10ms max 10 times, sleeping in between.
> 
> Ok. Is the polling safe outside of spin_lock_irqsave()?
> 

Should be, we only read one 32 bit register, and we anyway used to release
and re-acquire the lock right before this anyway.

-Mathias
