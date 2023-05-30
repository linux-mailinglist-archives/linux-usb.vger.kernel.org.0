Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42CFA715ED4
	for <lists+linux-usb@lfdr.de>; Tue, 30 May 2023 14:18:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229787AbjE3MR7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 30 May 2023 08:17:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230518AbjE3MR6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 30 May 2023 08:17:58 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1D81D9
        for <linux-usb@vger.kernel.org>; Tue, 30 May 2023 05:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685449073; x=1716985073;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=OHd43usJoN0fLrjtZrZVTEIYPFPW3yfv1EZFlXdkuIo=;
  b=RUTA6QVrCxp/ZRqRo0L1nnkklAhEP9qxu4nTRhptUbDubfWzxzWasHeY
   4eG9FtM6EGESLrvTe1bd+fxTo4mnuJGWn3O4aFx7hhA1yG2MiVrYU4mE7
   BC+K69Cw1PdrEimf55QQ3LfZZtQntfCYBH3mTWh2EgaMwjlKEc7uG9+ep
   R93JOXP2d/sJ3zRM7FHLajjMeTPULrRKbTPeVvjYdcQ3WkBfu3a/e5LZ/
   RRI+LjqYrAAV5JTYNCMzCNpRQpusK2UM7FAtA/s+sUcbcgRdmoXjiTtfS
   qclI91++sQNfT6cNfVMVAHoNsKmT0vk8vdjo9c6i4GWIfMud4D3ji49/G
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="339481228"
X-IronPort-AV: E=Sophos;i="6.00,204,1681196400"; 
   d="scan'208";a="339481228"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2023 05:17:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="830736742"
X-IronPort-AV: E=Sophos;i="6.00,204,1681196400"; 
   d="scan'208";a="830736742"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 30 May 2023 05:17:52 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 1F7D4589; Tue, 30 May 2023 15:17:56 +0300 (EEST)
Date:   Tue, 30 May 2023 15:17:56 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Christian =?utf-8?Q?Schaubschl=C3=A4ger?= 
        <christian.schaubschlaeger@gmx.at>
Cc:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        linux-usb@vger.kernel.org
Subject: Re: USB issue on a TB4 controller?
Message-ID: <20230530121756.GG45886@black.fi.intel.com>
References: <a45b9989-c9da-bf4e-94c8-3e1341777b4d@gmx.at>
 <20230526123655.GW45886@black.fi.intel.com>
 <0bbb844d-3348-dc28-311a-d4111f8a7f81@linux.intel.com>
 <2d12af30-4a7c-5fb3-fab8-5759296c68ac@gmx.at>
 <20230530105039.GF45886@black.fi.intel.com>
 <d6e7e0d5-0b30-d66c-2ee8-4f0c0caef0b9@gmx.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d6e7e0d5-0b30-d66c-2ee8-4f0c0caef0b9@gmx.at>
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, May 30, 2023 at 02:11:21PM +0200, Christian Schaubschläger wrote:
> 
> >> Can I enable this on the command line? Because I guess I need traces from startup when the dock is connected already.
> > I think you can add "trace_event=xhci-hcd" in the kernel command line to
> > get it enabled boot time. See:
> >
> > https://docs.kernel.org/trace/events.html#boot-option
> 
> Hm,
> 
> [    0.029711] Kernel command line: bzImage.efi thunderbolt.dyndbg=+p trace_event=xhci-hcd root=PARTUUID=1761F245-C668-41F5-90E4-5BBF2224097A rootwait  nomodeset ima_appraise=off
> [    0.063715] Failed to enable trace event: xhci-hcd

Could be that it expects the driver to be built-in in that case.
