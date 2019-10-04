Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0544FCB699
	for <lists+linux-usb@lfdr.de>; Fri,  4 Oct 2019 10:46:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728841AbfJDIqq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Oct 2019 04:46:46 -0400
Received: from mga06.intel.com ([134.134.136.31]:61539 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725730AbfJDIqq (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 4 Oct 2019 04:46:46 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 04 Oct 2019 01:46:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,255,1566889200"; 
   d="scan'208";a="205809681"
Received: from kuha.fi.intel.com ([10.237.72.53])
  by fmsmga001.fm.intel.com with SMTP; 04 Oct 2019 01:46:43 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Fri, 04 Oct 2019 11:46:42 +0300
Date:   Fri, 4 Oct 2019 11:46:42 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH 4/7] usb: typec: tcpm: Start using struct typec_operations
Message-ID: <20191004084642.GG1048@kuha.fi.intel.com>
References: <20191001094858.68643-1-heikki.krogerus@linux.intel.com>
 <20191001094858.68643-5-heikki.krogerus@linux.intel.com>
 <84d546e9-2f3f-1c82-97d3-ab1cc0c7d818@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <84d546e9-2f3f-1c82-97d3-ab1cc0c7d818@roeck-us.net>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Oct 01, 2019 at 06:30:42AM -0700, Guenter Roeck wrote:
> > @@ -4082,10 +4074,9 @@ static int tcpm_pr_set(const struct typec_capability *cap,
> >   	return ret;
> >   }
> > -static int tcpm_vconn_set(const struct typec_capability *cap,
> > -			  enum typec_role role)
> > +static int tcpm_vconn_set(struct typec_port *p, bool source)
> >   {
> > -	struct tcpm_port *port = typec_cap_to_tcpm(cap);
> > +	struct tcpm_port *port = typec_get_drvdata(p);
> >   	int ret;
> >   	mutex_lock(&port->swap_lock);
> > @@ -4096,7 +4087,7 @@ static int tcpm_vconn_set(const struct typec_capability *cap,
> >   		goto port_unlock;
> >   	}
> > -	if (role == port->vconn_role) {
> > +	if (source == port->vconn_role) {
> 
> source is boolean, vconn_role is enum typec_role.
> The original typec code took advantage of typec_role == TYPEC_SINK matching false,
> and typec_role == TYPEC_SOURCE matching true, but I don't think it is a good
> idea to carry that down to low level drivers. This will confuse everyone who wants
> to contribute a driver in the future.

OK, I'll keep the parameter as emum typec_role.


thanks,

-- 
heikki
