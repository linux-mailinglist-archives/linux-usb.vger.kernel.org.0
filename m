Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF9526620AD
	for <lists+linux-usb@lfdr.de>; Mon,  9 Jan 2023 09:55:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233151AbjAIIyu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 Jan 2023 03:54:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237039AbjAIIyG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 Jan 2023 03:54:06 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EF2565E9
        for <linux-usb@vger.kernel.org>; Mon,  9 Jan 2023 00:46:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673253963; x=1704789963;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FCN+5M+sXE4lP67+tF6y1fNxQI8Gt0NyQZKvGQSFegE=;
  b=YM8iFPpWWHT2yj/l/+IbajA3NQ5tOP6dfcRDKJqK6xxUN3dmU6ClhxDQ
   aCVycxgSwiGTwNB47T4Vl8BkIoayzKvhoejiRArAVKacEEG968OZdZ0sC
   OX3yhUQVfn9cbPs/ggQCt0+8d8cxEZSJ6VPpEzPRs413qax0+d3fGaspg
   TWCxKuRg0t+170u3p5YxOgbJgVXMXXwbOJag7xQL9wOJg7JL/hVYuY0qU
   WGodadwKTrgVh/WG5SYbHPW49R9eMnJK9YyDrItXbd5BDjD/YSi0O0IPG
   I9dc8vXXSE3pWQZjilOv2yEIPv/QrxSXWgvwyb2CeZSOB0O1Pr0BEVCbz
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10584"; a="320526968"
X-IronPort-AV: E=Sophos;i="5.96,311,1665471600"; 
   d="scan'208";a="320526968"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2023 00:45:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10584"; a="656613483"
X-IronPort-AV: E=Sophos;i="5.96,311,1665471600"; 
   d="scan'208";a="656613483"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga002.jf.intel.com with ESMTP; 09 Jan 2023 00:45:54 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id E98D4F4; Mon,  9 Jan 2023 10:46:27 +0200 (EET)
Date:   Mon, 9 Jan 2023 10:46:27 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Yehezkel Bernat <yehezkelshb@gmail.com>
Cc:     linux-usb@vger.kernel.org, Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Utkarsh Patel <utkarsh.h.patel@intel.com>
Subject: Re: [PATCH 0/3] thunderbolt: A couple of fixes for v6.2-rc
Message-ID: <Y7vUY65MNbC/4GOu@black.fi.intel.com>
References: <20230104080601.45562-1-mika.westerberg@linux.intel.com>
 <CA+CmpXuaK7d1pgV4JAmdU+8M_n89WU8S+YXYB6T7tFJraWy3YQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CA+CmpXuaK7d1pgV4JAmdU+8M_n89WU8S+YXYB6T7tFJraWy3YQ@mail.gmail.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jan 04, 2023 at 10:29:45AM +0200, Yehezkel Bernat wrote:
> On Wed, Jan 4, 2023 at 10:07 AM Mika Westerberg
> <mika.westerberg@linux.intel.com> wrote:
> >
> > Hi all,
> >
> > This series includes a couple of fixes for issues found/reported.
> >
> > Mika Westerberg (3):
> >   thunderbolt: Do not call PM runtime functions in tb_retimer_scan()
> >   thunderbolt: Use correct function to calculate maximum USB3 link rate
> >   thunderbolt: Disable XDomain lane 1 only in software connection manager
> >
> >  drivers/thunderbolt/retimer.c | 17 +++--------------
> >  drivers/thunderbolt/tb.c      | 20 +++++++++++++++-----
> >  drivers/thunderbolt/tunnel.c  |  2 +-
> >  drivers/thunderbolt/xdomain.c | 17 ++++++++++++-----
> >  4 files changed, 31 insertions(+), 25 deletions(-)
> >
> > --
> > 2.35.1
> >
> 
> Acked-by: Yehezkel Bernat <YehezkelShB@gmail.com>

Thanks!

All applied to fixes.
