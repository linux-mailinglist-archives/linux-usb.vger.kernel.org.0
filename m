Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0CC4A69762F
	for <lists+linux-usb@lfdr.de>; Wed, 15 Feb 2023 07:16:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229553AbjBOGQB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Feb 2023 01:16:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229483AbjBOGQA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Feb 2023 01:16:00 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B57A22A999
        for <linux-usb@vger.kernel.org>; Tue, 14 Feb 2023 22:15:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676441759; x=1707977759;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/Ks/mPB+0Vdi9d7suCtu+T1NiyKMVklNtOFl5dqFjbg=;
  b=ATODYc6EKq4Cj31Yzb007dBgsmaULTG7e1kg786P1Lwj9TsrWuCDlp71
   yC9Wz3O4PkM/Gus89S7eprL4ySrQos1MNzZ4kktLLN1STce7DkrLVF/3+
   21Y7bE5//MW19usM7PBOIts3QtVWpOux3zp6i57wXKIFUzxnnuFGbmFqk
   BTTnxGmUZ2pJBhxEdsQ2heYzlwLgOVDpJgt7woiWQbD6BFLJ1QcTvdH6V
   1ABBM6Vb3jHwX6FIHSAx1xsbqtykS0CVVrZT7UEnROQ1fDPvxau+FPH2W
   Ebb7m+2s7hZZVmL232MEVq8pPCKu5qJQT+cCg/E6LWs1av/RM08/QWe1V
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="333492241"
X-IronPort-AV: E=Sophos;i="5.97,298,1669104000"; 
   d="scan'208";a="333492241"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2023 22:15:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="998363486"
X-IronPort-AV: E=Sophos;i="5.97,298,1669104000"; 
   d="scan'208";a="998363486"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga005.fm.intel.com with ESMTP; 14 Feb 2023 22:15:56 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id B06C01A6; Wed, 15 Feb 2023 08:16:36 +0200 (EET)
Date:   Wed, 15 Feb 2023 08:16:36 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Basavaraj Natikar <bnatikar@amd.com>
Cc:     Sanjay R Mehta <Sanju.Mehta@amd.com>, andreas.noever@gmail.com,
        michael.jamet@intel.com, YehezkelShB@gmail.com,
        Basavaraj.Natikar@amd.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH v5] thunderbolt: Add quirk to disable CLx
Message-ID: <Y+x4xAwIuc+D4K7x@black.fi.intel.com>
References: <1676404912-7048-1-git-send-email-Sanju.Mehta@amd.com>
 <Y+xyh44lGEzwuOj/@black.fi.intel.com>
 <a4601106-e41e-1991-9f63-b595243dc8bb@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a4601106-e41e-1991-9f63-b595243dc8bb@amd.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Feb 15, 2023 at 11:29:00AM +0530, Basavaraj Natikar wrote:
> 
> On 2/15/2023 11:19 AM, Mika Westerberg wrote:
> > On Tue, Feb 14, 2023 at 02:01:52PM -0600, Sanjay R Mehta wrote:
> >>  void tb_check_quirks(struct tb_switch *sw)
> >>  {
> >> +	struct tb_switch *root_sw = sw->tb->root_switch;
> >>  	int i;
> >>  
> >>  	for (i = 0; i < ARRAY_SIZE(tb_quirks); i++) {
> >>  		const struct tb_quirk *q = &tb_quirks[i];
> >>  
> >> -		if (q->hw_vendor_id && q->hw_vendor_id != sw->config.vendor_id)
> >> +		if (q->hw_vendor_id && (q->hw_vendor_id != sw->config.vendor_id &&
> >> +					q->hw_vendor_id != root_sw->config.vendor_id))
> > Again, why you need to change this?
> >
> > If you have the AMD host router device ID in the list the quirk applies
> > and that makes the driver skip enabling CL states for that link. It
> > should not matter if we enable CL states in the deeper parts of the
> > topology (even if we actually do not at the moment) because that's
> > completely different link, right.
> 
> Thank you Mike for point it out then [PATCH v4] <https://lore.kernel.org/all/1676402030-4653-1-git-send-email-Sanju.Mehta@amd.com/#r> patch changes solves the purpose.
> 
> [PATCH v4] thunderbolt: Add quirk to disable CLx <https://lore.kernel.org/all/1676402030-4653-1-git-send-email-Sanju.Mehta@amd.com/#r>
> https://lore.kernel.org/all/1676402030-4653-1-git-send-email-Sanju.Mehta@amd.com/
> 
> Please review the changes

Indeed v4 looks good. I just skipped it because there appeared several
versions of the patch in my inbox overnight so picked the last one for
review ;-)
