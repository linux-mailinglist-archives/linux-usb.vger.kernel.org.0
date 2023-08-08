Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C5B8773EEE
	for <lists+linux-usb@lfdr.de>; Tue,  8 Aug 2023 18:39:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232942AbjHHQj1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Aug 2023 12:39:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231156AbjHHQix (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Aug 2023 12:38:53 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDE6D3A4D5
        for <linux-usb@vger.kernel.org>; Tue,  8 Aug 2023 08:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691510045; x=1723046045;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lipijqahMoRcN15yu2R4Ge3cMFr6M9Ld/1ZdPiMzCQg=;
  b=FDzlKSNtWLvRj1ImPiNagdlD11kbsivaEFCmJ6oqKHXRcTCZPsC33F4O
   7VgFseTOkv3tHlh0sz6AQ6SmJF/RkW8c3Mcz7SNmG5j3tML8n/FXNa6u1
   b8ktKS2xSAmpKNvZQqJV8lAX2m/5mFb+xBqbGSRoEcnPnIOQYgZSMOWgl
   LT3zV5n0jjEYGWPpFOe93oimamP3UMz6kTvOS4dEamFTu7pjljMqQ7r7i
   VAAMbS2JHxEfwANPdQo1OCAlNtbvs8A1IEMlWktnA5r18whETFvjwH9KY
   Kyat/UK/yrZoeq9+a+PhVvAWXXwlrVfi+2ehi0ixcrAhg+SweCcIzLgdL
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="437050639"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200"; 
   d="scan'208";a="437050639"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2023 22:11:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="854960521"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200"; 
   d="scan'208";a="854960521"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 07 Aug 2023 22:11:49 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id D956315C; Tue,  8 Aug 2023 08:14:36 +0300 (EEST)
Date:   Tue, 8 Aug 2023 08:14:36 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>
Subject: Re: [PATCH 1/3] thunderbolt: Log a warning if device links are not
 found
Message-ID: <20230808051436.GE14638@black.fi.intel.com>
References: <20230803095618.56001-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230803095618.56001-1-mika.westerberg@linux.intel.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Aug 03, 2023 at 12:56:16PM +0300, Mika Westerberg wrote:
> The software connection manager needs the device links in order to
> establish the tunnels before the native protocols so log a warning if
> they are not found.
> 
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

All applied to thunderbolt.git/next.
