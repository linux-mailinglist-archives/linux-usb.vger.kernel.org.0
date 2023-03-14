Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B201A6B8BF3
	for <lists+linux-usb@lfdr.de>; Tue, 14 Mar 2023 08:31:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229573AbjCNHbv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 Mar 2023 03:31:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229454AbjCNHbt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 14 Mar 2023 03:31:49 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0F0579B08
        for <linux-usb@vger.kernel.org>; Tue, 14 Mar 2023 00:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678779108; x=1710315108;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=7vLYTBff2aYxf5hv/OxfVJMSONkZONZSgOEER2VFwG4=;
  b=I+8J2CNUsmerb0Mr0kjSI6Cu/wQO4T/CiTFF7Gv19xk6kyox/dGYHokK
   fqfckLD2rjBJC1UNFt12xcgtbAyMzNotHh50MmFKILEAEb/vTRU85oGtl
   MwB6jRM1SYpEvkAaLgywDWh4wjp4wM8L5+qtnksFo+sVgxaMyo7g4QeRQ
   w1uKNywsIX4MYL9Ucd1WaNFmtFQnTNRc0ciMaKSrO1it9uc7gWDhyiB1G
   gvQxzN7IDpWa9sq6PBWVcnRJHfKjgYCM/mmbTSbN+oiJ7vAebHznFuTD8
   oiuqYzRfF/1PrCRXQcIPSF/bCSm+6p2pu0Ij92UQIJvGCPa/u07rVTRq7
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="325717876"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; 
   d="scan'208";a="325717876"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2023 00:31:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="822262732"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; 
   d="scan'208";a="822262732"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 14 Mar 2023 00:31:46 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 15EC4365; Tue, 14 Mar 2023 09:32:30 +0200 (EET)
Date:   Tue, 14 Mar 2023 09:32:30 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Christian =?utf-8?Q?Schaubschl=C3=A4ger?= 
        <christian.schaubschlaeger@gmx.at>
Cc:     linux-usb@vger.kernel.org, Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Gil Fine <gil.fine@linux.intel.com>
Subject: Re: [PATCH 0/5] thunderbolt: A couple of fixes
Message-ID: <20230314073230.GG62143@black.fi.intel.com>
References: <20230306113605.46137-1-mika.westerberg@linux.intel.com>
 <20230313100700.GF62143@black.fi.intel.com>
 <9393b12e-a9b1-a897-6634-05a2300e2742@gmx.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9393b12e-a9b1-a897-6634-05a2300e2742@gmx.at>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Mar 13, 2023 at 02:07:41PM +0100, Christian Schaubschläger wrote:
> Hi Mika,
> 
> 
> > > The second one is fixing a reboot time issue reported by Christian that
> > > we finally were able to reproduce in the lab. The reason this happened
> > > only in Linux is that we enumerate retimers during link bring up and
> > > there is certain step missing after the enumeration that leads the link
> > > to not come up properly after soft-reboot. This should be fixed with
> > > issuing UNSET_INBOUND_SBTX after retimer access and this works in the
> > > lab.
> > > 
> > > @Christian, can you check that it solves the issue for you too?
> 
> I was told today that the patch solves the issue on the Elitebook!

Okay good to know :)
