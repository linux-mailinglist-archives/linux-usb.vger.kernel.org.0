Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0EC1A25FBF8
	for <lists+linux-usb@lfdr.de>; Mon,  7 Sep 2020 16:22:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729801AbgIGOVX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Sep 2020 10:21:23 -0400
Received: from netrider.rowland.org ([192.131.102.5]:35061 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1729759AbgIGOSz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 7 Sep 2020 10:18:55 -0400
Received: (qmail 762377 invoked by uid 1000); 7 Sep 2020 10:18:14 -0400
Date:   Mon, 7 Sep 2020 10:18:14 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Peter Chen <peter.chen@nxp.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [PATCH 1/1] usb: gadget: core: wait gadget device .release
 finishing at usb_del_gadget_udc
Message-ID: <20200907141814.GA762136@rowland.harvard.edu>
References: <20200731095935.23034-1-peter.chen@nxp.com>
 <20200731115536.GB1648202@kroah.com>
 <DB8PR04MB7162B2FAC7FACD0A11F6D8218B4E0@DB8PR04MB7162.eurprd04.prod.outlook.com>
 <20200731122520.GB1655976@kroah.com>
 <20200731140553.GA8013@b29397-desktop>
 <20200731141632.GB1717752@kroah.com>
 <877dt610z6.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <877dt610z6.fsf@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Sep 07, 2020 at 10:48:29AM +0300, Felipe Balbi wrote:
> Greg Kroah-Hartman <gregkh@linuxfoundation.org> writes:
> 
> Hi,
> 
> > On Fri, Jul 31, 2020 at 02:06:20PM +0000, Peter Chen wrote:
> >> > And this no-op function is horrid.  There used to be documentation in
> >> > the kernel where I could rant about this, but instead, I'll just say,
> >> > "why are people trying to work around warnings we put in the core kernel
> >> > to fix common problems?  Do they think we did that just because we
> >> > wanted to be mean???"
> >> > 
> >> 
> >> So, like kernel doc for device_initialize said, a proper fix for dwc3
> >> should be zeroed gadget device memory at its own driver before the 
> >> gadget device register to driver core, right?
> >
> > It should get a totally different, dynamically allocated structure.
> > NEVER recycle them.
> 
> then we break usage of container_of(). That's okay, but we have to add
> some sort of private_data to the gadget structure so UDC drivers can get
> their own pointers back.

As you've probably seen by now, Peter solved this problem by storing the 
private back-pointer in gadget->dev.platform_data.

Alan Stern
