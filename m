Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D49077F7A4
	for <lists+linux-usb@lfdr.de>; Thu, 17 Aug 2023 15:25:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351385AbjHQNZM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 17 Aug 2023 09:25:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351226AbjHQNZH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 17 Aug 2023 09:25:07 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10856114
        for <linux-usb@vger.kernel.org>; Thu, 17 Aug 2023 06:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692278705; x=1723814705;
  h=message-id:date:mime-version:to:cc:references:from:
   subject:in-reply-to:content-transfer-encoding;
  bh=o6EDmqg240MBtX8eD4rr9ogXQYPS4VmZvbMlJi1qtUg=;
  b=i6RXpCG56vGYSbgJ1cm8UDI27ZRtXR3MRWd+/uBBFvMLWE694nYjKNxD
   wu4ChA7VU3111f30d8l3hFKZQh55ZSnYg9mCbnG/p8+JDJ7TrzrfeP/R1
   j1UcspBu/eZVD2iQ47OsoGmeHZqx7RxycYgm7VC57b5/0ICal9r+o9L26
   JDXPkp/E+hi0RXn6U/8+KWpCjKfoYsSoxZWiL6MuPddmE+9wWE8DXelEX
   D3LlO3gmsdBLQDd26d86DF37fN5IuZStTSRLl66y/nclVuD+AQMeFLck4
   o57F84IIi9oLMhoGzsUUxyPanH22PEHdrwsef347U1c2CKv6ogKHAp4Zn
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="403789202"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="403789202"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 06:24:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="800041032"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="800041032"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by fmsmga008.fm.intel.com with ESMTP; 17 Aug 2023 06:24:55 -0700
Message-ID: <104cad2c-65a2-ccf5-e13c-d1cba3d5a57c@linux.intel.com>
Date:   Thu, 17 Aug 2023 16:26:11 +0300
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
 <2b2c9002fe2ec104007b7a235e240b5c82075223.1692085657.git.lukas@wunner.de>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH 1/2] xhci: Set DESI bits in ERDP register correctly
In-Reply-To: <2b2c9002fe2ec104007b7a235e240b5c82075223.1692085657.git.lukas@wunner.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 15.8.2023 15.40, Lukas Wunner wrote:
> When using more than one Event Ring segment (ERSTSZ > 1), software shall
> set the DESI bits in the ERDP register to the number of the segment to
> which the upper ERDP bits are pointing.  The xHC may use the DESI bits
> as a shortcut to determine whether it needs to check for an Event Ring
> Full condition:  If it's enqueueing events in a different segment, it
> need not compare its internal Enqueue Pointer with the Dequeue Pointer
> in the upper bits of the ERDP register (sec 5.5.2.3.3).
> 
> Not setting the DESI bits correctly can result in the xHC enqueueing
> events past the Dequeue Pointer.  On Renesas uPD720201 host controllers,
> incorrect DESI bits cause an interrupt storm.  For comparison, VIA VL805
> host controllers do not exhibit such problems.  Perhaps they do not take
> advantage of the optimization afforded by the DESI bits.
> 
> To fix the issue, assign the segment number to each struct xhci_segment
> in xhci_segment_alloc().  When advancing the Dequeue Pointer in
> xhci_update_erst_dequeue(), write the segment number to the DESI bits.
> 
> On driver probe, set the DESI bits to zero in xhci_set_hc_event_deq() as
> processing starts in segment 0.  Likewise on driver teardown, clear the
> DESI bits to zero in xhci_free_interrupter() when clearing the upper
> bits of the ERDP register.  Previously those functions (incorrectly)
> treated the DESI bits as if they're declared RsvdP.
> 
> Signed-off-by: Lukas Wunner <lukas@wunner.de>

Thanks for working on this, sorting out the DESI bits

The segment numbers might become useful for transfer rings as well, but with
current transfer ring expansion support those numbers need to be adjusted
after expansion.

But I can make a small separate fix for that on top of this.

-Mathias
