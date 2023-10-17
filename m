Return-Path: <linux-usb+bounces-1744-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 159B67CC5AA
	for <lists+linux-usb@lfdr.de>; Tue, 17 Oct 2023 16:15:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AFE71281AC7
	for <lists+linux-usb@lfdr.de>; Tue, 17 Oct 2023 14:15:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FCC543A9F;
	Tue, 17 Oct 2023 14:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P7//XIsC"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C0F3B2B1
	for <linux-usb@vger.kernel.org>; Tue, 17 Oct 2023 14:14:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CB5A92
	for <linux-usb@vger.kernel.org>; Tue, 17 Oct 2023 07:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697552093; x=1729088093;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0Y+o7LU33y8OIGEK1R69LgCB4RaLC95fir3SQauzygM=;
  b=P7//XIsCE3gB/I1pQxCODKkeLQ36eD+OykkQXBn7ZM1cgsk8oMulo69I
   avyTu/4GCclVs9B/UVN9vQApm2iL7BRuvWyoOMam+mfQaRyTCmneBE4L5
   dgAnpih5Pyanv0DZGvvR0fyYTBTtjeZtNSy3fJPH2TXvnaMgzb879a7Cj
   wIgWKdbKVCDWuX+Li+h7w4hwU1gzNY51Kr9VBnbuoIPHhrFSzkF6K+tVM
   8kxVZjSAxHseiiRZH5Q3/KLujbhXW4atbDKhO+jRL/7t+q4jtGErC/6zA
   3E6ioN1Sjfm0RidwqcKQ7cNbS6QNm90rKQIYkGwhk6P9WA/hUD6v7HHFo
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="472013723"
X-IronPort-AV: E=Sophos;i="6.03,232,1694761200"; 
   d="scan'208";a="472013723"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2023 07:14:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="706016311"
X-IronPort-AV: E=Sophos;i="6.03,232,1694761200"; 
   d="scan'208";a="706016311"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga003.jf.intel.com with ESMTP; 17 Oct 2023 07:14:49 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id D5CB2193; Tue, 17 Oct 2023 17:14:47 +0300 (EEST)
Date: Tue, 17 Oct 2023 17:14:47 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: USB4/Thunderbolt fix for v6.6-rc7
Message-ID: <20231017141447.GX3208943@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Hi Greg,

The following changes since commit 8a749fd1a8720d4619c91c8b6e7528c0a355c0aa:

  Linux 6.6-rc4 (2023-10-01 14:15:13 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v6.6-rc7

for you to fetch changes up to ec4405ed92036f5bb487b5c2f9a28f9e36a3e3d5:

  thunderbolt: Call tb_switch_put() once DisplayPort bandwidth request is finished (2023-10-05 12:06:50 +0300)

----------------------------------------------------------------
thunderbolt: Fix for v6.6-rc7

This includes a single commit that fixes a memory leak when DisplayPort
bandwidth allocation request is being handled by the driver.

This has been in linux-next with no reported issues.

----------------------------------------------------------------
Gil Fine (1):
      thunderbolt: Call tb_switch_put() once DisplayPort bandwidth request is finished

 drivers/thunderbolt/tb.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

