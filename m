Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 54B076AB99C
	for <lists+linux-usb@lfdr.de>; Mon,  6 Mar 2023 10:22:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229864AbjCFJWO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Mar 2023 04:22:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229842AbjCFJWN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Mar 2023 04:22:13 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1337D1C5BE
        for <linux-usb@vger.kernel.org>; Mon,  6 Mar 2023 01:22:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678094533; x=1709630533;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ofj35FdZZTSaZGgYiAWDxP4Xyu1rJizu7dFp01cPh2Q=;
  b=lHA/X2ILRK20jJ+YG/mN0bbyres0yYz/dmaquZc2lGfHEHc0NVPXZrmW
   oPbpWxtZdMPTbqhvLKTb8AgMZ+40jRpqqp5QY66p2Z8ZOykzWukTWGsWF
   1fFGlaTCZtrzlrm2lIFVszdbA5qCaen9FwlWPTo52v9CZrjVLNgN1Tqq2
   Zz2++yxEkTeADQOHbg0ZtX8cJYrxcOf9rKhi4UZUGOVihVOFg7c2sLva0
   Y5gwtIqkPYNWmPKlyPtmcRzHE5lD/DNOjjdtBJDjtLkiGmDT/ptxzWtYT
   VPy729//yOZCI+0+eRPxgVsLOIVAtkGJPjxqZjPYsXypXIQvQ+/97lfAH
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="323818811"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; 
   d="scan'208";a="323818811"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2023 01:22:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="786146925"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; 
   d="scan'208";a="786146925"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 06 Mar 2023 01:22:10 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 16C9F143; Mon,  6 Mar 2023 11:22:53 +0200 (EET)
Date:   Mon, 6 Mar 2023 11:22:53 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Sanjay R Mehta <Sanju.Mehta@amd.com>
Cc:     andreas.noever@gmail.com, michael.jamet@intel.com,
        YehezkelShB@gmail.com, Basavaraj.Natikar@amd.com,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v4] thunderbolt: Add quirk to disable CLx
Message-ID: <20230306092253.GC62143@black.fi.intel.com>
References: <1676402030-4653-1-git-send-email-Sanju.Mehta@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1676402030-4653-1-git-send-email-Sanju.Mehta@amd.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

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

I added debug log when the quirk is run and applied to
thunderbolt.git/fixes, thanks!
