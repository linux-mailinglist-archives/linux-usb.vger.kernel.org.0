Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84A9851EC12
	for <lists+linux-usb@lfdr.de>; Sun,  8 May 2022 09:42:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230095AbiEHHqC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 8 May 2022 03:46:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229756AbiEHHqB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 8 May 2022 03:46:01 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8169B655E
        for <linux-usb@vger.kernel.org>; Sun,  8 May 2022 00:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651995732; x=1683531732;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hOQ9MHxMSJrDh/DcpNO8rYJJp/QXev+xbqmUfZLfxag=;
  b=JzaGqweovsz22njoGS8IHoV535xAK4ny+rgM2mWS5v4p8yDja5yrskpn
   Ej1H63I9nOSMWxZzh6xEyCdG73PdgnrbtMXFvpPCZq5dWiQeKC/j3v9dA
   1KAuWR2vOmq31AT8c4A6jiqJFLWBE/aIoKjpAnh3qq0m4SermCzp/ThCA
   FVtYj1fC+Q/B341Ik6+FGCOlCreD9kumDlgWje1pWVUcKyW4mvYlafGyC
   HfEo9/eZ1SmOkfgClIKaDtgRG86TDgmnpkpE8ji+09clQBGs0CtkfSNoX
   xTGkq1ZYqYN8b2f3Vi6FsO3ZyPPNPZtUNEw0UgMeSxAku51mbZJR+EkdT
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10340"; a="249346994"
X-IronPort-AV: E=Sophos;i="5.91,208,1647327600"; 
   d="scan'208";a="249346994"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2022 00:42:00 -0700
X-IronPort-AV: E=Sophos;i="5.91,208,1647327600"; 
   d="scan'208";a="633598959"
Received: from ccdjpclinux26.jer.intel.com (HELO localhost) ([10.12.48.253])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2022 00:41:58 -0700
Date:   Sun, 8 May 2022 10:51:36 +0300
From:   Gil Fine <gil.fine@intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Gil Fine <gil.fine@intel.com>, andreas.noever@gmail.com,
        michael.jamet@intel.com, YehezkelShB@gmail.com,
        linux-usb@vger.kernel.org, lukas@wunner.de
Subject: Re: [PATCH 2/5] thunderbolt: CLx disable before system suspend only
 if previously enabled
Message-ID: <20220508075135.GC19479@ccdjLinux26>
References: <20220501203321.19021-1-gil.fine@intel.com>
 <20220501203321.19021-3-gil.fine@intel.com>
 <Ym+p02MdXKkusMFR@lahna>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Ym+p02MdXKkusMFR@lahna>
Organization: Intel Israel Jerusalem (IDPj /IDCj) Har Hotzvim, HaMarpe Street
 9, Zip code 9777409
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Mika,

On Mon, May 02, 2022 at 12:52:19PM +0300, Mika Westerberg wrote:
> Hi Gil,
> 
> On Sun, May 01, 2022 at 11:33:18PM +0300, Gil Fine wrote:
> > Disable CLx before system suspended only if previously was enabled.
> > Also fix few typos.
> 
> Can you make that a separate patch?

Sure, will do.
-- 
Thanks,
Gil
---------------------------------------------------------------------
Intel Israel (74) Limited

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.

