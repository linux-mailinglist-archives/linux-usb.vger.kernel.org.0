Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85A6E702B4B
	for <lists+linux-usb@lfdr.de>; Mon, 15 May 2023 13:19:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240104AbjEOLT6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 15 May 2023 07:19:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240889AbjEOLTz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 15 May 2023 07:19:55 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5615CCE
        for <linux-usb@vger.kernel.org>; Mon, 15 May 2023 04:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684149594; x=1715685594;
  h=message-id:date:mime-version:to:references:from:subject:
   in-reply-to:content-transfer-encoding;
  bh=oobYQBXDvy/jAGRSg2vqoNo2SOmMfkp7z8kroGkYUKQ=;
  b=Yb7jBLQdT6ZYnkwXB0ZCFFWoMTnuRTSmw88U+q4x3flZHOMXry5AHEjH
   O1xulv/uf0iM0brk2//8CLL8cJK8h+PC4Vy2KELNB8iDJNZtYynTsLJMu
   ItUNeaziTrE8oIOKERmEKpKLoHYXqx3it5UzlqelFshR1XSHQ370ctzoP
   IvBoR5zhjyv0E+aTvObHPf9VCFHZahoHYwiueICHjxpj+MDCyBm/z0SBL
   ToNj1DAPQioHgVXCvnozOmQLdEKWdiqpsntciVqMpuejFMufqJkl6saer
   xDhks1g1swspR87gcGMt5+gn0NuUJyulqabPcxHq5RDQ0XKzqCtMlU1C0
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10710"; a="330794474"
X-IronPort-AV: E=Sophos;i="5.99,276,1677571200"; 
   d="scan'208";a="330794474"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2023 04:19:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10710"; a="790613433"
X-IronPort-AV: E=Sophos;i="5.99,276,1677571200"; 
   d="scan'208";a="790613433"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by FMSMGA003.fm.intel.com with ESMTP; 15 May 2023 04:19:53 -0700
Message-ID: <1397c89b-9644-183f-6020-868b956d9d50@linux.intel.com>
Date:   Mon, 15 May 2023 14:21:09 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.0
Content-Language: en-US
To:     yunhua li <yunhual@gmail.com>, linux-usb@vger.kernel.org
References: <CAMqbrUgMcOFuw_P6z_KmqJF5iKEXFHVz2eKOyy=5OnWARfRJhw@mail.gmail.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: XHCI(USB 3.0) isochronous bandwidth calculation question
In-Reply-To: <CAMqbrUgMcOFuw_P6z_KmqJF5iKEXFHVz2eKOyy=5OnWARfRJhw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-8.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 14.5.2023 4.50, yunhua li wrote:
> yunhua li <yunhual@gmail.com>
> 
> 6:46 PM (2 minutes ago)
> to linux-usb
> Hello all
> For USB 3.0 isochronous endpoint, anyone know how to calculate
> bandwidth for an XHCI chip?
> I have 3 isochronous Cameras.
> Camera1: 1920*1200*16(YUV) *20(FPS) = 737280000 ~ 740Mb/s
> Camera2:  1200*1200*16(YUV) * 20(FPS) = 460800000 ~ 470Mb/s
> Camera3:  1200*1200*16(YUV) * 20(FPS) = 460800000 ~ 470Mb/s
> 16(YUV) is 2 byte YUV encoding for each pixel.
> 20(FPS) is the frame rate.
> Total bandwidth 740+470+470 = 1680Mb/s ~ 1.7Gb/s
> USB 3.0 speed is 5Gbps. count in 10b/8b encoding, is 4Gbps. I know
> there is some protocol overhead.  When I open the 3rd camera with
> guvcview or other software. I got the following error.
> 
> xhci_hcd 0000:49:00.0: xhci_check_bandwidth called for udev 000000004bbf2dcd
> xhci_hcd 0000:49:00.0: // Ding dong!
> usb 10-2: Not enough bandwidth for new device state.
> xhci_hcd 0000:49:00.0: xhci_reset_bandwidth called for udev 000000004bbf2dcd
> usb 10-2: Not enough bandwidth for altsetting 1
> 
> the error comes xhci_check_bandwidth from
> https://elixir.bootlin.com/linux/v5.10.140/source/drivers/usb/host/xhci.c#L2906
> xhci_configure_endpoint
> https://elixir.bootlin.com/linux/v5.10.140/source/drivers/usb/host/xhci.c#L2862
> The result is COMP_BANDWIDTH_ERROR or  COMP_SECONDARY_BANDWIDTH_ERROR
> https://elixir.bootlin.com/linux/v5.10.140/source/drivers/usb/host/xhci.c#L2022
> 
> The bandwidth check is done by hardware, not software, I just want to
> know how to calculate the max supported bandwidth for 3 isochronous
> devices?
> I tried to read the XHCI spec.
> https://www.intel.com/content/dam/www/public/us/en/documents/technical-specifications/extensible-host-controler-interface-usb-xhci.pdf
> But I couldn't figure it out.  I appreciate any help, and thanks for
> your time to read my post.

Disclaimer: haven't really needed to calculate or look deep into this as hardware does
the bandwidth calculation, but here's how I understood it:

USB 3.0 (Gen 1)

A microframe is 125 microseconds (8 per millisecond, or 8000 per second)
a microframe can fit 3 isoc bursts,
a burst can contain 16 isoc packets
a isoc packet can contain 1024 bytes.

So for usb 3.0 you got 8000 * 3* 16 * 1024 bytes, roughly 393 Mbytes (~3.15 Gbits) for one
USB 3.0 superspeed bus instance.

Depending on the xHC vendor there can be a dedicated USB 3.0 bus instance per roothub port,
or it several ports may share a bus instance, or possibly have only one bus instance shared
among all usb 3.0 roothub ports.

USB 3 spec says max 90% of bandwidth can be allocated for isoc transfers
xhci specs says "Total Available Bandwidth will be at least 20% lower than the
cited bit rate of a Bus Instance"

Instead of looking at camera bandwidth it's probably better to look at the MaxPacketSize,
MaxBurst, Interval, and BytesPerInterval fields of the camera isoc endpoint descriptors.

Add together those for all active isoc endpoints and check if it fits the 3 bursts, 16 packets, 1024 bytes.
Remember the Interval, most devices don't send data every microframe.

xhci supports a "Get port bandwidth" command that shows available bandwidth per port at the moment.
Current upstream driver does not support it, but I have some old debugging patches that could
be rebased and tried out if you are interested.

Thanks
Mathias
  

