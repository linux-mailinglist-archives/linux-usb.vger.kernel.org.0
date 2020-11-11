Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86A272AEF7E
	for <lists+linux-usb@lfdr.de>; Wed, 11 Nov 2020 12:21:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726148AbgKKLVw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 Nov 2020 06:21:52 -0500
Received: from mga14.intel.com ([192.55.52.115]:46369 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726081AbgKKLVv (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 11 Nov 2020 06:21:51 -0500
IronPort-SDR: 3J+Qv1zQonDbYq5TavfPPlsXHjNQIS4iJLpGNEcZuyLZl1bCWuQi4oVbFD1NUYce8gA8F1VVT7
 H/mwasmGtb2w==
X-IronPort-AV: E=McAfee;i="6000,8403,9801"; a="169348094"
X-IronPort-AV: E=Sophos;i="5.77,469,1596524400"; 
   d="scan'208";a="169348094"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2020 03:21:46 -0800
IronPort-SDR: i9GSmkJyDyBIgNUenUzEob8HffyiVM1iloRBkNIR5RKr3OWvt8faVtA8lgixlCVI87wZvLwsLv
 +uMbvOCW4lJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,469,1596524400"; 
   d="scan'208";a="428716333"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 11 Nov 2020 03:21:43 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 11 Nov 2020 13:21:42 +0200
Date:   Wed, 11 Nov 2020 13:21:42 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Prashant Malani <pmalani@chromium.org>,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Benson Leung <bleung@chromium.org>,
        Guenter Roeck <groeck@chromium.org>
Subject: Re: [PATCH v2 2/2] platform/chrome: cros_ec_typec: Set partner
 num_altmodes
Message-ID: <20201111112142.GQ1224435@kuha.fi.intel.com>
References: <20201110061535.2163599-1-pmalani@chromium.org>
 <20201110061535.2163599-2-pmalani@chromium.org>
 <20201110105015.GF1224435@kuha.fi.intel.com>
 <ba6c1415-457b-1e8d-b604-fad603fe9be6@collabora.com>
 <20201111102846.GP1224435@kuha.fi.intel.com>
 <X6vDZXI3Cp1pqRUr@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <X6vDZXI3Cp1pqRUr@kroah.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Nov 11, 2020 at 11:56:37AM +0100, Greg KH wrote:
> On Wed, Nov 11, 2020 at 12:28:46PM +0200, Heikki Krogerus wrote:
> > On Tue, Nov 10, 2020 at 05:01:04PM +0100, Enric Balletbo i Serra wrote:
> > > Hi,
> > > 
> > > On 10/11/20 11:50, Heikki Krogerus wrote:
> > > > On Mon, Nov 09, 2020 at 10:15:36PM -0800, Prashant Malani wrote:
> > > >> Set the number of altmodes available for a registered partner using the
> > > >> Type C connector class framework routine.
> > > >>
> > > >> Signed-off-by: Prashant Malani <pmalani@chromium.org>
> > > > 
> > > > Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > > > 
> > > 
> > > Acked-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> > > 
> > > Heikki, would you like to take these two through your tree? It'd help if you can
> > > create an inmutable branch so I can pick other cros_ec_typec patches on top of it.
> > 
> > I'm sorry, but I don't actually maintain a tree for the USB Type-C
> > stuff.
> > 
> > Greg, I'm sorry to bother you with this, but can you provide the
> > immutable branch for Enric?
> 
> My usb tree branches are always immutable :)
> 
> > Maybe I should set up a tree for the USB Type-C stuff?
> 
> Or I can just take all of these patches as they depend on USB stuff more
> than any other specific platform driver changes, right?

Works for me.

Br,

-- 
heikki
