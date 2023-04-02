Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7927B6D38EA
	for <lists+linux-usb@lfdr.de>; Sun,  2 Apr 2023 18:00:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230379AbjDBQAq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 2 Apr 2023 12:00:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230330AbjDBQAo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 2 Apr 2023 12:00:44 -0400
X-Greylist: delayed 383 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 02 Apr 2023 09:00:42 PDT
Received: from mail.turbocat.net (turbocat.net [88.99.82.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD50EC165
        for <linux-usb@vger.kernel.org>; Sun,  2 Apr 2023 09:00:42 -0700 (PDT)
Received: from [10.36.2.154] (unknown [46.212.121.255])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by mail.turbocat.net (Postfix) with ESMTPSA id 78113260C0B;
        Sun,  2 Apr 2023 17:54:18 +0200 (CEST)
Message-ID: <7dc47823-01a1-ac19-73d4-4bf7eb07f98d@selasky.org>
Date:   Sun, 2 Apr 2023 17:54:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; FreeBSD amd64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [Bug 217242] CPU hard lockup related to xhci/dma
Content-Language: en-US
To:     bugzilla-daemon@kernel.org, linux-usb@vger.kernel.org
References: <bug-217242-208809@https.bugzilla.kernel.org/>
 <bug-217242-208809-LGiVP9fz4d@https.bugzilla.kernel.org/>
From:   Hans Petter Selasky <hps@selasky.org>
In-Reply-To: <bug-217242-208809-LGiVP9fz4d@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 4/2/23 00:17, bugzilla-daemon@kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=217242
> 
> --- Comment #6 from Austin Domino (austin.domino@hotmail.com) ---
> (In reply to Austin Domino from comment #4)
>> The setup that created the output in the previous two attached log files is
>> described in more detail in related posts on:
>>
>> Ubuntu Forums -> https://ubuntuforums.org/showthread.php … st14136903
>> and
>> Ubuntu's Launchpad Bug Page -> https://bugs.launchpad.net/ubuntu/+sour …
>> ug/2013390
> Try 3 (I wish I could edit posts, but I should not have pressed "Save Changes"
> so quickly. Sorry about this comment and my incompetence):
> 
> Here are the actual links:
> 
> Ubuntu Forums ->
> https://ubuntuforums.org/showthread.php?t=2485480&p=14136903#post14136903
> and
> Ubuntu's Launchpad Bug Page ->
> https://bugs.launchpad.net/ubuntu/+source/linux/+bug/2013390
> 

Hi,

I don't have access to the bugzilla, but this looks like a out of memory 
situation, and does not really point towards the USB XHCI. URB's are 
typically submitted using
GFP_KERNEL, which allow memory allocators to sleep while waiting for 
more memory. GFP_ATOMIC does not allow sleeping.

usb_submit_urb(xxx, GFP_KERNEL);

While that being said, I wish the Linux USB core would take the example 
of the FreeBSD USB core, and pre-allocate all memory needed for USB 
transfers, also called URB's, during device attach. Frequently going 
through allocate and free cycles during operation, is not just 
inefficient, but also greatly degrades the ability to debug the system. 
USB is still quite essential when doing remote server access. Yeah, the 
serial port is great too, but one day inb() and outb() will die :-)

--HPS
