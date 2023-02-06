Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 634E268BAD0
	for <lists+linux-usb@lfdr.de>; Mon,  6 Feb 2023 11:54:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229648AbjBFKyY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Feb 2023 05:54:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229502AbjBFKyX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Feb 2023 05:54:23 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6902F6EA2
        for <linux-usb@vger.kernel.org>; Mon,  6 Feb 2023 02:54:22 -0800 (PST)
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id F20A97FE;
        Mon,  6 Feb 2023 11:54:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1675680860;
        bh=YFVpYFQvxhzefDmYSl4dk8Kppd4T6BhtlNn/pWHfYcY=;
        h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
        b=Zx45XBiShgr2K+r2ByMcDO7iyWf0d1ZHMdMZGUIKB27NbD2sL2u/GNcR20G/ySacr
         s8OGDDOmfwiU1V7/cplNZr4qvgLHx1/tvJewZjW0yDUN1e6MP4zffSQM3d7tuDfcrj
         gxArCewqez6Unm7jgn9286pZ1px/+DCQ2QsmB49Y=
Message-ID: <174b5969-e461-3ce6-da0f-ab45e3e39fa2@ideasonboard.com>
Date:   Mon, 6 Feb 2023 10:54:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        mgr@pengutronix.de, balbi@kernel.org,
        kieran.bingham@ideasonboard.com, torleiv@huddly.com,
        stern@rowland.harvard.edu
References: <20230202135508.447109-1-dan.scally@ideasonboard.com>
 <Y+DQJ3tWRljP33f8@kroah.com>
 <18f2b583-b355-9f6a-fb0f-fcfb41c168d9@ideasonboard.com>
 <Y+DWdLJng2IW7vAe@kroah.com>
From:   Dan Scally <dan.scally@ideasonboard.com>
Subject: Re: [PATCH v4 00/11] Add XU support to UVC Gadget
In-Reply-To: <Y+DWdLJng2IW7vAe@kroah.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On 06/02/2023 10:29, Greg KH wrote:
> On Mon, Feb 06, 2023 at 10:24:03AM +0000, Dan Scally wrote:
>> Hi Greg
>>
>> On 06/02/2023 10:02, Greg KH wrote:
>>> On Thu, Feb 02, 2023 at 01:54:57PM +0000, Daniel Scally wrote:
>>>> Hello all
>>>>
>>>> This series adds support for the definition of extension units in configfs for
>>>> the UVC Gadget. The XUs are modelled as config_items within a new "extensions"
>>>> group under control, which seemed like an appropriate place to put them.
>>>>
>>>> To allow the XU's to be inserted in the function graph, the bSourceID attribute
>>>> for the default output terminal is made writeable - users will need to configure
>>>> it with the bUnitID of the XU that they want to use as the OT's source. This does
>>>> mean that the XUs can _only_ be placed immediately preceding the OT, but I think
>>>> that that's fine for now.
>>>>
>>>> The XUs configured through this series have been tested via uvc-gadget, uvcvideo
>>>> and uvcdynctrl.
>>>>
>>>> This version is almost identical to v3 but rebased onto usb-testing, with minor
>>>> changes to 6/11 and 7/11.
>>>>
>>>> v2 of the series here: https://lore.kernel.org/linux-usb/0ae65812-c937-d071-455b-7c1d6418b080@ideasonboard.com/
>>> This series conflicts with the previous patch series you sent, how did
>>> you create this?
>>
>> Do you mean conflicts with the previous version of this series, or with the
>> "UVC Gadget: Extend color matching support" series? If the latter I rebased
>> them separately onto usb-testing, so neither series knew about the other.
> The latter.  And if they know nothing about each other, how is anyone
> supposed to be able to apply both of them?


I had not really anticipated that they would be taken at the same time, 
so I was expecting to be rebasing one or the other at some point 
anyway...in that situation it seemed better to submit them both "clean" 
since neither inherently relies on the other.

>
> Please please please make my life easy to take your changes, not
> difficult, as this just makes me want to ignore your patches as I will
> inherently assume they are going to cause me problems...

Ack; I apologise - it's absolutely not my intention to make work for you.
>
> What would you do if you were in my place here?


I don't really know enough about the processes and deadlines you manage 
to make a judgement on that.

>
> thanks,
>
> greg k-h
