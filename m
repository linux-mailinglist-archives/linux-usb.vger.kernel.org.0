Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9FC1C4EBBD5
	for <lists+linux-usb@lfdr.de>; Wed, 30 Mar 2022 09:35:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243857AbiC3HgL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 30 Mar 2022 03:36:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243852AbiC3HgG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 30 Mar 2022 03:36:06 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3647721BC63
        for <linux-usb@vger.kernel.org>; Wed, 30 Mar 2022 00:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648625660; x=1680161660;
  h=to:cc:references:from:subject:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=gebrUP0PABkvuZtEnUDK1eQ6ZuQoR/5R69twsZKupCM=;
  b=DkmvhNj0T8IlqHHfzx7Ub0FvrS/46o7FZQ+IG/HYfwakPdo6ur297H3m
   by3jqC6xflsDICPYRxY9cyOKJdhmdwBx/HzPFqQgooGyNYuMdZEoRBy3K
   QOSjFmDIqYkIBPCkp6FOTy3LYObDgS/2hrbad0wogOwquFtWTvt6FncNa
   k9xLV9LhhPyl6/LHoUhQZN5mpQOJM6Ys1ZvLK9xYeIoMstCvWcdSl7aMu
   S5R002Pm5fL5g8BGxoCGQt7avkuY6irj8u8qLJC0N90oCtIhvgBzdEgXp
   aWBgy2HUCm076fZwar711aoiP+neYj1gkIsSZJyoiqQi5PS5Iy2Lj01N4
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10301"; a="259446093"
X-IronPort-AV: E=Sophos;i="5.90,222,1643702400"; 
   d="scan'208";a="259446093"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2022 00:34:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,222,1643702400"; 
   d="scan'208";a="653676873"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by orsmga004.jf.intel.com with ESMTP; 30 Mar 2022 00:34:16 -0700
To:     Greg KH <gregkh@linuxfoundation.org>,
        Josue David Hernandez Gutierrez 
        <josue.d.hernandez.gutierrez@intel.com>
Cc:     linux-usb@vger.kernel.org
References: <20220329154406.5485-1-josue.d.hernandez.gutierrez@intel.com>
 <20220329154406.5485-2-josue.d.hernandez.gutierrez@intel.com>
 <YkMv9wB1zXtMQgWN@kroah.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH 2/2] usb: host: xhci: Move msi/msi-x functions to xhci-pci
Message-ID: <3028aa38-bd85-1e04-e2e0-6229d6320b89@linux.intel.com>
Date:   Wed, 30 Mar 2022 10:36:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YkMv9wB1zXtMQgWN@kroah.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 29.3.2022 19.12, Greg KH wrote:
> On Tue, Mar 29, 2022 at 09:44:06AM -0600, Josue David Hernandez Gutierrez wrote:
>> There were sync and cleanup msi/msix functions in xhci inside a #ifdef
>> macro to check if PCI module is being compiling. These functions has
> 
> "have"?
> 
>> been moved to xhci-pci where they belong.
> 
> Again, move first, modify second.
> 

In this case a small modification first makes moving the code a lot easier.
But yes, patches could be split into clearer functional and "moving" changes.

Thanks
Mathias 

