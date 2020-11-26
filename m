Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25B882C52FB
	for <lists+linux-usb@lfdr.de>; Thu, 26 Nov 2020 12:31:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389120AbgKZLaV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 Nov 2020 06:30:21 -0500
Received: from mga04.intel.com ([192.55.52.120]:39013 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388808AbgKZLaU (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 26 Nov 2020 06:30:20 -0500
IronPort-SDR: QA/3EtSqWGZmNpo6eAfJbHocv3gB/0BM4VVtcYNY/vfjUOxbKz0JinxS4Is1wEvdY1a0gB4eji
 N0fhmNOXWoqA==
X-IronPort-AV: E=McAfee;i="6000,8403,9816"; a="169713364"
X-IronPort-AV: E=Sophos;i="5.78,371,1599548400"; 
   d="scan'208";a="169713364"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2020 03:30:19 -0800
IronPort-SDR: ce8HT/tzNXtbsXoHIOyOMlaIBGxhjJ51NKBaQpi0Ar+i7UZ8cJRthJCImYMEtx5AWiv02w2ajH
 z838iF6h4R1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,371,1599548400"; 
   d="scan'208";a="433246323"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 26 Nov 2020 03:30:16 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 26 Nov 2020 13:30:16 +0200
Date:   Thu, 26 Nov 2020 13:30:16 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Prashant Malani <pmalani@chromium.org>,
        Benson Leung <bleung@chromium.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH 2/2] usb: typec: Add type sysfs attribute file for
 partners
Message-ID: <20201126113016.GJ1008337@kuha.fi.intel.com>
References: <20201125120642.37156-1-heikki.krogerus@linux.intel.com>
 <20201125120642.37156-3-heikki.krogerus@linux.intel.com>
 <X79lHn+aEzFopTWv@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <X79lHn+aEzFopTWv@kroah.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Nov 26, 2020 at 09:19:42AM +0100, Greg Kroah-Hartman wrote:
> On Wed, Nov 25, 2020 at 03:06:42PM +0300, Heikki Krogerus wrote:
> > USB Power Delivery Specification defines a set of product
> > types for partners and cables. The product type can be read
> > from the ID Header VDO which is the first object in the
> > response to the Discover Identity command. This attribute
> > will display the product type of the partner. The cables
> > already have the attribute.
> > 
> > This sysfs attribute file is only created for the partners
> > and cables if the product type is really known in the
> > driver. Some interfaces do not give access to the Discover
> > Identity response from the partner or cable, but they may
> > still supply the product type separately in some cases.
> > 
> > When the product type of the partner or cable is detected,
> > uevent is also raised with PRODUCT_TYPE set to show the
> > actual product type (for example PRODUCT_TYPE=host).
> > 
> > Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > ---
> >  Documentation/ABI/testing/sysfs-class-typec |  53 ++++++-
> >  drivers/usb/typec/class.c                   | 147 +++++++++++++++++---
> >  2 files changed, 181 insertions(+), 19 deletions(-)
> 
> This patch doesn't apply against my usb-next branch (but patch 1/2 did).
> Can  you rebase this and resend it?

OK.

-- 
heikki
