Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B34ED7ACF5
	for <lists+linux-usb@lfdr.de>; Tue, 30 Jul 2019 17:55:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729585AbfG3PzO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 30 Jul 2019 11:55:14 -0400
Received: from mga07.intel.com ([134.134.136.100]:55358 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728813AbfG3PzO (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 30 Jul 2019 11:55:14 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 30 Jul 2019 08:55:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,327,1559545200"; 
   d="scan'208";a="323245421"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.164]) ([10.237.72.164])
  by orsmga004.jf.intel.com with ESMTP; 30 Jul 2019 08:55:12 -0700
Subject: Re: Oops in xhci_endpoint_reset
To:     Bob Gleitsmann <rjgleits@bellsouth.net>,
        Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
References: <a24f7305-abcc-c2ff-bba0-a02b23e34434@bellsouth.net>
 <20190727105955.GE458@kroah.com>
 <bd443170-6886-df60-0d05-849fc7229cd7@bellsouth.net>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Message-ID: <f2ad790f-6ff8-12dd-83fc-6eab89ea98df@linux.intel.com>
Date:   Tue, 30 Jul 2019 18:57:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <bd443170-6886-df60-0d05-849fc7229cd7@bellsouth.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 27.7.2019 23.43, Bob Gleitsmann wrote:
> OK, here's the result of the bisection:
> 
> ef513be0a9057cc6baf5d29566aaaefa214ba344 is the first bad commit
> commit ef513be0a9057cc6baf5d29566aaaefa214ba344
> Author: Jim Lin <jilin@nvidia.com>
> Date:???? Mon Jun 3 18:53:44 2019 +0800
> 
> ?????? usb: xhci: Add Clear_TT_Buffer
> ??????
> ?????? USB 2.0 specification chapter 11.17.5 says "as part of endpoint halt
> ?????? processing for full-/low-speed endpoints connected via a TT, the host
> ?????? software must use the Clear_TT_Buffer request to the TT to ensure
> ?????? that the buffer is not in the busy state".
> ??????
> ?????? In our case, a full-speed speaker (ConferenceCam) is behind a high-
> ?????? speed hub (ConferenceCam Connect), sometimes once we get STALL on a
> ?????? request we may continue to get STALL with the folllowing requests,
> ?????? like Set_Interface.
> ??????
> ?????? Here we invoke usb_hub_clear_tt_buffer() to send Clear_TT_Buffer
> ?????? request to the hub of the device for the following Set_Interface
> ?????? requests to the device to get ACK successfully.
> ??????
> ?????? Signed-off-by: Jim Lin <jilin@nvidia.com>
> ?????? Acked-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> ?????? Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 
> ??drivers/usb/host/xhci-ring.c | 27 ++++++++++++++++++++++++++-
> ??drivers/usb/host/xhci.c?????????? | 21 +++++++++++++++++++++
> ??drivers/usb/host/xhci.h?????????? |?? 5 +++++
> ??3 files changed, 52 insertions(+), 1 deletion(-)
> 
> 

Thanks, a quick look doesn't immediately open up the cause to me.
Most likely an endpoint or struct usb_device got dropped and freed at suspend/resume,
but we probably have some old stale pointer still in a a TD or URB to it.

could you apply the hack below, it should show more details about this issue.

grep for "Mathias" after resume, if you find it we just prevented a crash.

also adding more xhci debugging and tracing would help:

mount -t debugfs none /sys/kernel/debug
echo 'module xhci_hcd =p' >/sys/kernel/debug/dynamic_debug/control
echo 'module usbcore =p' >/sys/kernel/debug/dynamic_debug/control
echo 81920 > /sys/kernel/debug/tracing/buffer_size_kb
echo 1 > /sys/kernel/debug/tracing/events/xhci-hcd/enable
< suspend/resume >
Send output of dmesg
Send content of /sys/kernel/debug/tracing/trace

8<---

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 9741cde..98a515c 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -1809,14 +1809,33 @@ struct xhci_segment *trb_in_td(struct xhci_hcd *xhci,
  static void xhci_clear_hub_tt_buffer(struct xhci_hcd *xhci, struct xhci_td *td,
                 struct xhci_virt_ep *ep)
  {
+       struct usb_device *udev;
+
         /*
          * As part of low/full-speed endpoint-halt processing
          * we must clear the TT buffer (USB 2.0 specification 11.17.5).
          */
+
         if (td->urb->dev->tt && !usb_pipeint(td->urb->pipe) &&
             (td->urb->dev->tt->hub != xhci_to_hcd(xhci)->self.root_hub) &&
             !(ep->ep_state & EP_CLEARING_TT)) {
+               udev = td->urb->dev;
+               if (!udev) {
+                       xhci_err(xhci, "Mathias: missing udev\n");
+                       return;
+               }
+               if (!udev->slot_id)  {
+                       xhci_err(xhci, "Mathias: missing udev->slot_id\n");
+                       return;
+               }
+
+               if (!xhci->devs[udev->slot_id])  {
+                       xhci_err(xhci, "Mathias: missing xhci->devs[udev->slot_id]\n");
+                       return;
+               }
                 ep->ep_state |= EP_CLEARING_TT;
+               xhci_err(xhci, "urb->ep->hcpriv %p,  urb->hcpriv %p\n",
+                        td->urb->ep->hcpriv, td->urb->dev);
                 td->urb->ep->hcpriv = td->urb->dev;
                 if (usb_hub_clear_tt_buffer(td->urb))
                         ep->ep_state &= ~EP_CLEARING_TT;
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 248cd7a..d7978e0 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -3090,8 +3090,19 @@ static void xhci_endpoint_reset(struct usb_hcd *hcd,
         udev = (struct usb_device *) host_ep->hcpriv;
         vdev = xhci->devs[udev->slot_id];
         ep_index = xhci_get_endpoint_index(&host_ep->desc);
+
+       if (!vdev) {
+               xhci_warn(xhci, "Mathias: No vdev for slot id %d\n", udev->slot_id);
+               return;
+       }
         ep = &vdev->eps[ep_index];
  
+       if (!ep) {
+               xhci_warn(xhci, "Mathias: No ep for slot %d ep_index %d\n",
+                         udev->slot_id, ep_index);
+               return;
+       }
+
         /* Bail out if toggle is already being cleared by a endpoint reset */
         if (ep->ep_state & EP_HARD_CLEAR_TOGGLE) {
                 ep->ep_state &= ~EP_HARD_CLEAR_TOGGLE;

