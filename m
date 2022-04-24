Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3D7850D2E3
	for <lists+linux-usb@lfdr.de>; Sun, 24 Apr 2022 17:36:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234758AbiDXPic (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 24 Apr 2022 11:38:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240693AbiDXPeR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 24 Apr 2022 11:34:17 -0400
Received: from mxout01.lancloud.ru (mxout01.lancloud.ru [45.84.86.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43480170E3F
        for <linux-usb@vger.kernel.org>; Sun, 24 Apr 2022 08:31:11 -0700 (PDT)
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout01.lancloud.ru E6FB520D5693
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: Re: [PATCH 1/2] usb: host: uhci-debug: use scnprintf() instead of
 sprintf()
To:     David Laight <David.Laight@ACULAB.COM>,
        Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
References: <20220312202834.11700-1-s.shtylyov@omp.ru>
 <20220312202834.11700-2-s.shtylyov@omp.ru>
 <5e5c26cde6814a56a00019d81d23f386@AcuMS.aculab.com>
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <d05977f4-daf4-64ab-df4d-2dc85df73b7d@omp.ru>
Date:   Sun, 24 Apr 2022 18:31:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <5e5c26cde6814a56a00019d81d23f386@AcuMS.aculab.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT01.lancloud.ru (fd00:f066::141) To
 LFEX1907.lancloud.ru (fd00:f066::207)
X-Spam-Status: No, score=-3.8 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 3/13/22 1:33 AM, David Laight wrote:

[...]
>> The UHCI driver's debugging code uses a lot of sprintf() calls with the
>> large buffers, leaving some space at the end of the buffers to handle the
>> buffer overflow. Using scnprntf() instead eliminates the very possibility
>> of the buffer overflow, while simplifying the code at the expense of not
>> printing an ellipsis when the end of buffer is actually reached...
> 
> Hmmm...
> 
> The old code seems to so:

   s/so/do/? :-)

>> -	out += sprintf(out, "(buf=%08x)\n", hc32_to_cpu(uhci, td->buffer));
>>
>> -	if (out - buf > len)
>> -		out += sprintf(out, " ...\n");
> 
> Which is going to overflow the output buffer unless there
> is enough 'tailroom' after buf[len] for all the sprintf()

   There are 1024 bytes (EXTRA_SPACE)...

> before any length check and the ellipsis.
> 
> The new code won't overrun buf[len] but also fails to
> '\n' terminate long lines.

   Yes.
   And one also has problems correctly identifying the overflowing lines (iff
such line ends exactly at end of buffer)... :-(

> So you probably do need a check for:
> 	if (out == len - 1 && buf[out - 1] != '\n')

   'out' is a pointer, you probably meant:

	if (out - buf == len - 1 && *(out - 1) != '\n')

> 		strcpy(buf + len - 5, "...\n");

   That's not exactly what's done by the existing code... I think we'd be
better off using strrchr()... but then again, we're not sure we have at least
5 bytes...

> 	David

[...]

MBR, Sergey
