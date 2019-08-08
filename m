Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1247B8599D
	for <lists+linux-usb@lfdr.de>; Thu,  8 Aug 2019 07:07:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730863AbfHHFHS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 8 Aug 2019 01:07:18 -0400
Received: from mga05.intel.com ([192.55.52.43]:28742 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725933AbfHHFHS (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 8 Aug 2019 01:07:18 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 07 Aug 2019 22:07:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,360,1559545200"; 
   d="scan'208";a="174736649"
Received: from pipin.fi.intel.com (HELO pipin) ([10.237.72.175])
  by fmsmga008.fm.intel.com with ESMTP; 07 Aug 2019 22:07:15 -0700
From:   Felipe Balbi <balbi@kernel.org>
To:     Yinbo Zhu <yinbo.zhu@nxp.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, open list <linux-kernel@vger.kernel.org>
Cc:     yinbo.zhu@nxp.com, xiaobo.xie@nxp.com, jiafei.pan@nxp.com,
        Ran Wang <ran.wang_1@nxp.com>
Subject: Re: [PATCH v1] usb: dwc3: remove the call trace of USBx_GFLADJ
In-Reply-To: <20190729064607.8131-1-yinbo.zhu@nxp.com>
References: <20190729064607.8131-1-yinbo.zhu@nxp.com>
Date:   Thu, 08 Aug 2019 08:07:14 +0300
Message-ID: <875zn8nt31.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Hi,

Yinbo Zhu <yinbo.zhu@nxp.com> writes:

> layerscape board sometimes reported some usb call trace, that is due to
> kernel sent LPM tokerns automatically when it has no pending transfers
> and think that the link is idle enough to enter L1, which procedure will
> ask usb register has a recovery,then kernel will compare USBx_GFLADJ and
> set GFLADJ_30MHZ, GFLADJ_30MHZ_REG until GFLADJ_30MHZ is equal 0x20, if
> the conditions were met then issue occur, but whatever the conditions
> whether were met that usb is all need keep GFLADJ_30MHZ of value is 0x20
> (xhci spec ask use GFLADJ_30MHZ to adjust any offset from clock source
> that generates the clock that drives the SOF counter, 0x20 is default
> value of it)That is normal logic, so need remove the call trace.
>
> Signed-off-by: Yinbo Zhu <yinbo.zhu@nxp.com>
> ---
>  drivers/usb/dwc3/core.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> index 98bce85c29d0..a133d8490322 100644
> --- a/drivers/usb/dwc3/core.c
> +++ b/drivers/usb/dwc3/core.c
> @@ -300,8 +300,7 @@ static void dwc3_frame_length_adjustment(struct dwc3 *dwc)
>  
>  	reg = dwc3_readl(dwc->regs, DWC3_GFLADJ);
>  	dft = reg & DWC3_GFLADJ_30MHZ_MASK;
> -	if (!dev_WARN_ONCE(dwc->dev, dft == dwc->fladj,
> -	    "request value same as default, ignoring\n")) {
> +	if (dft != dwc->fladj) {

if the value isn't different, why do you want to change it?

-- 
balbi
