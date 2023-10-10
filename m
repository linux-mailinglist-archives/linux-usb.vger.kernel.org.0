Return-Path: <linux-usb+bounces-1372-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2127BFED9
	for <lists+linux-usb@lfdr.de>; Tue, 10 Oct 2023 16:14:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 215B91C20BA4
	for <lists+linux-usb@lfdr.de>; Tue, 10 Oct 2023 14:14:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5564224C88;
	Tue, 10 Oct 2023 14:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N2Drb+eS"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC2324C7A
	for <linux-usb@vger.kernel.org>; Tue, 10 Oct 2023 14:14:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF30FA9
	for <linux-usb@vger.kernel.org>; Tue, 10 Oct 2023 07:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696947280; x=1728483280;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ho1j3c4QO//mt8FclVRF+uf03bBDvzOOOBSUS3vnVaM=;
  b=N2Drb+eSwlZLLKqk9F2pHpnlZMChHMNC1y6zjEkFzHOaNAq4aTlhXdzw
   RWAZ2LS4jQggAaR+pLb35W+X+3jYevTALYEOLd1Hnv0NZwjLa9OShoOFx
   SXkHUSWfHNCI3efsqZ6c6vHBIf4SKPSM7hrt37g9rO9mwuGqZC3qJIoc/
   bSWVxI76bPmqyWyROiRNFRsZ+q8rCyjhF8rTCSwtrAS5bDhSVeGKmBVkO
   Jts1Bhiaten0anGo+nx6egkPlizrxqFtOsRojCVCnJbFG5m6KBrXaB88I
   lLamXvNW49mxNiWZmQrTpH1rT4if5ktgPIHF2brLZ06vDfPTO3xFMtJaY
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="387243510"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; 
   d="scan'208";a="387243510"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 07:14:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="1000712005"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; 
   d="scan'208";a="1000712005"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga006.fm.intel.com with SMTP; 10 Oct 2023 07:14:38 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 10 Oct 2023 17:14:37 +0300
Date: Tue, 10 Oct 2023 17:14:37 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Douglas Gilbert <dgilbert@interlog.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: [typec] ucsi.c: ucsi_register_partner_pdos() leak
Message-ID: <ZSVcTQfIHJtctJlj@kuha.fi.intel.com>
References: <161b4007-3360-4268-ab66-bc19aa8f360e@interlog.com>
 <ZSUMXdw9nanHtnw2@kuha.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZSUMXdw9nanHtnw2@kuha.fi.intel.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Tue, Oct 10, 2023 at 11:33:36AM +0300, Heikki Krogerus wrote:
> Hi Douglas,
> 
> Please always CC the mailing list. I'm not the only person working on
> this code.
> 
> On Sun, Oct 08, 2023 at 06:59:19PM -0400, Douglas Gilbert wrote:
> > Hi,
> > I was debugging something else in lk 6.6.0-rc1 and was tailing
> > /var/log/syslog and noticed several:
> >    kmemleak: 6 new suspected memory leaks
> > messages so I had a look and saw many of these:
> > 
> > unreferenced object 0xffff8882943a4df8 (size 8):
> >   comm "kworker/u32:41", pid 73935, jiffies 4437924777 (age 6489.122s)
> >   hex dump (first 8 bytes):
> >     70 64 35 00 82 88 ff ff                          pd5.....
> >   backtrace:
> >     [<ffffffff812d247c>] __kmalloc_node_track_caller+0x4c/0x150
> >     [<ffffffff815c8585>] kvasprintf+0x65/0xd0
> >     [<ffffffff81b1b56c>] kobject_set_name_vargs+0x1c/0x90
> >     [<ffffffff8178f30e>] dev_set_name+0x4e/0x70
> >     [<ffffffffa05f78b4>] usb_power_delivery_register+0x84/0xe0 [typec]
> >     [<ffffffffa0748112>] ucsi_register_partner_pdos+0x62/0x190 [typec_ucsi]
> >     [<ffffffffa07464a8>] ucsi_poll_worker+0x38/0x110 [typec_ucsi]
> >     [<ffffffff810a9d48>] process_one_work+0x1d8/0x4b0
> >     [<ffffffff810ab149>] worker_thread+0x1c9/0x3b0
> >     [<ffffffff810b60d2>] kthread+0xf2/0x130
> >     [<ffffffff8102d588>] ret_from_fork+0x28/0x40
> >     [<ffffffff81001aeb>] ret_from_fork_asm+0x1b/0x30
> > 
> > and similar variants involving UCSI. Looking at ucsi_register_partner_pdos()
> > there seems to be a leak of con->partner_pd if one other the other functions
> > that depend on it fail. If it was my code, I would replace most of the
> > returns in that function with 'goto err;' branches which would then call
> >    usb_power_delivery_unregister(con->partner_pd);
> 
> No, partner_pd object isn't there only for the PDOs. We need it even
> when PDO details are not supported by the interface (PDO details are
> optional in UCSI).
> 
> I don't see any leak here. All these object, including partner_pd, are
> unregistered in the end as they should, no?

I found an issue that I think is causing the problem. The link between
the typec and PD devices is never removed in this driver. That will
prevent the device from ever being released.

thanks,

-- 
heikki

