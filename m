Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A43577F884
	for <lists+linux-usb@lfdr.de>; Thu, 17 Aug 2023 16:17:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236259AbjHQOQd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 17 Aug 2023 10:16:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351785AbjHQOQ1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 17 Aug 2023 10:16:27 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9C302D72
        for <linux-usb@vger.kernel.org>; Thu, 17 Aug 2023 07:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692281786; x=1723817786;
  h=message-id:date:mime-version:to:cc:references:from:
   subject:in-reply-to:content-transfer-encoding;
  bh=Rso8rV5eVJcth/3LTIuwlVg1pfjuhmxdZo25p7CyzzU=;
  b=DTgL7F2z7P9fGYuv+7N3eBFSYvkZZcn+H1s4z97AAt6TgMI+14feFWZm
   qbTtNWe3U9GoJWNjVjghwssszp9cHvkpE7r9H+nRf1BMGKcNEFu/2qW2C
   K6kwzDJ2vjUKjzMb6M3NzbOiBJZawNXCWpvm43aac8Qt55RMUFeEqoHlT
   yo1hqOH5FycDdwF2t2uijE1/vwEW71/1HZz3D1VtIn4xonCsLjqhHbFEd
   L2APPLR3oies39e+ZJfqJw+2qjUYTQrtP6Y8QPrgjWLpaYqbo/DroJRMb
   SnURPXBaFOgwcpjOYffTEiSZz43Z7+IBozdUgPy8dEu0zhArolWUMhfI+
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="439191872"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="439191872"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 06:45:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="848890212"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="848890212"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by fmsmga002.fm.intel.com with ESMTP; 17 Aug 2023 06:45:31 -0700
Message-ID: <1e881541-ec0c-1540-37c8-f8226bc30a26@linux.intel.com>
Date:   Thu, 17 Aug 2023 16:46:47 +0300
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
        Lino Sanfilippo <LinoSanfilippo@gmx.de>
References: <cover.1692085657.git.lukas@wunner.de>
 <97f42cbb432ed38a327f02ef37348bd07765e0f5.1692085657.git.lukas@wunner.de>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH 2/2] xhci: Use more than one Event Ring segment
In-Reply-To: <97f42cbb432ed38a327f02ef37348bd07765e0f5.1692085657.git.lukas@wunner.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 15.8.2023 15.40, Lukas Wunner wrote:
> From: Jonathan Bell <jonathan@raspberrypi.com>
> 
> Users have reported log spam created by "Event Ring Full" xHC event
> TRBs.  These are caused by interrupt latency in conjunction with a very
> busy set of devices on the bus.  The errors are benign, but throughput
> will suffer as the xHC will pause processing of transfers until the
> Event Ring is drained by the kernel.
> 
> Commit dc0ffbea5729 ("usb: host: xhci: update event ring dequeue pointer
> on purpose") mitigated the issue by advancing the Event Ring Dequeue
> Pointer already after half a segment has been processed.  Nevertheless,
> providing a larger Event Ring would be useful to cope with load peaks.
> 
> Expand the number of event TRB slots available by increasing the number
> of Event Ring segments in the ERST.
> 
> Controllers have a hardware-defined limit as to the number of ERST
> entries they can process, but with up to 32k it can be excessively high
> (sec 5.3.4).  So cap the actual number at 8 (configurable through the
> ERST_MAX_SEGS macro), which seems like a reasonable quantity.

Making the new event ring default size 8 times bigger seems a bit over the top,
especially when most systems worked fine with just one segment.

How about doubling the current size as a default, and then think about
adding more segments dynamically if we get "Event Ring Full" events?

Thanks
Mathias

