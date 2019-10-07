Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D0CACDD86
	for <lists+linux-usb@lfdr.de>; Mon,  7 Oct 2019 10:44:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727295AbfJGIoa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Oct 2019 04:44:30 -0400
Received: from mga09.intel.com ([134.134.136.24]:16693 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727258AbfJGIoa (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 7 Oct 2019 04:44:30 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 07 Oct 2019 01:44:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,267,1566889200"; 
   d="scan'208";a="206366215"
Received: from kuha.fi.intel.com ([10.237.72.53])
  by fmsmga001.fm.intel.com with SMTP; 07 Oct 2019 01:44:27 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 07 Oct 2019 11:44:26 +0300
Date:   Mon, 7 Oct 2019 11:44:26 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 3/7] usb: typec: Separate the operations vector
Message-ID: <20191007084426.GB14192@kuha.fi.intel.com>
References: <20191004150817.45413-1-heikki.krogerus@linux.intel.com>
 <20191004150817.45413-4-heikki.krogerus@linux.intel.com>
 <9f45326d-8667-25e0-755a-37d1a76e5b83@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9f45326d-8667-25e0-755a-37d1a76e5b83@roeck-us.net>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Oct 05, 2019 at 10:36:02AM -0700, Guenter Roeck wrote:
> On 10/4/19 8:08 AM, Heikki Krogerus wrote:
> > Introducing struct typec_operations which has the same
> > callbacks as struct typec_capability. The old callbacks are
> > kept for now, but after all users have been converted, they
> > will be removed.
> > 
> > Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > ---
> >   drivers/usb/typec/class.c | 39 +++++++++++++++++++++++++++++----------
> >   include/linux/usb/typec.h | 20 ++++++++++++++++++++
> >   2 files changed, 49 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> > index 89ffe370e426..f4972b7ee022 100644
> > --- a/drivers/usb/typec/class.c
> > +++ b/drivers/usb/typec/class.c
> > @@ -54,6 +54,7 @@ struct typec_port {
> >   	const struct typec_capability	*orig_cap; /* to be removed */
> >   	const struct typec_capability	*cap;
> > +	const struct typec_operations   *ops;
> >   };
> >   #define to_typec_port(_dev_) container_of(_dev_, struct typec_port, dev)
> > @@ -956,7 +957,7 @@ preferred_role_store(struct device *dev, struct device_attribute *attr,
> >   		return -EOPNOTSUPP;
> >   	}
> > -	if (!port->cap->try_role) {
> > +	if (!port->cap->try_role || (!port->ops && !port->ops->try_role)) {
> 
> Even though it is only temporary, this should be
> 	if (!port->cap->try_role && (!port->ops || !port->ops->try_role)) {
> 
> otherwise both cap->try_role and ops->try_role must exist. Also, there would
> be a crash if port->cap->try_role and port->ops are both NULL. Same pretty
> much everywhere below.

Yes, this series is broken. I'll prepare v3.

I'm going to add two more patches to this series where I'll drop a few
more unused members from struct typec_capability.

thanks,

-- 
heikki
