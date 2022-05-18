Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64B4652B4D1
	for <lists+linux-usb@lfdr.de>; Wed, 18 May 2022 10:38:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233268AbiERIbc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 18 May 2022 04:31:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233357AbiERIbJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 18 May 2022 04:31:09 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48DD665E1
        for <linux-usb@vger.kernel.org>; Wed, 18 May 2022 01:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652862665; x=1684398665;
  h=message-id:date:mime-version:to:references:from:subject:
   in-reply-to:content-transfer-encoding;
  bh=awhCuvr8KLRnIzUhLHzzRksXvgU+3h1JvsxArgmbOZI=;
  b=arXH2BBh9Gnv2j7m4maSPXwHdN/+ITJDOTBWpDfapK79hT795/jp7rYX
   ITAfB7foNsRSnKoWpQB3J8FS9QsjWUKj4njCqRxxDlTV53SewIpjJPz1m
   1xRBcDjkvPED/JlGOIp/bQ80E3CtpzvxuPdJKNO7dbgUpovBzIkZA9sJl
   84/qp14fWVcTo3S2AfdtqBE2UPOEOoVUZFi/DgFLJbngu6ynM41PJ7SWF
   LfCIucBraMSciaceaYLORNRvlptcXmDKNoDIrq1hbTxx/c5E/Cj9qSBr9
   V05kQmjHBBzOo6FDKD3konloa7glG3nXfuwqAE0628dXbqGfwUWov3gZh
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10350"; a="253601841"
X-IronPort-AV: E=Sophos;i="5.91,234,1647327600"; 
   d="scan'208";a="253601841"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2022 01:31:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,234,1647327600"; 
   d="scan'208";a="597651074"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by orsmga008.jf.intel.com with ESMTP; 18 May 2022 01:30:49 -0700
Message-ID: <2de61edd-47ab-53ac-8c8a-8f2f6abf840e@linux.intel.com>
Date:   Wed, 18 May 2022 11:32:11 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.8.1
Content-Language: en-US
To:     Sergey Shtylyov <s.shtylyov@omp.ru>,
        Mathias Nyman <mathias.nyman@intel.com>,
        linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <2dc0d93e-2ac7-3f5c-e22c-d5329ec2e7f5@omp.ru>
 <ef9b047d-4762-6b06-e633-f51d2848f66c@omp.ru>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH] usb: host: xhci: use snprintf() in xhci_decode_trb()
In-Reply-To: <ef9b047d-4762-6b06-e633-f51d2848f66c@omp.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 17.5.2022 22.13, Sergey Shtylyov wrote:
> Hello!
> 
> On 3/16/22 11:36 PM, Sergey Shtylyov wrote:
> 
>> Commit cbf286e8ef83 ("xhci: fix unsafe memory usage in xhci tracing")
>> apparently missed one sprintf() call in xhci_decode_trb() -- replace
>> it with the snprintf() call as well...
>>
>> Found by Linux Verification Center (linuxtesting.org) with the SVACE static
>> analysis tool.
>>
>> Fixes: cbf286e8ef83 ("xhci: fix unsafe memory usage in xhci tracing")
>> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
>>
>> ---
>> This patch is against the 'usb-next' branch of Greg KH's 'usb.git' repo.
> 
>     Mathias, Greg, what's going on with this patch? It was posted 2 months ago
> and seemingly ignored... :-/
> 
> MBR, Sergey

Must have missed it

I'll queue it up for 5.20 unless Greg still picks it up for 5.19.
Not urgent.

-Mathias
