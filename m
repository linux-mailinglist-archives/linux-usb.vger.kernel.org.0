Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 550476C9B9C
	for <lists+linux-usb@lfdr.de>; Mon, 27 Mar 2023 09:04:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229947AbjC0HEI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Mar 2023 03:04:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231840AbjC0HEH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 27 Mar 2023 03:04:07 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C53F5421D
        for <linux-usb@vger.kernel.org>; Mon, 27 Mar 2023 00:04:03 -0700 (PDT)
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D7CBE7FA;
        Mon, 27 Mar 2023 09:04:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1679900641;
        bh=6QkjMSrAfubt2RyulIGIdQ9T0qrT0Y4fcKOgqd4P8s8=;
        h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
        b=ieKo6RwX21QJ4vGehzGi6ZEhaYHUwB0WLrp4CWzG3saEQYQSwg8aF/Egdk6NWpgEY
         u9a0CNMtVbwLE3zvYQBg8iB3Lfg75T5LHsTJFN9EG/0ZjbepRZ2i9alXjDUojRkMgk
         J4dHbK01L1XZKT50r//vYy/oAqOhixIst0EJUIGY=
Message-ID: <0fe9b711-689e-d9ce-992b-79f128e5efe6@ideasonboard.com>
Date:   Mon, 27 Mar 2023 08:03:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
To:     Lidor Elkais <lelkais@kramerav.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <PA4PR05MB9282681AE7CF4F8ADD039FEFD5849@PA4PR05MB9282.eurprd05.prod.outlook.com>
Content-Language: en-US
From:   Dan Scally <dan.scally@ideasonboard.com>
Subject: Re: UVC-GADGET ISSUE
In-Reply-To: <PA4PR05MB9282681AE7CF4F8ADD039FEFD5849@PA4PR05MB9282.eurprd05.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS,
        SUBJ_ALL_CAPS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello Lidor

On 24/03/2023 21:30, Lidor Elkais wrote:
> Hi,
>
> i am using your uvc-gadget application(from your git-hub).


Anything from Github will be a fork, we haven't hosted the project there. In that case (depending on 
the specific fork) it may be either out of date (because we did quite some work recently) or else 
contain a lot of work that wasn't done by us. I'll still try to help, but it'll be easier if you're 
using the main repo since that's the one I'm familiar with, could you give it a try please: 
https://gitlab.freedesktop.org/camera/uvc-gadget/

> i have an issue, if you can help it will be great.
>
> i did shell script in order to configure the gadget(attached), when i am running your uvc app, the computer(windows - I connected via USB-Host) says "usb not recognized(set address failed)"
>
The script looks ok, can you share the output from stdout on the device when you run the application 
please? What's the hardware that you're running the uvc-gadget program on?
>
> the option for your app are below:
> ./uvc.elf -d -i P720.jpg -u /dev/video1 -r 0 -f 1 -o 1
>
> Uvc.elf - is your uvc-gadget application, I just compiled the files with my environment(Vitis)


And indeed the options here look like they're from wlhe's fork.


Thanks

Dan

>
>
> please help me,
>
> thanks,
> Lidor
>
> Lidor Elkais
> R&D Group, V&V Engineer
>
> 2 Negev St., Airport City
> 9546303, Israel
> Mobile: +972.52.547.4211
> lelkais@kramerav.com
>
>
>
