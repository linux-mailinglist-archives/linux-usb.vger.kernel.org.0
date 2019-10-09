Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C77F8D08F7
	for <lists+linux-usb@lfdr.de>; Wed,  9 Oct 2019 09:58:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726336AbfJIH6l (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Oct 2019 03:58:41 -0400
Received: from mga17.intel.com ([192.55.52.151]:62725 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725879AbfJIH6l (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 9 Oct 2019 03:58:41 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 09 Oct 2019 00:58:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,273,1566889200"; 
   d="scan'208";a="206825859"
Received: from kuha.fi.intel.com ([10.237.72.53])
  by fmsmga001.fm.intel.com with SMTP; 09 Oct 2019 00:58:39 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 09 Oct 2019 10:58:38 +0300
Date:   Wed, 9 Oct 2019 10:58:38 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 1/9] usb: typec: Copy everything from struct
 typec_capability during registration
Message-ID: <20191009075838.GD12909@kuha.fi.intel.com>
References: <20191008111350.68581-1-heikki.krogerus@linux.intel.com>
 <20191008111350.68581-2-heikki.krogerus@linux.intel.com>
 <20191008204428.GA16138@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191008204428.GA16138@roeck-us.net>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Oct 08, 2019 at 01:44:28PM -0700, Guenter Roeck wrote:
> > @@ -1579,9 +1581,10 @@ struct typec_port *typec_register_port(struct device *parent,
> >  	mutex_init(&port->port_type_lock);
> >  
> >  	port->id = id;
> > -	port->cap = cap;
> > +	port->orig_cap = cap;
> >  	port->port_type = cap->type;
> >  	port->prefer_role = cap->prefer_role;
> > +	port->cap = kmemdup(cap, sizeof(*cap), GFP_KERNEL);
> 
> I just realized ... unfortunately kmemdup() can return NULL.

Of course. I'll fix that.

thanks,

-- 
heikki
