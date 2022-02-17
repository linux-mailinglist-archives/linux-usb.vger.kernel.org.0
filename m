Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4BC8C4BA2E5
	for <lists+linux-usb@lfdr.de>; Thu, 17 Feb 2022 15:24:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234409AbiBQOYL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 17 Feb 2022 09:24:11 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:45370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231938AbiBQOYJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 17 Feb 2022 09:24:09 -0500
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79FCA2B1669
        for <linux-usb@vger.kernel.org>; Thu, 17 Feb 2022 06:23:54 -0800 (PST)
Received: from [192.168.0.2] (ip5f5aeb9b.dynamic.kabel-deutschland.de [95.90.235.155])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: pmenzel)
        by mx.molgen.mpg.de (Postfix) with ESMTPSA id 74D7B61E6478B;
        Thu, 17 Feb 2022 15:23:52 +0100 (CET)
Message-ID: <28018234-c7d7-df8e-e314-0a5a5f73f8cb@molgen.mpg.de>
Date:   Thu, 17 Feb 2022 15:23:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: Linux logs error `3:3: cannot set freq 24000 to ep 0x82`
Content-Language: en-US
To:     James <bjlockie@lockie.ca>
Cc:     Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
References: <734b8412-1e93-19ac-b7f5-24d703302a4d@molgen.mpg.de>
 <82b1c7ae-1755-4f15-979a-490b07de124d@lockie.ca>
From:   Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <82b1c7ae-1755-4f15-979a-490b07de124d@lockie.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Dear James,


Am 17.02.22 um 14:41 schrieb James:
> Feb. 17, 2022 06:07:16 Paul Menzel:

>> On the Dell OptiPlex 5055 connect a Logitech Webcam C270 over USB, Linux 5.10.93 reports the error below:
>>
>>       $ dmesg --level=err
>>       [   13.739837] usb 3-2: 3:3: cannot set freq 24000 to ep 0x82
> What problem do you experience?
> 
> https://www.techytalk.info/logitech-e3500-webcam-and-cannot-set-freq-16000-to-ep-0x86/

The user has not informed us about any problems specific related to the 
Webcam. But the user experiences desktop session freezes. I think it’s 
unrelated to the error message above, but while debugging errors always 
distract. So I am wondering, what that error means, and am asking for 
advise, how to continue to get rid of it. Is there some 
debugging/tracing option, showing the non-spec-compliant behavior, and 
which I could send to Logitech?

>>       $ dmesg | grep -e 'usb 3-2' -e input10
>>       [    4.682834] usb 3-2: new high-speed USB device number 2 using xhci_hcd
>>       [   12.268308] input: C270 HD WEBCAM as /devices/pci0000:00/0000:00:07.1/0000:05:00.3/usb3/3-2/3-2:1.0/input/input10
>>       [   13.709847] usb 3-2: current rate 16000 is different from the runtime rate 32000
>>       [   13.725839] usb 3-2: current rate 24000 is different from the runtime rate 16000
>>       [   13.739837] usb 3-2: 3:3: cannot set freq 24000 to ep 0x82
>>       [   13.864837] usb 3-2: set resolution quirk: cval->res = 384
>>       [   59.598714] usb 3-2: reset high-speed USB device number 2 using xhci_hcd
>>       [ 3921.003081] usb 3-2: reset high-speed USB device number 2 using xhci_hcd
>>       [ 3926.523106] usb 3-2: reset high-speed USB device number 2 using xhci_hcd
>>
>>       $ lsusb
>>       Bus 004 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
>>       Bus 003 Device 002: ID 046d:0825 Logitech, Inc. Webcam C270
>>       Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
>>       Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
>>       Bus 001 Device 002: ID 413c:301a Dell Computer Corp.
>>       Bus 001 Device 003: ID 413c:2113 Dell Computer Corp.
>>       Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
>>
>> What does that error mean exactly, and what can be done about it? Could the message be extended like “Report that problem to the USB device vendor to fix the firmware to be spec compliant.” or something like that? (If that is the case.)


Kind regards,

Paul
