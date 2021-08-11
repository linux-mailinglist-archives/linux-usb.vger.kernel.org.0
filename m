Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D9943E9279
	for <lists+linux-usb@lfdr.de>; Wed, 11 Aug 2021 15:23:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231249AbhHKNYM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 Aug 2021 09:24:12 -0400
Received: from mga17.intel.com ([192.55.52.151]:1792 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230425AbhHKNYA (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 11 Aug 2021 09:24:00 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10072"; a="195388089"
X-IronPort-AV: E=Sophos;i="5.84,313,1620716400"; 
   d="scan'208";a="195388089"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2021 06:23:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,313,1620716400"; 
   d="scan'208";a="590091824"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 11 Aug 2021 06:23:27 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 11 Aug 2021 16:23:26 +0300
Date:   Wed, 11 Aug 2021 16:23:26 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     USB list <linux-usb@vger.kernel.org>
Subject: Re: UCSI failing due to probe() getting version 0
Message-ID: <YRPPTjaFLy5t5HsP@kuha.fi.intel.com>
References: <db9e63df-80cc-6dae-89ae-23cb1cd09425@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <db9e63df-80cc-6dae-89ae-23cb1cd09425@suse.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Aug 05, 2021 at 04:04:03PM +0200, Oliver Neukum wrote:
> Hi,
> 
> I am trying this on a new laptop, but I am getting a result I do not
> understand.
> ucsi_acpi_probe() is called, but ucsi_register() fails with -ENODEV,
> because ucsi->version is 0.
> 
> If I dump the ucsi_acpi buffer I get:
> 
> 00 00 00 00 02 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 
> And, frankly I do not understand that. Why have the ACPI device
> but show version number 0?

Because of BIOS bugs.

Ideally we should be able to rely on the _STA method of the ACPI
device, but unfortunately with UCSI we can't rely on that alone. On
some systems the BIOS claims that the device is enabled (based on
_STA) even when the platform doesn't actually support UCSI at all.

If you remove the check, does the driver work?

Br,

-- 
heikki
