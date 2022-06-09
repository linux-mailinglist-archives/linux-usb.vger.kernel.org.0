Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E4B4544A54
	for <lists+linux-usb@lfdr.de>; Thu,  9 Jun 2022 13:37:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237371AbiFILhX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Jun 2022 07:37:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234360AbiFILhW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 9 Jun 2022 07:37:22 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BFE2255
        for <linux-usb@vger.kernel.org>; Thu,  9 Jun 2022 04:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654774641; x=1686310641;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=TMr75W9JKZO+t3mT/EgyHSDLEJvzD8yw2MY1iSHkBQI=;
  b=XwzlzdyuEU1YlFjCO76A1Pl5ztd/yAkrPHsD+IPmOB6C+VXjtM5DLKw+
   cuqn1Pp33PgJXXkef9s9uh5qcvH7aKR1P3uvG37jOjbarwyw7mNCZDu3i
   geQRsQh0I5CKaz2vPYT8jtpR5K/dj3zlNuDo84BVj0F4bpsD15axV/sCP
   tFLtJGf9XZB59jBuD1IfI5mMsuFhIT1TyowyneooMT5odStCgOIIIcBQ5
   Fh9qIlg+tQ2v0wPdtbjnwayDPdEk1As3OPyOEfUs5L9AreVD+WdNt0E/3
   JB9RZwiW/iMG/AL9ZbaSOwuzGVw8HmGar85MJOEJTtORhqNGVd0vc8wyR
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10372"; a="341329003"
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; 
   d="scan'208";a="341329003"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2022 04:37:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; 
   d="scan'208";a="724377873"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by fmsmga001.fm.intel.com with ESMTP; 09 Jun 2022 04:37:18 -0700
Message-ID: <c4e9f0d8-c736-1153-3f32-b85e7024b3fe@linux.intel.com>
Date:   Thu, 9 Jun 2022 14:38:45 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.8.1
Subject: Re: [PATCH v2 4/5] usb: host: xhci-plat: prepare operation w/o shared
 hcd
Content-Language: en-US
To:     Matthias Kaehlcke <mka@chromium.org>,
        Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux USB Mailing List <linux-usb@vger.kernel.org>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Jack Pham <quic_jackp@quicinc.com>,
        Tung Nguyen <tunguyen@apm.com>
References: <0684616b-5cc0-e9f6-7015-ce709c6d4386@gmail.com>
 <506113fe-5bd9-bdd0-7858-2b702ca32d53@gmail.com>
 <YqEMzQgqG16gwFUq@google.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <YqEMzQgqG16gwFUq@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 8.6.2022 23.55, Matthias Kaehlcke wrote:
> Hi,
> 
> with v5.19-rc1 (which includes this patch) I encounter a NULL pointer
> exception during system resume on a SC7280 board, which has an
> USB2-only HCD:
> 
...
> 
> In the re-init path xhci_resume() passes 'hcd->primary_hcd' to hci_init(),
> however this field isn't initialized by __usb_create_hcd() for a HCD
> without secondary controller.

Thanks for debugging this, I'll write a patch for it.
Can you try it out?

-Mathias
