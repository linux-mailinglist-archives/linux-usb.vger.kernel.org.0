Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6746FC996F
	for <lists+linux-usb@lfdr.de>; Thu,  3 Oct 2019 10:03:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728207AbfJCIDV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Oct 2019 04:03:21 -0400
Received: from mga12.intel.com ([192.55.52.136]:30229 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728104AbfJCIDV (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 3 Oct 2019 04:03:21 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 03 Oct 2019 01:03:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,251,1566889200"; 
   d="scan'208";a="205561245"
Received: from kuha.fi.intel.com ([10.237.72.53])
  by fmsmga001.fm.intel.com with SMTP; 03 Oct 2019 01:03:18 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 03 Oct 2019 11:03:17 +0300
Date:   Thu, 3 Oct 2019 11:03:17 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/7] usb: typec: Copy everything from struct
 typec_capability during registration
Message-ID: <20191003080317.GA1048@kuha.fi.intel.com>
References: <20191001094858.68643-1-heikki.krogerus@linux.intel.com>
 <20191001094858.68643-2-heikki.krogerus@linux.intel.com>
 <9173aabc-3e61-fc9b-e01e-0f1ce78429a2@roeck-us.net>
 <20191002160652.GB19836@kuha.fi.intel.com>
 <20191002163639.GA30400@roeck-us.net>
 <20191002182933.GA19870@kuha.fi.intel.com>
 <318179e6-fa1e-0b33-4a4f-40ecd6947f8a@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <318179e6-fa1e-0b33-4a4f-40ecd6947f8a@roeck-us.net>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Oct 02, 2019 at 08:45:28PM -0700, Guenter Roeck wrote:
> On 10/2/19 11:29 AM, Heikki Krogerus wrote:
> > On Wed, Oct 02, 2019 at 09:36:39AM -0700, Guenter Roeck wrote:
> > > port->cap->type used to be the role provided by the low level driver.
> > > That was static, and it was not possible to override it. It did not
> > > resemble the current port type, or a configured port type, it resembled
> > > port capabilities.
> > > 
> > > Your code changes that, meaning even if the low level driver (effectively
> > > the hardware) states that it can not support DRP, it is now configurable
> > > anyway. That seems to me like a substantial change to the original meaning
> > > of this attribute.
> > > 
> > > Effectiv ely there are now three values,
> > > - port->port_type	the current port tyle
> > > - port->fixed_type	the type selected by the user
> > > - port->cap->type	the type provided by low level code,
> > > 			now no longer available / used
> > > 
> > > Even if the low level driver (hardware) says that it can not support
> > > TYPEC_PORT_DRP, that can be overwritten by the user. Maybe there is a
> > > good reason for that, but I don't see it, sorry.
> > 
> > No, that was not my intention. Clearly there is a bug in my code.
> > 
> > > Maybe it would make sense to introduce port->fixed_type in a separate patch.
> > > As part of that patch you could explain why port->cap->type, ie a reflection
> > > of the port capabilities, is no longer needed.
> > 
> > Or, I could make this really simple. I could just copy the content of
> > the cap as is to another struct typec_capability during port
> > registration. My goal is really just remove the need for the device
> > drivers keep the struct typec_capability instance if they don't need
> > it, and I don't need to remove the cap member to achieve that.
> > 
> 
> Maybe just use devm_kmemdup() ?

For example.

thanks,

-- 
heikki
