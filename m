Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F61372B7CE
	for <lists+linux-usb@lfdr.de>; Mon, 12 Jun 2023 07:49:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232585AbjFLFtC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 12 Jun 2023 01:49:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235766AbjFLFsR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 12 Jun 2023 01:48:17 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 498E84237
        for <linux-usb@vger.kernel.org>; Sun, 11 Jun 2023 22:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686548693; x=1718084693;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=M3sPMlBW6JCxoe3cQp0S8MeMmmaJub3tOmY1zYTdn4E=;
  b=PvtztOqmHMBj7GFFBCqluMgA2bVH5a4MY2b6TQ4cVGD8OInXDQHmXMq0
   xapuPHxJP5EhX66OOfpgJnRzL1muhNUp4LNzlN5VAr8YocXizDgylnxZP
   NoqWbFSE6os+GXVY3lU8NxWTur0VA646dCJt1pjIec8CaO2W7dt1nOJs4
   4LpZCTYJJLJLKAR0DjgqEBFMdfW69HUyBqSNrBS9VKk8ZszfvgTmJB87F
   cNJwEHd9Oa5M5kxupXXSm0tpgRM7woqb7FvjqLsXPshnjUcyJv3Z5ea9w
   yWTty+aQiJDMzYtqSZsH/BaUi0dGMTHYZ458hafE+X6MxDPZBYBRTnl9o
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10738"; a="342638930"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; 
   d="scan'208";a="342638930"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2023 22:42:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10738"; a="740871021"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; 
   d="scan'208";a="740871021"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga008.jf.intel.com with ESMTP; 11 Jun 2023 22:42:48 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id BA641357; Mon, 12 Jun 2023 08:42:56 +0300 (EEST)
Date:   Mon, 12 Jun 2023 08:42:56 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Utkarsh H Patel <utkarsh.h.patel@intel.com>
Subject: Re: [PATCH 0/3] thunderbolt: Few improvements for retimer access
Message-ID: <20230612054256.GR45886@black.fi.intel.com>
References: <20230602091055.65049-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230602091055.65049-1-mika.westerberg@linux.intel.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jun 02, 2023 at 12:10:52PM +0300, Mika Westerberg wrote:
> Hi,
> 
> These 3 patches improve the way we access retimers over sideband in
> various situations, and make it more compliant with the USB4 spec.
> 
> Mika Westerberg (3):
>   thunderbolt: Read retimer NVM authentication status prior tb_retimer_set_inbound_sbtx()
>   thunderbolt: Do not send UNSET_INBOUND_SBTX when retimer NVM authentication started
>   thunderbolt: Enable/disable sideband depending on USB4 port offline mode

All applied to thunderbolt.git/next.

Yehezkel, let me know if you have any objections or want more
clarifications.
