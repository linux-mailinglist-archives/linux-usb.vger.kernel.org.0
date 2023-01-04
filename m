Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7BB3365CDFB
	for <lists+linux-usb@lfdr.de>; Wed,  4 Jan 2023 09:03:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233761AbjADID4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 Jan 2023 03:03:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229773AbjADIDz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 4 Jan 2023 03:03:55 -0500
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AED05D60
        for <linux-usb@vger.kernel.org>; Wed,  4 Jan 2023 00:03:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672819434; x=1704355434;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=bjcBmw0BF2KjD9nZxgsq8jojW0YFrD5sBXGu5F3H5cc=;
  b=kNOE4390PSffE2NtV4+e6HncecknjHFKCsCtQz7dE4ebv4WjptPKTdNQ
   PY/Dea/aOCp6imK/NIJ+w9kARsHkAQpa3GrvgrKWIflcNVdpA18AsakTq
   2oDmC2Ctbqlvig4FfN23X5P8NV4u7s7HI1P5c7MKMVmZQS7zfNpEWBz7+
   VkRNfSoLv9DzC3H+OrA7ZkR/WML2gCeIU2rl4EntddescyD8trgfQA6nE
   WYucueX13AOp4r+ggEhBg9518WRTIZl1ZLkCkG4ZAJwhJQTELFAjbLa79
   61gwHXAkRcYca2ZX7kdmYUbOp/awBYiafyClKJ/gKuYHfbemxl8i5sLYY
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10579"; a="408129702"
X-IronPort-AV: E=Sophos;i="5.96,299,1665471600"; 
   d="scan'208";a="408129702"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2023 00:03:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10579"; a="718369659"
X-IronPort-AV: E=Sophos;i="5.96,299,1665471600"; 
   d="scan'208";a="718369659"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 04 Jan 2023 00:03:53 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 994BF162; Wed,  4 Jan 2023 10:04:25 +0200 (EET)
Date:   Wed, 4 Jan 2023 10:04:25 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Christian =?utf-8?Q?Schaubschl=C3=A4ger?= 
        <christian.schaubschlaeger@gmx.at>
Cc:     linux-usb@vger.kernel.org,
        "michael.simon@cpsd.at" <michael.simon@cpsd.at>
Subject: Re: Possible problem with thunderbolt 4
Message-ID: <Y7UzCY6ujQ2qtoq5@black.fi.intel.com>
References: <Y67X5JrnRxYN/pns@black.fi.intel.com>
 <00dbeaf9-4d2c-3e3a-fa39-4c232b3a68e6@gmx.at>
 <Y7K7zLoAQVyv0zD5@black.fi.intel.com>
 <011df027-5381-1e10-9c54-e0935ae549f9@gmx.at>
 <Y7ME7EwduIQE38+2@black.fi.intel.com>
 <a324ff2a-d014-83d2-4f30-b865db7c352b@gmx.at>
 <Y7QMlV82mtaApJwJ@black.fi.intel.com>
 <a8c1dd4b-7227-5ba2-97a4-a2dc3d561ea3@gmx.at>
 <Y7RSrLYfG1r8b+Zj@black.fi.intel.com>
 <86a6b7ca-4302-00fe-97f6-d48ebb5e6171@gmx.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <86a6b7ca-4302-00fe-97f6-d48ebb5e6171@gmx.at>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Tue, Jan 03, 2023 at 06:50:02PM +0100, Christian Schaubschläger wrote:
> Hi,
> 
> 
> > Okay you have only one Thunderbolt PCIe root port just as you correctly
> > guessed (07.0). At this point I'm running out of ideas what to check or
> > try. We have seen similar but only when there is no battery on the
> > device which is not your case, I suppose. In this case the initial USB4
> > link state is kind of "open" so it may come up or not.
> 
> Hm, maybe it _is_ a firmware issue then? Would it, in your opinion,
> make any sense to confront HP with that issue? Not that I'd have any
> contacts to HP, but just thinking about options...

It may also be a "feature" nobody considered ;-)

> Earlier you said that with Windows 11 the behaviour might be the same
> as in Linux. I'll try that next week (out of office until then). If
> Win 11 indeed has the same problem, then I guess someone at HP or
> wherever will address this sooner or later. I mean, the requirement
> for a working network device/stack after a reboot from an OS is not
> that unusual I'd say...

I agree. If it turns out that Windows 11 works wrt. this (please check
that it is using Windows "inbox" driver for TBT) then we need to figure
out what it is doing differently.
