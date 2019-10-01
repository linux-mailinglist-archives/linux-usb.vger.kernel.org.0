Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D088C34A6
	for <lists+linux-usb@lfdr.de>; Tue,  1 Oct 2019 14:47:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732994AbfJAMqo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Oct 2019 08:46:44 -0400
Received: from mga06.intel.com ([134.134.136.31]:14517 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725821AbfJAMqn (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 1 Oct 2019 08:46:43 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 01 Oct 2019 05:46:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,571,1559545200"; 
   d="scan'208";a="205057409"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.157])
  by fmsmga001.fm.intel.com with SMTP; 01 Oct 2019 05:46:39 -0700
Received: by lahna (sSMTP sendmail emulation); Tue, 01 Oct 2019 15:46:38 +0300
Date:   Tue, 1 Oct 2019 15:46:38 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org,
        Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Rajmohan Mani <rajmohan.mani@intel.com>,
        Nicholas Johnson <nicholas.johnson-opensource@outlook.com.au>,
        Lukas Wunner <lukas@wunner.de>,
        Alan Stern <stern@rowland.harvard.edu>,
        Mario.Limonciello@dell.com,
        Anthony Wong <anthony.wong@canonical.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 01/22] thunderbolt: Introduce tb_switch_is_icm()
Message-ID: <20191001124638.GL2714@lahna.fi.intel.com>
References: <20191001113830.13028-1-mika.westerberg@linux.intel.com>
 <20191001113830.13028-2-mika.westerberg@linux.intel.com>
 <20191001121005.GA2951658@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191001121005.GA2951658@kroah.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Oct 01, 2019 at 02:10:05PM +0200, Greg Kroah-Hartman wrote:
> On Tue, Oct 01, 2019 at 02:38:09PM +0300, Mika Westerberg wrote:
> > We currently differentiate between SW CM and ICM by looking directly at
> 
> You should spell out what "SW CM" and "ICM" means please :)

Indeed, sorry about that. I will spell them out in next version.

SW CM is Software Connection manager, essentially
drivers/thunderbolt/tb.c.

ICM is the Firmware Connection manager, essentially what is done in
drivers/thunderbolt/icm.c. I think the I in ICM comes from Internal.
