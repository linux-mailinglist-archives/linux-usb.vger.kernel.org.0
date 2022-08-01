Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B65BE586C55
	for <lists+linux-usb@lfdr.de>; Mon,  1 Aug 2022 15:56:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231213AbiHAN4o (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 1 Aug 2022 09:56:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230390AbiHAN4n (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 1 Aug 2022 09:56:43 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4F396175
        for <linux-usb@vger.kernel.org>; Mon,  1 Aug 2022 06:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659362202; x=1690898202;
  h=message-id:date:mime-version:to:cc:references:from:
   subject:in-reply-to:content-transfer-encoding;
  bh=r9ubyF3TJhNdERmTqZR1H0pIRNoE1z8tiF2bAeXUGq0=;
  b=kgtOo/awaYeOcrDYB8qDKBBL4+0rJ1Q9bz4CECtP4IsWFJlgiNUEmKdd
   8BoVK5CVuEjd2FuhwsnzMMp4R8cb7cWL5Ac0RqFOP/rH8TBbT1h7vWFoz
   JjFDDgTLaAijbuVsUkH1aR7+HAOXhscld05pMfwnkGnVbdp/N+azzBhX/
   boWEUmfYucoPV7HhT7EXz/Nyg4nWePmtBWjgBX2P4DILL65O2bH0Y8Epj
   lLcNG6hkyPK8p0pZkT1SUJTxhg058eZobKSdA3GSEcviJnoYvxT+/ue3D
   eD7XLO7ODJq5ZWQ8ZyxxFwhS7pc/apyqQfrekSU+y3VG5MRl0xnBn8D8s
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10426"; a="287904728"
X-IronPort-AV: E=Sophos;i="5.93,208,1654585200"; 
   d="scan'208";a="287904728"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2022 06:56:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,208,1654585200"; 
   d="scan'208";a="661158557"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by fmsmga008.fm.intel.com with ESMTP; 01 Aug 2022 06:56:41 -0700
Message-ID: <04136197-c93b-2d61-6673-59b9f44f8d3b@linux.intel.com>
Date:   Mon, 1 Aug 2022 16:58:21 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.8.1
Content-Language: en-US
To:     Alexey Sheplyakov <asheplyakov@basealt.ru>,
        Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>
References: <20220722141700.1271439-1-asheplyakov@basealt.ru>
 <Ytq+xiPgH64fnCnh@kroah.com> <YtrEPC7vsaMaffN5@asheplyakov-rocket>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH] usb: xhci_plat_remove: avoid NULL dereference
In-Reply-To: <YtrEPC7vsaMaffN5@asheplyakov-rocket>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 22.7.2022 18.38, Alexey Sheplyakov wrote:
> Hello,
> 
> On Fri, Jul 22, 2022 at 05:14:14PM +0200, Greg KH wrote:
>> On Fri, Jul 22, 2022 at 06:17:00PM +0400, Alexey Sheplyakov wrote:
>>> Since commit 4736ebd7fcaff1eb8481c140ba494962847d6e0a ("usb: host:
>>> xhci-plat: omit shared hcd if either root hub has no ports")
>>> xhci->shared_hcd can be NULL, which causes the following Oops
>>> on reboot:

Thanks for debugging this.

>>
>> But really, why is hcd NULL at all?
> 
> xhci_plat_remove does this:
> 
> 396	    struct usb_hcd *shared_hcd = xhci->shared_hcd;
> 397
> 398         pm_runtime_get_sync(&dev->dev);
> 399         xhci->xhc_state |= XHCI_STATE_REMOVING;
> 400
> 401         usb_remove_hcd(shared_hcd);
> 402         xhci->shared_hcd = NULL;
> 
> However with e0fe986972f5 ("usb: host: xhci-plat: prepare operation w/o
> shared hcd") and 4736ebd7fcaf ("usb: host: xhci-plat: omit shared hcd
> if either root hub has no ports") it's OK to have no shared hcd, and
> xhci->shared_hcd is NULL in this case.
> 
> So one should check for NULL either in xhci_plat_remove (and possibly
> other users of usb_remove_hcd), or in usb_remove_hcd itself.
> 

Yes, xhci_plat_remove() should be fixed.
It really shouldn't call usb_remove_hcd(NULL), I'll write a patch for it.

No harm in checking hcd is valid in usb_remove_hcd() like this patch either.
  
Thanks
-Mathias
