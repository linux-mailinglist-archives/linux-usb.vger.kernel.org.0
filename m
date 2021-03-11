Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEF6E337412
	for <lists+linux-usb@lfdr.de>; Thu, 11 Mar 2021 14:35:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233555AbhCKNem (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 11 Mar 2021 08:34:42 -0500
Received: from mga03.intel.com ([134.134.136.65]:63460 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233241AbhCKNe3 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 11 Mar 2021 08:34:29 -0500
IronPort-SDR: 8cgjhK6LD3SG+wUG1qClZLFHLWQUlLs8Pdq8N+6gQgfu8R1iOCp7tPZN76C4weuk1pWs9zPntA
 XmsAXTKVbdUg==
X-IronPort-AV: E=McAfee;i="6000,8403,9919"; a="188703772"
X-IronPort-AV: E=Sophos;i="5.81,240,1610438400"; 
   d="scan'208";a="188703772"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2021 05:34:28 -0800
IronPort-SDR: bkjroLbcr2q1JaWy7lMYGbRlKV91qO2V8Dt8Dd6TGFCopr7sy2Mnr8aVFNcOao357As4UgJWyB
 g8O/D7XnwWTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,240,1610438400"; 
   d="scan'208";a="510015598"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 11 Mar 2021 05:34:26 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 11 Mar 2021 15:34:25 +0200
Date:   Thu, 11 Mar 2021 15:34:25 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Elias Rudberg <mail@eliasrudberg.se>, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: typec: Remove vdo[3] part of
 tps6598x_rx_identity_reg struct
Message-ID: <YEocYaOfIzOcHI1i@kuha.fi.intel.com>
References: <20210311124710.6563-1-mail@eliasrudberg.se>
 <YEoVSRfVaGr6uxXe@kuha.fi.intel.com>
 <YEoX3i54VVHJ4155@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YEoX3i54VVHJ4155@kroah.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Mar 11, 2021 at 02:15:10PM +0100, Greg KH wrote:
> On Thu, Mar 11, 2021 at 03:04:09PM +0200, Heikki Krogerus wrote:
> > Hi,
> > 
> > On Thu, Mar 11, 2021 at 01:47:10PM +0100, Elias Rudberg wrote:
> > > Remove the unused "u32 vdo[3]" part in the tps6598x_rx_identity_reg
> > > struct. This helps avoid "failed to register partner" errors which
> > > happen when tps6598x_read_partner_identity() fails because the
> > > amount of data read is 12 bytes smaller than the struct size.
> > > Note that vdo[3] is already in usb_pd_identity and hence
> > > shouldn't be added to tps6598x_rx_identity_reg as well.
> > > 
> > > Fixes: f6c56ca91b92 ("usb: typec: Add the Product Type VDOs to struct usb_pd_identity")
> > > 
> > > Signed-off-by: Elias Rudberg <mail@eliasrudberg.se>
> > 
> > This needs to go to the stable kernels as well. Please resend with the
> > appropriate "Cc: stable@vger.kernel.org" tag. Please also include my
> > reviewed-by tag:
> > 
> > Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> 
> I can add the cc: stable when committting this, thanks.

Thanks Greg.

-- 
heikki
