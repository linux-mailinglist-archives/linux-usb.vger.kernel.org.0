Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F142B159A
	for <lists+linux-usb@lfdr.de>; Thu, 12 Sep 2019 22:51:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727785AbfILUvR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 12 Sep 2019 16:51:17 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:49092 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726308AbfILUvR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 12 Sep 2019 16:51:17 -0400
Received: (qmail 6503 invoked by uid 2102); 12 Sep 2019 16:51:15 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 12 Sep 2019 16:51:15 -0400
Date:   Thu, 12 Sep 2019 16:51:15 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Allen Blaylock <AllenB@epiloglaser.com>
cc:     Manu Gautam <mgautam@codeaurora.org>,
        Peter Chen <peter.chen@nxp.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: EHSET with hub and PCIe root hub
In-Reply-To: <BYAPR20MB2501A4FBEDBBC6353B6EC585CCB00@BYAPR20MB2501.namprd20.prod.outlook.com>
Message-ID: <Pine.LNX.4.44L0.1909121648280.1305-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 12 Sep 2019, Allen Blaylock wrote:

> >I should add that the USB 2.0 spec includes the following text (from section 11.24.2.13):
> >
> >        Test mode of a downstream facing port can only be used in
> >        a well defined sequence of hub states. This sequence is
> >        defined as follows:
> >
> >        1)  All enabled downstream facing ports of the hub containing
> >            the port to be tested must be (selectively) suspended via
> >            the SetPortFeature(PORT_SUSPEND) request.  Each downstream
> >            facing port of the hub must be in the disabled,
> >            disconnected, or suspended state (see Figure 11-9).
> >
> >So you can see the hub probably failed the request because a non-suspended device was connected to port 3.  (And who knows what was attached to the other ports -- the usbmon trace doesn't say.)
> >
> >Alan Stern
> 
> This was very helpful.
> 
> I was able to get the USB3503 to generate test packets by adding a SetPortFeature(PORT_SUSPEND) request to suspend the port before setting the PORT_TEST feature. Is there a way to tell that a device is a hub but not a root hub so ports on root hub ports aren't suspended prior to calling SetPortFeature(PORT_TEST)?
> 
> I tried to use hub_udev->maxchild to determine if something was a hub but this appears misguided since root hubs can have multiple children, nothing else in the usb_device structure jumped out as being directly related to a hub.

That's a perfectly good way to see that the device really is a hub.  In
addition, if hub_udev->parent == NULL then hub_udev is a root hub,
otherwise it isn't.

Alan Stern

