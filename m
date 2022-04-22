Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7068250AF94
	for <lists+linux-usb@lfdr.de>; Fri, 22 Apr 2022 07:37:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232148AbiDVFjk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 22 Apr 2022 01:39:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233024AbiDVFaf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 22 Apr 2022 01:30:35 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 050C04F445
        for <linux-usb@vger.kernel.org>; Thu, 21 Apr 2022 22:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650605262; x=1682141262;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ZDtjdS0EKyXvHECo3L3TkAd5jse0+uLSaytu0Zugtgw=;
  b=GDPCONWspjGEGaoKVvcwW8VqQc5dLGKlR8RT7FD07I3cCHsSBjwLjaPV
   MQ6Df1nIIK6btTxA/Qq+Jzm+lZOxwX3CS8YVESPQSqM7O7y12jmd9vX1K
   /CvgOUubOWFrCQj9H0G4XqynIO4h7SyIUZ4SEM/8iFLGFpk3J+NCUpppk
   0h6LO0I1J1rf67z/W9PAp1rxXb7D7dGCL1mg9uuzekJ6uraQUPszMprQj
   JrrFxyYpP1DnXyfmz6WGbgc24+Q5EvBMZFWa6Jshfp+MFzC7dGQlwlE4X
   PkannL8M0dH7kWd9V7xemP6P6imvfJaN6AvZujdyoD2noMerd/yuUNZRW
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10324"; a="244504106"
X-IronPort-AV: E=Sophos;i="5.90,280,1643702400"; 
   d="scan'208";a="244504106"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2022 22:27:42 -0700
X-IronPort-AV: E=Sophos;i="5.90,280,1643702400"; 
   d="scan'208";a="593997401"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.162])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2022 22:27:39 -0700
Received: by lahna (sSMTP sendmail emulation); Fri, 22 Apr 2022 08:26:27 +0300
Date:   Fri, 22 Apr 2022 08:26:27 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Tomasz =?utf-8?Q?Mo=C5=84?= <desowin@gmail.com>
Cc:     linux-usb@vger.kernel.org,
        Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>
Subject: Re: Wake from Thunderbolt dock doesn't work
Message-ID: <YmI8g2Jaye8Kk+hA@lahna>
References: <6580ca29cd8e245627c4a742189e27acf79f6b39.camel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6580ca29cd8e245627c4a742189e27acf79f6b39.camel@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Thu, Apr 21, 2022 at 09:52:18PM +0200, Tomasz Moń wrote:
> Hello,
> 
> I have observed that when I suspend to RAM, I cannot wakeup the host
> (MacBook Pro 2019) with my low-speed USB keyboard (Microsoft Comfort
> Curve Keyboard 2000) connected to Thunderbolt 3 dock (CalDigit USB-C
> Pro Dock).
> 
> The host runs on Intel Core i9-9980HK and lspci shows Intel Corporation
> JHL7540 Thunderbolt 3 NHI [Titan Ridge 4C 2018] and Intel Corporation
> DSL6540 Thunderbolt 3 Bridge [Alpine Ridge 4C 2015].
> 
> On Windows and Mac OS the system can be successfully woken up by
> pressing key on keyboard connected via the dock.

Is the system that has the problem an Apple system or a regular PC?
