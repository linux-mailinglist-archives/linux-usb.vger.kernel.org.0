Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 24B59642B2B
	for <lists+linux-usb@lfdr.de>; Mon,  5 Dec 2022 16:15:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230235AbiLEPPk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 5 Dec 2022 10:15:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231916AbiLEPPW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 5 Dec 2022 10:15:22 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51BAB64EF
        for <linux-usb@vger.kernel.org>; Mon,  5 Dec 2022 07:15:18 -0800 (PST)
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5AAED3D7;
        Mon,  5 Dec 2022 16:15:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1670253316;
        bh=DdIqeAnR/Q4a95826UmHZg5faqiYEe16ZwjhcQObQxc=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=ZBoIk4utFm8Zfpm5h491Te3nSuKvxx3EjLQNv8St6TH82+AIEahSokWS6k76jckLX
         Lx3ZAxSyIcfv+BNtOoca821InW6MV7E4FXt4JIYoY+heMN4yEBFQWtl8lo7ZWSUylg
         0dmkulBhprzxtN9ex/nT7bhuboLilxj5GZ87e9gQ=
Message-ID: <2ac579cd-959c-557c-5e7f-f3342a97741d@ideasonboard.com>
Date:   Mon, 5 Dec 2022 15:15:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] usb: gadget: uvc: Rename bmInterfaceFlags ->
 bmInterlaceFlags
Content-Language: en-US
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        mgr@pengutronix.de, kieran.bingham@ideasonboard.com
References: <20221205145807.1099062-1-dan.scally@ideasonboard.com>
 <Y44H33+G/ekqWEKv@kroah.com>
From:   Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <Y44H33+G/ekqWEKv@kroah.com>
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

On 05/12/2022 15:01, Greg KH wrote:
> On Mon, Dec 05, 2022 at 02:58:07PM +0000, Daniel Scally wrote:
>> In the specification documents for the Uncompressed and MJPEG USB
>> Video Payloads, the field name is bmInterlaceFlags - it has been
>> misnamed within the kernel.
>>
>> Although renaming the field does break the kernel's interface to
>> userspace it should be low-risk in this instance. The field is read
>> only and hardcoded to 0, so there was never any value in anyone
>> reading it. A search of our uvc-gadget application and all the major
>> forks that I could find for it did not reveal any users either.
> Note, if this does break someone, we will have to rename it back, ok?
>
Sounds reasonable to me. The patch Fixes: cdda479f15cd ("USB gadget: 
video class function driver")
