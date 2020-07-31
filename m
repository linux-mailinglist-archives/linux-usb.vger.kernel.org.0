Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC4D223477C
	for <lists+linux-usb@lfdr.de>; Fri, 31 Jul 2020 16:12:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728811AbgGaOMt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 31 Jul 2020 10:12:49 -0400
Received: from netrider.rowland.org ([192.131.102.5]:34807 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1728801AbgGaOMt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 31 Jul 2020 10:12:49 -0400
Received: (qmail 37413 invoked by uid 1000); 31 Jul 2020 10:12:48 -0400
Date:   Fri, 31 Jul 2020 10:12:48 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [PATCH 1/1] usb: gadget: core: wait gadget device .release
 finishing at usb_del_gadget_udc
Message-ID: <20200731141248.GC36650@rowland.harvard.edu>
References: <20200731095935.23034-1-peter.chen@nxp.com>
 <20200731115536.GB1648202@kroah.com>
 <DB8PR04MB7162B2FAC7FACD0A11F6D8218B4E0@DB8PR04MB7162.eurprd04.prod.outlook.com>
 <20200731122520.GB1655976@kroah.com>
 <20200731140553.GA8013@b29397-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200731140553.GA8013@b29397-desktop>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jul 31, 2020 at 02:06:20PM +0000, Peter Chen wrote:
> On 20-07-31 14:25:20, Greg Kroah-Hartman wrote:
> > On Fri, Jul 31, 2020 at 12:11:32PM +0000, Peter Chen wrote:
> > 
> > Grab a reference from somewhere else and do not give it up for a long
> > time.
> > 
> 
> So wait_for_completion_timeout is suitable? The similar use case is when
> we open the file at the USB Drive at Windows, and we click "Eject", it
> will say "The device is currently in use", and refuse our "Eject"
> operation.
> 
> When we try to remove the gadget, if the gadget is in use, we could
> refuse the remove operation, reasonable?

No, the real solution is to fix the UDC drivers.  They need to allocate 
the gadget structure dynamically instead of reusing it.  And they should 
have a real release routine that deallocates the gadget structure.

Alan Stern
