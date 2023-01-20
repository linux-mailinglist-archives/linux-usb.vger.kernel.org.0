Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9823B67537B
	for <lists+linux-usb@lfdr.de>; Fri, 20 Jan 2023 12:36:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229634AbjATLgT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 20 Jan 2023 06:36:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229636AbjATLgS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 20 Jan 2023 06:36:18 -0500
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C4C68729B
        for <linux-usb@vger.kernel.org>; Fri, 20 Jan 2023 03:36:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674214577; x=1705750577;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=8KMyH63qOxdA0DCddxonlJIvMx++wxHTtCEoKnHiJm8=;
  b=GHlHWVlx8ILVHyqM7We1XuDhE/RYadmkZRscHbIfqkpasK8pceIe9HPB
   zTlTPlh54ScNV7yrr87TKs9ZqV+9fdcX/CXeshd6UnNxjN8STu0b4gUZT
   ZuBkY8WQqoO8pGQU3uISt0lqE6jTwfoiKko4V6QA8oYpuLSDYG2Ld5gKf
   VjFU2fD+3/zqyt/HUVo3M8qW15N2zCP/DZPQ2TKfk+QEVxa5E4f7QNfYq
   QwLd5OHKKczbqxJzZl7Y6oVZ1PVzM6GWg7XWTzxQznzcfNvPtj02FkU5h
   vq+rZd6+jyj+fyix2PHtMp2iu3BKOArKyKqj32+RfdUGoYii1OUEhdSc9
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="324242089"
X-IronPort-AV: E=Sophos;i="5.97,232,1669104000"; 
   d="scan'208";a="324242089"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2023 03:36:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="660559232"
X-IronPort-AV: E=Sophos;i="5.97,232,1669104000"; 
   d="scan'208";a="660559232"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga002.jf.intel.com with ESMTP; 20 Jan 2023 03:36:15 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 46878368; Fri, 20 Jan 2023 13:36:50 +0200 (EET)
Date:   Fri, 20 Jan 2023 13:36:50 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Christian =?utf-8?Q?Schaubschl=C3=A4ger?= 
        <christian.schaubschlaeger@gmx.at>
Cc:     linux-usb@vger.kernel.org,
        "michael.simon@cpsd.at" <michael.simon@cpsd.at>
Subject: Re: Possible problem with thunderbolt 4
Message-ID: <Y8p80hxj6IV06QNF@black.fi.intel.com>
References: <Y7wNnrlEWMOV4Cj/@black.fi.intel.com>
 <0f862f75-9805-f5d0-ef89-0b77d0ae8778@gmx.at>
 <Y72AbwKFd9snjZrJ@black.fi.intel.com>
 <3ccb150b-dbd9-c9d0-0e8c-8c169f0d8faf@gmx.at>
 <Y76TS54PJpmseZs3@black.fi.intel.com>
 <8c2da730-ba9b-6ec7-d493-1a6a2ce54622@gmx.at>
 <Y8kXFFrue7l7DKf3@black.fi.intel.com>
 <78c5218a-67ef-d61d-09fe-2c2cf7fdc87f@gmx.at>
 <Y8ppf5HHTOaDfGLq@black.fi.intel.com>
 <6edd3033-b22b-a293-82e8-10594526ab44@gmx.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6edd3033-b22b-a293-82e8-10594526ab44@gmx.at>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jan 20, 2023 at 12:19:18PM +0100, Christian Schaubschläger wrote:
> Hi,
> >> You're right! With this commit reverted it uses the software connection manager, with the commit applied it uses the firmware connection manager.
> > Hmm, so reverting this commit enables software connection manager and
> > makes the Lenovo system work? Are you sure? that's completely opposite
> > how the HP system behaves ;-)
> 
> No, with the software CM active it does _not_ work! The patch
> introduced in 5.18.11 somehow prevents the software CM to be used...
> 
> 5.18.9, without the comit:
> 
> bash-5.0# uname -r
> 5.18.9-superschaf-uefi-bisect
> bash-5.0# dmesg |grep manager
> [    2.028144] thunderbolt 0000:00:0d.2: using software connection manager
> [    2.220380] thunderbolt 0000:00:0d.3: using software connection manager
> 
> and 5.18.11, including the commit:
> 
> bash-5.0# uname -r
> 5.18.11-superschaf-uefi-bisect
> bash-5.0# dmesg | grep manager
> [    1.827993] thunderbolt 0000:00:0d.2: using firmware connection manager
> [    2.113706] thunderbolt 0000:00:0d.3: using firmware connection manager
> 
> On the HP the software CM is used always (unless I run a kernel with CONFIG_USB4=n).

Okay then it is consistent. Thanks for confirming.
