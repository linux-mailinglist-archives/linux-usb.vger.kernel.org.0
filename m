Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A52B679540
	for <lists+linux-usb@lfdr.de>; Tue, 24 Jan 2023 11:33:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233459AbjAXKdL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 24 Jan 2023 05:33:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230191AbjAXKdL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 24 Jan 2023 05:33:11 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7964D14206
        for <linux-usb@vger.kernel.org>; Tue, 24 Jan 2023 02:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674556390; x=1706092390;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sU4v2iv031nKn4lw0a19rA2vVst8cIMe3ngjBJsgDXc=;
  b=fekNmAHya156NFVdFUUiK/i6CsmlKMiiq03RZB3UMUGuNgUkgLRpwSGd
   b7lW1rVuHgR8atLzpZE1yYgrES9lRZVEkSSYEXLv00sX1o6pN3YshjLJL
   B9zUqPmTU6zOpgN+4CAbm++/hTfDceLiHffDuJAMxLtlaDPaUsSFkTKsC
   6djCfwS7NDR2To4Q2RYk9WrIRRAgggaLDNW5/TQrtJK4d6s7hNdQHFYRt
   2AR2llDJMg3KUeMZ7nTmTG9eRX/vUi/aLKPROWiwUYhmmRiSD5nif7/xb
   XouJ3Or+XPBHJ3/yRqScpzmLS3jdow4SBssauuTtPQe/6st4mLkkAGFvs
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="323959579"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; 
   d="scan'208";a="323959579"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2023 02:33:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="694285928"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; 
   d="scan'208";a="694285928"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 24 Jan 2023 02:33:08 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 54278154; Tue, 24 Jan 2023 12:33:44 +0200 (EET)
Date:   Tue, 24 Jan 2023 12:33:44 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Lukas Wunner <lukas@wunner.de>
Cc:     linux-usb@vger.kernel.org, Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Andreas Noever <andreas.noever@gmail.com>
Subject: Re: [PATCH 2/2] thunderbolt: Add missing kernel-doc comment to
 tb_tunnel_maximum_bandwidth()
Message-ID: <Y8+0CJYuuYxomwXg@black.fi.intel.com>
References: <20230124090938.58825-1-mika.westerberg@linux.intel.com>
 <20230124090938.58825-2-mika.westerberg@linux.intel.com>
 <20230124102626.GA32238@wunner.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230124102626.GA32238@wunner.de>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jan 24, 2023 at 11:26:26AM +0100, Lukas Wunner wrote:
> On Tue, Jan 24, 2023 at 11:09:38AM +0200, Mika Westerberg wrote:
> > +/**
> > + * tb_tunnel_maximum_bandwidth() - Return maximum possible bandwidth
> > + * @tunnel: Tunnel to check
> > + * @max_up: Maximum upstream bandwidth in Mb/s
> > + * @max_down: Maximum upstream bandwidth in Mb/s
>                          ^^^^^^^^
> 			 downstream?
> 
> I'm sure you're just testing whether anyone is reading your patches ;)

Hehe, thanks for reading them ;-) Fixed it now.
