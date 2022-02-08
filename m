Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89AD14AD7E9
	for <lists+linux-usb@lfdr.de>; Tue,  8 Feb 2022 12:52:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358805AbiBHLvK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Feb 2022 06:51:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358060AbiBHLu4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Feb 2022 06:50:56 -0500
Received: from mxout03.lancloud.ru (mxout03.lancloud.ru [45.84.86.113])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0896BC03E931
        for <linux-usb@vger.kernel.org>; Tue,  8 Feb 2022 03:49:40 -0800 (PST)
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout03.lancloud.ru 8B0D020EF2D7
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: Re: [PATCH] usb: core: use sysfs_emit() instead of sprintf()
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>
References: <4248804f-d9eb-5e00-563f-28815cd42b65@omp.ru>
 <YgJSI8gbhKeVkgi3@kroah.com>
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <fe7888bd-5181-c4fe-3cee-7baec3d6ac71@omp.ru>
Date:   Tue, 8 Feb 2022 14:49:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YgJSI8gbhKeVkgi3@kroah.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT01.lancloud.ru (fd00:f066::141) To
 LFEX1907.lancloud.ru (fd00:f066::207)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2/8/22 2:21 PM, Greg Kroah-Hartman wrote:

>> sprintf() (still used in the USB core for the sysfs output) is vulnerable
>> to the buffer overflow.
> 
> Really?  Where?  If we have potential overflows, let's fix them as bug
> fixes and properly backport the fixes where needed.

   I must admit I didn't found any real overflows in my quick triage...

> If these really are just using the "old-style" functions instead, then
> that's something totally different and you should not say "vulnerable"
> if it really is not at all.

   Isn't sprint() generally considered harmful? :-)

>> Use the new-fangled sysfs_emit() instead.
>>
>> Found by Linux Verification Center (linuxtesting.org) with the SVACE static
>> analysis tool.
> 
> You mean coccinelle, right?

   Do you think coccinelle is the only code analyzer in this world? :-)
   I told you I was using SVACE (made by Russian Institute of the System Programming).

>  It's been checking for this for a while.
> 
> Also properly wrap your changelog at 72 columns please.

   Well, checkpatch.pl was content. :-)

> thanks,
> 
> greg k-h

MBR, Sergey
