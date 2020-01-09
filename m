Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C0B3C1357FD
	for <lists+linux-usb@lfdr.de>; Thu,  9 Jan 2020 12:30:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730069AbgAILac (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Jan 2020 06:30:32 -0500
Received: from mga02.intel.com ([134.134.136.20]:50215 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728588AbgAILac (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 9 Jan 2020 06:30:32 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 09 Jan 2020 03:30:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,413,1571727600"; 
   d="scan'208";a="227185913"
Received: from kuha.fi.intel.com ([10.237.72.53])
  by fmsmga001.fm.intel.com with SMTP; 09 Jan 2020 03:30:29 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 09 Jan 2020 13:30:28 +0200
Date:   Thu, 9 Jan 2020 13:30:28 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Guenter Roeck <linux@roeck-us.net>, linux-usb@vger.kernel.org
Subject: Re: [PATCH 14/15] usb: typec: Add member for the supported USB modes
 to struct typec_capability
Message-ID: <20200109113028.GB29437@kuha.fi.intel.com>
References: <20191230142611.24921-1-heikki.krogerus@linux.intel.com>
 <20191230142611.24921-15-heikki.krogerus@linux.intel.com>
 <20200109095205.GA129962@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200109095205.GA129962@kroah.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jan 09, 2020 at 10:52:05AM +0100, Greg Kroah-Hartman wrote:
> On Mon, Dec 30, 2019 at 05:26:10PM +0300, Heikki Krogerus wrote:
> > The ports can inform which USB modes (USB2, USB3 and USB4)
> > they support with this member.
> > 
> > This information will be needed once we start using the new
> > Enter_USB message.
> > 
> > Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > ---
> >  include/linux/usb/typec.h | 6 ++++++
> >  1 file changed, 6 insertions(+)
> 
> I dropped a few other patches in this series, and stopped here.  If you
> could fix up the attribute issue I pointed out and rebase and resend the
> reset of these, I'll be glad to take them.

OK. Thanks for going over these.

Br,

-- 
heikki
