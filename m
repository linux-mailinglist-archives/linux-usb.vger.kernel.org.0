Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E19D3723C0B
	for <lists+linux-usb@lfdr.de>; Tue,  6 Jun 2023 10:41:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235379AbjFFIlR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 6 Jun 2023 04:41:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237185AbjFFIlP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 6 Jun 2023 04:41:15 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0E99E55
        for <linux-usb@vger.kernel.org>; Tue,  6 Jun 2023 01:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686040870; x=1717576870;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9ohr/FeOJoK7xwymUgk/9SnJNYqoygI8E/LAX6TUixU=;
  b=CmuGD72ph4KgFe5xkNvR/U9TePxu4b2O9mKYXV0Vxm1roevqf/GR7tg6
   ROn9RCZDWEHf0qpPGnC1nlgcpNdNOVyrXi38kbpvgKzR8quUoE/3gzisD
   xGLmbWSZDFeh24caQDxyJ3+x5N353pLAdwGWYWMGyi3RZYnMAjxAp49IJ
   CCJ+IUlUL1/QaW26oJ6SX65i+AXX4Rsd9VbTQ3z7iH02whD1POe0ZEDF7
   7MyR/munNTQ2Jt/1QJt2wg4Yw5APK78Khck/QiSCQYLLLG35g++uWECxK
   zKUTCppUPsireocDd9i/LH81I+au1BfxHV5KtOtXH4l7cV+/0LT2ylCbe
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="354100628"
X-IronPort-AV: E=Sophos;i="6.00,219,1681196400"; 
   d="scan'208";a="354100628"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2023 01:41:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="774039014"
X-IronPort-AV: E=Sophos;i="6.00,219,1681196400"; 
   d="scan'208";a="774039014"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 06 Jun 2023 01:41:09 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 4BCAB34F; Tue,  6 Jun 2023 11:41:16 +0300 (EEST)
Date:   Tue, 6 Jun 2023 11:41:16 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Torsten Hilbrich <torsten.hilbrich@secunet.com>
Cc:     Mario Limonciello <mario.limonciello@amd.com>,
        linux-usb@vger.kernel.org
Subject: Re: [thunderbolt] Regression in v6.1.30, WARNING accessing sysfs
 boot_acl
Message-ID: <20230606084116.GA45886@black.fi.intel.com>
References: <e28465d5-95a3-d08f-3baa-fa7c6cba4a6c@secunet.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e28465d5-95a3-d08f-3baa-fa7c6cba4a6c@secunet.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Tue, Jun 06, 2023 at 10:33:37AM +0200, Torsten Hilbrich wrote:
> Hello,
> 
> v6.1.31 added the following commit:
> 
> commit e16629c639d429e48c849808e59f1efcce886849
> Author: Mario Limonciello <mario.limonciello@amd.com>
> Date:   Mon Apr 24 14:55:54 2023 -0500
> 
>     thunderbolt: Clear registers properly when auto clear isn't in use
>     
>     commit c4af8e3fecd03b0aedcd38145955605cfebe7e3a upstream.
> 
> This introduced a regression on some of our systems (Lenovo T490, T14G1) where a sysfs file boot_acl is found in the system.

Thanks for the report. Should be fixed with:

https://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git/commit/?h=fixes&id=9f9666e65359d5047089aef97ac87c50f624ecb0
