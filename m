Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A1C164EDFC
	for <lists+linux-usb@lfdr.de>; Fri, 16 Dec 2022 16:32:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230447AbiLPPcx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 16 Dec 2022 10:32:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229627AbiLPPcv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 16 Dec 2022 10:32:51 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51947DFB3
        for <linux-usb@vger.kernel.org>; Fri, 16 Dec 2022 07:32:49 -0800 (PST)
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7F9ACA31;
        Fri, 16 Dec 2022 16:32:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1671204766;
        bh=gITIB40UCIhenJLBa68hquLycvRNBVciiZqcobuWXVw=;
        h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
        b=ApPg1jJYrtGjY/Ado9CBWbV6rCb2/J9Ys22NO23c4jWhLMv6rEyYRa4OJNIuQz4zU
         QQkaJ245IRlRlsP6Z1Mrikx9TKM6lzGh6U1LheAQ+UAyj+wjlcvEGuGmqSGedYgZwC
         bEMzvDVhS4xObymnYlc916D0qg+JJB7FirtnuRqk=
Message-ID: <6b7a930a-59e9-c4ca-f7f1-7ebcc89bc735@ideasonboard.com>
Date:   Fri, 16 Dec 2022 15:32:43 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        linux-usb@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, gregkh@linuxfoundation.org,
        w36195@motorola.com, m.grzeschik@pengutronix.de, torleiv@huddly.com
References: <20221213083736.2284536-1-dan.scally@ideasonboard.com>
 <20221213083736.2284536-5-dan.scally@ideasonboard.com>
 <167110488489.9133.920745374027359778@Monstersaurus>
From:   Dan Scally <dan.scally@ideasonboard.com>
Subject: Re: [PATCH 4/6] usb: gadget: uvc: Remove the hardcoded default color
 matching
In-Reply-To: <167110488489.9133.920745374027359778@Monstersaurus>
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

Hi Kieran

On 15/12/2022 11:48, Kieran Bingham wrote:
> Quoting Daniel Scally (2022-12-13 08:37:34)
>> A hardcoded default color matching descriptor is embedded in struct
>> f_uvc_opts but no longer has any use - remove it.
> Does this affect the legacy g_webcam, or is this part independent ?


It's not independent, but the legacy gadget doesn't use the 
uvc_color_matching member of f_uvc_opts. Instead that file has a static 
definition of the same thing [1], so this is safe to remove here.


The legacy version does actually have the same issue with just a single 
color matching descriptor trailing all the format/frame descriptors 
rather than once-per-format...I'll patch that too.

>
>> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
>> ---
>>   drivers/usb/gadget/function/f_uvc.c | 9 ---------
>>   drivers/usb/gadget/function/u_uvc.h | 1 -
>>   2 files changed, 10 deletions(-)
>>
>> diff --git a/drivers/usb/gadget/function/f_uvc.c b/drivers/usb/gadget/function/f_uvc.c
>> index 6e196e06181e..46bdea73cdeb 100644
>> --- a/drivers/usb/gadget/function/f_uvc.c
>> +++ b/drivers/usb/gadget/function/f_uvc.c
>> @@ -793,7 +793,6 @@ static struct usb_function_instance *uvc_alloc_inst(void)
>>          struct uvc_camera_terminal_descriptor *cd;
>>          struct uvc_processing_unit_descriptor *pd;
>>          struct uvc_output_terminal_descriptor *od;
>> -       struct uvc_color_matching_descriptor *md;
>>          struct uvc_descriptor_header **ctl_cls;
>>          int ret;
>>   
>> @@ -842,14 +841,6 @@ static struct usb_function_instance *uvc_alloc_inst(void)
>>          od->bSourceID                   = 2;
>>          od->iTerminal                   = 0;
>>   
>> -       md = &opts->uvc_color_matching;
>> -       md->bLength                     = UVC_DT_COLOR_MATCHING_SIZE;
>> -       md->bDescriptorType             = USB_DT_CS_INTERFACE;
>> -       md->bDescriptorSubType          = UVC_VS_COLORFORMAT;
>> -       md->bColorPrimaries             = 1;
>> -       md->bTransferCharacteristics    = 1;
>> -       md->bMatrixCoefficients         = 4;
>> -
>>          /* Prepare fs control class descriptors for configfs-based gadgets */
>>          ctl_cls = opts->uvc_fs_control_cls;
>>          ctl_cls[0] = NULL;      /* assigned elsewhere by configfs */
>> diff --git a/drivers/usb/gadget/function/u_uvc.h b/drivers/usb/gadget/function/u_uvc.h
>> index 24b8681b0d6f..577c1c48ca4a 100644
>> --- a/drivers/usb/gadget/function/u_uvc.h
>> +++ b/drivers/usb/gadget/function/u_uvc.h
>> @@ -52,7 +52,6 @@ struct f_uvc_opts {
>>          struct uvc_camera_terminal_descriptor           uvc_camera_terminal;
>>          struct uvc_processing_unit_descriptor           uvc_processing;
>>          struct uvc_output_terminal_descriptor           uvc_output_terminal;
>> -       struct uvc_color_matching_descriptor            uvc_color_matching;
>>   
>>          /*
>>           * Control descriptors pointers arrays for full-/high-speed and
>> -- 
>> 2.34.1
>>
