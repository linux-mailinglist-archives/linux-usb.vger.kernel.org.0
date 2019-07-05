Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B0E63605ED
	for <lists+linux-usb@lfdr.de>; Fri,  5 Jul 2019 14:29:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728042AbfGEM3P (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 5 Jul 2019 08:29:15 -0400
Received: from gate.crashing.org ([63.228.1.57]:53751 "EHLO gate.crashing.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726794AbfGEM3P (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 5 Jul 2019 08:29:15 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
        by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x65CSxOJ024146;
        Fri, 5 Jul 2019 07:29:00 -0500
Message-ID: <588e0e632b91cbdd927ac5d5f6ad8ae8f61d19ee.camel@kernel.crashing.org>
Subject: Re: [PATCH V3] usb: gadget: storage: Remove warning message
From:   Benjamin Herrenschmidt <benh@kernel.crashing.org>
To:     EJ Hsu <ejh@nvidia.com>, Alan Stern <stern@rowland.harvard.edu>
Cc:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        WK Tsai <wtsai@nvidia.com>
Date:   Fri, 05 Jul 2019 22:28:58 +1000
In-Reply-To: <BN7PR12MB2644CE5F029CD6A5DE353D88CFF50@BN7PR12MB2644.namprd12.prod.outlook.com>
References: <BN7PR12MB26449A2DC32EC2767CBF6687CFFA0@BN7PR12MB2644.namprd12.prod.outlook.com>
         <Pine.LNX.4.44L0.1907041204570.18767-100000@netrider.rowland.org>
         <BN7PR12MB2644CE5F029CD6A5DE353D88CFF50@BN7PR12MB2644.namprd12.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 2019-07-05 at 10:49 +0000, EJ Hsu wrote:
> 
> Yes, looks like we are facing the same issue.
> 
> The change of Ben is similar to mine, but the priority of FSG_STATE_CONFIG_CHANGE in his patch is higher than FSG_STATE_CONFIG_CLEAR.
> So, it will not hit the USB CV TD 9.13 failure as above.

Correct. This is on purpose. A CONFIG_CHANGE will wipe out the previous
config, so if the queued state was CONFIG_CLEAR, and we haven't
dequeued it yet, we can skip it.

> However, in my opinion, I think we should keep the handling of
> FSG_STATE_CONFIG_CHANGE as it was. FSG_STATE_CONFIG_CHANGE should
> take care of handling FSG_STATE_CONFIG_CLEAR because of its higher
> priority.

My patch does just that. If you get a clear and a change fast enough
(ie, the clear hasn't been dequeued), then the change will override,
which is what we want, since that will cleanup the previous config
regardless.

The entire point of my patch is to make sure that new_fsg is only ever
set in that one place, the config change, and there is no possible
confusion with the async continuation.

> Think about below case:
> When fsg_main_thread tries to handle the FSG_STATE_CONFIG_CHANGE, a disconnect event arise at the same time and fsg_disable() is called accordingly. 
> In this case, FSG_STATE_CONFIG_CLEAR might not be queued. (depending on if FSG_STATE_CONFIG_CHANGE is cleared in handle_exception() )
> If we still call usb_composite_setup_continue() without checking common->new_fsg, the " Unexpected call" message might still be printed (if delayed_status has been cleared in reset_config() ).
> Please correct me if I have any misunderstanding.

new_fsg will never be clear if we do FSG_STATE_CONFIG_CHANGE, that's
the whole point of my patch.

Otherwise we keep having the problem that I described in my cset
comment where two parties stomp on that one variable and confusion
ensures.

Now, there's indeed one remaining issue as you pointed out. If we
disconnect before we've dequeued FSG_STATE_CONFIG_CHANGE.

Is that an issue in practice however ? There are several ways we could
handle that one:

 - We can do a fully ordered queue of events. But that's more complex
and somewhat suboptimal, but would be the most robust I suppose.

 - Or we could be a bit smarter here, and have additional state
information protected by the lock set while queuing
FSG_STATE_CONFIG_CHANGE. This would include the fact that we have a
pending set_alt and thus a delayed status to complete. Then we could
have a flag indicating a disable/disconnect. fsg_disable would set it,
fsg_set_alt would clear it. Those would need to be established with the
same lock that queues the state and *retreived* in the same lock as
well, otherwise we go back to having them change on the fly leading to
inconsistent state.

But in any case, having more than one agent stomping on new_fsg
locklessly from interrupts is going to be a problem and I don't want to
get back down that path.
 
As it is, my patch makes things work for me. Does it work for you ? We
can look at polishing more later.

Cheers,
Ben.


