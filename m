Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B82D578FD62
	for <lists+linux-usb@lfdr.de>; Fri,  1 Sep 2023 14:38:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243800AbjIAMit (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 1 Sep 2023 08:38:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231348AbjIAMis (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 1 Sep 2023 08:38:48 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFDD3E7F
        for <linux-usb@vger.kernel.org>; Fri,  1 Sep 2023 05:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693571924; x=1725107924;
  h=message-id:date:mime-version:to:cc:references:from:
   subject:in-reply-to:content-transfer-encoding;
  bh=sLUvg4VBuqfSV1CMpGamxlZPMcvTX3Uq12TM/UZLp1s=;
  b=C6Wg4nOXaVUvdJt086fHtTx38FIfAtOZ8i4KMXWX9iMVi4CCALNHOiRn
   gndfXBjGSauzF7xMY3KG3LxFblyNh5CwtMMPky2QkZZ8B2W+cM4LIdwAo
   bBWIFQKVVGNKrnCgkvwLJ2/qgAeTtinDZslBt4U4LKxFWRVbS5hYv5H0B
   KnarHsPoCVxgV/jg2bsXUQfz0GKH4y4xZB5UZrf23Oan6NCJfpwh3w3E0
   BZC1p4oixx3GBIKUUgh164i4hpmft4+vR5Py0AG7/U27L1XEqyyD6iunp
   0yC3RVHDBm4g8Q777eWf+CI+Ne2Ufl8ycDGZDACxsgLntrxTlhJdJT4MQ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="378936253"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; 
   d="scan'208";a="378936253"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2023 05:38:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="854698427"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; 
   d="scan'208";a="854698427"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by fmsmga002.fm.intel.com with ESMTP; 01 Sep 2023 05:38:41 -0700
Message-ID: <0b1591f2-4f4b-e3be-ee5f-bf8fe5e779f3@linux.intel.com>
Date:   Fri, 1 Sep 2023 15:40:00 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Content-Language: en-US
To:     Lukas Wunner <lukas@wunner.de>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org,
        Jonathan Bell <jonathan@raspberrypi.org>,
        Phil Elwell <phil@raspberrypi.com>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Philipp Rosenberger <p.rosenberger@kunbus.com>,
        Lino Sanfilippo <LinoSanfilippo@gmx.de>,
        Peter Chen <peter.chen@kernel.org>
References: <cover.1692892942.git.lukas@wunner.de>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH v2 00/10] Multi-segment Event Ring support for XHCI
In-Reply-To: <cover.1692892942.git.lukas@wunner.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 24.8.2023 19.15, Lukas Wunner wrote:
> Enlarge the XHCI Event Ring to cope with high load situations
> by allowing more than one segment.
> 
> This second iteration seeks to address all of Mathias' review feedback on v1:
> 
> * Patch [01/10]:
>    Use ERST_DESI_MASK instead of ERST_PTR_MASK when constructing the new
>    ERDP value to avoid carrying over a set EHB bit.
> 
> * Patch [04/10]:
>    Only use up to 2 Event Ring segments by default (instead of 8).
> 
> * Patch [05/10]:
>    New patch to adjust segment numbers after ring expansion.
> 
> * Patch [08/10]:
>    New patch to clean up ERST_PTR_MASK inversion.
> 
> Several other issues caught my eye and I'm including fixes and cleanups
> for those as well.
> 

Thanks for working on this.

Tested this series with a forced transfer ring expansion and all worked well.

I'll add this internally first and then later send it forward after the merge window.

Thanks
Mathias

