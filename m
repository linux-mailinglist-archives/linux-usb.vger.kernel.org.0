Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A0CF382E3E
	for <lists+linux-usb@lfdr.de>; Mon, 17 May 2021 16:05:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237760AbhEQOFG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 May 2021 10:05:06 -0400
Received: from netrider.rowland.org ([192.131.102.5]:41749 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S234578AbhEQOE4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 17 May 2021 10:04:56 -0400
Received: (qmail 1086015 invoked by uid 1000); 17 May 2021 10:03:39 -0400
Date:   Mon, 17 May 2021 10:03:39 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Dominik Winecki <dominikwinecki@gmail.com>,
        Mathias Nyman <mathias.nyman@intel.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: xHCI over-current causing pm loop
Message-ID: <20210517140339.GD1083813@rowland.harvard.edu>
References: <YKCAoxmr+7bVo63X@hyperion>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YKCAoxmr+7bVo63X@hyperion>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, May 15, 2021 at 10:17:07PM -0400, Dominik Winecki wrote:
> Hello,
> 
> I've got an issue on my laptop (Dell XPS 9570 with an i7-7700HQ) that
> I'm trying to fix. Multiple usb ports are reporting over-current, despite
> nothing being plugged in:
> 
> Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
> Bus 001 Device 002: ID 138a:0091 Validity Sensors, Inc. VFS7552 Touch Fingerprint Sensor
> Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
> 
> Two kworkers running runtime pm are trying to suspend the usb 2 & 3 root hubs.
> The xHCI driver will not suspend a hub with over-current triggered
> (since e9fb08d617bf) so it fails, resumes the hub, and pm tries again.
> This is taking two CPU cores, but it stops if a device of the same usb
> version is plugged in, or if I set the power control policy to on.
> Also, this is blocking system suspend, but that's expected behavior.
> 
> Reverting the e9fb08d617bf check fixes both issues for me, but that may cause
> system halts in other systems. Making it a non-retriable suspend failure
> stops the kworkers but then it will never suspend after an OC event.
> 
> Does it make sense to fix this in the USB driver? Or is this a PM issue?
> I'd rather fix my over-current issue, but taking two cpus whenever xHCI has
> a no-device over-current reading seems like a bug.

As you mentioned, the real bug is in your hardware.  Why does it report 
an over-current condition when nothing is plugged into the port?

The only reasonable way I can think of to fix this would be to add a 
quirk telling the xhci-hcd driver that your hardware does not report 
over-current conditions reliably, so the reports should be ignored.

Alan Stern
