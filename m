Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E5124961E9
	for <lists+linux-usb@lfdr.de>; Fri, 21 Jan 2022 16:21:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351332AbiAUPVO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 21 Jan 2022 10:21:14 -0500
Received: from netrider.rowland.org ([192.131.102.5]:49393 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S243029AbiAUPVL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 21 Jan 2022 10:21:11 -0500
Received: (qmail 18098 invoked by uid 1000); 21 Jan 2022 10:21:10 -0500
Date:   Fri, 21 Jan 2022 10:21:10 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Pratham Pratap <quic_ppratap@quicinc.com>
Cc:     gregkh@linuxfoundation.org, mathias.nyman@intel.com,
        linux-usb@vger.kernel.org, quic_pkondeti@quicinc.com,
        quic_jackp@quicinc.com, quic_mrana@quicinc.com
Subject: Re: [PATCH v1] usb: hub: Power cycle root hub if CSC is set during
 hub_port_reset
Message-ID: <YerPZh1IpFi9xn+a@rowland.harvard.edu>
References: <1642607498-8458-1-git-send-email-quic_ppratap@quicinc.com>
 <YehKeTcpa1mxDHbG@rowland.harvard.edu>
 <6fbf149a-52d7-c348-3d52-61c6f9820481@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6fbf149a-52d7-c348-3d52-61c6f9820481@quicinc.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jan 21, 2022 at 06:39:59PM +0530, Pratham Pratap wrote:
> Hi Alan,
> 
> Thanks for reviewing.
> 
> On 1/19/2022 10:59 PM, Alan Stern wrote:
> > On Wed, Jan 19, 2022 at 09:21:38PM +0530, Pratham Pratap wrote:
> > > When a FS device is following a suspend-reset-enumeration-data
> > > transfer sequence,
> > Such a sequence never happens.  The kernel always does a resume before a
> > reset, if the port is suspended.
> > 
> > I seem to recall reading something in the USB-2 spec saying that this was
> > required (i.e., a suspended port should never be reset without being
> > resumed first), but now I can't find it.
> What if resume failed and the driver ends up in reset resume path?

Use The Source, Luke.  If the resume fails then 
usb_reset_and_verify_device() will return -EINVAL immediately, without 
performing a reset:

	if (udev->state == USB_STATE_NOTATTACHED ||
			udev->state == USB_STATE_SUSPENDED) {
		dev_dbg(&udev->dev, "device reset not allowed in state %d\n",
				udev->state);
		return -EINVAL;
	}

> Also, there can be a possibility of some class driver preforming
> reset-resume(based on quirks).

Despite its name, reset-resume involves performing a resume first and a 
reset second.  You can tell from the fact that the reset isn't performed 
until finish_port_resume() tests the udev->reset_resume flag, which 
occurs after the port has been resumed.

(Furthermore, the reset part of a reset-resume is carried out by calling 
usb_reset_and_verify_device(), which as pointed out above, won't do 
anything if the device is still suspended.)

Alan Stern
