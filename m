Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A10C63B60BB
	for <lists+linux-usb@lfdr.de>; Mon, 28 Jun 2021 16:28:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233589AbhF1O2u (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 28 Jun 2021 10:28:50 -0400
Received: from netrider.rowland.org ([192.131.102.5]:53175 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S232542AbhF1O0p (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 28 Jun 2021 10:26:45 -0400
Received: (qmail 657845 invoked by uid 1000); 28 Jun 2021 10:24:18 -0400
Date:   Mon, 28 Jun 2021 10:24:18 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Matt Corallo <oc2udbzfd@mattcorallo.com>
Cc:     linux-usb@vger.kernel.org, linux-amlogic@lists.infradead.org,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: ODROID-C1/-C2 USB Detection only triggered by some devices
Message-ID: <20210628142418.GC656159@rowland.harvard.edu>
References: <0badab7c-f12e-e9ed-2f90-2cf5f25f4038@bluematt.me>
 <20210628005825.GA638648@rowland.harvard.edu>
 <e421818c-dea4-ba6b-e737-bb8d99582588@bluematt.me>
 <20210628011628.GC638648@rowland.harvard.edu>
 <0c62655d-738c-4d71-6b7b-fe7fa90b54e3@bluematt.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0c62655d-738c-4d71-6b7b-fe7fa90b54e3@bluematt.me>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Jun 27, 2021 at 09:24:45PM -0400, Matt Corallo wrote:
> 
> 
> On 6/27/21 21:16, Alan Stern wrote:
> > You mean that only devices in the first group are affected by this bug?
> > Devices in the second group are always detected correctly regardless of
> > what else is plugged in?  (This contradicts what you wrote above.)
> 
> 
> Correct. Ignoring hotplug (ie on fresh boot or lsusb -vvv), the devices in
> the second group work great. The devices in the first group do too, but only
> if a device from the second group is present.

Okay.  You can try collecting some usbmon traces to see what's going on.  

First test: Boot with nothing plugged in, start a usbmon trace for bus 0 
(cat /sys/kernel/debug/usb/usbmon/0u >mon1.txt), plug in a first-group 
device, run lsusb -v to trigger enumeration, and then kill the "cat" 
process.

Second test: Same as the first except that you boot with a second-group 
device already plugged in.

The differences between the two traces may indicate where the problem 
is.

Alan Stern
