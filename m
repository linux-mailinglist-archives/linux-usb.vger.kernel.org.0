Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 305701E5B2D
	for <lists+linux-usb@lfdr.de>; Thu, 28 May 2020 10:51:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727976AbgE1Ivh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 28 May 2020 04:51:37 -0400
Received: from smtp2.math.uni-bielefeld.de ([129.70.45.13]:55740 "EHLO
        smtp2.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727088AbgE1Ivg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 28 May 2020 04:51:36 -0400
Received: from math.uni-bielefeld.de (kvm01.math.uni-bielefeld.de [129.70.45.15])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by smtp2.math.uni-bielefeld.de (Postfix) with ESMTPSA id 9883F60236;
        Thu, 28 May 2020 10:51:34 +0200 (CEST)
Date:   Thu, 28 May 2020 10:51:33 +0200
From:   Jean Rene Dawin <jdawin@math.uni-bielefeld.de>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Kernel Oops in cdc_acm
Message-ID: <20200528085133.GA17192@math.uni-bielefeld.de>
References: <20200525120026.GA11378@math.uni-bielefeld.de>
 <1590409690.2838.7.camel@suse.com>
 <20200525191624.GA28647@math.uni-bielefeld.de>
 <1590491586.2838.38.camel@suse.com>
 <20200526195750.GA10336@math.uni-bielefeld.de>
 <1590569589.2838.50.camel@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1590569589.2838.50.camel@suse.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Oliver Neukum wrote on Wed 27/05/20 10:53:
> OK, we have two possibilities here. Either
> a4e7279cd1d19f48f0af2a10ed020febaa9ac092 or
> 0afccd7601514c4b83d8cc58c740089cc447051d
> 
> have had a really wierd effect, or they introduced a bug
> that hid a later bug. Can I ask you to run a complicated test
> to decide between these possibilities?
> 
> Could you test a4e7279cd1d19f48f0af2a10ed020febaa9ac092
> together with the patch I sent you applied on top?

Hi,

I tested 0afccd7601514c4b83d8cc58c740089cc447051d and couldn't get it to
show the symptoms.

Then I tested a4e7279cd1d19f48f0af2a10ed020febaa9ac092 with your patch
applied and it still showed the symptom

[  730.590055] Call Trace:
[  730.590058]  <IRQ>
[  730.590062]  queue_work_on+0x36/0x40
[  730.590065]  __usb_hcd_giveback_urb+0x6f/0x120
[  730.590067]  usb_giveback_urb_bh+0xa6/0x100
[  730.590070]  tasklet_action_common.isra.0+0x5f/0x130
[  730.590074]  __do_softirq+0x111/0x34d
[  730.590077]  irq_exit+0xac/0xd0
[  730.590078]  do_IRQ+0x89/0x140
[  730.590080]  common_interrupt+0xf/0xf

but very non-deterministic. The first time the error came up after
the battery was removed the second time. Then after the fourth time. 
And testing again this morning it was after six removals.
I will try to narrow the conditions that tirgger the behaviour.
It seems the timing is important.

Regards,
Jean Rene
