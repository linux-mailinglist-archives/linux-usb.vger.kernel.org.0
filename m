Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE4FF695CDE
	for <lists+linux-usb@lfdr.de>; Tue, 14 Feb 2023 09:26:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231408AbjBNI0H (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 Feb 2023 03:26:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230153AbjBNI0G (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 14 Feb 2023 03:26:06 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0104610F5
        for <linux-usb@vger.kernel.org>; Tue, 14 Feb 2023 00:26:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676363162; x=1707899162;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mqzAQAQhdEsZYj3siH7K9ISZPoFQ+cxYtI9Bqo/+uhU=;
  b=UmSOApyIG0onLfi0m4LEfXr00+hS+oGf3d+/pKk1w1S9YfFvx/FiZuzo
   5upFpw6JKprr33tLcUslAxAhhEd2RxtjRCJ55u+AWHccVzRmaI/UICqqF
   qlQWidpvezKPqi4xqd3FlusEoOVQEGyxR0Al3N3QtAB/g2MzNtoWwQ/D0
   Xawki8jrJeUHzOK964IHFDfZijys1TQGFbzM21Fcfymk72VQFNp5pvDVS
   ntdJheCE1koZZNYEoGcYG82i+zYoLs9VKnI6OwNL1wHld79CG5K0BjBHI
   eeVnUVdomkmavw/6F4VCqVHydAHHeZwsve9IwJxd0dEv00tHJoYzXjwVO
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="328818626"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; 
   d="scan'208";a="328818626"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2023 00:26:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="811934957"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; 
   d="scan'208";a="811934957"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 14 Feb 2023 00:26:00 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 14 Feb 2023 10:25:59 +0200
Date:   Tue, 14 Feb 2023 10:25:59 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     "Gopal, Saranya" <saranya.gopal@intel.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "Regupathy, Rajaram" <rajaram.regupathy@intel.com>
Subject: Re: [PATCH v2] usb: typec: pd: Add higher_capability sysfs for sink
 PDO
Message-ID: <Y+tFlzYz/K3Tmk0j@kuha.fi.intel.com>
References: <20230213140522.171578-1-saranya.gopal@intel.com>
 <Y+pVDx84luyrJJv0@kroah.com>
 <DM6PR11MB46123516D600B54C21880610E3DD9@DM6PR11MB4612.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM6PR11MB46123516D600B54C21880610E3DD9@DM6PR11MB4612.namprd11.prod.outlook.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Feb 13, 2023 at 06:00:30PM +0000, Gopal, Saranya wrote:
> > So you deleted an attribute from this device, ok, but again, I don't
> > understand how this is considered a "fix" other than perhaps the old
> > attribute does not relate to this device?
> As per USB PD specification:
> 28th bit of the fixed supply "sink" PDO represents higher capability (whether sink device needs
> more than vSafe5V (eg:12 V) for full functionality).
> 28th bit of the fixed supply "source" PDO represents usb_suspend_supported attribute.
> Before this patch, 28th bit of sink PDO was wrongly representing usb_suspend_supported
> attribute. We had to add the new attribute to correctly represent the 28th bit of sink PDO.
> Does it make sense to add fixes tag now if I add these additional details in commit message?
> Or do you still prefer not to add fixes tag for this patch?
> 
> Thanks,
> Saranya
> 
> > 
> > And if so, then make that a single patch, with a Fixes: tag, and we
> > can
> > properly backport that one, and then have a second patch that adds
> > the
> > new attribute.
> > 
> > Again, adding a new attribute is a "new feature" not a fix, right?

This is true. Saranya, please split the patch in two like Greg pointed
out.

thanks,

-- 
heikki
