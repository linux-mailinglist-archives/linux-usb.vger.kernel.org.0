Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E013C6ABF71
	for <lists+linux-usb@lfdr.de>; Mon,  6 Mar 2023 13:27:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229542AbjCFM1s (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Mar 2023 07:27:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229536AbjCFM1r (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Mar 2023 07:27:47 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2C7523DA1
        for <linux-usb@vger.kernel.org>; Mon,  6 Mar 2023 04:27:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.at; s=s31663417;
        t=1678105658; i=christian.schaubschlaeger@gmx.at;
        bh=7JXakcHF6f4M6t3YPZpxskB8h7AxudKEGaIkY+MLpoc=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=pzpYFKPTb3PeM7dWCI8PIUKF0hsy2scylyECNFfHjFyAfU3Rmw9BMj3n25Hfde6Qc
         xj/Ygycim6vz3HFa6BfsP5iNHGaLwFko/OC7ucnLygPxilHQyp7oBmtQcxLTLd2ek6
         qYQo5ADe/mR5yWOROdaclaL7+ZdR5JKGVG4MsqapGSpEi+Uy0gvSncFmZd7DNx9WeF
         wLtvf2ocx9ppK7qGfUQiKM4n0xSC0GrHyTNg027Oga0pMvqksFhrmI9SEn9d1RvSor
         xLggYTOoCgfGIJvqHRDUT1XqIDdD9GTCQ1sx7paxcuBO3NHh1S7XgvwY4dMLzMTCPy
         I6xtePk2Ftxvg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.70] ([81.189.232.75]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MKsnF-1prVEl0FTB-00LF9x; Mon, 06
 Mar 2023 13:27:38 +0100
Message-ID: <5cb1771f-47e2-c83f-1081-6e975ed650e0@gmx.at>
Date:   Mon, 6 Mar 2023 13:27:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: Possible problem with thunderbolt 4
Content-Language: en-US
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-usb@vger.kernel.org,
        "michael.simon@cpsd.at" <michael.simon@cpsd.at>
References: <Y72AbwKFd9snjZrJ@black.fi.intel.com>
 <3ccb150b-dbd9-c9d0-0e8c-8c169f0d8faf@gmx.at>
 <Y76TS54PJpmseZs3@black.fi.intel.com>
 <8c2da730-ba9b-6ec7-d493-1a6a2ce54622@gmx.at>
 <Y8kXFFrue7l7DKf3@black.fi.intel.com>
 <78c5218a-67ef-d61d-09fe-2c2cf7fdc87f@gmx.at>
 <0c9e644e-a07d-e9bb-f8d6-692d2412fd30@gmx.at>
 <Y9PDRYHHYNSJWwGe@black.fi.intel.com>
 <47af73e9-0d3f-0ac2-52e6-b89a87bc602b@gmx.at>
 <Y9fPxIKIOrkHmjHS@black.fi.intel.com>
 <20230306115236.GE62143@black.fi.intel.com>
From:   =?UTF-8?Q?Christian_Schaubschl=c3=a4ger?= 
        <christian.schaubschlaeger@gmx.at>
In-Reply-To: <20230306115236.GE62143@black.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:f0or0+kUQMw3NKQFIXi0pQ67muDPKamv8BmbA8t1hEKWqnKAaPS
 XOcc6Ckbx5g5Ljg18VNb5xVUnq4joTwEwjoBMhOkBkA37xw6tEHQJtgfg2sQcs4o43t9633
 NmvIcide6beMdbUzkXDkSHgvfvvYdVCRFYqOOYPUlJViTT+LGvjE5aG7DXjoRfN66JMWfD7
 x0xFRjh9s+L7GSbsl2yKA==
UI-OutboundReport: notjunk:1;M01:P0:pqxxNtOrLxI=;B30J7KQ/YRMurcy4Tzf6X6UPFSB
 Z4Hs7hK7EU4+3jQN+9wbdBWHdyTXGBcXK7v8YPWRi2Znt+PFpmsWQt2bsVE6yCIGpOllXAKWk
 jf77V8LyAz9rgOOfu7EjnCtcDDF1YON6yrJuKWoFEURwHYZh/cj63picXJO1/TD2LcstfLKIb
 Xvv/wIpbfu4ZYWdrs8qq2GV8OWNRD1QckAnVL9Wh7eRfL/qMGhSzv+Tjt1rKToaUGEUL84yPg
 q45y9k4cFdqKbGqrL4QmpgBZcKKOoCYPDYkG6PrPs6R8Vkj3XQiZiWNTbo5bgMTL4HFL2PwtY
 df+8w51Red7rxTaBVukdvRrJKZjY3VEMgygOoR374tfXKqCx5gdPKM+HAcTUYy15GAMjnOOHk
 GtCfn8BTgp3CGhRDAu1D7WOk4fH9arBX5WA6rGGH3MtJIrrVtDHuzGyVZavh2vHJHNlLK00/2
 69xmOOoDPG4wUhGMKIR6fJk2ePSUbIuCQQ6aTii3cxmHPAIKWjghZJQB3apjtWK2knX/N5y/Y
 IjyrsqVRqb+3UgQlTy1NJOJlv7IfyfYMCIxed6OMnz/o6gshvxd6oidwmeoFHaV0rFjS4/ebO
 7pJkkhXADJnWoX1Gs6RhNQVYyqSxSb0iEQvBJVhvps6dwjZfIeg8f/8oSBVpfYtlZwl2FrZ40
 wUZsln1X0vqJtXEcOv5K5pqrdpdnZZv4Q1b+ynRtGBFAr9gbwnWvgNk8vkJQsPI+cSWzRuBaf
 Phul+ldx3ld92HDme+JPd+D5C+GQFP69cmH3xw4RMc9DCygOx0YSLFwE+Rfn1pNG0VZUytxcQ
 5u5ubrMBeAVa6ysp2PuoQ2Yr4kaI3y+HmD16bhFZpYUEpjfLVMr1Z6xVMxBF5AzXGN3Hv32s9
 gAfwhvdj701pJhJzcMf6YCm4i7sizeetG0mAsGZT1wwIxsdjmqPVtnBUTWIzniVQSNlI+92jL
 86bjOg==
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Mika,

> We are able to reproduce the issue and it was root caused to be missing
> UNSET_INBOUND_SBTX port operation during retimer enumeration. I posted a
> series of fixes few minutes ago (with you Cc'd) and one of them should
> fix this issue:
>
> https://lore.kernel.org/linux-usb/20230306113605.46137-3-mika.westerberg@linux.intel.com/

That's great news, thank you!
I'll apply this patch to a 6.1.15 kernel and give it a try. Could take a day or two, though, beacause I don't have the hardware here at the moment. I'll let you know.

Thanks and best regards,
Christian

