Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50C43428A33
	for <lists+linux-usb@lfdr.de>; Mon, 11 Oct 2021 11:52:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235573AbhJKJyb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 Oct 2021 05:54:31 -0400
Received: from mga14.intel.com ([192.55.52.115]:11493 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235522AbhJKJyb (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 11 Oct 2021 05:54:31 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10133"; a="227127560"
X-IronPort-AV: E=Sophos;i="5.85,364,1624345200"; 
   d="scan'208";a="227127560"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2021 02:52:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,364,1624345200"; 
   d="scan'208";a="625436340"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 11 Oct 2021 02:52:29 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 11 Oct 2021 12:52:28 +0300
Date:   Mon, 11 Oct 2021 12:52:28 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Xu Yang <xu.yang_2@nxp.com>
Cc:     "linux@roeck-us.net" <linux@roeck-us.net>, Jun Li <jun.li@nxp.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [EXT] Re: [PATCH v2] usb: typec: tcpm: fix issue of multiple
 tcpm_set_state
Message-ID: <YWQJXJKWA9uEBaZ9@kuha.fi.intel.com>
References: <20210827114809.1577720-1-xu.yang_2@nxp.com>
 <YWPaPfzlnWdEsk21@kuha.fi.intel.com>
 <DB8PR04MB68432981F23173E7894587D58CB59@DB8PR04MB6843.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DB8PR04MB68432981F23173E7894587D58CB59@DB8PR04MB6843.eurprd04.prod.outlook.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Mon, Oct 11, 2021 at 09:17:54AM +0000, Xu Yang wrote:
> Hi heikki,
> 
> > -----Original Message-----
> > From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > Sent: Monday, October 11, 2021 2:31 PM
> > To: Xu Yang <xu.yang_2@nxp.com>; linux@roeck-us.net
> > Cc: Jun Li <jun.li@nxp.com>; gregkh@linuxfoundation.org; linux-
> > usb@vger.kernel.org; dl-linux-imx <linux-imx@nxp.com>
> > Subject: [EXT] Re: [PATCH v2] usb: typec: tcpm: fix issue of multiple
> > tcpm_set_state
> > 
> > Caution: EXT Email
> > 
> > Guenter, can you check this?
> > 
> > On Fri, Aug 27, 2021 at 07:48:09PM +0800, Xu Yang wrote:
> > > There are potential problems when states are set as following:
> > >
> > >     tcpm_set_state(A, 0)
> > >     tcpm_set_state(B, X)
> > >
> > > As long as the state A is set and the state_machine work is queued
> > > successfully, state_machine work will be scheduled soon after. Before
> > > running into tcpm_state_machine_work(), there is a chance to set state
> > > B again. If it does occur:
> > >
> > > either (X = 0)
> > >     port->state = B and state_machine work is queued again, then work
> > >     will be executed twice.
> > > or (X != 0)
> > >     port->state = A and port->delayed_state = B, then work will be
> > >     executed once but timer is still running.
> > >
> > > For this situation, tcpm should only handle the most recent state
> > > change as if only one state is set just now. Therefore, if the
> > > state_machine work has already been queued, it can't be queued again
> > > before running into tcpm_state_machine_work().
> > >
> > > The state_machine_running flag already prevents from queuing the work,
> > > so we can make it contain the pending stage (after work be queued and
> > > before running into tcpm_state_machine_work). The
> > > state_machine_pending_or_running flag can be used to indicate that a
> > > state can be handled without queuing the work again.
> > >
> > > Because the state_machine work has been queued for state A, there is
> > > no way to cancel as it may be already dequeued later, and then will
> > > run into
> > > tcpm_state_machine_work() certainly. To handle the delayed state B,
> > > such an abnormal work should be skiped. If port->delayed_state !=
> > > INVALID_STATE and timer is still running, it's time to skip.
> > >
> > > Fixes: 4b4e02c83167 ("typec: tcpm: Move out of staging")
> > > cc: <stable@vger.kernel.org>
> > > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > 
> > What changed since v1?
> > 
> > thanks,
> 
> In patch v1, I committed two patches to fix two problems. However, the two 
> problems are resulted by the same reason. And I try to address the issues 
> after it occurs.
> 
> In patch v2, according to Guenter's advice, I try to avoid such problems 
> occurring from the source. So I set a state_machine_pending_or_running flag 
> to indicate that a state can be handled without queuing the work again. 
> Meanwhile, one patch is enough to address the problems.

This did not apply on top of Greg's latest usb-next branch anymore,
so you need to rebase and resend. Don't forget the changelog :-)


thanks,

-- 
heikki
