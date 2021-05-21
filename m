Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A840038C944
	for <lists+linux-usb@lfdr.de>; Fri, 21 May 2021 16:34:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235993AbhEUOfk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 21 May 2021 10:35:40 -0400
Received: from netrider.rowland.org ([192.131.102.5]:43995 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S235995AbhEUOfi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 21 May 2021 10:35:38 -0400
Received: (qmail 1240856 invoked by uid 1000); 21 May 2021 10:34:14 -0400
Date:   Fri, 21 May 2021 10:34:14 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        Guido Kiener <Guido.Kiener@rohde-schwarz.com>,
        dave penkler <dpenkler@gmail.com>,
        USB list <linux-usb@vger.kernel.org>
Subject: Re: Recovering from transaction errors [was: Re: [syzbot] INFO: rcu
 detected stall in tx]
Message-ID: <20210521143414.GA1239965@rowland.harvard.edu>
References: <d673611ca53f42a3a629eb051cabc6eb@rohde-schwarz.com>
 <20210519173545.GA1173157@rowland.harvard.edu>
 <12088413-2f7d-a1e5-5e8a-25876d85d18a@synopsys.com>
 <20210520020117.GA1186755@rowland.harvard.edu>
 <74b2133b-2f77-c86f-4c8b-1189332617d3@synopsys.com>
 <20210520210506.GA1218545@rowland.harvard.edu>
 <4f73f443-7509-e740-c6b9-884614dcfd4b@synopsys.com>
 <20210521012149.GB1224757@rowland.harvard.edu>
 <c5ac1967-fcae-1e85-57d3-ec610aebd97e@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c5ac1967-fcae-1e85-57d3-ec610aebd97e@synopsys.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, May 21, 2021 at 02:12:43AM +0000, Thinh Nguyen wrote:
> Alan Stern wrote:
> > At the moment, I think the best approach is Guido's suggestion to reject 
> > URBs submitted to endpoints that have gotten a transaction error, until 
> > the error status has somehow been cleared.  Is that what you would like 
> > to see automated?
> > 
> 
> First, just want to point out that I'm not familiar with syzbot. I was
> just thinking if this issue occurs, and if the user wants to start a new
> test, then she doesn't have to unplug+plug the device back and allow
> some application to automatically trigger a new test after a failure.

If you're just talking about syzbot testing, this isn't a issue.  Syzbot 
doesn't test real devices; it tests emulated devices using a 
special-purpose userspace driver.

Alan Stern
