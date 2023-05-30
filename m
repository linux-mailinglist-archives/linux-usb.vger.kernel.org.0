Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 624C371556C
	for <lists+linux-usb@lfdr.de>; Tue, 30 May 2023 08:15:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229864AbjE3GPJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 30 May 2023 02:15:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbjE3GPG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 30 May 2023 02:15:06 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7803B0
        for <linux-usb@vger.kernel.org>; Mon, 29 May 2023 23:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685427303; x=1716963303;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8TFcrMzS6te0wbjONe9wOgcUjGp8NhV/6D/S0gvjeZQ=;
  b=jAa2c1QEZF6d5bp5hjlKX2xvwOgqoNuFGuKscUakDnbev4BKS9tr/+6v
   rC8sPbIxJ67K+aR3F2Qu+WmAKHIVwG9OFpoUjy1HlRv5Q9aRZ4tZlllNu
   60L9fhkpGNTBCxClQDpEYIq8GV/BafzpRxHSoO/o4uGzxE9KI8UfZLYI7
   PdpiATLkMD/wrj01QKLPme129Al52WVUBoAElQLSTQZvnaKrRM5t+nMEW
   vHrLiq6ts0Bwb7Gk5yCSIM70Q7C75QUIZLryNdXiH0YUFoWOjUTP3IXLE
   EnR/++BNsjABCzWrGgnJcGlEY8QtuESPgDC5jM6uMBzBrDori+/ls66dR
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="441182986"
X-IronPort-AV: E=Sophos;i="6.00,203,1681196400"; 
   d="scan'208";a="441182986"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2023 23:14:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="656710356"
X-IronPort-AV: E=Sophos;i="6.00,203,1681196400"; 
   d="scan'208";a="656710356"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga003.jf.intel.com with ESMTP; 29 May 2023 23:14:57 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 9DDEC4BA; Tue, 30 May 2023 09:15:02 +0300 (EEST)
Date:   Tue, 30 May 2023 09:15:02 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>
Subject: Re: [PATCH] thunderbolt: Log DisplayPort adapter rate and lanes on
 discovery
Message-ID: <20230530061502.GB45886@black.fi.intel.com>
References: <20230526110037.20542-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230526110037.20542-1-mika.westerberg@linux.intel.com>
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, May 26, 2023 at 02:00:37PM +0300, Mika Westerberg wrote:
> This may be helpful when debugging possible issues around DisplayPort
> port tunneling.
> 
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Applied to thunderbolt.git/next.
