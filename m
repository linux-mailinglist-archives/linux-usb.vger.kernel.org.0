Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 535EA1D7C9B
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2020 17:19:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728260AbgERPTm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 18 May 2020 11:19:42 -0400
Received: from netrider.rowland.org ([192.131.102.5]:58655 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726918AbgERPTm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 18 May 2020 11:19:42 -0400
Received: (qmail 17480 invoked by uid 1000); 18 May 2020 11:19:40 -0400
Date:   Mon, 18 May 2020 11:19:40 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Qais Yousef <qais.yousef@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Tony Prisk <linux@prisktech.co.nz>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Oliver Neukum <oneukum@suse.de>,
        linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] usb/ohci-platform: Fix a warning when hibernating
Message-ID: <20200518151940.GC15479@rowland.harvard.edu>
References: <20200424134800.4629-1-qais.yousef@arm.com>
 <Pine.LNX.4.44L0.2004281459240.1555-100000@netrider.rowland.org>
 <20200518145748.puvxkcmyrxc7eqt7@e107158-lin.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200518145748.puvxkcmyrxc7eqt7@e107158-lin.cambridge.arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, May 18, 2020 at 03:57:49PM +0100, Qais Yousef wrote:
> > For both this patch and the 3/3 patch (ehci-platform):
> > 
> > Acked-by: Alan Stern <stern@rowland.harvard.edu>
> 
> Thanks Alan. Did this make it through to any tree? I don't see it on next, nor
> on Linus. But it could be queued somewhere else.
> 
> I have sent v2 to patch 2 (xhci) as a reply, so hopefully it wasn't missed.
> I can resend the whole series if necessary.

Greg, what happened to this series?  Did it just fall through the 
cracks?

Alan Stern
