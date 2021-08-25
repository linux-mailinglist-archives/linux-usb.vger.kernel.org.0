Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAE033F705B
	for <lists+linux-usb@lfdr.de>; Wed, 25 Aug 2021 09:26:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238790AbhHYH06 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 25 Aug 2021 03:26:58 -0400
Received: from mga06.intel.com ([134.134.136.31]:59278 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238654AbhHYH05 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 25 Aug 2021 03:26:57 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10086"; a="278482192"
X-IronPort-AV: E=Sophos;i="5.84,349,1620716400"; 
   d="scan'208";a="278482192"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2021 00:26:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,349,1620716400"; 
   d="scan'208";a="597961325"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 25 Aug 2021 00:26:09 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 25 Aug 2021 10:26:08 +0300
Date:   Wed, 25 Aug 2021 10:26:08 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     Nehal Bakulchandra Shah <Nehal-Bakulchandra.shah@amd.com>,
        gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, kun.liu2@amd.com,
        alexander.deucher@amd.com
Subject: Re: [RESEND PATCH 2/2] usb: dwc3: pci add property to allow user
 space role switch
Message-ID: <YSXwkKJ53d/uwnhy@kuha.fi.intel.com>
References: <20210824192337.3100288-1-Nehal-Bakulchandra.shah@amd.com>
 <87ilzu5ap0.fsf@kernel.org>
 <YSXqsXmuom2fFiKN@kuha.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YSXqsXmuom2fFiKN@kuha.fi.intel.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Aug 25, 2021 at 10:01:05AM +0300, Heikki Krogerus wrote:
> On Wed, Aug 25, 2021 at 08:55:41AM +0300, Felipe Balbi wrote:
> > 
> > Hi,
> > 
> > Nehal Bakulchandra Shah <Nehal-Bakulchandra.shah@amd.com> writes:
> > 
> > > For AMD platform there is a requirement to enable user space role
> > > switch from host to device and device to host as customer platform is not
> > > completely capable of OTG i.e. with type C controller it does not have PD
> > > to support role switching. Hence, based ACPI/EC interrupt role switch is
> > > triggered by the usemode script running in background.
> >                    usermode ?
> 
> Couldn't you capture that ACPI/EC interrupt in kernel?
> 
> > > Signed-off-by: Nehal Bakulchandra Shah <Nehal-Bakulchandra.shah@amd.com>
> > 
> > I'm okay with this, just wondering if we need to Document the property
> > somewhere.
> > 
> > @Heikki, is there a place to document these private properties that's
> > not on DT binding document?
> 
> The build-in properties are not documented separately. I've always
> tried to supply DT bindings for all new properties I've proposed.
> 
> In this case though, do we need the new property at all? Why not just
> register a normal USB role switch on this platform? It can be either a
> dummy role switch that only passes the user space input to dwc3, or,
> perhaps ideally, it would also be a driver that captures that ACPI/EC
> event/notification and then passes the information from it to dwc3.

Please ignore the above question. Sorry. Let me try again...

The question is: why not just capture that ACPI/EC "interrupt" in
kernel and then just use that information to set the dwc3 role switch?
No extra properties needed.


thanks,

-- 
heikki
