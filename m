Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 708B0DFD8E
	for <lists+linux-usb@lfdr.de>; Tue, 22 Oct 2019 08:12:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731093AbfJVGLZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 22 Oct 2019 02:11:25 -0400
Received: from mga18.intel.com ([134.134.136.126]:52133 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726082AbfJVGLZ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 22 Oct 2019 02:11:25 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 21 Oct 2019 23:11:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,326,1566889200"; 
   d="scan'208";a="196337878"
Received: from pipin.fi.intel.com (HELO pipin) ([10.237.72.175])
  by fmsmga008.fm.intel.com with ESMTP; 21 Oct 2019 23:11:21 -0700
From:   Felipe Balbi <balbi@kernel.org>
To:     Michal Simek <michal.simek@xilinx.com>,
        Saurav Girepunje <saurav.girepunje@gmail.com>,
        gregkh@linuxfoundation.org, michal.simek@xilinx.com,
        swboyd@chromium.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     saurav.girepunje@hotmail.com
Subject: Re: [PATCH] usb: gadget: udc: Fix assignment of 0/1 to bool variables
In-Reply-To: <cfb871aa-332c-2256-d194-15f8b87de6f8@xilinx.com>
References: <20191007181527.GA6816@saurav> <cfb871aa-332c-2256-d194-15f8b87de6f8@xilinx.com>
Date:   Tue, 22 Oct 2019 09:11:21 +0300
Message-ID: <8736fl48dy.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Hi,

Michal Simek <michal.simek@xilinx.com> writes:
>> @@ -1952,9 +1952,9 @@ static void xudc_nonctrl_ep_handler(struct xusb_udc *udc, u8 epnum,
>>  	ep = &udc->ep[epnum];
>>  	/* Process the End point interrupts.*/
>>  	if (intrstatus & (XUSB_STATUS_EP0_BUFF1_COMP_MASK << epnum))
>> -		ep->buffer0ready = 0;
>> +		ep->buffer0ready = false;
>>  	if (intrstatus & (XUSB_STATUS_EP0_BUFF2_COMP_MASK << epnum))
>> -		ep->buffer1ready = 0;
>> +		ep->buffer1ready = false;
>>  
>>  	if (list_empty(&ep->queue))
>>  		return;
>> 
>
> Acked-by: Michal Simek <michal.simek@xilinx.com>

I don't have the original patch, sorry. Care to resend with Acks?

-- 
balbi
