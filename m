Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6175A6F400A
	for <lists+linux-usb@lfdr.de>; Tue,  2 May 2023 11:24:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233120AbjEBJYX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 2 May 2023 05:24:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233546AbjEBJYU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 2 May 2023 05:24:20 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7EE79D
        for <linux-usb@vger.kernel.org>; Tue,  2 May 2023 02:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683019457; x=1714555457;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=JbbXQQxLW6adIeIiH54A0/h/kIetnaEkwqat+Xm9CbY=;
  b=nwaB7HYA9OFlkqTABPnXJEaG2C2d0auZ7qWd42APDtrVfoHS40YMPJ7w
   ydm4O8lGJTQndGlWgnHNw/uP7gzj3y0x8YUgUhQIx39snwmuLY3nBew3k
   K/NdQcgVryHFLMw/QQUk+frTZn97JXejyyiWbfT8d4faJk+U1Yx3Df1PK
   Cezv2fNVfQg/DoBIKR0cE8r5q6BijahgpgxZ5UdvWKXLAU+CadPSdUtMt
   x5oo8r/yB1U7a65Lbs470Q+JbLYB6J8wVAIQiLRyvmgE1fHKyU0FdiN6d
   ekKw5mE+KW5C8VXJRJUiAgtR6+XZDB0045HCsB9wt9rFSbaCIpaniDSnF
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="411486780"
X-IronPort-AV: E=Sophos;i="5.99,243,1677571200"; 
   d="scan'208";a="411486780"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2023 02:24:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="698897559"
X-IronPort-AV: E=Sophos;i="5.99,243,1677571200"; 
   d="scan'208";a="698897559"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by fmsmga007.fm.intel.com with ESMTP; 02 May 2023 02:24:14 -0700
Message-ID: <e5b1a9f5-0e9d-1b4b-8247-689d6db2d1f1@linux.intel.com>
Date:   Tue, 2 May 2023 12:25:45 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.7.1
Subject: Re: [PATCH v4 1/2] USB: Extend pci resume function to handle PM
 events
Content-Language: en-US
To:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
        gregkh@linuxfoundation.org, stern@rowland.harvard.edu,
        mathias.nyman@intel.com, linux-usb@vger.kernel.org
References: <20230428140056.1318981-1-Basavaraj.Natikar@amd.com>
 <20230428140056.1318981-2-Basavaraj.Natikar@amd.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20230428140056.1318981-2-Basavaraj.Natikar@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 28.4.2023 17.00, Basavaraj Natikar wrote:
> Currently, the pci_resume method has only a flag indicating whether the
> system is resuming from hibernation. In order to handle all PM events like
> AUTO_RESUME (runtime resume from device in D3), RESUME (system resume from
> s2idle, S3 or S4 states) etc change the pci_resume method to handle all PM
> events.
> 
> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
> Acked-by: Alan Stern <stern@rowland.harvard.edu>
> ---

For the xhci parts:
Acked-by: Mathias Nyman <mathias.nyman@linux.intel.com>

