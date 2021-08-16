Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EE393ECC28
	for <lists+linux-usb@lfdr.de>; Mon, 16 Aug 2021 03:04:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231969AbhHPBD7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 15 Aug 2021 21:03:59 -0400
Received: from netrider.rowland.org ([192.131.102.5]:59911 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S230124AbhHPBD7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 15 Aug 2021 21:03:59 -0400
Received: (qmail 107272 invoked by uid 1000); 15 Aug 2021 21:03:27 -0400
Date:   Sun, 15 Aug 2021 21:03:27 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Peter Chen <peter.chen@kernel.org>
Cc:     Jeaho Hwang <jhhwang@rtst.co.kr>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: chipidea: fix RT issue for udc
Message-ID: <20210816010327.GA106658@rowland.harvard.edu>
References: <20210810060228.GA3326442@ubuntu>
 <20210816005205.GA3907@nchen>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210816005205.GA3907@nchen>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Aug 16, 2021 at 08:52:06AM +0800, Peter Chen wrote:
> On 21-08-10 15:02:28, Jeaho Hwang wrote:
> > hw_ep_prime sometimes fails if irq occurs while it rus on RT kernel.
> > to prevent local_irq_save should keep the function from irqs.
> > 
> > I am not sure where is the best to submit this patch, between RT and USB
> > community so sending to both. thanks.
> 
> Greg, do you have any suggestions about it, the RT kernel schedules the interrupt
> handler (top-half) out which causes the USB hardware atomic sequences are broken,
> these hardware operations needs to be executed within limited time.

The RT kernel does its scheduling based on priorities.  If the 
interrupt handler is scheduled out, it's because some other process 
with a higher priority needs to run.  The answer should be to increase 
the handler's priority.

Alan Stern
