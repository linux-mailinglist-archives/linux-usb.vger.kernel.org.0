Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6EF665D138
	for <lists+linux-usb@lfdr.de>; Tue,  2 Jul 2019 16:10:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726623AbfGBOK7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 2 Jul 2019 10:10:59 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:48380 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726341AbfGBOK6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 2 Jul 2019 10:10:58 -0400
Received: (qmail 2757 invoked by uid 2102); 2 Jul 2019 10:10:57 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 2 Jul 2019 10:10:57 -0400
Date:   Tue, 2 Jul 2019 10:10:57 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
cc:     EJ Hsu <ejh@nvidia.com>, "balbi@kernel.org" <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH V3] usb: gadget: storage: Remove warning message
In-Reply-To: <CY4PR1201MB003732F412EFABD4046D7FD4AAF80@CY4PR1201MB0037.namprd12.prod.outlook.com>
Message-ID: <Pine.LNX.4.44L0.1907021007380.1647-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 2 Jul 2019, Thinh Nguyen wrote:

> Hi,
> 
> Alan Stern wrote:
> > On Fri, 10 May 2019, EJ Hsu wrote:
> >
> >> This change is to fix below warning message in following scenario:
> >> usb_composite_setup_continue: Unexpected call
> >>
> >> When system tried to enter suspend, the fsg_disable() will be called to
> >> disable fsg driver and send a signal to fsg_main_thread. However, at
> >> this point, the fsg_main_thread has already been frozen and can not
> >> respond to this signal. So, this signal will be pended until
> >> fsg_main_thread wakes up.
> >>
> >> Once system resumes from suspend, fsg_main_thread will detect a signal
> >> pended and do some corresponding action (in handle_exception()). Then,
> >> host will send some setup requests (get descriptor, set configuration...)
> >> to UDC driver trying to enumerate this device. During the handling of "set
> >> configuration" request, it will try to sync up with fsg_main_thread by
> >> sending a signal (which is the same as the signal sent by fsg_disable)
> >> to it. In a similar manner, once the fsg_main_thread receives this
> >> signal, it will call handle_exception() to handle the request.
> >>
> >> However, if the fsg_main_thread wakes up from suspend a little late and
> >> "set configuration" request from Host arrives a little earlier,
> >> fsg_main_thread might come across the request from "set configuration"
> >> when it handles the signal from fsg_disable(). In this case, it will
> >> handle this request as well. So, when fsg_main_thread tries to handle
> >> the signal sent from "set configuration" later, there will nothing left
> >> to do and warning message "Unexpected call" is printed.
> >>
> >> Signed-off-by: EJ Hsu <ejh@nvidia.com>
> >> ---
> >> v2: remove the copyright info
> >> v3: change fsg_unbind() to use FSG_STATE_DISCONNECT
> >> ---

> This patch causes a failure in USB CV TD 9.13 Set Configuration Test.
> Please review and help resolve it.
> Apologize for the short report description. I'll try to capture more
> info if you cannot reproduce it.

Yes, please provide the complete log and information from the failing 
USB CV test.

Alan Stern

