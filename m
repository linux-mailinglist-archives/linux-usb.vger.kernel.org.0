Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8B6859BD18
	for <lists+linux-usb@lfdr.de>; Mon, 22 Aug 2022 11:45:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230467AbiHVJpu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 22 Aug 2022 05:45:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230518AbiHVJpr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 22 Aug 2022 05:45:47 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C756627157
        for <linux-usb@vger.kernel.org>; Mon, 22 Aug 2022 02:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661161542; x=1692697542;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FXapEnhGsluCjuazV+7z9C02JuBiOHyswv5xgs7P41g=;
  b=QDRi3rnFgx1Nr4s50tCyy+SdP0hY3nbxq1cIQFg+SHdQHD0n/RRogZtY
   InlbitzbgpBAt+ybJYYI4OMUDmsL+/NY2IOZn5E4v4uLrTt2zyWc22CoP
   YdqzWAlN01fFb2OK3NY0srj2Rx3L1WVMKN9ejZaUu72y9URRunwXlHN+r
   A35jjSjaUSrZiFNE9awgKU9MOgdFAD+0tk1AnGYMQ1yPZOJBsiwJ80MSH
   rFklJhd/yurEj7CvPm6q+GzKtc8Z/RYZLPSr0G+UQt818D7XK7tU9uzXT
   q0N/utVMLNmTsB9tBE6im9HQdZd7Mw6N+yx4qeslCU9dVJkZwrgYD6iMR
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10446"; a="319403355"
X-IronPort-AV: E=Sophos;i="5.93,254,1654585200"; 
   d="scan'208";a="319403355"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2022 02:45:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,254,1654585200"; 
   d="scan'208";a="585453320"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 22 Aug 2022 02:45:37 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 27A82174; Mon, 22 Aug 2022 12:45:51 +0300 (EEST)
Date:   Mon, 22 Aug 2022 12:45:51 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        utkarsh.h.patel@intel.com
Subject: Re: [PATCH 1/2] thunderbolt: Add comment where Thunderbolt 4 PCI IDs
 start
Message-ID: <YwNQT32JS9RbyNlI@black.fi.intel.com>
References: <20220816105146.72098-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220816105146.72098-1-mika.westerberg@linux.intel.com>
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Aug 16, 2022 at 01:51:45PM +0300, Mika Westerberg wrote:
> This makes it consistent with the previous generations. No functional
> impact.
> 
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Both applied to thunderbolt.git/next.
