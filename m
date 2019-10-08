Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BBBBCCFBD0
	for <lists+linux-usb@lfdr.de>; Tue,  8 Oct 2019 16:02:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726066AbfJHOCG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Oct 2019 10:02:06 -0400
Received: from mga06.intel.com ([134.134.136.31]:12455 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725848AbfJHOCG (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 8 Oct 2019 10:02:06 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 08 Oct 2019 07:02:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,270,1566889200"; 
   d="scan'208";a="206639741"
Received: from kuha.fi.intel.com ([10.237.72.53])
  by fmsmga001.fm.intel.com with SMTP; 08 Oct 2019 07:02:00 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 08 Oct 2019 17:01:59 +0300
Date:   Tue, 8 Oct 2019 17:01:59 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 0/2] extcon: axp288: Move to swnodes
Message-ID: <20191008140159.GC12909@kuha.fi.intel.com>
References: <20191008122600.22340-1-heikki.krogerus@linux.intel.com>
 <8120fbf2-08d3-6ee2-21bf-458a4e12b29c@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8120fbf2-08d3-6ee2-21bf-458a4e12b29c@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Oct 08, 2019 at 03:59:23PM +0200, Hans de Goede wrote:
> Hi,
> 
> On 08-10-2019 14:25, Heikki Krogerus wrote:
> > Hi Hans,
> > 
> > Fixed the compiler warning in this version. No other changes.
> > 
> > The original cover letter:
> > 
> > That AXP288 extcon driver is the last that uses build-in connection
> > description. I'm replacing it with a code that finds the role mux
> > software node instead.
> > 
> > I'm proposing also here a little helper
> > usb_role_switch_find_by_fwnode() that uses
> > class_find_device_by_fwnode() to find the role switches.
> 
> Both patches look good to me and I can confirm that things still
> work as they should on a CHT device with an AXP288 PMIC, so for both:
> 
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> Tested-by: Hans de Goede <hdegoede@redhat.com>
> 
> Regards,
> 
> Hans
> 
> p.s.
> 
> I guess this means we can remove the build-in connection (
> device_connection_add / remove) stuff now?

Yes. I'll prepare separate patches for that.

thanks,

-- 
heikki
