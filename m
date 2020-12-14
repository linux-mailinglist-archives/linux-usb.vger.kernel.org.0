Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E4E42D9D76
	for <lists+linux-usb@lfdr.de>; Mon, 14 Dec 2020 18:20:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730421AbgLNRS5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 14 Dec 2020 12:18:57 -0500
Received: from netrider.rowland.org ([192.131.102.5]:44905 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1728061AbgLNRS4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 14 Dec 2020 12:18:56 -0500
Received: (qmail 158648 invoked by uid 1000); 14 Dec 2020 12:18:15 -0500
Date:   Mon, 14 Dec 2020 12:18:15 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Alberto Sentieri <22t@tripolho.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: Re: kernel locks due to USB I/O
Message-ID: <20201214171815.GA153671@rowland.harvard.edu>
References: <20201111155130.GB237113@rowland.harvard.edu>
 <9687fac9-94de-50a3-f88e-b7e05d660aba@tripolho.com>
 <20201116170625.GC436089@rowland.harvard.edu>
 <1e58c6f4-c651-b45a-b0fc-7bee40fe61cb@tripolho.com>
 <20201119172250.GC576844@rowland.harvard.edu>
 <0125b936-46b9-0fb8-3fe2-63d1563a1e17@tripolho.com>
 <20201119200147.GB582614@rowland.harvard.edu>
 <4f8f545e-4846-45e0-b8f8-5c73876b150a@tripolho.com>
 <20201119225144.GA590990@rowland.harvard.edu>
 <3df90f9d-0af2-2aaa-9853-966f99e961a4@tripolho.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3df90f9d-0af2-2aaa-9853-966f99e961a4@tripolho.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Dec 14, 2020 at 09:43:25AM -0500, Alberto Sentieri wrote:
> Alan,
> 
> I was finally able to assemble (on my desk) a similar environment which can
> reproduce the problem. It is locking with only 18 USB devices, which are
> being accessed in higher frequency than on the regular application (once
> every 3 seconds instead of once every 15 seconds). I was able to reproduce
> locks with kernel version 5.9.8, which I compiled myself.
> 
> Now a brief description of what I did.
> 
> Each access I referred to on the first paragraph was composed of 3 64-byte
> USB interrupt packets, which are: a request the computer sends, a response
> the device sends back, and a confirmation that the computer send to finish
> the cycle, which would be repeated in about 3 seconds.
> 
> The computer motherboard I am using has a UART (apparently a 16550) and I
> could enable a serial console using: console=tty1 console=ttyS0,115200. I
> also would like to point out that ipv6.disable=1 is the other kernel
> argument I am using. The serial console was working properly and all its
> output was being captured by another computer during the locks. My lab
> machine has the same USB expansion card model being used at the production
> environment and that was the one being used during the experiments. Though
> my lab machine has some extra PCI USB cards installed, they were not being
> using during the locks.
> 
> I did the experiment just a few times during the weekend, after receiving
> the last parts I needed on Saturday.
> 
> So, with kernel 5.4.0-53-generic, which is one of the kernels released with
> Ubuntu, the locked happened in just a couple of minutes. I tried that twice.
> With kernel 5.9.8, the lock took more time to happen. Initially I though it
> would not happen, because I'd observed the machine running for about 15
> minutes and everything seemed normal. However after a couple of hours I
> found the machine locked. I also would like to point out that I’ve been
> using this machine for more than 6 months and that it had never locked on
> me, so that excludes any hardware problem.
> 
> Unfortunately on the 3 times it locked (2 with 5.4.0 and one with 5.9.8)
> nothing was printed on the serial console.
> 
> I will be working on this during the day and I will try to enable some of
> the debugging tools you suggested in your previous emails.
> 
> Any comment on this will be highly appreciated.

We'll have to wait and see what the tests and debugging tools reveal.

As for the comment about the hardware being reliable -- in fact, you 
can't be certain of this.  It may be that your test is stressing the 
hardware in a way that it never experienced during the prior six 
months.

Alan Stern
