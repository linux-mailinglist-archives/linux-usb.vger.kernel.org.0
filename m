Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EF463EA04D
	for <lists+linux-usb@lfdr.de>; Thu, 12 Aug 2021 10:10:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234860AbhHLIKx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 12 Aug 2021 04:10:53 -0400
Received: from mga06.intel.com ([134.134.136.31]:59242 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231520AbhHLIKw (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 12 Aug 2021 04:10:52 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10073"; a="276338267"
X-IronPort-AV: E=Sophos;i="5.84,315,1620716400"; 
   d="scan'208";a="276338267"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2021 01:10:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,315,1620716400"; 
   d="scan'208";a="590552892"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 12 Aug 2021 01:10:25 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 12 Aug 2021 11:10:24 +0300
Date:   Thu, 12 Aug 2021 11:10:24 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     USB list <linux-usb@vger.kernel.org>
Subject: Re: UCSI failing due to probe() getting version 0
Message-ID: <YRTXcNcaLTnXfCU/@kuha.fi.intel.com>
References: <db9e63df-80cc-6dae-89ae-23cb1cd09425@suse.com>
 <YRPPTjaFLy5t5HsP@kuha.fi.intel.com>
 <3207f6c5-db56-d38e-66ab-42d6b6166cae@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3207f6c5-db56-d38e-66ab-42d6b6166cae@suse.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Aug 11, 2021 at 04:47:13PM +0200, Oliver Neukum wrote:
> 
> On 11.08.21 15:23, Heikki Krogerus wrote:
> Hi,
> > Because of BIOS bugs.
> >
> > Ideally we should be able to rely on the _STA method of the ACPI
> > device, but unfortunately with UCSI we can't rely on that alone. On
> > some systems the BIOS claims that the device is enabled (based on
> > _STA) even when the platform doesn't actually support UCSI at all.
> >
> > If you remove the check, does the driver work?
> 
> Unfortunately, no it does not:

OK, so your laptop does not support UCSI even though the BIOS claims
it does.

thanks,

-- 
heikki
