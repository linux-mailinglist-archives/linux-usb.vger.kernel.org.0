Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA83B50910C
	for <lists+linux-usb@lfdr.de>; Wed, 20 Apr 2022 22:05:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1381917AbiDTUG5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 20 Apr 2022 16:06:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1381910AbiDTUGy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 20 Apr 2022 16:06:54 -0400
Received: from mxout03.lancloud.ru (mxout03.lancloud.ru [45.84.86.113])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89E8F3DDC6
        for <linux-usb@vger.kernel.org>; Wed, 20 Apr 2022 13:04:04 -0700 (PDT)
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout03.lancloud.ru 5A21D20ED6DC
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: Re: [PATCH] usb: core: devices: use scnprintf() instead of sprintf()
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>
References: <ebfd7a94-34d2-6259-fa0c-4a5dcc649d2b@omp.ru>
 <Yl+q1QL2vkuKYPDx@kroah.com>
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <aab4aece-2a18-7caa-e735-a41ab26dff83@omp.ru>
Date:   Wed, 20 Apr 2022 23:04:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <Yl+q1QL2vkuKYPDx@kroah.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT01.lancloud.ru (fd00:f066::141) To
 LFEX1907.lancloud.ru (fd00:f066::207)
X-Spam-Status: No, score=-6.0 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello!

On 4/20/22 9:40 AM, Greg Kroah-Hartman wrote:

   Thanks for the (unusually?) prompt reply! :-)

>> The USB device dump code uses the sprintf() calls with a 2-page buffer,
>> leaving 256 bytes at the end of that buffer to prevent buffer overflow.
>> Using scnprntf() instead eliminates the very possibility of the buffer
>> overflow, while also simplifying the code. This however is achieved at
>> the expense of not printing the "(truncated)" line anymore when the end
>> of that buffer is actually reached; instead a possible partial line at
>> the end of buffer (not ending with '\n') is now not printed.
> 
> So you just changed a user-visable abi :(

    debugfs is an ABI too? :-)
 
> Please no, obviously that is not allowed.

    Oh, well...
   I'll prepare another patch then: some of the checks in this file are
clearly redundant...

> greg k-h

MBR, Sergey
