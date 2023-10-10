Return-Path: <linux-usb+bounces-1346-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E219E7BF5FA
	for <lists+linux-usb@lfdr.de>; Tue, 10 Oct 2023 10:33:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1CC141C20D14
	for <lists+linux-usb@lfdr.de>; Tue, 10 Oct 2023 08:33:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 593FEDF44;
	Tue, 10 Oct 2023 08:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZQ+2gIot"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FDBE15AE4
	for <linux-usb@vger.kernel.org>; Tue, 10 Oct 2023 08:33:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E497A7
	for <linux-usb@vger.kernel.org>; Tue, 10 Oct 2023 01:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696926817; x=1728462817;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8mkXrzkF3SfiYG2dWHMqfRD9Ky4l0XjpND155B+7sk4=;
  b=ZQ+2gIotbrGGNRGIS41YdReuBLXPwFc1SNqHWrFqWDXXAoE+2u0KypkS
   61/CexrPOtMk0eVMk/rLOGGrCNfFAKqUev5y/RNJFiCrfIhAsxDRrP3DZ
   dCRMFtNsstwbbxT7ShgiJ3hszU798R89Xv0gCbDxAtw+nAz6dz2zocBrJ
   1K7Kujh5OQfrYmHFDlmTnKd2aZHD9cH0Vl2ffadF1gyViT8LrRTlw+cHL
   wBcnkq4PMQKchu8Pn2Pl+TG6M3+imhiBYTpmNkWpFdfcQU9DaqV28WpNK
   5Sx4baC4cG8aw22Obf57C4C7t0Lp/VNZJuyuw1+NRRJBdOIHfskPEedhN
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="448534388"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; 
   d="scan'208";a="448534388"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 01:33:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="746990468"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; 
   d="scan'208";a="746990468"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by orsmga007.jf.intel.com with SMTP; 10 Oct 2023 01:33:34 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 10 Oct 2023 11:33:33 +0300
Date: Tue, 10 Oct 2023 11:33:33 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Douglas Gilbert <dgilbert@interlog.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: [typec] ucsi.c: ucsi_register_partner_pdos() leak
Message-ID: <ZSUMXdw9nanHtnw2@kuha.fi.intel.com>
References: <161b4007-3360-4268-ab66-bc19aa8f360e@interlog.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <161b4007-3360-4268-ab66-bc19aa8f360e@interlog.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Hi Douglas,

Please always CC the mailing list. I'm not the only person working on
this code.

On Sun, Oct 08, 2023 at 06:59:19PM -0400, Douglas Gilbert wrote:
> Hi,
> I was debugging something else in lk 6.6.0-rc1 and was tailing
> /var/log/syslog and noticed several:
>    kmemleak: 6 new suspected memory leaks
> messages so I had a look and saw many of these:
> 
> unreferenced object 0xffff8882943a4df8 (size 8):
>   comm "kworker/u32:41", pid 73935, jiffies 4437924777 (age 6489.122s)
>   hex dump (first 8 bytes):
>     70 64 35 00 82 88 ff ff                          pd5.....
>   backtrace:
>     [<ffffffff812d247c>] __kmalloc_node_track_caller+0x4c/0x150
>     [<ffffffff815c8585>] kvasprintf+0x65/0xd0
>     [<ffffffff81b1b56c>] kobject_set_name_vargs+0x1c/0x90
>     [<ffffffff8178f30e>] dev_set_name+0x4e/0x70
>     [<ffffffffa05f78b4>] usb_power_delivery_register+0x84/0xe0 [typec]
>     [<ffffffffa0748112>] ucsi_register_partner_pdos+0x62/0x190 [typec_ucsi]
>     [<ffffffffa07464a8>] ucsi_poll_worker+0x38/0x110 [typec_ucsi]
>     [<ffffffff810a9d48>] process_one_work+0x1d8/0x4b0
>     [<ffffffff810ab149>] worker_thread+0x1c9/0x3b0
>     [<ffffffff810b60d2>] kthread+0xf2/0x130
>     [<ffffffff8102d588>] ret_from_fork+0x28/0x40
>     [<ffffffff81001aeb>] ret_from_fork_asm+0x1b/0x30
> 
> and similar variants involving UCSI. Looking at ucsi_register_partner_pdos()
> there seems to be a leak of con->partner_pd if one other the other functions
> that depend on it fail. If it was my code, I would replace most of the
> returns in that function with 'goto err;' branches which would then call
>    usb_power_delivery_unregister(con->partner_pd);

No, partner_pd object isn't there only for the PDOs. We need it even
when PDO details are not supported by the interface (PDO details are
optional in UCSI).

I don't see any leak here. All these object, including partner_pd, are
unregistered in the end as they should, no?

The function looks a bit funny because it has to always try to read
both sink and source PDOs (UCSI does not tell us what is available
beforehand). We can probable refactor the code a bit to make it more
understandable. The actual registration of the PDOs should be split
into separate function and this one should be renamed to
ucsi_register_partner_pd().

thanks,

-- 
heikki

