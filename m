Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0F503CC205
	for <lists+linux-usb@lfdr.de>; Sat, 17 Jul 2021 10:28:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231816AbhGQIbX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 17 Jul 2021 04:31:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230081AbhGQIbX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 17 Jul 2021 04:31:23 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEAD7C06175F
        for <linux-usb@vger.kernel.org>; Sat, 17 Jul 2021 01:28:26 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id g8-20020a1c9d080000b02901f13dd1672aso8183644wme.0
        for <linux-usb@vger.kernel.org>; Sat, 17 Jul 2021 01:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=nhvhha+2kzB0/kZXOUFnUJzvQ/MWo1Pyj706ZepwX14=;
        b=PsO9E+OcTGXDSIAOzyLt3/pbq2ll3VMj9AqrlYA22XKBntDSjmHcVcfSIQSJ28J4Sl
         r3oyn4yf9W1U4qWDFfdqg5uwna1xbICTOy+pypunHSlIa5TGgHz1/1eA2FHOHJuKz4ls
         xZ5GDOf7C9lkPwfxNCijPSquYKMTwCZLticxppYjrrC2oIqokZ7++6TZ+zDTkxbqnby8
         Ypx1Od+T515RDGuJTvWLtNjnwolyjluksPfWNG0yNhr0P+hNdVJpHxgG3A7YmATq8yvi
         icF55hRyCivaxcOl6Kb8O14m1YcNeotedss0w7tRmnHlO2f24Z0fwu/5vIYREsKE51si
         HAgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=nhvhha+2kzB0/kZXOUFnUJzvQ/MWo1Pyj706ZepwX14=;
        b=c5iFDMNKqy99wWR1MEnRKhHXNAoIATO97krL57Z2VVPd0/SLVjonoF7vDnonkAXvqV
         0FH5Iywe7j8+QcgyRlG4gOyj2MMQtsfwR5EV2VGFI+cEC99/uewGX3uoQwE7zm34oIZd
         B1xhXxoJYL7ouuqmUIsRqR5w9Zzwm8GeQSXFyYTNTOObw+xwNZkWeAzUSJtF76msqqPJ
         +p5lnzML25SgnJJwotGerHX298vOf76FoPoWZynsz1akr2L1RtwZfZVHnqo+Ep8D0AVk
         sUWnUkGiBIolZEOcNG6XMwhrRd4bEvDjyRsmUEF49+h2XxPMbuB0fxwqF9/NmtPltcnE
         n0oQ==
X-Gm-Message-State: AOAM531UhKr6/uqadj5U2rVYaI2qWisDdk0gvwLdfIGC/v2atIrh5nQx
        zrkvSyZ4kERWYOrnYGfinY378/v18rbDuQ==
X-Google-Smtp-Source: ABdhPJxLFDsh7kKyc8/gpnBnJ6Y9DXPGDmMvtATlF0yQR8qBD4t1QU+YtXLHx/P42/syA44ArHKj0w==
X-Received: by 2002:a05:600c:214a:: with SMTP id v10mr20308641wml.17.1626510504786;
        Sat, 17 Jul 2021 01:28:24 -0700 (PDT)
Received: from ?IPv6:2a02:908:1984:a6c0::17aa? ([2a02:908:1984:a6c0::17aa])
        by smtp.gmail.com with ESMTPSA id l24sm13268016wmi.30.2021.07.17.01.28.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Jul 2021 01:28:23 -0700 (PDT)
Subject: Re: Lacie Rugged USB3-FW does not work with UAS
From:   Julian Sikorski <belegdol@gmail.com>
To:     Oliver Neukum <oneukum@suse.com>,
        Nathan Stratton Treadway <vgerlists@nathanst.com>
Cc:     linux-usb@vger.kernel.org
References: <ffe7a644-bd56-3f3e-4673-f69f21f4132b@gmail.com>
 <1566567572.8347.54.camel@suse.com>
 <bedb5e9f-5332-4905-2237-347d7ea77447@gmail.com>
 <0eaecb64-4c67-110d-8493-31dd7fd58759@gmail.com>
 <1566595393.8347.56.camel@suse.com>
 <5f8f8e05-a29b-d868-b354-75ac48d40133@gmail.com>
 <a090c289-6b1a-8907-271a-069aea96ba2f@gmail.com>
 <1567424535.2469.11.camel@suse.com>
 <2a06a5dd-3fc9-0aac-a7e2-67be35e2d6bb@gmail.com>
 <20190904155831.GE4337@nathanst.com>
 <d11b22f3-3f09-2e3f-dc64-956193f2c5d3@gmail.com>
 <1568033125.365.17.camel@suse.com>
 <ed7f6cd6-b787-4876-2462-7977d69c8d4b@gmail.com>
Message-ID: <f4682d70-9623-c877-78a1-2cdf471014f6@gmail.com>
Date:   Sat, 17 Jul 2021 10:28:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <ed7f6cd6-b787-4876-2462-7977d69c8d4b@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am 09.09.19 um 18:18 schrieb Julian Sikorski:
> W dniu 09.09.2019 o 14:45, Oliver Neukum pisze:
>> Am Mittwoch, den 04.09.2019, 19:10 +0200 schrieb Julian Sikorski:
>>>
>>>
>>> Moreover, does this matter that the two Read Capacity errors only appear
>>> after the device is disconnected?
>>
>> Hi,
>>
>> yes it does. However, it didn't in the first log I looked at.
>> Could you check whether the command the failure happens on
>> is constant? That is, test a few times and look for differences.
>>
>>     Regards
>>         Oliver
>>
> Hello,
> 
> I can check again, but Idid at the old log again, the errors also 
> happened after disconnect with both logs I shared earlier - with the 
> first one there were some I/O errors in between:
> 
> [16216.299763] usb 6-3.4.2: USB disconnect, device number 4
> [16216.350027] print_req_error: I/O error, dev sdb, sector 0 flags 0
> [16216.350031] Buffer I/O error on dev sdb, logical block 0, async page 
> read
> [16216.350066] print_req_error: I/O error, dev sdb, sector 0 flags 0
> [16216.350073] Buffer I/O error on dev sdb, logical block 0, async page 
> read
> [16216.350093] print_req_error: I/O error, dev sdb, sector 0 flags 0
> [16216.350095] Buffer I/O error on dev sdb, logical block 0, async page 
> read
> [16216.350103] ldm_validate_partition_table(): Disk read failed.
> [16216.350121] print_req_error: I/O error, dev sdb, sector 0 flags 0
> [16216.350123] Buffer I/O error on dev sdb, logical block 0, async page 
> read
> [16216.350143] print_req_error: I/O error, dev sdb, sector 0 flags 0
> [16216.350145] Buffer I/O error on dev sdb, logical block 0, async page 
> read
> [16216.350167] print_req_error: I/O error, dev sdb, sector 0 flags 0
> [16216.350169] Buffer I/O error on dev sdb, logical block 0, async page 
> read
> [16216.350189] print_req_error: I/O error, dev sdb, sector 0 flags 0
> [16216.350191] Buffer I/O error on dev sdb, logical block 0, async page 
> read
> [16216.350199] Dev sdb: unable to read RDB block 0
> [16216.350215] print_req_error: I/O error, dev sdb, sector 0 flags 0
> [16216.350217] Buffer I/O error on dev sdb, logical block 0, async page 
> read
> [16216.350231] print_req_error: I/O error, dev sdb, sector 0 flags 0
> [16216.350233] Buffer I/O error on dev sdb, logical block 0, async page 
> read
> [16216.350239]  sdb: unable to read partition table
> [16216.514973] sd 12:0:0:0: [sdb] Read Capacity(16) failed: Result: 
> hostbyte=DID_ERROR driverbyte=DRIVER_OK
> [16216.514977] sd 12:0:0:0: [sdb] Sense not available.
> [16216.634949] sd 12:0:0:0: [sdb] Read Capacity(10) failed: Result:
> hostbyte=DID_ERROR driverbyte=DRIVER_OK
> 
> and
> 
> [  431.853505] usb 2-4: USB disconnect, device number 3
> [  431.903459] sd 12:0:0:0: [sdb] Optimal transfer size 33553920 bytes
> [  432.064456] sd 12:0:0:0: [sdb] Read Capacity(16) failed: Result: 
> hostbyte=DID_ERROR driverbyte=DRIVER_OK
> [  432.064459] sd 12:0:0:0: [sdb] Sense not available.
> [  432.184595] sd 12:0:0:0: [sdb] Read Capacity(10) failed: Result: 
> hostbyte=DID_ERROR driverbyte=DRIVER_OK
> 
> Best regards,
> Julian

Hi all,

apologies for necro-ing this thread. I have just tried this drive with 
my new laptop (Asus ZenBook UM425IA) and the same quirk was needed to 
get the drive to work:
options usb-storage quirks=059f:1061:u

Should we still try to get uas working with this drive or should I send 
a patch hardcoding a quirk? I am on 5.13.2-300.fc34.x86_64 kernel now. 
Thanks for the feedback in advance.

Best regards,
Julian
