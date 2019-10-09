Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92BC7D1789
	for <lists+linux-usb@lfdr.de>; Wed,  9 Oct 2019 20:24:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731254AbfJISYW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Oct 2019 14:24:22 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:59097 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731134AbfJISYW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 9 Oct 2019 14:24:22 -0400
X-Originating-IP: 83.155.44.161
Received: from classic (mon69-7-83-155-44-161.fbx.proxad.net [83.155.44.161])
        (Authenticated sender: hadess@hadess.net)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id D68EE1BF207;
        Wed,  9 Oct 2019 18:24:19 +0000 (UTC)
Message-ID: <0661117fc2ff5f926443513c6685b72b8f371d14.camel@hadess.net>
Subject: Re: [PATCH 4/5] USB: Select better matching USB drivers when
 available
From:   Bastien Nocera <hadess@hadess.net>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Wed, 09 Oct 2019 20:24:19 +0200
In-Reply-To: <Pine.LNX.4.44L0.1910091324300.1603-100000@iolanthe.rowland.org>
References: <Pine.LNX.4.44L0.1910091324300.1603-100000@iolanthe.rowland.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 2019-10-09 at 13:28 -0400, Alan Stern wrote:
<snip>
> No, that's not quite it.
> 
> Here's what should happen when the subclass driver is being probed:
> First, call the generic_probe routine, and return immediately if that
> fails.  Then call the subclass driver's probe routine.  If that gets
> an
> error, fail the probe call but tell the device core that the device
> is
> now bound to the generic driver, not to the subclass driver.

So, something like that, on top of the existing patches? (I'm not sure
whether device_driver_attach is the correct call to use here).

-       if (udriver->probe)
-               return udriver->probe(udev);
-       return 0;
+       if (!udriver->probe)
+               return 0;
+       error = udriver->probe(udev);
+       if (error == -ENODEV &&
+           udrv != &usb_generic_driver)
+               return device_driver_attach(usb_generic_driver.drvwrap.driver, dev);
+       return error;

Anything else in this patch series? I was concerned about the naming
for "generic_init" in patch 2 ("subclass").

If there's nothing, I'll test and respin the patchset with the above
changes tomorrow.

Cheers

