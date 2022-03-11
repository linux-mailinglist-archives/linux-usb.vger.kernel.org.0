Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EECA74D628D
	for <lists+linux-usb@lfdr.de>; Fri, 11 Mar 2022 14:45:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348961AbiCKNqn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 11 Mar 2022 08:46:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240780AbiCKNqm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 11 Mar 2022 08:46:42 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36DA71C4B0B
        for <linux-usb@vger.kernel.org>; Fri, 11 Mar 2022 05:45:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647006340; x=1678542340;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZTwoEaeo09VpzpOGNAt7gBnIcJLHWPmo0cCuEkID2uY=;
  b=j7/LPpUhPVpCGiP3j2MO6mBE6bF3CvsHIKQFTb7vycVtscrfjKYaqLZX
   KplkSK3824uJ+J1ESjdOhSexzgswrUBzLNnEOaDZ8XG1UUOPDTL6vSdew
   SOo3mytNv8JehhfE2/9ifqDsWDDvA12xAy3fIDai1HPyUknfggOfAg4NJ
   0EkKkXFXog4k92+N9OioRcVxTU7l8kz4Wxz54QI2B66J6rn2TlGsnu34R
   zc1PleZ+GF4lvNhdhucSOWVT2mCPvqbcJ6lVKDrVcKsbD9bGhWay4RnYP
   l6RIXZtICY1YQY8RNoSPluqaOv09HIW+LeYVWlZaWBEkcTe9E95EhRAk/
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10282"; a="280317590"
X-IronPort-AV: E=Sophos;i="5.90,173,1643702400"; 
   d="scan'208";a="280317590"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2022 05:45:39 -0800
X-IronPort-AV: E=Sophos;i="5.90,173,1643702400"; 
   d="scan'208";a="538999813"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.162])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2022 05:45:36 -0800
Received: by lahna (sSMTP sendmail emulation); Fri, 11 Mar 2022 15:45:23 +0200
Date:   Fri, 11 Mar 2022 15:45:23 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] Thunderbolt/USB4 changes for v5.18 merge window
Message-ID: <YitSc/Sy8O4BSilF@lahna>
References: <YidKEUcphTB4SE0E@lahna>
 <Yis2eUiooOFy0b46@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yis2eUiooOFy0b46@kroah.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Mar 11, 2022 at 12:46:01PM +0100, Greg Kroah-Hartman wrote:
> On Tue, Mar 08, 2022 at 02:20:33PM +0200, Mika Westerberg wrote:
> > Hi Greg,
> > 
> > The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:
> > 
> >   Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)
> > 
> > are available in the Git repository at:
> > 
> >   git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v5.18-rc1
> 
> The gpg key you used to sign this tag is expired, so my checks fail :(

Hmm,

I extended the expiration time already last year and it shows here:

  rsa4096 2017-11-02 [SC] [expires: 2022-08-23]

For that key. I pushed it to the keyserver too at the time
(keyserver.ubuntu.com).

> Please fix this.

Sure but how? :)
