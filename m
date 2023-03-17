Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E22B6BED56
	for <lists+linux-usb@lfdr.de>; Fri, 17 Mar 2023 16:52:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231237AbjCQPwO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Mar 2023 11:52:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231362AbjCQPwM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 17 Mar 2023 11:52:12 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABF71B1A74
        for <linux-usb@vger.kernel.org>; Fri, 17 Mar 2023 08:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679068331; x=1710604331;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=viX8D2rclATFdpXFu/Fhs70VeWWcJIkwIhDDkPYoRAs=;
  b=XcnTZwTfiFA1d60zAw/Ej1UCUsSKFxjs4a8C+M3JFxDSzBMwFLrEw2Oj
   gnec75K2Ad/dr1Xc5GMeB4HD5u00+SC2sW1PVTwzhptUYojQuGpsWQXTK
   wFp/MqbQwGrlioRC6cx4CcuSuJRap6LtlBmPTRV0E0RJxEApdiQfmicRy
   VHexx0He8CxmLnKMgnEUXm8vzJXAdEXbQjwzELZ+yT4oyao9jdUd8zCSp
   vnqZRIkWy8oScC2SQw1yq0zjbKpvaS6aBPKL/ceYWbxrH4hpFwlFS2MXJ
   U0vRLmJTB2cn021VfEnMLWNZWI6UL/2lKc4fC5loFMSuxt3a5EEDEuMkG
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="424561118"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
   d="scan'208";a="424561118"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2023 08:52:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="926191447"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
   d="scan'208";a="926191447"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by fmsmga006.fm.intel.com with ESMTP; 17 Mar 2023 08:52:10 -0700
Message-ID: <6eee6869-d6c3-82aa-47c1-93be91b67339@linux.intel.com>
Date:   Fri, 17 Mar 2023 17:53:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.7.1
Subject: Re: [PATCH 00/14] xhci features for usb-next
Content-Language: en-US
To:     gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org
References: <20230317154715.535523-1-mathias.nyman@linux.intel.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20230317154715.535523-1-mathias.nyman@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 17.3.2023 17.47, Mathias Nyman wrote:
> Hi Greg
> 
> A set of xhci features and cleanups for usb-next
> 
> - Add sysfs entries to modify usb descriptor values shown by xHC in DbC
>    device mode.
> 
> - Decouple PCI specific MSI code from usb core.

Decouple xhci MSI code from _xhci_ core, not usb core.

-Mathias
