Return-Path: <linux-usb+bounces-1849-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C21107CD887
	for <lists+linux-usb@lfdr.de>; Wed, 18 Oct 2023 11:49:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EED8C1C20C6E
	for <lists+linux-usb@lfdr.de>; Wed, 18 Oct 2023 09:49:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05D93182D1;
	Wed, 18 Oct 2023 09:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S+Kaf8YC"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C63CF8C0C
	for <linux-usb@vger.kernel.org>; Wed, 18 Oct 2023 09:49:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3C86A2
	for <linux-usb@vger.kernel.org>; Wed, 18 Oct 2023 02:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697622544; x=1729158544;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UI2fC7G9dQyGTElaqLRkpWdrAAoDohzt1bgkkKek2KM=;
  b=S+Kaf8YC/d6UmnWFVsTAfLF8o3hGotomHvqvWY0YIa6dQ+UmJ3LPitkL
   /tfavG1WG9hGbncjI8C8tKuMx8xNe8NBBdlMAlgu3tMQqNDlDmaqU9zwX
   bCWGB9oHXRNtXAJo2Wi9zJgdRpnsvKnm0L1Q81ZVwDezdZtE6WnzIB4bi
   ajmQlCvLdCiXxSQa7vnQgh26PcSz5Ky2zi9COw+PJxACI9ypVfOMKnDL3
   gsjRjxE1/d1qoiSR61JdjOa0mjj1By/cZ6HGVOjN8vL0/Au5kF9vfWZYu
   R/2kYPiEo8d6RQozedFSuMnwbxmJkEevvWTDMOWkQCtsc0h9hKjSosrio
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="376350196"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; 
   d="scan'208";a="376350196"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 02:49:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="847199379"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; 
   d="scan'208";a="847199379"
Received: from black.fi.intel.com ([10.237.72.28])
  by FMSMGA003.fm.intel.com with ESMTP; 18 Oct 2023 02:49:01 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 5DF26130; Wed, 18 Oct 2023 12:49:00 +0300 (EEST)
Date: Wed, 18 Oct 2023 12:49:00 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>
Subject: Re: USB4/Thunderbolt fix for v6.6-rc7
Message-ID: <20231018094900.GA3208943@black.fi.intel.com>
References: <20231017141447.GX3208943@black.fi.intel.com>
 <2023101716-magenta-almighty-281d@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2023101716-magenta-almighty-281d@gregkh>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Tue, Oct 17, 2023 at 07:28:38PM +0200, Greg Kroah-Hartman wrote:
> On Tue, Oct 17, 2023 at 05:14:47PM +0300, Mika Westerberg wrote:
> > Hi Greg,
> > 
> > The following changes since commit 8a749fd1a8720d4619c91c8b6e7528c0a355c0aa:
> > 
> >   Linux 6.6-rc4 (2023-10-01 14:15:13 -0700)
> > 
> > are available in the Git repository at:
> > 
> >   git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v6.6-rc7
> 
> Nit, you forgot the [GIT PULL] prefix in the subject line.

Oops! Thanks for pointing out. I'll make sure this won't happen again.

> Anyway, pulled and pushed out, thanks!

Thanks!

