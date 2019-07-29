Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AEF7F79327
	for <lists+linux-usb@lfdr.de>; Mon, 29 Jul 2019 20:34:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387982AbfG2SeZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 Jul 2019 14:34:25 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:38959 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387665AbfG2SeZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 29 Jul 2019 14:34:25 -0400
Received: by mail-wr1-f66.google.com with SMTP id x4so9769334wrt.6
        for <linux-usb@vger.kernel.org>; Mon, 29 Jul 2019 11:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tpTNef2J2++QNO/OkHVy/yBR1B5TUwAqqnweG/iXLyQ=;
        b=LZVoxJO0kBPqiF/uiAFqrbcV2bFOZTwsBdFA28Xc8nQJSw/oSIaMTOi0CJ/jTHW+kb
         kACkHaaTGZ5nbO7JbvxdhhGQC1iFHZEBGxy/Igms3FH3htza/94TRLm1nZBPT9nmcPIX
         v9S963ibaBpFPqm4rgg0MujYPEqxWeU/d6/97rEBTKPfdGMLcW6ZcrFefJNKbV1H0OS/
         icvQypSExJN8HtE5YcyKj5QcOgKFTxA50dxbjFLH95maIKNImEPobXrcWyik2Buz5FQK
         BOw0crkgXtXYCvOdhJMxsFBd0H614pBW3ZAS7IpKS+PHXoMGpfRDC/MDTFeo/UccetOM
         Bv0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tpTNef2J2++QNO/OkHVy/yBR1B5TUwAqqnweG/iXLyQ=;
        b=MKKgroR/Ob4hAv6rx5/Ceduvcf0BuJzgEKf68OQqXyiH3ddklXj+UWQQXYx+Hj7MTu
         3IJoevwR2JdVcJA0bX5/wsWMbVW/yeGCUKXMqh0a6lAGtMl+CmcBz35X8fTQAGijGHP3
         9lDtnR5yTmB2gBA7NaBcZGTIZZMB7p+bYXfq2aw3lFNIhY4GEB9ZGp4rAVhcvfhWBpD7
         QafmZnv/OTaLJiCmUYSQTO21LhJdGlM7KdBlCBdUzCe5oyEM+1DYcolC/k2981+PyjEJ
         4wgD3IZ8V0no2iiTzU/tfZmPkUQYcBrS4RAr4w9eSIkRoyyiI63gBjcixf6APYUV3ukJ
         2B5g==
X-Gm-Message-State: APjAAAWkn328ITZ+z4vQ5sVhsIT5xrMDNJRkGYgyAMFp0N/KSjY4XQiY
        7qmFGqlvZwHT6O2TrdGK0mSmZgpNwCx5CGoXRmVL7g==
X-Google-Smtp-Source: APXvYqzm6XO0MjlmwEOBSDGQInrilKkrrqCvL/4sjBmTp50wT9ZFDcnAsnubc3selGc8g3TuMaB/fX2ZNp0VmcyOQa0=
X-Received: by 2002:adf:b1cb:: with SMTP id r11mr114636138wra.328.1564425262685;
 Mon, 29 Jul 2019 11:34:22 -0700 (PDT)
MIME-Version: 1.0
References: <CY4PR1201MB003708ADAD79BF4FD24D3445AACB0@CY4PR1201MB0037.namprd12.prod.outlook.com>
 <20190723202735.113381-1-john.stultz@linaro.org>
In-Reply-To: <20190723202735.113381-1-john.stultz@linaro.org>
From:   John Stultz <john.stultz@linaro.org>
Date:   Mon, 29 Jul 2019 11:34:10 -0700
Message-ID: <CALAqxLW0HWJpPUK5JBDhuQ_m3w6teWo6eg1BeEd9YcfSmG+iHQ@mail.gmail.com>
Subject: Re: [PATCH] usb: dwc3: Check for IOC/LST bit in both event->status
 and TRB->ctrl fields
To:     lkml <linux-kernel@vger.kernel.org>
Cc:     Anurag Kumar Vulisha <anurag.kumar.vulisha@xilinx.com>,
        Felipe Balbi <felipe.balbi@linux.intel.com>,
        Fei Yang <fei.yang@intel.com>,
        Thinh Nguyen <thinhn@synopsys.com>,
        Tejas Joglekar <tejas.joglekar@synopsys.com>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Linux USB List <linux-usb@vger.kernel.org>,
        stable <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jul 23, 2019 at 1:27 PM John Stultz <john.stultz@linaro.org> wrote:
>
> From: Anurag Kumar Vulisha <anurag.kumar.vulisha@xilinx.com>
>
> The present code in dwc3_gadget_ep_reclaim_completed_trb() will check
> for IOC/LST bit in the event->status and returns if IOC/LST bit is
> set. This logic doesn't work if multiple TRBs are queued per
> request and the IOC/LST bit is set on the last TRB of that request.
> Consider an example where a queued request has multiple queued TRBs
> and IOC/LST bit is set only for the last TRB. In this case, the Core
> generates XferComplete/XferInProgress events only for the last TRB
> (since IOC/LST are set only for the last TRB). As per the logic in
> dwc3_gadget_ep_reclaim_completed_trb() event->status is checked for
> IOC/LST bit and returns on the first TRB. This makes the remaining
> TRBs left unhandled.
> To aviod this, changed the code to check for IOC/LST bits in both
> event->status & TRB->ctrl. This patch does the same.
>
> At a practical level, this patch resolves USB transfer stalls seen
> with adb on dwc3 based Android devices after functionfs gadget
> added scatter-gather support around v4.20.
>
> Cc: Felipe Balbi <felipe.balbi@linux.intel.com>
> Cc: Fei Yang <fei.yang@intel.com>
> Cc: Thinh Nguyen <thinhn@synopsys.com>
> Cc: Tejas Joglekar <tejas.joglekar@synopsys.com>
> Cc: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
> Cc: Greg KH <gregkh@linuxfoundation.org>
> Cc: Linux USB List <linux-usb@vger.kernel.org>
> Cc: stable <stable@vger.kernel.org>
> Tested-By: Tejas Joglekar <tejas.joglekar@synopsys.com>
> Reviewed-by: Thinh Nguyen <thinhn@synopsys.com>
> Signed-off-by: Anurag Kumar Vulisha <anurag.kumar.vulisha@xilinx.com>
> [jstultz: forward ported to mainline, added note to commit log]
> Signed-off-by: John Stultz <john.stultz@linaro.org>
> ---
> Just wanted to send this out so we're all looking at the same thing.
> Not sure if its correct, but it seems to solve the adb stalls I've
> been seeing for awhile.

Felipe: Any thoughts on this patch?

thanks
-john
