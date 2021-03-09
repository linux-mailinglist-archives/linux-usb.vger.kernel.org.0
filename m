Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E19B73323DA
	for <lists+linux-usb@lfdr.de>; Tue,  9 Mar 2021 12:24:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229951AbhCILXd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 9 Mar 2021 06:23:33 -0500
Received: from mga04.intel.com ([192.55.52.120]:56909 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230116AbhCILXa (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 9 Mar 2021 06:23:30 -0500
IronPort-SDR: e4TZiN1ZcJndigXU9cN4ztohDdvK3JZ8nYGPaI/Jzra8hjlSmafP67Rp5LeQPh9wo9PBkA5ZGF
 BCRsYUgfakLA==
X-IronPort-AV: E=McAfee;i="6000,8403,9917"; a="185828059"
X-IronPort-AV: E=Sophos;i="5.81,234,1610438400"; 
   d="scan'208";a="185828059"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2021 03:23:30 -0800
IronPort-SDR: r8EtFY+5ZGzscBFpLU4w4mth/H3Nh4tI4fhLGgKy8sbyBZekeIW/6Qv+0UP+BCdz0iRtYxtBDD
 Eu/PybnpQW/g==
X-IronPort-AV: E=Sophos;i="5.81,234,1610438400"; 
   d="scan'208";a="430717853"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2021 03:23:27 -0800
Received: by lahna (sSMTP sendmail emulation); Tue, 09 Mar 2021 13:23:25 +0200
Date:   Tue, 9 Mar 2021 13:23:25 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Yehezkel Bernat <yehezkelshb@gmail.com>
Cc:     Gil Fine <gil.fine@intel.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        linux-usb@vger.kernel.org, Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH] thunderbolt: debugfs: Show all accessible dwords
Message-ID: <20210309112325.GV2542@lahna.fi.intel.com>
References: <20210309092330.5813-1-gil.fine@intel.com>
 <CA+CmpXuyRMdxHi5EkOhhQqOc0gu5c0ZV+GCuCAXeH4_4hRHvpQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+CmpXuyRMdxHi5EkOhhQqOc0gu5c0ZV+GCuCAXeH4_4hRHvpQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Mar 09, 2021 at 12:47:11PM +0200, Yehezkel Bernat wrote:
> On Tue, Mar 9, 2021 at 11:22 AM Gil Fine <gil.fine@intel.com> wrote:
> >
> > Currently, when first failure occurs while reading of the block,
> > we stop reading the block and jump to the next capability.
> > This doesn't cover the case of block with "holes" of inaccessible
> > dwords, followed by accessible dwords.
> > This patch address this problem.
> > In case of failure while reading the complete block in one transaction,
> > (because of one or more dwords is inaccessible), we read the remaining
> > dwords of the block dword-by-dword, one dword per transaction,
> > till the end of the block.
> 
> Just wondering: is there any chance this will slow down the device adding flow
> if there are many inaccessible dwords, or we expect the read to return
> immediately for such dwords?  If for some devices it may be a slow process, does
> it make sense to have a way to disable this feature for specific devices or by a
> module parameter?  Maybe we don't worry about it as it's only for debugfs?

We don't worry about it as it is just debugfs ;-)
