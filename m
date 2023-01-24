Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 339EA679C1F
	for <lists+linux-usb@lfdr.de>; Tue, 24 Jan 2023 15:39:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234052AbjAXOjj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 24 Jan 2023 09:39:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232999AbjAXOji (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 24 Jan 2023 09:39:38 -0500
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E668AE
        for <linux-usb@vger.kernel.org>; Tue, 24 Jan 2023 06:39:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674571177; x=1706107177;
  h=message-id:date:mime-version:to:cc:references:from:
   subject:in-reply-to:content-transfer-encoding;
  bh=7yPhVmmZ5YCXhklby4+NlwoGVyzc4D6S031uQBHL/2k=;
  b=JKf4W78fVZbs/9PP94vGvIHaPwgFflPrYURQqGkp8qYhE7YL3RuVUaBI
   Z7929P6gxxlqi+JChHlE7YEpjSL4WuDqVhOMVFsKBU01Tpw6xC2N/NfYR
   lWLeC+Ef+uNz0hG0LNdDeFZi7uT2t749g8SehNoIKpIzz8aVC/9msQbmj
   JtOfCcSczM/CNCK5FnGh8FVB0Iaw40xZjZeTMAn/MYGkheXrsfTwIWeeI
   Zxdub7pbVv3abHuT0V+8pZXEF+YeI4BjEYBbklh0YWEH0IlNHAREgPkKn
   /REl+ZeExhS2B/fPEqkngixbAzIzgmYkwcJwUi+Ko20bF98uKb4q3k2DT
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="324983238"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; 
   d="scan'208";a="324983238"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2023 06:39:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="725494000"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; 
   d="scan'208";a="725494000"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by fmsmga008.fm.intel.com with ESMTP; 24 Jan 2023 06:39:36 -0800
Message-ID: <54dca4fd-81c3-ba7f-e63e-64c8a38eebd8@linux.intel.com>
Date:   Tue, 24 Jan 2023 16:40:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
To:     Joe Bolling <jbolling@bostondynamics.com>,
        Mathias Nyman <mathias.nyman@intel.com>
Cc:     linux-usb@vger.kernel.org
References: <CAHPEz-1J=PU1Qgyw9=gWbC_Z71muoXQx=jYCvB2XE=_qZySCqQ@mail.gmail.com>
Content-Language: en-US
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: PROBLEM: Error 110 from ASMedia Host Controller
In-Reply-To: <CAHPEz-1J=PU1Qgyw9=gWbC_Z71muoXQx=jYCvB2XE=_qZySCqQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 21.12.2022 0.12, Joe Bolling wrote:
> [1.] One line summary of the problem: Error 110 from ASMedia Host Controller
> 
> [2.] Full description of the problem/report: I'm seeing a failure from
> XHCI_HCD when I stream video from Intel Realsense D435 cameras through
> an ASMedia ASM3042 USB host controller. The issue usually manifests as
> repeated Error 110s from the camera as long as I'm trying to stream
> data:
> [  100.227800] usb 4-1: Failed to query (SET_CUR) UVC control 1 on
> unit 3: -110 (exp. 1024).
> Followed by a bit of a lockup from XHCI_HCD. lsusb will hang and I
> can't get any image data from the camera. This problem seems to happen
> sooner when there are multiple cameras connected and streaming. In the
> logs below, I'm streaming from four cameras, two connected to an
> ASM3042 and two via an Intel host controller. It seems to happen when
> I stop and re-start streaming from the cameras repeatedly. dmesg and
> tracing output are located in this folder:
> https://bostondynamics1.box.com/s/qtn28it8avda6pvve5sowyaeff4jzlyr
> 

Had a quick look at the trace.
The control transfer that times out is queued at:

95.030596: xhci_urb_enqueue: ep0out-control: urb 000000005be6faad pipe 2147484160 slot 1 length 0/1024 sgs 0/0 stream 0 flags 00110000
95.030597: xhci_queue_trb: CTRL: bRequestType 21 bRequest 01 wValue 0100 wIndex 0300 wLength 1024 length 8 TD size 0 intr

It never completes so it's cancelled after 5 seconds.
xhci driver stops the endpoint to remove the cancelled transfer.

100.268771: xhci_urb_dequeue: ep0out-control: urb 000000001ac66029 pipe 2147484160 slot 1 length 0/1024 sgs 0/0 stream 0 flags 00110000
100.268797: xhci_dbg_cancel_urb: Cancel URB 000000001ac66029, dev 1, ep 0x0, starting at offset 0x16f13f9c0
100.268804: xhci_queue_trb: CMD: Stop Ring Command: slot 1 sp 0 ep 1 flags c

Trace is a bit hard to follow as we can't distinguish between hosts.
Also seems that some events are just missing from trace.

Control transfers on ep0 fails after this.

No idea why this transfer does not complete, but I'd start by taking a better look at
the 'Context state error' responses to stop endpoint commands.

This error should mostly occur when a stop endpoint command races with an error on the endpoint,
and in these cases the endpoint state should be "error" or "halted".
In this trace endpoint state often stopped.

105.388818: xhci_queue_trb: CMD: Stop Ring Command: slot 1 sp 0 ep 1 flags c
105.389099: xhci_handle_event: EVENT: TRB 000000016f583260 status 'Context State Error' len 0 slot 1 ep 0 type 'Command Completion Event' flags e:c
105.389101: xhci_handle_command: CMD: Stop Ring Command: slot 1 sp 0 ep 1 flags c
105.389104: xhci_handle_cmd_stop_ep: State stopped mult 1 max P. Streams 0 interval 125 us max ESIT payload 0 CErr 3 Type Ctrl burst 0 maxp 512 deq 000000016f13f9f1 avg trb len 0

Many other control transfer requests in this log cause a protocol stall, meaning device
doesn't support the request. xHC will halt the host side of an endpoint on both
functional and protocol stalls, and needs to be recovered with a reset endpoint command.

Maybe ASMedia host side endpoint is really halted even if it reports stopped, and needs a
reset endpoint command to recover?

Thanks
Mathias

