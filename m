Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A894C8B38
	for <lists+linux-usb@lfdr.de>; Wed,  2 Oct 2019 16:29:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727333AbfJBO3F (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Oct 2019 10:29:05 -0400
Received: from mga17.intel.com ([192.55.52.151]:45561 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725747AbfJBO3E (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 2 Oct 2019 10:29:04 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 02 Oct 2019 07:29:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,574,1559545200"; 
   d="scan'208";a="205352931"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.157])
  by fmsmga001.fm.intel.com with SMTP; 02 Oct 2019 07:29:00 -0700
Received: by lahna (sSMTP sendmail emulation); Wed, 02 Oct 2019 17:28:59 +0300
Date:   Wed, 2 Oct 2019 17:28:59 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     linux-usb@vger.kernel.org,
        Anthony Wong <anthony.wong@canonical.com>,
        Mario.Limonciello@dell.com,
        Andreas Noever <andreas.noever@gmail.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Rajmohan Mani <rajmohan.mani@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Nicholas Johnson <nicholas.johnson-opensource@outlook.com.au>,
        Alan Stern <stern@rowland.harvard.edu>,
        linux-kernel@vger.kernel.org, Lukas Wunner <lukas@wunner.de>
Subject: Re: [RFC PATCH 05/22] thunderbolt: Add helper macros to iterate over
 switch ports
Message-ID: <20191002142859.GF2819@lahna.fi.intel.com>
References: <20191001113830.13028-1-mika.westerberg@linux.intel.com>
 <20191001113830.13028-6-mika.westerberg@linux.intel.com>
 <1570025874.2472.14.camel@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1570025874.2472.14.camel@suse.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Oct 02, 2019 at 04:17:54PM +0200, Oliver Neukum wrote:
> Am Dienstag, den 01.10.2019, 14:38 +0300 schrieb Mika Westerberg:
> > @@ -1975,10 +1972,8 @@ void tb_switch_suspend(struct tb_switch *sw)
> >         if (err)
> >                 return;
> >  
> > -       for (i = 1; i <= sw->config.max_port_number; i++) {
> > -               if (tb_port_has_remote(&sw->ports[i]))
> > -                       tb_switch_suspend(sw->ports[i].remote->sw);
> > -       }
> > +       tb_switch_for_each_remote_port(sw, i)
> > +               tb_switch_suspend(sw->ports[i].remote->sw);
> 
> This macro looks a bit prone to misunderstanding.
> I guess the function would be better if the test could be seen.

The macro does not really save too many lines so I think I can just drop
this patch for now and keep these open-coded.
