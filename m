Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC962697B91
	for <lists+linux-usb@lfdr.de>; Wed, 15 Feb 2023 13:15:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233964AbjBOMP5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Feb 2023 07:15:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233894AbjBOMP4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Feb 2023 07:15:56 -0500
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBE333250B
        for <linux-usb@vger.kernel.org>; Wed, 15 Feb 2023 04:15:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676463355; x=1707999355;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PI4U49wYoOE/6L+LPujlKrA6teiE5Kwod2Vhn+SiBvs=;
  b=cQgYIhLnlcWX2V2fL/fcqoQmHRjLjsCaig2hPvFL9y9SOaqN5bTeetzz
   kUxpebt6zBh+uamzuEUgMCOWHqEd92+F83xybofW9c5oU6Tzi6r2p0OKi
   FbuKP0UQAAt1aVsrLC+iOOkhubcsZboIPukRco5XpM6dbqWkYXBNQUzEW
   t4qbdznbIi+f47NJAW3VHJWw2Sf3xCm6WG5a0NgOktQCxYrIcUg6bBe0J
   dWXupbcFzIEUExM04lUZqs8BIc5ikb1Uci2jU66olXvSnRV2t2Oo7jwFz
   b4Ja5oTG992VZZeqLLBW8uMZ/+RwHBG/auxV2rpXYOe0mtZAHDZx98m2y
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="417632513"
X-IronPort-AV: E=Sophos;i="5.97,299,1669104000"; 
   d="scan'208";a="417632513"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2023 04:15:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="812417788"
X-IronPort-AV: E=Sophos;i="5.97,299,1669104000"; 
   d="scan'208";a="812417788"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 15 Feb 2023 04:15:49 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 15 Feb 2023 14:15:48 +0200
Date:   Wed, 15 Feb 2023 14:15:48 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: dwc3: pci: add support for the Intel Meteor Lake-M
Message-ID: <Y+zM9IWhBBZAqiAd@kuha.fi.intel.com>
References: <20230215115052.49822-1-heikki.krogerus@linux.intel.com>
 <Y+zJdaJz0E2PUcoV@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y+zJdaJz0E2PUcoV@kroah.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Feb 15, 2023 at 01:00:53PM +0100, Greg Kroah-Hartman wrote:
> On Wed, Feb 15, 2023 at 01:50:52PM +0200, Heikki Krogerus wrote:
> > This patch adds the necessary PCI IDs for Intel Meteor Lake-M
> > devices.
> > 
> > Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > ---
> >  drivers/usb/dwc3/dwc3-pci.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> 
> Should this also go to stable kernels?

Yes. I'm sorry, I forgot the stable tag.

cheers,

-- 
heikki
