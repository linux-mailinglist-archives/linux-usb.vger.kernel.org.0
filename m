Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F512ADCEB
	for <lists+linux-usb@lfdr.de>; Mon,  9 Sep 2019 18:18:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388808AbfIIQSO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 Sep 2019 12:18:14 -0400
Received: from mail-wm1-f49.google.com ([209.85.128.49]:53049 "EHLO
        mail-wm1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728311AbfIIQSO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 Sep 2019 12:18:14 -0400
Received: by mail-wm1-f49.google.com with SMTP id t17so249845wmi.2
        for <linux-usb@vger.kernel.org>; Mon, 09 Sep 2019 09:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ml5eLoN0xSDgqrXuI/ReYGuTTC1Hm6o/tTbXBqiFzJE=;
        b=BesgncDoMvf5lAOxvOcn9CzqAbT1sDL/JvvN95kXf9+gv39fbY23V82OmH9CuZlngO
         58ViFd85rIv+XZKlagQd6wuVsx1n0yK0qNp0ep7yxJAqep/kv1mWyk6KmkoSQLWIhFfZ
         KwlRuzj1YZO2TZ3bNB7kp7v0zG00CshNTyvB55RHrPRdpMilWXkSHp0HpRDtFtLobSr7
         6Bujf6OYI1512T8vlrczyAbD29N2Ns/HnKm+QgRkNd+5UHu4dcYNqa0CqExLp140CBDl
         zrTvxYBQHceb0fxJR1tBKbV1cekGcicVlTHNZCyKgLy8tR9n1cPCpsrLpgnDNlRj2po+
         XaNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ml5eLoN0xSDgqrXuI/ReYGuTTC1Hm6o/tTbXBqiFzJE=;
        b=eFnvF/gVfPyALW1dgtrPAdcnRJFP+2g1dl7tGbR3WsRJkH8ZtG1m6OJj5rvYaIR7Yh
         f33l+ObfVKpmLOdF9RYFG+hHgTCXUTEq9pUkZ2rves2mZa6R/sJSWjj28G1oWa2nXsSy
         ecP/TxUiF/457kzVhpo0r3gbHdl3Puf8Jpd/mLCn31oic2IqDRivlTqUDwGBOCKEK+qM
         oEu7/kxawdOZRsDB5HyfvKH3TOz/yjrbL9xcRF9A5mcEVCFYOgDTmj70oxwm1HOVHc0B
         HW7C6F4y+WpF9UEz1HzvVASUIVXKB1jCDeQrjYL/1PYk1DqDUJtuyYNAYf8E4AHo6Pqi
         ZWew==
X-Gm-Message-State: APjAAAVF2U0jYVfoC5OFFnAAmNJ6PCSqR+RgfGp9+BFZlgVOFdXUomQB
        RnO7fXjOP/gYAZweIq613OEbtdPY
X-Google-Smtp-Source: APXvYqxcq8ruikSMcgbGB4aeYWZ0dCtNE/44wX6WUnYlIof2qs9T7BP3ch15NjvqLGYRhJUxP/MC5A==
X-Received: by 2002:a1c:7302:: with SMTP id d2mr58788wmb.43.1568045891465;
        Mon, 09 Sep 2019 09:18:11 -0700 (PDT)
Received: from ?IPv6:2a02:908:1964:6740:dc2f:29cb:3162:2e00? ([2a02:908:1964:6740:dc2f:29cb:3162:2e00])
        by smtp.gmail.com with ESMTPSA id o8sm27192wmc.30.2019.09.09.09.18.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Sep 2019 09:18:10 -0700 (PDT)
Subject: Re: Lacie Rugged USB3-FW does not work with UAS
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
From:   Julian Sikorski <belegdol@gmail.com>
Message-ID: <ed7f6cd6-b787-4876-2462-7977d69c8d4b@gmail.com>
Date:   Mon, 9 Sep 2019 18:18:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <1568033125.365.17.camel@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: pl
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

W dniu 09.09.2019 o 14:45, Oliver Neukum pisze:
> Am Mittwoch, den 04.09.2019, 19:10 +0200 schrieb Julian Sikorski:
>>
>>
>> Moreover, does this matter that the two Read Capacity errors only appear
>> after the device is disconnected?
> 
> Hi,
> 
> yes it does. However, it didn't in the first log I looked at.
> Could you check whether the command the failure happens on
> is constant? That is, test a few times and look for differences.
> 
> 	Regards
> 		Oliver
> 
Hello,

I can check again, but Idid at the old log again, the errors also 
happened after disconnect with both logs I shared earlier - with the 
first one there were some I/O errors in between:

[16216.299763] usb 6-3.4.2: USB disconnect, device number 4
[16216.350027] print_req_error: I/O error, dev sdb, sector 0 flags 0
[16216.350031] Buffer I/O error on dev sdb, logical block 0, async page read
[16216.350066] print_req_error: I/O error, dev sdb, sector 0 flags 0
[16216.350073] Buffer I/O error on dev sdb, logical block 0, async page read
[16216.350093] print_req_error: I/O error, dev sdb, sector 0 flags 0
[16216.350095] Buffer I/O error on dev sdb, logical block 0, async page read
[16216.350103] ldm_validate_partition_table(): Disk read failed.
[16216.350121] print_req_error: I/O error, dev sdb, sector 0 flags 0
[16216.350123] Buffer I/O error on dev sdb, logical block 0, async page read
[16216.350143] print_req_error: I/O error, dev sdb, sector 0 flags 0
[16216.350145] Buffer I/O error on dev sdb, logical block 0, async page read
[16216.350167] print_req_error: I/O error, dev sdb, sector 0 flags 0
[16216.350169] Buffer I/O error on dev sdb, logical block 0, async page read
[16216.350189] print_req_error: I/O error, dev sdb, sector 0 flags 0
[16216.350191] Buffer I/O error on dev sdb, logical block 0, async page read
[16216.350199] Dev sdb: unable to read RDB block 0
[16216.350215] print_req_error: I/O error, dev sdb, sector 0 flags 0
[16216.350217] Buffer I/O error on dev sdb, logical block 0, async page read
[16216.350231] print_req_error: I/O error, dev sdb, sector 0 flags 0
[16216.350233] Buffer I/O error on dev sdb, logical block 0, async page read
[16216.350239]  sdb: unable to read partition table
[16216.514973] sd 12:0:0:0: [sdb] Read Capacity(16) failed: Result: 
hostbyte=DID_ERROR driverbyte=DRIVER_OK
[16216.514977] sd 12:0:0:0: [sdb] Sense not available.
[16216.634949] sd 12:0:0:0: [sdb] Read Capacity(10) failed: Result:
hostbyte=DID_ERROR driverbyte=DRIVER_OK

and

[  431.853505] usb 2-4: USB disconnect, device number 3
[  431.903459] sd 12:0:0:0: [sdb] Optimal transfer size 33553920 bytes
[  432.064456] sd 12:0:0:0: [sdb] Read Capacity(16) failed: Result: 
hostbyte=DID_ERROR driverbyte=DRIVER_OK
[  432.064459] sd 12:0:0:0: [sdb] Sense not available.
[  432.184595] sd 12:0:0:0: [sdb] Read Capacity(10) failed: Result: 
hostbyte=DID_ERROR driverbyte=DRIVER_OK

Best regards,
Julian
