Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 233B1262F86
	for <lists+linux-usb@lfdr.de>; Wed,  9 Sep 2020 16:10:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726535AbgIIOIi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Sep 2020 10:08:38 -0400
Received: from mga17.intel.com ([192.55.52.151]:53175 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730323AbgIINLJ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 9 Sep 2020 09:11:09 -0400
IronPort-SDR: Q91RznWiFRGzB0tGxT5zl0z3zPwwiqU7feHQ+gt9xCY54EgqyBp25je2HaTUHj8y0VS5MOtlqv
 AOhYj1rNuGlQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9738"; a="138363314"
X-IronPort-AV: E=Sophos;i="5.76,409,1592895600"; 
   d="scan'208";a="138363314"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2020 06:11:02 -0700
IronPort-SDR: l36POSGCzQGkqTBe+7H1PFCCJBCzucpLRrcML4YciT9+8vrlta/2n9h9j9c/uJFqFHgxnVFRX4
 +evhrtW32m6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,409,1592895600"; 
   d="scan'208";a="407444765"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 09 Sep 2020 06:11:00 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 09 Sep 2020 16:10:59 +0300
Date:   Wed, 9 Sep 2020 16:10:59 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Zwane Mwaikambo <zwanem@gmail.com>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Zwane Mwaikambo <zwane@yosper.io>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v5 1/2] usb/typec: fix array overruns in ucsi.c
 partner_altmode[]
Message-ID: <20200909131059.GB3627076@kuha.fi.intel.com>
References: <alpine.DEB.2.21.2008271035320.30454@montezuma.home>
 <0013fe6c-c0a2-1759-c769-cda025e5eb38@infradead.org>
 <alpine.DEB.2.21.2008271058220.37762@montezuma.home>
 <alpine.DEB.2.21.2008271131570.37762@montezuma.home>
 <20200828123328.GF174928@kuha.fi.intel.com>
 <alpine.DEB.2.21.2008300220350.37231@montezuma.home>
 <20200903111047.GH1279097@kuha.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200903111047.GH1279097@kuha.fi.intel.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Sep 03, 2020 at 02:10:50PM +0300, Heikki Krogerus wrote:
> Hi Zwane,
> 
> Sorry to keep you waiting. I'm trying to find a board I can use to
> test these...

I've now tested this (these) with ThinkPad X280, and there is no
regression, however, now that (I think) I understand what's going on,
I would not try to fix the issue like you do. I would simply make sure
the alternate mode arrays are NULL terminated. For example with
something like this:

diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index cba6f77bea61b..7e66e4d232996 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -317,8 +317,8 @@ struct ucsi_connector {
        struct typec_port *port;
        struct typec_partner *partner;
 
-       struct typec_altmode *port_altmode[UCSI_MAX_ALTMODES];
-       struct typec_altmode *partner_altmode[UCSI_MAX_ALTMODES];
+       struct typec_altmode *port_altmode[UCSI_MAX_ALTMODES + 1];
+       struct typec_altmode *partner_altmode[UCSI_MAX_ALTMODES + 1];
 
        struct typec_capability typec_cap;

Though I'm not sure we should need even that. Try it out in any case.

Even if that works, I have a feeling there is something odd going on.
What kinds of device has all 30 modes supported (or even more)? I want
to know if this is a case where the firmware is just reporting bogus
values.

What device are you plugging to the Type-C connector? Does it really
have all 30 altmodes? What do you see in /sys/class/typec directory
when you connect the device?

        ls /sys/class/typec

Actually, do this:

        grep . /sys/class/typec/port*-partner/port*-partner.*/svid

and tell what you get.

thanks,

-- 
heikki
