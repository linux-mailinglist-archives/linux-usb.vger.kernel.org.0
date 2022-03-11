Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 20F354D6424
	for <lists+linux-usb@lfdr.de>; Fri, 11 Mar 2022 15:54:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240629AbiCKOza (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 11 Mar 2022 09:55:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233249AbiCKOz3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 11 Mar 2022 09:55:29 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6732E19CCD6
        for <linux-usb@vger.kernel.org>; Fri, 11 Mar 2022 06:54:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647010466; x=1678546466;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=c1qYwScWtXh0OldVfypk9jueHnlZ00XMgL4bR4KT11g=;
  b=bLGqLgHSXTeVz5dJc1QfE2zK9KBkZYsRFmrhUiT1dO4EriUA0HWlseG6
   wcUMJvaufGRfbV/mdby27hV9Gj/ArFAjSFaDTOI2IrnLbu9YHiUy2pVYy
   aCMQQKJd13RyxPpg9zqDzNSiW9G/rcRw4OdxwsMa/VSh9octya5Ke8Khe
   TzTyc5+AAaKhZiLHJX6p2Oz6iXISLygemwYkOUyO7OrAP+q9XnzcJwTsp
   TUPkQ9UkgJZq73douq58q4ST7wEZkfd9ajeKzMFimSD9sW1I70D7TwBD8
   oT2/oGqgO8TYfJbqbbKaRH5XLTFVd0JIRVATo3B0mcBRAjFVAt4FlS+2C
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10282"; a="236187831"
X-IronPort-AV: E=Sophos;i="5.90,174,1643702400"; 
   d="scan'208";a="236187831"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2022 06:54:26 -0800
X-IronPort-AV: E=Sophos;i="5.90,174,1643702400"; 
   d="scan'208";a="644949761"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.162])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2022 06:54:23 -0800
Received: by lahna (sSMTP sendmail emulation); Fri, 11 Mar 2022 16:54:20 +0200
Date:   Fri, 11 Mar 2022 16:54:20 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] Thunderbolt/USB4 changes for v5.18 merge window
Message-ID: <YitinFevmtz9fB32@lahna>
References: <YidKEUcphTB4SE0E@lahna>
 <Yis2eUiooOFy0b46@kroah.com>
 <YitSc/Sy8O4BSilF@lahna>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YitSc/Sy8O4BSilF@lahna>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

On Fri, Mar 11, 2022 at 03:45:39PM +0200, Mika Westerberg wrote:
> On Fri, Mar 11, 2022 at 12:46:01PM +0100, Greg Kroah-Hartman wrote:
> > On Tue, Mar 08, 2022 at 02:20:33PM +0200, Mika Westerberg wrote:
> > > Hi Greg,
> > > 
> > > The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:
> > > 
> > >   Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)
> > > 
> > > are available in the Git repository at:
> > > 
> > >   git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v5.18-rc1
> > 
> > The gpg key you used to sign this tag is expired, so my checks fail :(
> 
> Hmm,
> 
> I extended the expiration time already last year and it shows here:
> 
>   rsa4096 2017-11-02 [SC] [expires: 2022-08-23]
> 
> For that key. I pushed it to the keyserver too at the time
> (keyserver.ubuntu.com).
> 
> > Please fix this.
> 
> Sure but how? :)

I just read this:

  https://korg.docs.kernel.org/pgpkeys.html

and uploaded the updated key to https://keys.openpgp.org/upload/ too. I
hope it works now. Sorry about the mess.
