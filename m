Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B1D94CA8C4
	for <lists+linux-usb@lfdr.de>; Wed,  2 Mar 2022 16:05:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243358AbiCBPFx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Mar 2022 10:05:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239644AbiCBPFx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 2 Mar 2022 10:05:53 -0500
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9F11CA701
        for <linux-usb@vger.kernel.org>; Wed,  2 Mar 2022 07:05:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646233509; x=1677769509;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=cCDPjlc6pEKUqBQ8rZt+dq6VR8gp7ceHA/CfmIzbQYw=;
  b=RETuPOcQmlUQ97JvMgYR2+u4m933lWhL+l5nxZKLPEy34Vc41SJwMAxY
   sC9Zo2N/VUr7oslTQxJMTMwJNTtQIdIRF2v7s0SOA9xgWsRJe/S0mK+B6
   7gwQFkkj8/gVTSJFdI/iTeE6NJ2Sjd2UWY7uJCYcXh9SIBePDerO/4iSO
   mZ0ALqwBgcrgFOHeZBtUGj2QGqtsLlu9+HafZ6vPNOJ2sFpv8xXkD6KIZ
   bY8HnMbDZz7qn4fYpHosBJdtfm5y3671px5mI96xtGPB+hs0ZYm0uoreo
   AeC3oSPq4bPxwlx8OyihDuDNQlvk0RxZq2gUegHX+m9JnalrwWgvmw+Qk
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10274"; a="314138284"
X-IronPort-AV: E=Sophos;i="5.90,149,1643702400"; 
   d="scan'208";a="314138284"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2022 07:05:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,149,1643702400"; 
   d="scan'208";a="576131542"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by orsmga001.jf.intel.com with ESMTP; 02 Mar 2022 07:05:07 -0800
Subject: Re: [PATCH v2 0/5] usb: xhci: fix of some code/comment
To:     Linyu Yuan <quic_linyyuan@quicinc.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, Jack Pham <quic_jackp@quicinc.com>
References: <1645060971-27141-1-git-send-email-quic_linyyuan@quicinc.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Message-ID: <52eeb27d-63dd-2288-a913-7a5056708f96@linux.intel.com>
Date:   Wed, 2 Mar 2022 17:06:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1645060971-27141-1-git-send-email-quic_linyyuan@quicinc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 17.2.2022 3.22, Linyu Yuan wrote:
> Only samll change, no description here.
> 
> v2: fix checkpatch warning on patch#1,
>     thanks to Sergei Shtylyov and Greg Kroah-Hartman
> 
> Linyu Yuan (5):
>   usb: host: xhci: use ffs() in xhci_mem_init()
>   usb: host: xhci: fix a comment typo in xhci_mem_init()
>   usb: host: xhci: update hci_version operation in xhci_gen_setup()
>   usb: host: xhci: add blank line in xhci_halt()
>   usb: host: xhci: remove init to some ret/retval
> 
>  drivers/usb/host/xhci-mem.c |  8 ++------
>  drivers/usb/host/xhci.c     | 14 ++++++++------
>  2 files changed, 10 insertions(+), 12 deletions(-)
> 

Thanks, adding these

-Mathias
