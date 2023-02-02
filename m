Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46C85687E47
	for <lists+linux-usb@lfdr.de>; Thu,  2 Feb 2023 14:06:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231422AbjBBNGW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Feb 2023 08:06:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231546AbjBBNGV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Feb 2023 08:06:21 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12AA87AAF
        for <linux-usb@vger.kernel.org>; Thu,  2 Feb 2023 05:06:17 -0800 (PST)
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6106B505;
        Thu,  2 Feb 2023 14:06:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1675343174;
        bh=0M71MsNrGcKulxvb1Kpv6eFLim86OVA8AHlke0aMslY=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=EG6st9f3ETF07sV/PWht+aqi3O4JgBxz4Yx2pDYupvH+j2VrZHmY2f+e7PKhOOpEI
         db5IYIOl+nbtXsYDBMIW+tbXz+36r6op9l924G1JwaeYrqvTnPAmBUE3QqF08wjlBy
         6ctr/t8TpqvX4UbHlxv/Xu59loM6L9KPLaJlpOmw=
Message-ID: <53195215-0169-709c-fce9-ccc8081dbca0@ideasonboard.com>
Date:   Thu, 2 Feb 2023 13:06:11 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 06/11] usb: gadget: configfs: Support arbitrary string
 descriptors
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        laurent.pinchart@ideasonboard.com, mgr@pengutronix.de,
        balbi@kernel.org, kieran.bingham@ideasonboard.com,
        torleiv@huddly.com
References: <20230130093443.25644-1-dan.scally@ideasonboard.com>
 <20230130093443.25644-7-dan.scally@ideasonboard.com>
 <Y9fyXEOduSuEGSG1@rowland.harvard.edu>
Content-Language: en-US
From:   Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <Y9fyXEOduSuEGSG1@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Alan

On 30/01/2023 16:37, Alan Stern wrote:
> On Mon, Jan 30, 2023 at 09:34:38AM +0000, Daniel Scally wrote:
>> Add a framework to allow users to define arbitrary string descriptors
>> for a USB Gadget. This is modelled as a new type of config item rather
>> than as hardcoded attributes so as to be as flexible as possible.
>>
>> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
>> ---
>> Changes in v3:
>>
>> 	- Moved this functionality from the UVC function to usb gadget core.
>>
>> Changes in v2:
>>
>> 	- New patch
>>
>>   drivers/usb/gadget/configfs.c | 172 +++++++++++++++++++++++++++++++++-
>>   include/linux/usb/gadget.h    |  11 +++
>>   2 files changed, 181 insertions(+), 2 deletions(-)
> Shouldn't this patch also include an update to
> Documentation/usb/gadget_configfs.rst?


Yes; I'll update that before resubmitting.

> Alan Stern
