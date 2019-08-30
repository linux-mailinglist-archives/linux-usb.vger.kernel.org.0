Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8065A3538
	for <lists+linux-usb@lfdr.de>; Fri, 30 Aug 2019 12:49:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728170AbfH3Ktg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 30 Aug 2019 06:49:36 -0400
Received: from eumx.net ([91.82.101.43]:60074 "EHLO legacy.eumx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726902AbfH3Ktg (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 30 Aug 2019 06:49:36 -0400
Subject: Re: RK3288 dwc2 USB OTG + macOS
From:   Jack Mitchell <ml@embed.me.uk>
To:     "linux-rockchip@lists.infradead.org" 
        <linux-rockchip@lists.infradead.org>
Cc:     Phillip Karls <prkarls@gmail.com>, linux-usb@vger.kernel.org,
        hminas@synopsys.com
References: <e6321abc-1d3a-cfa1-638a-6051719462ad@embed.me.uk>
Message-ID: <bcda1da2-fcdf-2c5b-d07b-5cf397571eb7@embed.me.uk>
Date:   Fri, 30 Aug 2019 11:49:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <e6321abc-1d3a-cfa1-638a-6051719462ad@embed.me.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-BW
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 22/08/2019 17:06, Jack Mitchell wrote:
> I'm having issues on a Firefly rk3288 board when trying to use USB
> gadget ethernet on macOS. The dr_mode is set to "otg" and it works fine
> with my Linux desktop.
> 
> If I set the dr_mode to "peripheral" macOS will work, but still takes
> around 10 seconds to enumerate the device which makes me think it's only
> just working. However, I need the port to be in "otg" mode as it will
> switch between peripheral/host use cases.
> 
> I've attached a log from the dwc2 driver from mainline Linux 5.2 when
> being plugged into the macOS device for 30 seconds, then removed. The
> mac in this case is a 2013 macbook pro. Any pointers in the right
> direction would be greatly appreciated.
> 
> Regards,
> Jack.
> 

I've been poking about with this some more and I've managed to bisect
the issue down to the following commit

729cac693eecfebdb9e152eaddddd358ae2decb7 usb: dwc2: Change ISOC DDMA flow

If I build before this commit everything works fine with a g_ether
gadget device on mac. Unfortunately it's a rather large change which I
can't just revert in master as it's got multiple dependant commits
later. So, any advice on what could be causing this or how to help debug
it would be much appreciated, as at the moment I've just forward ported
the working 4.16 version of the driver over the 5.3-rc6 broken driver
which isn't very sustainable in the long run.

Regards,
Jack.
