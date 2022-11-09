Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ECC56622849
	for <lists+linux-usb@lfdr.de>; Wed,  9 Nov 2022 11:21:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230009AbiKIKVs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Nov 2022 05:21:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229492AbiKIKVr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 9 Nov 2022 05:21:47 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E4DF20353
        for <linux-usb@vger.kernel.org>; Wed,  9 Nov 2022 02:21:46 -0800 (PST)
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E6FF7896;
        Wed,  9 Nov 2022 11:21:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1667989304;
        bh=buMdE7GhJKTV1We3EptyoiXd7HZvjvNqkieX7wpC48Y=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=E8uiCcK4mWFTam6KLydJtG40pHsQd1qewvu7Zvbz3/3RzexRyySnGzVT+y85B8J2+
         iGt/LkfsO1aU39LhQNczeaoSvLjXfUvVCRtsu+KTUQzvmX6jIbiglU25lYNXIqMoiT
         F8ruFBxTagIEPKfUmIB4+WU5zdAjyhvgq0V0fbRk=
Message-ID: <61cd1b4c-d44a-0c73-466b-80f3037e2680@ideasonboard.com>
Date:   Wed, 9 Nov 2022 10:21:41 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 1/4] usb: gadget: uvc: Make bSourceID read/write
Content-Language: en-US
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, balbi@kernel.org,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com,
        torleiv@huddly.com, mgr@pengutronix.de
References: <20221102151755.1022841-1-dan.scally@ideasonboard.com>
 <20221102151755.1022841-2-dan.scally@ideasonboard.com>
 <Y2t+/Sjl3NSsSMht@kroah.com>
From:   Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <Y2t+/Sjl3NSsSMht@kroah.com>
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

Morning

On 09/11/2022 10:20, Greg KH wrote:
> On Wed, Nov 02, 2022 at 03:17:52PM +0000, Daniel Scally wrote:
>> At the moment, the UVC function graph is hardcoded IT -> PU -> OT.
>> To add XU support we need the ability to insert the XU descriptors
>> into the chain. To facilitate that, make the output terminal's
>> bSourceID attribute writeable so that we can configure its source.
>>
>> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
>> ---
>>   drivers/usb/gadget/function/uvc_configfs.c | 59 +++++++++++++++++++++-
>>   1 file changed, 58 insertions(+), 1 deletion(-)
> Isn't there a documentation update needed here too?


Yes - sorry, I forgot documentation for the whole patchset. My bad, 
it'll be in the v2.

>
> thanks,
>
> greg k-h
