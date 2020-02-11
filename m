Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 20C8E159220
	for <lists+linux-usb@lfdr.de>; Tue, 11 Feb 2020 15:44:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730227AbgBKOod (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 Feb 2020 09:44:33 -0500
Received: from mga06.intel.com ([134.134.136.31]:54897 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727728AbgBKOoc (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 11 Feb 2020 09:44:32 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 11 Feb 2020 06:44:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,428,1574150400"; 
   d="scan'208";a="347290682"
Received: from kuha.fi.intel.com ([10.237.72.53])
  by fmsmga001.fm.intel.com with SMTP; 11 Feb 2020 06:44:29 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 11 Feb 2020 16:44:29 +0200
Date:   Tue, 11 Feb 2020 16:44:29 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Oliver Neukum <oneukum@suse.de>
Cc:     linux-usb@vger.kernel.org
Subject: Re: No PNP0CA0 device on a Dell Precision 5520 laptop
Message-ID: <20200211144429.GD1498@kuha.fi.intel.com>
References: <1581427518.1580.3.camel@suse.de>
 <20200211135920.GB1498@kuha.fi.intel.com>
 <1581430450.1580.5.camel@suse.de>
 <20200211142855.GC1498@kuha.fi.intel.com>
 <1581431677.1580.7.camel@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1581431677.1580.7.camel@suse.de>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Feb 11, 2020 at 03:34:37PM +0100, Oliver Neukum wrote:
> Am Dienstag, den 11.02.2020, 16:28 +0200 schrieb Heikki Krogerus:
> > On Tue, Feb 11, 2020 at 03:14:10PM +0100, Oliver Neukum wrote:
> > > Am Dienstag, den 11.02.2020, 15:59 +0200 schrieb Heikki Krogerus:
> > > > cat /sys/bus/acpi/devices/USBC000\:00/status
> > > 
> > > Technically -ENODEV. It does not exist, even in a listing.
> > > But this thing definitely has a type C port. It is connected
> > > to a docking station which supplies the whole system with power.
> > > Ethernet also works.
> > 
> > There is still no requirement for the BIOS or the EC firmware to
> > expose UCSI to the operating system. If the ACPI node is not there,
> > then there is no UCSI on that system. The USB Type-C connectors
> > function autonomously in any case on a system that exposes them to the
> > operating system with UCSI. UCSI is more like an optional status
> > interface that allows limited control over some specific things like
> > role swapping.
> > 
> > UCSI is usually supported when the USB Power Delivery (USB PD)
> > controllers are connected to the Embedded Controller on the system,
> > but on some of our platforms they are directly connected to the SOC
> > instead. So on those platforms we can directly communicate with the
> > USB PD controller from the operating system, which is actually much
> > better situation compared to UCSI IMO.
> > 
> > Do you have this ACPI node: INT3515 ?
> > 
> > It's for the TI TPS6598x USB PD controllers.
> 
> Hi,
> 
> yes I got that one. Thanks for the tip.

OK, cool! Let me know if the tps6598x.c driver works with that.

thanks,

-- 
heikki
