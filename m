Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44A1F25FA1A
	for <lists+linux-usb@lfdr.de>; Mon,  7 Sep 2020 14:04:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729019AbgIGMEE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Sep 2020 08:04:04 -0400
Received: from mga07.intel.com ([134.134.136.100]:17281 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729109AbgIGMDq (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 7 Sep 2020 08:03:46 -0400
IronPort-SDR: 3qH6NSllJxu3e7cU17CviuWtiOFNA/zyF9VJ37Zxu9dXKM6Av/FVX5lH3znZJ8Eoug1S8vfmJw
 /EDcGpCrL8NA==
X-IronPort-AV: E=McAfee;i="6000,8403,9736"; a="222202391"
X-IronPort-AV: E=Sophos;i="5.76,401,1592895600"; 
   d="scan'208";a="222202391"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2020 05:03:00 -0700
IronPort-SDR: xAubLeS51761V1WF9ekhxvU4TOkUaH5XtH2RCHqvUVr3UfH05Jpsmv5yicd6P2gfWuPpx4nH3A
 5lJ+RzQcoFsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,401,1592895600"; 
   d="scan'208";a="406817844"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga001.fm.intel.com with SMTP; 07 Sep 2020 05:02:57 -0700
Received: by lahna (sSMTP sendmail emulation); Mon, 07 Sep 2020 15:02:56 +0300
Date:   Mon, 7 Sep 2020 15:02:56 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Lukas Wunner <lukas@wunner.de>
Cc:     linux-usb@vger.kernel.org, Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>
Subject: Re: [PATCH] thunderbolt: Retry DROM read once if parsing fails
Message-ID: <20200907120256.GL2495@lahna.fi.intel.com>
References: <20200907110340.71031-1-mika.westerberg@linux.intel.com>
 <20200907112151.GA22115@wunner.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200907112151.GA22115@wunner.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Sep 07, 2020 at 01:21:51PM +0200, Lukas Wunner wrote:
> On Mon, Sep 07, 2020 at 02:03:40PM +0300, Mika Westerberg wrote:
> > Kai-Heng reported that sometimes DROM parsing of ASUS PA27AC Thunderbolt 3
> > monitor fails. This makes the driver to fail to add the device so only
> > DisplayPort tunneling is functional.
> 
> Maybe the DROM is contained in an external EEPROM attached via slow
> SPI or i2c and cannot be read in time before a response on the control
> channel is due?  Does it help to always delay 100 ms before performing
> the DROM read with this display?  Perhaps a quirk specific for this
> display is more appropriate than a change which affects all devices?
> Because this way of working around problems is difficult to maintain
> long term.

It helps to always wait the 100ms IIRC but I'm not sure we want to do
that for every device. Also I'm not a fan of maintaining a list of
quirks if we have the possibility to have more "general" solution to the
issue (like what we do here, retry once).
