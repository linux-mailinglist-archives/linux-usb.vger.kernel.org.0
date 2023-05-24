Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3EB9370EE56
	for <lists+linux-usb@lfdr.de>; Wed, 24 May 2023 08:44:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239746AbjEXGoE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 24 May 2023 02:44:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239744AbjEXGne (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 24 May 2023 02:43:34 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D17611704
        for <linux-usb@vger.kernel.org>; Tue, 23 May 2023 23:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684910537; x=1716446537;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+YsLYTyw0+FKWPgcNTrSqBc16rsKEAEQpGuP7NFtQwY=;
  b=JL6bagVdEbqo2dsNWcnlbQdyeNhLlYMg7IwrtCYqpGxFlc2ztVbU0EOF
   ydTE4k255GPjJxYZHbYKd8K3OTaOvlOwgljqCnXU2x6A67u7Q5xqu6wVU
   yZJHyV3LnGIoVQePSpldGuZHJSjvH37J24c5C09dW5bHJ6lr5WYMou6PG
   Ehtfvk1ToM0DBaW0Kb6Z8q33vsykFawnYD9JQ4o/vZhUEWBAZnYL2qKzQ
   96G5R6fCjtQ60J37QD2avmQJa9ZORdYzqmXWJ+J2fuGPByTWVAKTDALEo
   AdQYregHerwBuiHsiETt9E25II2WeEaEABGLPlaaQYLwgEs5LWaYgKLDL
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="439826840"
X-IronPort-AV: E=Sophos;i="6.00,188,1681196400"; 
   d="scan'208";a="439826840"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2023 23:42:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="816451064"
X-IronPort-AV: E=Sophos;i="6.00,188,1681196400"; 
   d="scan'208";a="816451064"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 23 May 2023 23:42:16 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 8649B3DA; Wed, 24 May 2023 09:42:19 +0300 (EEST)
Date:   Wed, 24 May 2023 09:42:19 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>
Subject: Re: [PATCH 1/7] thunderbolt: Check for ring 0 in
 tb_tunnel_alloc_dma()
Message-ID: <20230524064219.GQ45886@black.fi.intel.com>
References: <20230517084103.45213-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230517084103.45213-1-mika.westerberg@linux.intel.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, May 17, 2023 at 11:40:57AM +0300, Mika Westerberg wrote:
> Ring 0 cannot be used for anything else than control channel messages.
> For this reason add a check to tb_tunnel_alloc_dma() and fail if someone
> tries to do that.
> 
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

All applied to thunderbolt.git/next.
