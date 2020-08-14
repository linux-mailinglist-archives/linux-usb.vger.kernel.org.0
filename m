Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8CEC244B7C
	for <lists+linux-usb@lfdr.de>; Fri, 14 Aug 2020 16:57:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728458AbgHNO56 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 14 Aug 2020 10:57:58 -0400
Received: from netrider.rowland.org ([192.131.102.5]:38247 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726185AbgHNO56 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 14 Aug 2020 10:57:58 -0400
Received: (qmail 33804 invoked by uid 1000); 14 Aug 2020 10:57:57 -0400
Date:   Fri, 14 Aug 2020 10:57:57 -0400
From:   "stern@rowland.harvard.edu" <stern@rowland.harvard.edu>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        "mathias.nyman@intel.com" <mathias.nyman@intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [RESEND PATCH 5/7] usb: host: xhci-plat: initialize device
 wakeup default enabled
Message-ID: <20200814145757.GA32825@rowland.harvard.edu>
References: <20200813033741.13982-1-peter.chen@nxp.com>
 <20200813033741.13982-6-peter.chen@nxp.com>
 <20200814062412.GC22554@b29397-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200814062412.GC22554@b29397-desktop>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Aug 14, 2020 at 06:25:04AM +0000, Peter Chen wrote:
> Hi Alan,
> 
> We may can't set the wakeup enabled as default value since it will
> affect the parent's wakeup setting. See function:
> dpm_propagate_wakeup_to_parent at drivers/base/power/main.c.
> The parent's wakeup_path is set as true during the system
> system routine, then the power domain for the parent will not be
> off (See genpd_finish_suspend) after system suspend, it does not
> meet design expectation. The expectation is the device's power
> domain is only on if the device as wakeup source.
> 
> Even with host-only use case, the thing is the same. If wakeup enabled
> as default, the related power domain will be on during the system
> suspend no matter the wakeup is really wanted.
> 
> Do you agree I set the wakeup default value as disabled?

Yes, I guess so.  There doesn't seem to be any other way to handle this.

What we really should have is a setting which means "Leave wakeup turned 
off unless it is enabled for a child device".  Maybe something like that 
can be added in the future.

Alan Stern
