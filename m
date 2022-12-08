Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 77B46647354
	for <lists+linux-usb@lfdr.de>; Thu,  8 Dec 2022 16:40:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229756AbiLHPkJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 8 Dec 2022 10:40:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229783AbiLHPkF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 8 Dec 2022 10:40:05 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D4D917A91
        for <linux-usb@vger.kernel.org>; Thu,  8 Dec 2022 07:39:56 -0800 (PST)
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 31FA325B;
        Thu,  8 Dec 2022 16:39:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1670513994;
        bh=tHdQN75SzbyFxI2DjodcvZ38FkaCOOjeFuQH0u7hYDQ=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=i5NRp+YhjpnETf45Hf3Sol/AEV1wwgDcS7QaOglqBC5+Zq3rY2vZV3J4YBqTKNMUj
         ImsasQvijLnxNfh/ZyELuhCRJTyy1OCDh2jM7ebb6Ht3kZ5nCONOfbGdfcrcdgf6m1
         iyhFAEpgamVf60Wa7TVA8l9WpdSnADPevcu+Ipds=
Message-ID: <33adbf7d-e6e2-3a11-418b-ccf55197fc96@ideasonboard.com>
Date:   Thu, 8 Dec 2022 15:39:51 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/3] usb: gadget: uvc: Rename uvc_control_ep
Content-Language: en-US
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        mgr@pengutronix.de, kieran.bingham@ideasonboard.com
References: <20221205143758.1096914-1-dan.scally@ideasonboard.com>
 <20221205143758.1096914-2-dan.scally@ideasonboard.com>
 <Y5IDyPevtLR5qDCb@kroah.com>
From:   Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <Y5IDyPevtLR5qDCb@kroah.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg

On 08/12/2022 15:33, Greg KH wrote:
> On Mon, Dec 05, 2022 at 02:37:56PM +0000, Daniel Scally wrote:
>> The f_uvc code defines an endpoint named "uvc_control_ep" but it
>> is configured with a non-zero endpoint address and has its
>> bmAttributes flagged as USB_ENDPOINT_XFER_INT - this cannot be the
>> VideoControl interface's control endpoint, as the default endpoint
>> 0 is used for that purpose. This is instead the optional interrupt
>> endpoint that can be contained by a VideoControl interface.
>>
>> Rename the variables to make that clear.
> Does userspace documentation also need to be updated to reflect this
> change?


Not for this one I don't think; the data sent to userspace was already 
correct and isn't changing, it's just the internal variable name that 
is...but for #2/3 absolutely; I'll update the documentation in a v2.

> thanks,
>
> greg k-h
