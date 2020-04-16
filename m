Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C5041AC624
	for <lists+linux-usb@lfdr.de>; Thu, 16 Apr 2020 16:35:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731282AbgDPOez (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Apr 2020 10:34:55 -0400
Received: from netrider.rowland.org ([192.131.102.5]:38911 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1730919AbgDPOex (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 Apr 2020 10:34:53 -0400
Received: (qmail 18144 invoked by uid 500); 16 Apr 2020 10:34:51 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 16 Apr 2020 10:34:51 -0400
Date:   Thu, 16 Apr 2020 10:34:51 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@netrider.rowland.org
To:     Paul Zimmerman <pauldzim@gmail.com>
cc:     Peter Chen <peter.chen@nxp.com>,
        USB list <linux-usb@vger.kernel.org>
Subject: Re: No disconnection event for suspended device at v5.6
In-Reply-To: <20200415162247.04012028@EliteBook>
Message-ID: <Pine.LNX.4.44L0.2004161031060.14937-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 15 Apr 2020, Paul Zimmerman wrote:

> Hi Alan,
> 
> On Wed, 15 Apr 2020 15:40:31 -0400 (EDT) Alan Stern <stern@rowland.harvard.edu> wrote:

> > Paul, I trust this new patch won't mess up your Bluetooth adapter.  It 
> > should still clear the hub->change_bits entry before the hub workqueue 
> > thread wakes up.
> > 
> > Alan Stern

> Unfortunately, my testing on this is somewhat inconclusive. I updated
> to the latest Linus kernel, then did about a half-dozen suspend/resume
> cycles to verify it was still working. Then I applied the patch and
> rebooted into the new kernel. At first I thought it was OK, but after
> about 5 or 6 suspend/resume cycles, the bluetooth stopped working (the
> desktop bluetooth manager in Linux Mint froze when I opened it). Another
> suspend/resume cycle brought it back to life, but after a couple more
> cycles it froze again.

That sounds different from your original bug report.  Didn't the 
adapter fail in a significantly larger fraction of suspends?

> But looking at the dmesg log, there were no errors concerning the
> bluetooth adapter. With the original failure, it would show errors
> before or during the firmware update of the bluetooth adapter, but
> now, the firmware update seemed to complete OK. And to top it off,
> after a reboot, I am no longer able to make it fail. I did more than
> a dozen suspend/resume cycles and have not seen any further failures.
> 
> So, make of that what you will :)

Overall, I guess we can call it a success.  Do you want to collect a 
usbmon trace to verify that the patch behaves as expected, or are you 
happy with the testing so far?

Alan Stern

