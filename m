Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 935C84B83FC
	for <lists+linux-usb@lfdr.de>; Wed, 16 Feb 2022 10:25:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231876AbiBPJUb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Feb 2022 04:20:31 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:41814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232058AbiBPJU3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 16 Feb 2022 04:20:29 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11A1823BF3D
        for <linux-usb@vger.kernel.org>; Wed, 16 Feb 2022 01:20:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645003212; x=1676539212;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=ShIPmTfVzvntrJk67MCNZndHO1BKVvxUJzbaSmWFgqQ=;
  b=mZ3jm1WIhvsMZLTOBxf9mgdt7xNQ92vh78IKDAHAz0DsOUmNu0Kh+4lA
   BU2FuPE2BhzLyaGYXyD2S5x6x116d5ql9eJa7hv7kf7lLlk2r96PKYA2l
   MDWZFpV63g6AgIlykx/OToSxGloUY4w6GFQZHcveTBJa14GJPGlo7WAZ6
   5uT0Uri7HvykBZMMOujA3e4SCLjsFNwYqkn7HrlktuJUnZnHLyVI4miHJ
   0g1D3Vy4CQchz2jra0fsOMkE6uE1yJvzw9EMROO1eAGsVUA2+9tZLfw85
   hXGnhqWmMqHAE7LDrEbI6Vc4+d5l0bxAU2jD0azxYKoPxUknYRTQygWre
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10259"; a="248157323"
X-IronPort-AV: E=Sophos;i="5.88,373,1635231600"; 
   d="scan'208";a="248157323"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2022 01:20:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,373,1635231600"; 
   d="scan'208";a="571194223"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by orsmga001.jf.intel.com with ESMTP; 16 Feb 2022 01:20:10 -0800
Subject: Re: [PATCH 0/9] xhci and hub features for usb-next
To:     gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org
References: <20220216090938.1260899-1-mathias.nyman@linux.intel.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Message-ID: <4dc2f796-abfe-651e-3ec2-974455e3b6b0@linux.intel.com>
Date:   Wed, 16 Feb 2022 11:21:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220216090938.1260899-1-mathias.nyman@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 16.2.2022 11.09, Mathias Nyman wrote:
> Hi Greg
> 
> This series mostly adds support for running xhci DbC on more than one
> xHC controller in a setup at the same time.
> 
> There are also some link power management changes, of which one touches
> usb core hub code, removing an extra LPM disable before device reset.
> 
> Thanks
> -Mathias


Argh, ignore this. Merged DbC patches from wrong branch

Will resend v2

-Mathias
