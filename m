Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 251F6649B81
	for <lists+linux-usb@lfdr.de>; Mon, 12 Dec 2022 10:57:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231728AbiLLJ5a (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 12 Dec 2022 04:57:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbiLLJ52 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 12 Dec 2022 04:57:28 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDF2960E1
        for <linux-usb@vger.kernel.org>; Mon, 12 Dec 2022 01:57:27 -0800 (PST)
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9C8646CF;
        Mon, 12 Dec 2022 10:57:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1670839046;
        bh=sP2InNjX93sTFuCYrZXzIUmqMQGq6PENrAFNT2M6gZg=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=Rt0YvO3T/NPjlmoWiKbFVN99QScdrVkxZC5sCbAX3kpDFoOn1Vtxao+PgzTdJ3zt+
         z7pQ3r3Bn99VsDfUjFY8nnYjldSMhVFx6yH5ziN0k7pjCE1YJwOJDw64BzfWs8jWfy
         GJgs12NDNmbhY+6g+EZHKV6o8JN8gUANKrz9pOho=
Message-ID: <809f3003-0e1b-19d8-6c27-1108933bb34b@ideasonboard.com>
Date:   Mon, 12 Dec 2022 09:57:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 0/9] Add XU support to UVC Gadget
Content-Language: en-US
To:     linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, gregkh@linuxfoundation.org,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com,
        torleiv@huddly.com, mgr@pengutronix.de
References: <20221121092517.225242-1-dan.scally@ideasonboard.com>
From:   Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20221121092517.225242-1-dan.scally@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello all


A gentle ping for any comments on this series :)


Thanks

Dan

On 21/11/2022 09:25, Daniel Scally wrote:
> Hello all
>
> This series adds support for the definition of extension units in configfs for
> the UVC Gadget. The XUs are modelled as config_items within a new "extensions"
> group under control, which seemed like an appropriate place to put them.
>
> To allow the XU's to be inserted in the function graph, the bSourceID attribute
> for the default output terminal is made writeable - users will need to configure
> it with the bUnitID of the XU that they want to use as the OT's source. This does
> mean that the XUs can _only_ be placed immediately preceding the OT, but I think
> that that's fine for now.
>
> Series level changes:
>
>    - Added patches 5-9 which additionally add the ability to create string
>    descriptors through configfs and link them to the extension units as well as
>    to override the default descriptors for the IAD and VC/VS interfaces
>
> The XUs configured through this series have been tested via uvc-gadget, uvcvideo
> and uvcdynctrl.
>
> Thanks
> Dan
>
>
> Daniel Scally (9):
>    usb: gadget: uvc: Make bSourceID read/write
>    usb: gadget: uvc: Generalise helper functions for reuse
>    usb: gadget: uvc: Allow definition of XUs in configfs
>    usb: gadget: uvc: Copy XU descriptors during .bind()
>    usb: gadget: uvc: Support arbitrary string descriptors
>    usb: gadget: uvc: Allow linking XUs to string descriptors
>    usb: gadget: uvc: Attach custom string descriptors
>    usb: gadget: uvc: Allow linking function to string descs
>    usb: gadget: uvc: Use custom strings if available
>
>   .../ABI/testing/configfs-usb-gadget-uvc       |   50 +-
>   drivers/usb/gadget/function/f_uvc.c           |  134 +-
>   drivers/usb/gadget/function/u_uvc.h           |   22 +
>   drivers/usb/gadget/function/uvc.h             |    1 +
>   drivers/usb/gadget/function/uvc_configfs.c    | 1087 ++++++++++++++++-
>   drivers/usb/gadget/function/uvc_configfs.h    |   60 +
>   6 files changed, 1283 insertions(+), 71 deletions(-)
>
