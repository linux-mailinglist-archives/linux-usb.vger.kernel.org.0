Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DCB61697649
	for <lists+linux-usb@lfdr.de>; Wed, 15 Feb 2023 07:26:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233213AbjBOG0Y (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Feb 2023 01:26:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231803AbjBOG0S (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Feb 2023 01:26:18 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FCD73347D
        for <linux-usb@vger.kernel.org>; Tue, 14 Feb 2023 22:26:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676442378; x=1707978378;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=K+kBfVtw5A4yR8hsUaeY+/iXPY4gMDnyQFleQATTSv0=;
  b=ZlMBb2Xtes3J9AOgAAvbdG6nzWCaogK6J+ssp4PEGDfHrKkmCQvdF1rI
   BN7Hx1h6dcUQmK5PB7b/geZBi5990qXOC6DedmE6drxUbxpuufKXvgLXz
   okQAkeXhJZj3ffiSr81bOT25ti1xrzbpqxQgxZZ3X7CxTuslov7QigY78
   SD4R2SO/9/l1YsX7h1aLyCU5OI/YqUEMcq3J1oafTrB4zTf82aR4thSvB
   ha0ERdSI9VZMXjaOQ7+bsxRdiYaT+reLTIz+h0B0oCnDF9RP9svFET2oy
   xDAoP9FCLRIw/ye0moKpFRqSkmE3IJIwQRy5WSIWFjAn72qXKEZlZRPwy
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="333493958"
X-IronPort-AV: E=Sophos;i="5.97,298,1669104000"; 
   d="scan'208";a="333493958"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2023 22:26:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="699838421"
X-IronPort-AV: E=Sophos;i="5.97,298,1669104000"; 
   d="scan'208";a="699838421"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga008.jf.intel.com with ESMTP; 14 Feb 2023 22:26:15 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 99DFA1A6; Wed, 15 Feb 2023 08:26:55 +0200 (EET)
Date:   Wed, 15 Feb 2023 08:26:55 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Sanjay R Mehta <Sanju.Mehta@amd.com>
Cc:     andreas.noever@gmail.com, michael.jamet@intel.com,
        YehezkelShB@gmail.com, Basavaraj.Natikar@amd.com,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v4] thunderbolt: Add quirk to disable CLx
Message-ID: <Y+x7Lzy6TUf3E8kS@black.fi.intel.com>
References: <1676402030-4653-1-git-send-email-Sanju.Mehta@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1676402030-4653-1-git-send-email-Sanju.Mehta@amd.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Tue, Feb 14, 2023 at 01:13:50PM -0600, Sanjay R Mehta wrote:
> From: Sanjay R Mehta <sanju.mehta@amd.com>
> 
> Add QUIRK_NO_CLX to disable the CLx state for hardware which
> doesn't supports it.
> 
> AMD Yellow Carp and Pink Sardine don't support CLx state,
> hence disabling it using QUIRK_NO_CLX.
> 
> Signed-off-by: Sanjay R Mehta <sanju.mehta@amd.com>
> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>

This looks good, thanks! I will pick this up after the merge window is
over as I already sent out my PR for v6.3-rc1.
