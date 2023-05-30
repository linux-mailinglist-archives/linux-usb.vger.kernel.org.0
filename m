Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37913715C3D
	for <lists+linux-usb@lfdr.de>; Tue, 30 May 2023 12:50:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229720AbjE3Kuw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 30 May 2023 06:50:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229736AbjE3Kuk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 30 May 2023 06:50:40 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74A17106
        for <linux-usb@vger.kernel.org>; Tue, 30 May 2023 03:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685443838; x=1716979838;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=g/jsf5A6VUhCeSIVH6PBcjSGpOwkL3iotAtto8dmp30=;
  b=fDHR1L716wWrWLxsSfjLIhy9DicAo8UCw5RUM02Gpnu6L9y6qUHXAlYg
   yvqXHbQb43zpVgQBW3rnMiDaI9htzqi4PnrhFcUq1yHIA+s6NTIgd/QPQ
   jm+C4jNpjt3oLFZm078zlM7YQgHU2PooD3/0kmiJY+/nBy+fA8cFJI4KW
   FFG1P6rCXZgpKfLeOLBjij+Qm7Gv9SIezv0VEvnO6QFTvo+IpSO6j3M6S
   4E9blKgExJcDKzoFtSzfWrhgtEsPRPGyJe1Ngi7uKouVh8srTk3bdUyfG
   WkcoX8bDC5t28F2wvOBr2pBlQO/admwz/Rm7JoSsW6oGiM9cxDb6A1Flb
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="441237905"
X-IronPort-AV: E=Sophos;i="6.00,204,1681196400"; 
   d="scan'208";a="441237905"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2023 03:50:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="739485073"
X-IronPort-AV: E=Sophos;i="6.00,204,1681196400"; 
   d="scan'208";a="739485073"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 30 May 2023 03:50:34 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 0AFD353A; Tue, 30 May 2023 13:50:39 +0300 (EEST)
Date:   Tue, 30 May 2023 13:50:39 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Christian =?utf-8?Q?Schaubschl=C3=A4ger?= 
        <christian.schaubschlaeger@gmx.at>
Cc:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        linux-usb@vger.kernel.org
Subject: Re: USB issue on a TB4 controller?
Message-ID: <20230530105039.GF45886@black.fi.intel.com>
References: <a45b9989-c9da-bf4e-94c8-3e1341777b4d@gmx.at>
 <20230526123655.GW45886@black.fi.intel.com>
 <0bbb844d-3348-dc28-311a-d4111f8a7f81@linux.intel.com>
 <2d12af30-4a7c-5fb3-fab8-5759296c68ac@gmx.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2d12af30-4a7c-5fb3-fab8-5759296c68ac@gmx.at>
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, May 30, 2023 at 12:13:19PM +0200, Christian Schaubschläger wrote:
> Hi,
> 
> >>   # echo 81920 > /sys/kernel/debug/tracing/buffer_size_kb
> >>   # echo 1 > /sys/kernel/debug/tracing/events/xhci-hcd/enable
> >>
> >> Trace buffer is /sys/kernel/debug/tracing/trace.
> 
> Can I enable this on the command line? Because I guess I need traces from startup when the dock is connected already.

I think you can add "trace_event=xhci-hcd" in the kernel command line to
get it enabled boot time. See:

https://docs.kernel.org/trace/events.html#boot-option
