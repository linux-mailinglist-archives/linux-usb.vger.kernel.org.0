Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBC6C35993E
	for <lists+linux-usb@lfdr.de>; Fri,  9 Apr 2021 11:31:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232704AbhDIJbR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 9 Apr 2021 05:31:17 -0400
Received: from mga12.intel.com ([192.55.52.136]:52437 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232642AbhDIJbQ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 9 Apr 2021 05:31:16 -0400
IronPort-SDR: X+ZHPU3x9cwiEr3R7gGAWNyUro+BpXqcVOyU7vTU9XxyUfwW6SaAXee/3bcvgPGuHP9LsatrUp
 g0SvC1738DQg==
X-IronPort-AV: E=McAfee;i="6000,8403,9948"; a="173205307"
X-IronPort-AV: E=Sophos;i="5.82,209,1613462400"; 
   d="scan'208";a="173205307"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2021 02:30:58 -0700
IronPort-SDR: cgLm0iM2X5Xcy0AJKgEbAcnGD6G67/VLa4/Xi1xcVQP5sx+NgFSXEeTnY/q+ys+zFdcGE7LS+x
 EMJMDFVkUgBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,209,1613462400"; 
   d="scan'208";a="520223208"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 09 Apr 2021 02:30:56 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Fri, 09 Apr 2021 12:30:55 +0300
Date:   Fri, 9 Apr 2021 12:30:55 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: roles: Cakk try_module_get() from
 usb_role_switch_find_by_fwnode()
Message-ID: <YHAez16ixJitMVtN@kuha.fi.intel.com>
References: <20210408203611.544005-1-hdegoede@redhat.com>
 <20210408230904.GA87058@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210408230904.GA87058@roeck-us.net>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Apr 08, 2021 at 04:09:04PM -0700, Guenter Roeck wrote:
> On Thu, Apr 08, 2021 at 10:36:11PM +0200, Hans de Goede wrote:
> > usb_role_switch_find_by_fwnode() returns a reference to the role-switch
> > which must be put by calling usb_role_switch_put().
> > 
> > usb_role_switch_put() calls module_put(sw->dev.parent->driver->owner),
> > add a matching try_module_get() to usb_role_switch_find_by_fwnode(),
> > making it behave the same as the other usb_role_switch functions
> > which return a reference.
> > 
> > This avoids a WARN_ON being hit at kernel/module.c:1158 due to the
> > module-refcount going below 0.
> > 
> 
> Took me a while to figure out what the subject line is supposed
> to mean.
> 
> s/Cakk/Call/
> 
> Otherwise
> 
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> 
> It might be useful though to explain the difference between
> fwnode_usb_role_switch_get() and usb_role_switch_find_by_fwnode(),
> and why two different functions are needed, both passing fwnode
> as parameter and returning a pointer to usb_role_switch.

Yes, the function names are confusing indeed. My proposal is to rename
usb_role_switch_find_by_fwnode() to fwnode_to_usb_role_switch().

I can prepare a patch for that if you guys are OK with it, or Hans,
would you prefer to send that together with this one?

Actually, shouldn't this be marked as a fix?


thanks,

-- 
heikki
