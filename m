Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12F9F6ABEB7
	for <lists+linux-usb@lfdr.de>; Mon,  6 Mar 2023 12:51:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229723AbjCFLv5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Mar 2023 06:51:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbjCFLv4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Mar 2023 06:51:56 -0500
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 017862055F
        for <linux-usb@vger.kernel.org>; Mon,  6 Mar 2023 03:51:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678103515; x=1709639515;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ytxqmHt2I9f6O5M27oxZo7cvFeIqCwqL2MbrNIKgK/o=;
  b=INjz/b8dNyeLCWYDNYTyczkNrf7UcoqWEzQgTBjURJeah0VtYXXq61Xn
   vquJHLWVS0m2Ie8g2pJxNxVvD68w6y51ID8jKnsMQyU87ob7Z87Q9z2Eu
   gauQGK6iHiST9apJAZlVlLji27BfQpl2ouBFcCVMZLRDtT6vSsxapdFQb
   Lsdhq4xhJwI64kuxApUQ2/jBVyosaHK1rvgxBh7SSlTST1pgjodrsYqpH
   +FA0AWtk7U4gIDvpUfTNuxy6/uzjbM/BSa/YWjW2sjb0nvB3PvDdRyDy4
   M5QJsHJQdsXYZRdw6IC9igiyvlUCc97ainwW+OrQ/pni2LFU+2K7nT0bA
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="421805946"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; 
   d="scan'208";a="421805946"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2023 03:51:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="678444881"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; 
   d="scan'208";a="678444881"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 06 Mar 2023 03:51:52 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 5917C143; Mon,  6 Mar 2023 13:52:36 +0200 (EET)
Date:   Mon, 6 Mar 2023 13:52:36 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Christian =?utf-8?Q?Schaubschl=C3=A4ger?= 
        <christian.schaubschlaeger@gmx.at>
Cc:     linux-usb@vger.kernel.org,
        "michael.simon@cpsd.at" <michael.simon@cpsd.at>
Subject: Re: Possible problem with thunderbolt 4
Message-ID: <20230306115236.GE62143@black.fi.intel.com>
References: <Y72AbwKFd9snjZrJ@black.fi.intel.com>
 <3ccb150b-dbd9-c9d0-0e8c-8c169f0d8faf@gmx.at>
 <Y76TS54PJpmseZs3@black.fi.intel.com>
 <8c2da730-ba9b-6ec7-d493-1a6a2ce54622@gmx.at>
 <Y8kXFFrue7l7DKf3@black.fi.intel.com>
 <78c5218a-67ef-d61d-09fe-2c2cf7fdc87f@gmx.at>
 <0c9e644e-a07d-e9bb-f8d6-692d2412fd30@gmx.at>
 <Y9PDRYHHYNSJWwGe@black.fi.intel.com>
 <47af73e9-0d3f-0ac2-52e6-b89a87bc602b@gmx.at>
 <Y9fPxIKIOrkHmjHS@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y9fPxIKIOrkHmjHS@black.fi.intel.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Christian,

On Mon, Jan 30, 2023 at 04:10:12PM +0200, Mika Westerberg wrote:
> Hi,
> 
> On Mon, Jan 30, 2023 at 11:52:59AM +0100, Christian Schaubschläger wrote:
> > Hi,
> > 
> > Am 27.01.23 um 13:27 schrieb Mika Westerberg:
> > > Yeah, I just got report from the folks and unfortunately we were not
> > > able to reproduce the issue in the lab. The PCIe tunnel stays up (or
> > > gets re-created) after reboot from Linux and is visible in the UEFI
> > > shell (so in the BIOS).
> > >
> > > So at the moment I'm out of ideas why this happens since Windows flows
> > > should be the same. And we have no means to repro it locally to
> > > investigate further :/
> > 
> > Ok. I try to get access to some more TB4 devices. Currently I have two
> > (HP, Lenovo) that show the issue when the software connection manager
> > is used.
> 
> We should be getting one HP EliteBook 630 G9 soon (I guess this is one
> of the systems you see the issue). Once we get it we will try to repro
> and investigate further.

We are able to reproduce the issue and it was root caused to be missing
UNSET_INBOUND_SBTX port operation during retimer enumeration. I posted a
series of fixes few minutes ago (with you Cc'd) and one of them should
fix this issue:

https://lore.kernel.org/linux-usb/20230306113605.46137-3-mika.westerberg@linux.intel.com/
