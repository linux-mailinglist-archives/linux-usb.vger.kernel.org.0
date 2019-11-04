Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B979DEE0A1
	for <lists+linux-usb@lfdr.de>; Mon,  4 Nov 2019 14:09:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728940AbfKDNJI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 4 Nov 2019 08:09:08 -0500
Received: from mga01.intel.com ([192.55.52.88]:6802 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728847AbfKDNJI (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 4 Nov 2019 08:09:08 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 04 Nov 2019 05:09:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,267,1569308400"; 
   d="scan'208";a="212311895"
Received: from kuha.fi.intel.com ([10.237.72.53])
  by fmsmga001.fm.intel.com with SMTP; 04 Nov 2019 05:09:05 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 04 Nov 2019 15:09:04 +0200
Date:   Mon, 4 Nov 2019 15:09:04 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 0/2] extcon: axp288: Move to swnodes
Message-ID: <20191104130904.GC29493@kuha.fi.intel.com>
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

Hi Greg,

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

These two patches in this series are basically about the usb role API,
so can you take them?

thanks,

-- 
heikki
