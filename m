Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7BDA456C4D
	for <lists+linux-usb@lfdr.de>; Fri, 19 Nov 2021 10:26:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234168AbhKSJ3q (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 19 Nov 2021 04:29:46 -0500
Received: from mga07.intel.com ([134.134.136.100]:61973 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231450AbhKSJ3q (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 19 Nov 2021 04:29:46 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10172"; a="297803620"
X-IronPort-AV: E=Sophos;i="5.87,246,1631602800"; 
   d="scan'208";a="297803620"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2021 01:25:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,246,1631602800"; 
   d="scan'208";a="647103204"
Received: from kuha.fi.intel.com ([10.237.72.166])
  by fmsmga001.fm.intel.com with SMTP; 19 Nov 2021 01:25:19 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Fri, 19 Nov 2021 11:25:18 +0200
Date:   Fri, 19 Nov 2021 11:25:18 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Xu Yang <xu.yang_2@nxp.com>
Cc:     "linux@roeck-us.net" <linux@roeck-us.net>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Jun Li <jun.li@nxp.com>, dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [EXT] Re: [PATCH] usb: typec: tcpm: fix tcpm unregister port but
 leave a pending timer
Message-ID: <YZdtfsCkp1hQpglh@kuha.fi.intel.com>
References: <20211118092352.259748-1-xu.yang_2@nxp.com>
 <YZZSpffDfPd/CJDX@kuha.fi.intel.com>
 <DB8PR04MB68433EAC3FDD82834FDC0E768C9B9@DB8PR04MB6843.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DB8PR04MB68433EAC3FDD82834FDC0E768C9B9@DB8PR04MB6843.eurprd04.prod.outlook.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Nov 18, 2021 at 03:00:16PM +0000, Xu Yang wrote:
> Hi,
> 
> > -----Original Message-----
> > From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > Sent: Thursday, November 18, 2021 9:18 PM
> > To: Xu Yang <xu.yang_2@nxp.com>
> > Cc: linux@roeck-us.net; gregkh@linuxfoundation.org; linux-
> > usb@vger.kernel.org; Jun Li <jun.li@nxp.com>; dl-linux-imx <linux-
> > imx@nxp.com>
> > Subject: [EXT] Re: [PATCH] usb: typec: tcpm: fix tcpm unregister port but
> > leave a pending timer
> > 
> > Caution: EXT Email
> > 
> > Hi,
> > 
> > On Thu, Nov 18, 2021 at 05:23:52PM +0800, Xu Yang wrote:
> > > @@ -6428,6 +6432,9 @@ void tcpm_unregister_port(struct tcpm_port
> > > *port)  {
> > >       int i;
> > 
> > You need to take the port lock here, no?
> > 
> >         mutex_lock(&port->lock);
> > 
> > > +     kthread_destroy_worker(port->wq);
> > > +     port->wq = NULL;
> > 
> >         mutex_unlock(&port->lock);
> 
> I think we should not take the port lock before kthread_destroy_worker() since
> a deadlock might occur. Considering a work is pending and tcpm_unregister_port
> is called at this time, the worker needs to flush all the works after taking
> the port lock in tcpm_unregister_port(). However, the work can't take the port
> lock anymore.

The point is that you create a race with that code. If the port lock
is not useful in this case, there needs to be something else.

thanks,

-- 
heikki
