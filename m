Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C20F0552BD3
	for <lists+linux-usb@lfdr.de>; Tue, 21 Jun 2022 09:24:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346190AbiFUHXy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 Jun 2022 03:23:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344735AbiFUHXs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 21 Jun 2022 03:23:48 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 211651A3A8
        for <linux-usb@vger.kernel.org>; Tue, 21 Jun 2022 00:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655796225; x=1687332225;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WCgsWuLBx/XaU2GfBWVvnON/H2Vi5/L174LDuQcTn0k=;
  b=e2Jf5MYNdxXlgdk0jhYpJPHxcCF8qJns2t9DAYz5q+bSd3A64bnRMiMw
   sRDjDO3ZiN4zVin3FIhMTcdG5NZUdJLhbSl//ZLfEk8MR/UFDPnS4mqp0
   9eQ0euvkCSuI4sEflG4hXZkYtKlqxeFJCC6uvMeZG6pawdm8qj2rhzLos
   51Zd0DrRcT5WZImnknyTgPDeAyw9L0UC9TaNqXYrDeLKqmDcMKXEYN6Ke
   9k6MWe7x9icnb/z+R1kINas7Lj34Oew8G4m9nODsi9DdxggkdUPNhcCAm
   RdVK6mLa+Z82Ic2eIDosF92jMT641B0gUlsZuRim0PJMUNvKjXS4kjV7R
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10384"; a="277599046"
X-IronPort-AV: E=Sophos;i="5.92,209,1650956400"; 
   d="scan'208";a="277599046"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2022 00:23:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,209,1650956400"; 
   d="scan'208";a="729718209"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 21 Jun 2022 00:23:30 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 21 Jun 2022 10:23:29 +0300
Date:   Tue, 21 Jun 2022 10:23:29 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Phil Edworthy <phil.edworthy@renesas.com>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Aswath Govindraju <a-govindraju@ti.com>,
        linux-usb@vger.kernel.org
Subject: Re: usb: typec: driver for TI HD3SS3220 USB Type-C DRP port
 controller question
Message-ID: <YrFx8RFYgF6RWckE@kuha.fi.intel.com>
References: <TYYPR01MB70867A4B8CEBD6450A239D45F5B09@TYYPR01MB7086.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TYYPR01MB70867A4B8CEBD6450A239D45F5B09@TYYPR01MB7086.jpnprd01.prod.outlook.com>
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Phil,

On Mon, Jun 20, 2022 at 09:04:10AM +0000, Phil Edworthy wrote:
> Hi Heikki,
> 
> I have a board that uses the TI HD3SS3220 USB Type-C DRP port
> controller [1], however it doesn't have the interrupt line
> connected. How would you recommend I handle this? Should I get
> the driver to poll the i2c registers?
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/usb/typec/hd3ss3220.c?h=v5.19-rc3

If you have some other way of detecting connections on your system,
then we probable could consider some kind of notifier, but as a
general solution for the lack of interrupt, I think polling is the
only way.

I'll add the list, and Aswath and Roger. Aswath and Roger were looking
at the same problem with the tps6598x (tipd) driver.


thanks,

-- 
heikki
