Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6802265E62E
	for <lists+linux-usb@lfdr.de>; Thu,  5 Jan 2023 08:42:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229631AbjAEHmQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 5 Jan 2023 02:42:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229909AbjAEHmO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 5 Jan 2023 02:42:14 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A40E15F1F
        for <linux-usb@vger.kernel.org>; Wed,  4 Jan 2023 23:42:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672904533; x=1704440533;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DDqXPqUGACxcgYxWuoKiRKnBPxfviAgKBvnvjwDF/qk=;
  b=C1MJSFnyToZBLHRE6EBjM3sX3kiLTAC80JdiBabHeG9txyKBBH7zlBAQ
   vKWHEzYPR6X14AIgY148QNqLwZCiTZ4yZWEEj8clW6smUgmQhWNfjP4TQ
   RkTjXKQ0eV/JSy/AJzhWPIAWWGQ/l/k9yRprz+0qXPgUZQvvMgTdoQELl
   MjG97rlxUTCSwYbEdJuNXY4VYBA9YnZZIqNYgABovlJlwCjh4jnTgkNaz
   o+fmAny9JcsMw1Wv/EhLywuSNwHweNR8qQBf5uNtUFp405hNDIde4WjEt
   IecSZgXCkC6aUU8CvzNWDuCI0Ph2qHxqxDc/ppW7804U9LFjZG4fXT8/g
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10580"; a="324142930"
X-IronPort-AV: E=Sophos;i="5.96,302,1665471600"; 
   d="scan'208";a="324142930"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2023 23:42:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10580"; a="797821679"
X-IronPort-AV: E=Sophos;i="5.96,302,1665471600"; 
   d="scan'208";a="797821679"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 04 Jan 2023 23:42:09 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 05 Jan 2023 09:42:08 +0200
Date:   Thu, 5 Jan 2023 09:42:08 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Chanh Nguyen <chanh@amperemail.onmicrosoft.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Frank Li <Frank.Li@nxp.com>, Rondreis <linhaoguo86@gmail.com>,
        Chanh Nguyen <chanh@os.amperecomputing.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org
Subject: Re: The "bus for gadgets" is preventing the use of multiple UDCs
Message-ID: <Y7Z/UOQK5bXX1YIC@kuha.fi.intel.com>
References: <Y7WkOwcNYl2mWyiW@kuha.fi.intel.com>
 <Y7Wo0jyqKuB2iUsc@rowland.harvard.edu>
 <3fc02af3-3ced-0423-f3be-3ff546b8d26b@amperemail.onmicrosoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3fc02af3-3ced-0423-f3be-3ff546b8d26b@amperemail.onmicrosoft.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jan 05, 2023 at 11:02:07AM +0700, Chanh Nguyen wrote:
> On 04/01/2023 23:26, Alan Stern wrote:
> > On Wed, Jan 04, 2023 at 06:07:23PM +0200, Heikki Krogerus wrote:
> > > Hi,
> > > 
> > > Before the introduction of this bus it was possible to use configfs
> > > with multiple device controllers:
> > > 
> > >          echo "dwc3.1.auto" > usb_gadget/g1/UDC
> > >          echo "dwc3.2.auto" > usb_gadget/g2/UDC
> > > 
> > > But now only one UDC can be assigned. When I try to assign the second
> > > UDC for g2, I get this error:
> > > 
> > >          Error: Driver 'configfs-gadget' is already registered, aborting...
> > >          UDC core: g2: driver registration failed: -16
> > 
> > Two separate patches have been submitted to fix this.  See:
> > 
> > https://lore.kernel.org/linux-usb/20221213220354.628013-1-Frank.Li@nxp.com/
> > https://lore.kernel.org/linux-usb/20221221091317.19380-1-chanh@os.amperecomputing.com/
> > 
> > So far, neither of them has been merged.
> 
> Yes, I'm testing the patch v3 and will be sent out soon.

Okay, great! Thanks guys!

-- 
heikki
