Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF6135ACA58
	for <lists+linux-usb@lfdr.de>; Mon,  5 Sep 2022 08:09:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236182AbiIEGGi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 5 Sep 2022 02:06:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236160AbiIEGGh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 5 Sep 2022 02:06:37 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FA2E2B185
        for <linux-usb@vger.kernel.org>; Sun,  4 Sep 2022 23:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662357995; x=1693893995;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BLTNgzop61vH2yZFcJ+FztE75UtrDQG1fC4S6F9piI0=;
  b=R7W3NCHMXL+diZyDTG+xoXZ6ZZRakEs/WCH193s+Jp0uG0trl3cbVPmd
   FAPpRa2/A3cEKgs6Hbt6GVHKx7fhVW0qAtLBmvLy4jWhcWHICAYe0AENL
   CmS7A+tGzoWEfAlzwooTdg81uk3ZjK+IfdLmjuL/g4l4DfzkSnO/UhPXR
   du2O2QZfjX55qLu8CED/t4IbopX5/u3GZcbxYLx9YPvrp/GVebD/uyEk6
   vFB1xnJmeKSyMonbi6tUikS5dswXwydOFOrdafaa0qH6P4xNzyVxoLA1J
   2QQnh5VWzJaqVVa23L4cmk4hCr2X+iUMHOCLgzqQu4Ap4KRh0kG0/WTJR
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10460"; a="279330206"
X-IronPort-AV: E=Sophos;i="5.93,290,1654585200"; 
   d="scan'208";a="279330206"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2022 23:06:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,290,1654585200"; 
   d="scan'208";a="564633025"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga003.jf.intel.com with ESMTP; 04 Sep 2022 23:06:33 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id E08B886; Mon,  5 Sep 2022 09:06:48 +0300 (EEST)
Date:   Mon, 5 Sep 2022 09:06:48 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>
Subject: Re: [PATCH v2 0/5] thunderbolt: Add support for receiver lane
 margining
Message-ID: <YxWR+B8tdtLh05PG@black.fi.intel.com>
References: <20220830132751.42518-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220830132751.42518-1-mika.westerberg@linux.intel.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Aug 30, 2022 at 04:27:46PM +0300, Mika Westerberg wrote:
>   thunderbolt: Move tb_xdomain_parent() to tb.h
>   thunderbolt: Move port CL state functions into correct place in switch.c
>   thunderbolt: Pass CL state bitmask to tb_port_clx_supported()
>   thunderbolt: Add helper to check if CL states are enabled on port
>   thunderbolt: Add support for receiver lane margining

All applied to thunderbolt.git/next.
