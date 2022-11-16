Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9EAA362B72D
	for <lists+linux-usb@lfdr.de>; Wed, 16 Nov 2022 11:07:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231866AbiKPKHZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Nov 2022 05:07:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231660AbiKPKHY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 16 Nov 2022 05:07:24 -0500
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97E66FAFE
        for <linux-usb@vger.kernel.org>; Wed, 16 Nov 2022 02:07:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668593243; x=1700129243;
  h=message-id:date:mime-version:to:cc:references:from:
   subject:in-reply-to:content-transfer-encoding;
  bh=wrr9cINTL00hJEDG3QVPbzyrrYAG4QuCPK8+ZSDIZO0=;
  b=NEh8Tf7cju+/B/FL3PN25rum9v2hzLAsj6ULpdyRfo3tvBzsOisY6Gc3
   CQ52FZCkZmr5JCKY0Egly8y7PUm8Gtnv9khkUv2OEd34BBL7VH2DY0Cpt
   zKnH4cMDKz4IPulTRgg/UHdA+FWKfQ7+yTjhuZFO4KHrgs0Rf4zSQ1uBR
   1AMnBb4hJzCMpczyT4AfWW3hQjVDTqH97Xs9Qz13zlMHjN34acr8Ngfjn
   rd+QGhcQqLmCBbZIGoCyBv3S0l5oirD1QsW3VjOSY/SZbEp4VoA/jiwhP
   HEn5YAkMk7nct7GpdJzlMi4u1i5Yqo3Bbfp9aiPFbdbwxbcdvl3BCvxVX
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="398792503"
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; 
   d="scan'208";a="398792503"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2022 02:05:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="781706243"
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; 
   d="scan'208";a="781706243"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by fmsmga001.fm.intel.com with ESMTP; 16 Nov 2022 02:05:09 -0800
Message-ID: <fa7d7926-5944-e58d-7f90-5284fdaeeb55@linux.intel.com>
Date:   Wed, 16 Nov 2022 12:06:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.2.2
To:     chao zeng <chao.zengup@gmail.com>, mathias.nyman@intel.com
Cc:     linux-usb@vger.kernel.org
References: <CAGzEXPYzhJdw5M+F0SdcrtN8Hnew_LCjD6bC=ANBJzBxVRM_NA@mail.gmail.com>
Content-Language: en-US
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: Some problems about xhci_ring_expansion
In-Reply-To: <CAGzEXPYzhJdw5M+F0SdcrtN8Hnew_LCjD6bC=ANBJzBxVRM_NA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi

On 16.11.2022 10.46, chao zeng wrote:
> hello!
>    Thank you for taking the time to look at my question.
> 
>    At file xhci-ring.c
> static inline int room_on_ring(struct xhci_hcd *xhci, struct xhci_ring *ring,
>                  unsigned int num_trbs)
> {
>          int num_trbs_in_deq_seg;
> 
>          if (ring->num_trbs_free < num_trbs)
>                  return 0;
> 
>          if (ring->type != TYPE_COMMAND && ring->type != TYPE_EVENT) {
>                  num_trbs_in_deq_seg = ring->dequeue - ring->deq_seg->trbs;
>                  if (ring->num_trbs_free < num_trbs + num_trbs_in_deq_seg)
>                          return 0;////suppose return here
>          }
> 
>          return 1;
> }
> 
> Suppose the function room_on_ring returns in my bolded condition.
> num_trbs_needed will be a very large value because the num_trbs <
> num_trbs_free. In this way , we will just double the total ring size.

You are correct, good point.
So it turns out we almost always double the ring size when we need
more space, and we do this just because num_trbs_neeed is completely incorrect.
(trying to store negative value in unsigned int)

> Is this as expected or should add one segment size instead?

That's a good question.
Code should be fixed, but do we want to continue doubling ring size, or add
just enough segments to fit actual num_trbs_needed, or perhaps add enough
segments to fit twice the amount of needed trbs?

Would you like work on this? patches are welcome

Thanks
-Mathias


