Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2648B68BA06
	for <lists+linux-usb@lfdr.de>; Mon,  6 Feb 2023 11:24:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230128AbjBFKYM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Feb 2023 05:24:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230126AbjBFKYL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Feb 2023 05:24:11 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF2EBB76A
        for <linux-usb@vger.kernel.org>; Mon,  6 Feb 2023 02:24:10 -0800 (PST)
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BA13A4DA;
        Mon,  6 Feb 2023 11:24:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1675679046;
        bh=9mmiJjKJYl67HyYKXmTc/iuBW6uGGSOhbhEshpK5VBQ=;
        h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
        b=NqQzjg4pM6FsUiTiaNyVehEZNPjlex0oapmglWL8Sh7ff4BocQcIsOsf8g10rI+K2
         rl07tIc8hC0ulIl76zDed6QfzTocgOeJNcIT1D2wMG9BOgh9sVdLCUGqPbxY2cCGv1
         dmXh3KgXdB8HQ65bDMJYTUy62SnKSB5AYfWsWxW8=
Message-ID: <18f2b583-b355-9f6a-fb0f-fcfb41c168d9@ideasonboard.com>
Date:   Mon, 6 Feb 2023 10:24:03 +0000
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
From:   Dan Scally <dan.scally@ideasonboard.com>
Subject: Re: [PATCH v4 00/11] Add XU support to UVC Gadget
In-Reply-To: <Y+DQJ3tWRljP33f8@kroah.com>
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

Hi Greg

On 06/02/2023 10:02, Greg KH wrote:
> On Thu, Feb 02, 2023 at 01:54:57PM +0000, Daniel Scally wrote:
>> Hello all
>>
>> This series adds support for the definition of extension units in configfs for
>> the UVC Gadget. The XUs are modelled as config_items within a new "extensions"
>> group under control, which seemed like an appropriate place to put them.
>>
>> To allow the XU's to be inserted in the function graph, the bSourceID attribute
>> for the default output terminal is made writeable - users will need to configure
>> it with the bUnitID of the XU that they want to use as the OT's source. This does
>> mean that the XUs can _only_ be placed immediately preceding the OT, but I think
>> that that's fine for now.
>>
>> The XUs configured through this series have been tested via uvc-gadget, uvcvideo
>> and uvcdynctrl.
>>
>> This version is almost identical to v3 but rebased onto usb-testing, with minor
>> changes to 6/11 and 7/11.
>>
>> v2 of the series here: https://lore.kernel.org/linux-usb/0ae65812-c937-d071-455b-7c1d6418b080@ideasonboard.com/
> This series conflicts with the previous patch series you sent, how did
> you create this?


Do you mean conflicts with the previous version of this series, or with 
the "UVC Gadget: Extend color matching support" series? If the latter I 
rebased them separately onto usb-testing, so neither series knew about 
the other.

>
> Again, can you rebase and resubmit?


Sure, sorry about the hassle this morning!

>
> thanks,
>
> greg k-h
