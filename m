Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9306677015C
	for <lists+linux-usb@lfdr.de>; Fri,  4 Aug 2023 15:22:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231187AbjHDNWS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Aug 2023 09:22:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229918AbjHDNV7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 4 Aug 2023 09:21:59 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0AA14ECA
        for <linux-usb@vger.kernel.org>; Fri,  4 Aug 2023 06:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691155206; x=1722691206;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WPAdJin5PPbRialOZ79NI80/bkFrK49R3hlEYQP0TxM=;
  b=blBjZGSZKMM66Ejt+hIbegSIWh4zXs6E8o+1tGAta2k4HbYry4GpeFVc
   JRMDBLTrDeILXzj5tayXmtv2BJN5CI34YsY2numPxQUcKjYAO5aFG8O5S
   QUOPJKmFC6daaFeS6WGAaIMV2lv7fby4k3aB1OPN/yoDKuVicxO3ju7HW
   srR9gbJ4bB6SoC+JBU9LMfPm0+0c/k5e/86zvUP/d5mnyqn7vWSHlMddz
   89b0b/N7KZukQJxQs8z6aeFdVQY26Ikopz1bMM0Y+G4RTpo9iZ8ZfCiw7
   s1CdyMNqdBkViaY7jvPIvvXHvZxa0CSdvRnthgJBBrwtEHDyQQxwjft9z
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="372897497"
X-IronPort-AV: E=Sophos;i="6.01,255,1684825200"; 
   d="scan'208";a="372897497"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2023 06:20:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="820128472"
X-IronPort-AV: E=Sophos;i="6.01,255,1684825200"; 
   d="scan'208";a="820128472"
Received: from black.fi.intel.com ([10.237.72.28])
  by FMSMGA003.fm.intel.com with ESMTP; 04 Aug 2023 06:20:02 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 56726BAB; Fri,  4 Aug 2023 16:20:13 +0300 (EEST)
Date:   Fri, 4 Aug 2023 16:20:13 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>
Subject: Re: [PATCH] thunderbolt: Fix memory leak in
 tb_handle_dp_bandwidth_request()
Message-ID: <20230804132013.GC14638@black.fi.intel.com>
References: <20230803095042.54743-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230803095042.54743-1-mika.westerberg@linux.intel.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Aug 03, 2023 at 12:50:42PM +0300, Mika Westerberg wrote:
> The memory allocated in tb_queue_dp_bandwidth_request() needs to be
> released once the request is handled to avoid leaking it.
> 
> Fixes: 6ce3563520be ("thunderbolt: Add support for DisplayPort bandwidth allocation mode")
> Cc: stable@vger.kernel.org
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Applied to thunderbolt.git/fixes.
