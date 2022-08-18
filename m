Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E2E3B598072
	for <lists+linux-usb@lfdr.de>; Thu, 18 Aug 2022 10:59:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242036AbiHRI5W (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 18 Aug 2022 04:57:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239820AbiHRI5W (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 18 Aug 2022 04:57:22 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 688E150703
        for <linux-usb@vger.kernel.org>; Thu, 18 Aug 2022 01:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660813041; x=1692349041;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BiGh6dqTb+TD1Ka4pWXyyatydB/FKuyX2Y2De4whwjQ=;
  b=Ckb3Z27crkRFl+ykLgfVtGevtsBpwbCFgF8xmxqfgy34jIh8EcA3ud/n
   REsQ9spdmEnH9mxMcXE+vxKKNR8PriPvITW2XWkyYB0zxn6ldACjQ/EAX
   x6QCFwOnDX71BgCAbbJvZhcmOnttB+dFjhfEq8pXMDvwNHG5eHpr/Twbd
   SetRj21z5TKEIlQaGvpWcJQSmmHgvbNOiG6E+wJwFs3ISJuwl306y6AV6
   RE93ndvYq3jfkbgZ9H09rme3X9Wb/ZR7g8CUpLJ3lhA5BKaavxpVAqceP
   PLjWW4YkT7c+qJCJ/PnpjUIV9A+PUCqem5ZUKoXw9uv4YY9pHw611BThL
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10442"; a="293983224"
X-IronPort-AV: E=Sophos;i="5.93,246,1654585200"; 
   d="scan'208";a="293983224"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2022 01:57:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,246,1654585200"; 
   d="scan'208";a="783709107"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga005.jf.intel.com with ESMTP; 18 Aug 2022 01:57:19 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id B7E6219D; Thu, 18 Aug 2022 11:57:32 +0300 (EEST)
Date:   Thu, 18 Aug 2022 11:57:32 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>
Subject: Re: [PATCH 1/2] thunderbolt: Use the actual buffer in
 tb_async_error()
Message-ID: <Yv3+/Mmwt7XK93jQ@black.fi.intel.com>
References: <20220816104059.71844-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220816104059.71844-1-mika.westerberg@linux.intel.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Aug 16, 2022 at 01:40:58PM +0300, Mika Westerberg wrote:
> The received notification packet is held in pkg->buffer and not in pkg
> itself. Fix this by using the correct buffer.
> 
> Fixes: 81a54b5e1986 ("thunderbolt: Let the connection manager handle all notifications")
> Cc: stable@vger.kernel.org
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Both applied to thunderbolt.git/fixes.
