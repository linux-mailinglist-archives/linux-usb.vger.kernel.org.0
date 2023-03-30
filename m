Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 300496D0816
	for <lists+linux-usb@lfdr.de>; Thu, 30 Mar 2023 16:22:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232464AbjC3OWS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 30 Mar 2023 10:22:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232513AbjC3OWH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 30 Mar 2023 10:22:07 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 783B2CDD0
        for <linux-usb@vger.kernel.org>; Thu, 30 Mar 2023 07:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680186101; x=1711722101;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=tm1vz7rf+zY9FCoTIhxGwiCnOArAsYM42z5m2qp8fU8=;
  b=MWMzDeBGp4sar0W9MBrGqPoLwLfV06i5Cl3gAtEySJvUFRZN+Kj6slGv
   jFu8ogZyfWDgEdQgAyqPy2/rzOkDTaYrUkqYzf9B8jHtzgUJLO5TkiVdw
   KN3EaZ3GgZty3wI9YEk+gcAEdW0roQoFYpBrAjHMVllvTdNwrzX81iYov
   HtxRSMYdqMGwM7KroytowxqXwvIgZ9SZX0M7EM5VQWnQeWYXgQscC4TkK
   IyHIyo4YqDrtrMJTyby1YyIbUW/MX2+ja3//N3XyhUzv1UI17grjUxgiq
   5TgrOIokhghOYJt2mL7eiSrKPVzzLZ2VPnN89kgtkKAGWZ5TtAZkCrLPo
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="343656600"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; 
   d="scan'208";a="343656600"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2023 07:06:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="828351991"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; 
   d="scan'208";a="828351991"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 30 Mar 2023 07:06:32 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 30 Mar 2023 17:06:31 +0300
Date:   Thu, 30 Mar 2023 17:06:31 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Samuel =?utf-8?B?xIxhdm9q?= <samuel@cavoj.net>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: typec: ucsi: introduce read_explicit operation
Message-ID: <ZCWXZ1KwzYeSdJhv@kuha.fi.intel.com>
References: <20230120233920.752245-1-samuel@cavoj.net>
 <Y8uRnc3Cxb1ADad6@kroah.com>
 <Y8+/Lgp7fWaxFsri@kuha.fi.intel.com>
 <ZAi1KO+WUs+9nNOn@kuha.fi.intel.com>
 <ZBMUsweZjfqxZJdc@kuha.fi.intel.com>
 <c5223adc99dd9bf849071e8fdfed4bb1@cavoj.net>
 <3ae633095973c747baea1a23f3b7f6f4@cavoj.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3ae633095973c747baea1a23f3b7f6f4@cavoj.net>
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Sam,

On Thu, Mar 30, 2023 at 01:48:18AM +0200, Samuel Čavoj wrote:
> Hi Heikki,
> 
> On 2023-03-18 03:04, Samuel Čavoj wrote:
> ...
> > > Unfortunately nothing seems to work... I'm attaching the DMI quirk
> > > patch here. Can you test it?
> > 
> > I'll definitely try it out, I hope sometime next week!
> > 
> > > I'm not sure if the DMI_PRODUCT_NAME is just "ZenBook" so you may
> > > need to fix that in the patch!!
> > > 
> > > You can get the correct value by running dmidecode. This should work:
> > > 
> > >         % dmidecode -s system-product-name
> 
> This returns "ZenBook UX325UA_UM325UA", so the DMI_MATCH would work.
> However my DMI_SYS_VENDOR is "ASUSTeK COMPUTER INC.", uppercase.
> 
> All in all, the patch works after some modifications which I'm
> attaching below. In summary:
> 
>  - The DMI_MATCH SYS_VENDOR was changed to uppercase
>  - The DMI_MATCH PRODUCT_NAME was changed to be more specific, although
>    I'm not sure what the best value is here.
>  - The conditional in ucsi_zenbook_read was fixed.
>  - ua->cmd cannot be reset to 0 after read because the reset
>    procedure repeatedly calls read without performing
>    any other commands. I don't think this should cause any problems
>  - ucsi_acpi_notify needs to call the quirked variant
>    as well, so I put an indirect call there.
> 
> Otherwise maybe ucsi_acpi_async_write should only set cmd if the offset
> is UCSI_CONTROL.

Thanks!

> I'm occasionally getting some other errors later on, but I think
> those might be specific to a certain cheap USB-C hub I have. They
> don't occur with it unplugged.

Okay... Did you see those errors with your original patch?

Br,

-- 
heikki
