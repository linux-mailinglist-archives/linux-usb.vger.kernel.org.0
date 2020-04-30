Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 776311BFDDA
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2020 16:21:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726780AbgD3OV5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 30 Apr 2020 10:21:57 -0400
Received: from netrider.rowland.org ([192.131.102.5]:41389 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726550AbgD3OV5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 30 Apr 2020 10:21:57 -0400
Received: (qmail 28927 invoked by uid 500); 30 Apr 2020 10:21:56 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 30 Apr 2020 10:21:56 -0400
Date:   Thu, 30 Apr 2020 10:21:56 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@netrider.rowland.org
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
cc:     Peter Chen <peter.chen@nxp.com>, Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH 1/5] usb: gadget: Introduce usb_request->is_last field
In-Reply-To: <1f366918-1544-7013-6340-2a186791b803@synopsys.com>
Message-ID: <Pine.LNX.4.44L0.2004301019550.27217-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 30 Apr 2020, Thinh Nguyen wrote:

> Peter Chen wrote:

> > If 'transfer size' here is software concept, why controller needs to know? The general
> > controller internal logic doesn't care class protocol, it only cares TRB chain software prepares.
> 
> While some controllers don't have the concept of this, DWC_usb3x does. 
> It has a notion of starting and ending a transfer. While a transfer is 
> started, the endpoint uses a resource. It releases that resource when 
> the transfer completes. So far, dwc3 implemented in such a way that bulk 
> transfers are always in-progress and don't complete. That's fine so far, 
> but it's not the case with streams.

This is peculiar.  I haven't heard of any other controller doing this.

What does the controller use this resource for?  Would anything go 
wrong if you told the controller that each transfer was a single 
usb_request?

Alan Stern

