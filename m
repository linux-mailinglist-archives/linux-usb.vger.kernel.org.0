Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63F78717874
	for <lists+linux-usb@lfdr.de>; Wed, 31 May 2023 09:41:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234310AbjEaHlh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 31 May 2023 03:41:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232077AbjEaHlf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 31 May 2023 03:41:35 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E69D793
        for <linux-usb@vger.kernel.org>; Wed, 31 May 2023 00:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685518894; x=1717054894;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bA6YHhl1fzzkusX+8GIYc+yYS3px/ug2lC/YP/W/OJE=;
  b=Wf4t2jnUqbNfvyoaFEwPQSMbYR9BF5CU8Rubn5osF0opPiJHyac8dIuv
   SygomZc0feSTDmWLk71wSLmU0AHx+XgXcZMiEXNKHisYn6FsmP8iXSKJn
   OMXyackX7YYNNTFVExyqyvaiKwzf5ERMxJy0afzOB3SdyR+IFdyb1dFGx
   IJC4wv3douRDkQK/Y0szmqVF7B5HZisLPaMs5iet46LMGTiw32idG6Ym+
   po28pIJ8wDDu+8NN/Ilb3JQWzcPsxHaiyhhVXRJuN4rrM84GKBM82nlCp
   DxbY6KOy3y7ctBUhX3w/oR9OWxw19i2RFJWaCkrn0jjFNdAeRhHmQt732
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="420930058"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; 
   d="scan'208";a="420930058"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2023 00:41:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="771901018"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; 
   d="scan'208";a="771901018"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 31 May 2023 00:41:26 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id CA0D4589; Wed, 31 May 2023 10:41:31 +0300 (EEST)
Date:   Wed, 31 May 2023 10:41:31 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        beld zhang <beldzhang@gmail.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Re: [PATCH] thunderbolt: Mask ring interrupt on Intel hardware as
 well
Message-ID: <20230531074131.GJ45886@black.fi.intel.com>
References: <20230530075555.35239-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230530075555.35239-1-mika.westerberg@linux.intel.com>
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, May 30, 2023 at 10:55:55AM +0300, Mika Westerberg wrote:
> When resuming from system sleep states the driver issues following
> warning on Intel hardware:
> 
>   thunderbolt 0000:07:00.0: interrupt for TX ring 0 is already enabled
> 
> The reason for this is that the commit in question did not mask the ring
> interrupt on Intel hardware leaving the interrupt active. Fix this by
> masking it also in Intel hardware.
> 
> Reported-by: beld zhang <beldzhang@gmail.com>
> Closes: https://lore.kernel.org/linux-usb/ZHKW5NeabmfhgLbY@debian.me/
> Fixes: c4af8e3fecd0 ("thunderbolt: Clear registers properly when auto clear isn't in use")
> Cc: stable@vger.kernel.org
> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Applied to thunderbolt.git/fixes.
