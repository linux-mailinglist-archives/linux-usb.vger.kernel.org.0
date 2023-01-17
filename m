Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF2CE66DA5E
	for <lists+linux-usb@lfdr.de>; Tue, 17 Jan 2023 10:55:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236166AbjAQJzU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 17 Jan 2023 04:55:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236223AbjAQJzR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 17 Jan 2023 04:55:17 -0500
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F8442B081
        for <linux-usb@vger.kernel.org>; Tue, 17 Jan 2023 01:55:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673949315; x=1705485315;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OC9/6jtOewbE3Q/MM0qd3cEMfxNqRHoVm9cm299QBLg=;
  b=e3aXRB/lujs9aWhODk8yafiGNdzAtisgJbvqN4pkk+xjeA3SP3xuVMOE
   /bmKGj/RTrP3mQOq7r/IzxyJEeIcmZPxPY8tqtfHYgzsa9K4u798rTzfL
   2090ftu0AX9+a4hs4aFD5OhOdoJJlAgw0Mwd+7pSfveZI8f+LJC/W6xep
   GeI7NyGfv9/wBWPmqfxwFhRVkzRVkCZjcC4CJD6K0nSjC0Cbn6eYSlbrL
   qND1NkUdwpY2/LsZRNE7IhaPJBJCDYPKKvYrQwBmDooYnP0OVeXTdlb7p
   AvQpkxptVZdEQE8KHKT65ZdIDlVaRd4wC9I35oyJoUAZIZLPG6Vac259u
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="410893393"
X-IronPort-AV: E=Sophos;i="5.97,222,1669104000"; 
   d="scan'208";a="410893393"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2023 01:54:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="722590243"
X-IronPort-AV: E=Sophos;i="5.97,222,1669104000"; 
   d="scan'208";a="722590243"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 17 Jan 2023 01:54:25 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id D2D24130; Tue, 17 Jan 2023 11:54:59 +0200 (EET)
Date:   Tue, 17 Jan 2023 11:54:59 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>
Subject: Re: [PATCH 0/8] thunderbolt: Add support for DisplayPort bandwidth
 allocation mode
Message-ID: <Y8Zwcyx5ZwnK0q3m@black.fi.intel.com>
References: <20230105113559.68531-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230105113559.68531-1-mika.westerberg@linux.intel.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jan 05, 2023 at 01:35:51PM +0200, Mika Westerberg wrote:
> Hi all,
> 
> This series implements an optional feature in USB4 spec called
> DisplayPort bandwidth allocation mode. This allows the graphics driver
> to negotiate with the Thunderbolt driver the bandwidth requirements
> dynamically through DP IN adapters of the host router (graphics driver
> uses DP AUX registers for this). This enables more "fine grained"
> bandwidth allocation.
> 
> Mika Westerberg (8):
>   thunderbolt: Use decimal port number in control and tunnel logs too
>   thunderbolt: Log DP adapter type
>   thunderbolt: Improve debug logging in tb_available_bandwidth()
>   thunderbolt: Take CL states into account when waiting for link to come up
>   thunderbolt: Increase timeout of DP OUT adapter handshake
>   thunderbolt: Add functions to support DisplayPort bandwidth allocation mode
>   thunderbolt: Include the additional DP IN double word in debugfs dump
>   thunderbolt: Add support for DisplayPort bandwidth allocation mode

All applied to thunderbolt.git/next.
