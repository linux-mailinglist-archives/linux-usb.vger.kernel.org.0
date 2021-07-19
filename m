Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 526DB3CE636
	for <lists+linux-usb@lfdr.de>; Mon, 19 Jul 2021 18:45:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349469AbhGSQC0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 19 Jul 2021 12:02:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350509AbhGSPvG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 19 Jul 2021 11:51:06 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33D5CC08E886
        for <linux-usb@vger.kernel.org>; Mon, 19 Jul 2021 08:45:00 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id d12so22674231wre.13
        for <linux-usb@vger.kernel.org>; Mon, 19 Jul 2021 09:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language;
        bh=+Mm+qkYTvWukqMgSS/Cb1YHP+DC3cfpcDhyw6ZF8lOE=;
        b=ah26NsaCBjlKz6ohvygNqHYHIKBegLdj5FdY5z3+fXBFqtlYC3aCLWZcRePbKIaMNF
         cSSPgVGJzPNb/0xDYeulVxLeg1xQst2si+b1c98RIkARI29dtcQ8Uz9tOZqvdzvwO07Q
         5ykuUIp2J65L9JQ0r07OwwzxBB0yJtUzbKHePSRZDPq85h5nS8yFFYfLkq/TJgcK3RCD
         R3mHGu2vuIDKAUZ0c/3ABcuGYWpTE5cv/s2NWzy+k7Qe8UMiApWz+mjl7MLTCqICW5cc
         J4DeG9VtKrKlL+zxb9ZjjQfTvM7G2S512kpCA3/9sM8MpwcWm0qIOD/DeaVrL+lAbgSN
         814A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language;
        bh=+Mm+qkYTvWukqMgSS/Cb1YHP+DC3cfpcDhyw6ZF8lOE=;
        b=lwFBuq7C3t/Dqwr2nXhTfo7lJMyT/bKKs3ngNrzI2pjqukkOAmD/buz6WwSUyYmbnn
         Z9Ma7eNu1DmkRldkVI+OwbSUZAauqqbvb6+Y2y7bjYw7B+Eb6vRo/b5czrOGeXRMvPgJ
         iHX69e2FlsAcF193nXgs/c9YZducfgEaZkiunkWg+xnrenhfjKu5GRtqKka39Ofv1rPk
         vuj0ZpUo7KWEkQ0tryrLFMRKRaz4MsONA22So+fWuFvJwXKnIHCXo4RcrpE0GO7VOe8L
         KY38c95YKNSw9pUkwbaX95WfR2bXt4XCgkuPIWXCyUElLz9MYLV5JcArSiNQ3Xrxf5bB
         EEXg==
X-Gm-Message-State: AOAM533+Gt4/KfodtmYyqayMmRvVxmmqfIz5OPTBRk3BpEiwAvgFWnJ3
        /Rb5OSuw9fRTgHOn2Pj/HzM=
X-Google-Smtp-Source: ABdhPJyxFvQQGKHZErdaSqGwwatID713ORYPTZKJRXLYYPG9JKQPF0X13kQ6jQ8tTwq15btLdiwkBQ==
X-Received: by 2002:a5d:4d0f:: with SMTP id z15mr3900327wrt.185.1626711012058;
        Mon, 19 Jul 2021 09:10:12 -0700 (PDT)
Received: from ?IPv6:2a02:908:1984:a6c0::ff60? ([2a02:908:1984:a6c0::ff60])
        by smtp.gmail.com with ESMTPSA id q19sm19725317wmq.38.2021.07.19.09.10.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jul 2021 09:10:11 -0700 (PDT)
Subject: Re: Lacie Rugged USB3-FW does not work with UAS
To:     Oliver Neukum <oneukum@suse.com>,
        Nathan Stratton Treadway <vgerlists@nathanst.com>
Cc:     linux-usb@vger.kernel.org, hdegoede@redhat.com
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
 <f4682d70-9623-c877-78a1-2cdf471014f6@gmail.com>
 <4c2b1c8a-4126-ccfe-3431-323c4935566e@suse.com>
From:   Julian Sikorski <belegdol@gmail.com>
Message-ID: <56cebf15-cf9d-475f-b388-b2be723697f6@gmail.com>
Date:   Mon, 19 Jul 2021 18:10:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <4c2b1c8a-4126-ccfe-3431-323c4935566e@suse.com>
Content-Type: multipart/mixed;
 boundary="------------B068DDD7BC96BD3308B81EC2"
Content-Language: en-US
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This is a multi-part message in MIME format.
--------------B068DDD7BC96BD3308B81EC2
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

W dniu 19.07.2021 o 14:47, Oliver Neukum pisze:
> 
>> Hi all,
>>
>> apologies for necro-ing this thread. I have just tried this drive with
>> my new laptop (Asus ZenBook UM425IA) and the same quirk was needed to
>> get the drive to work:
>> options usb-storage quirks=059f:1061:u
>>
>> Should we still try to get uas working with this drive or should I
>> send a patch hardcoding a quirk? I am on 5.13.2-300.fc34.x86_64 kernel
>> now. Thanks for the feedback in advance.
>>
> 
> Hi,
> 
> 
> sometimes we must give up. This thing is too elusive. Please send a
> patch with a quirk.
> 
>      Regards
> 
>          Oliver
> 
> 

Hi,

thanks for confirming. Patch is attached, it appears to be working 
correctly when applied against 5.13.3. Please let me know if changes are 
required.

Best regards,
Julian

--------------B068DDD7BC96BD3308B81EC2
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-Add-LaCie-Rugged-USB3-FW-to-IGNORE_UAS.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-Add-LaCie-Rugged-USB3-FW-to-IGNORE_UAS.patch"

From 01057f40aaf0036271dc401add9310dc63bfbcc1 Mon Sep 17 00:00:00 2001
From: Julian Sikorski <belegdol+github@gmail.com>
Date: Mon, 19 Jul 2021 17:27:16 +0200
Subject: [PATCH] Add LaCie Rugged USB3-FW to IGNORE_UAS

LaCie Rugged USB3-FW appears to be incompatible with UAS. It generates
errors like:
[ 1151.582598] sd 14:0:0:0: tag#16 uas_eh_abort_handler 0 uas-tag 1 inflight: IN
[ 1151.582602] sd 14:0:0:0: tag#16 CDB: Report supported operation codes a3 0c 01 12 00 00 00 00 02 00 00 00
[ 1151.588594] scsi host14: uas_eh_device_reset_handler start
[ 1151.710482] usb 2-4: reset SuperSpeed Gen 1 USB device number 2 using xhci_hcd
[ 1151.741398] scsi host14: uas_eh_device_reset_handler success
[ 1181.785534] scsi host14: uas_eh_device_reset_handler start
---
 drivers/usb/storage/unusual_uas.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/usb/storage/unusual_uas.h b/drivers/usb/storage/unusual_uas.h
index f9677a5ec31b..c35a6db993f1 100644
--- a/drivers/usb/storage/unusual_uas.h
+++ b/drivers/usb/storage/unusual_uas.h
@@ -45,6 +45,13 @@ UNUSUAL_DEV(0x059f, 0x105f, 0x0000, 0x9999,
 		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
 		US_FL_NO_REPORT_OPCODES | US_FL_NO_SAME),
 
+/* Reported-by: Julian Sikorski <belegdol@gmail.com> */
+UNUSUAL_DEV(0x059f, 0x1061, 0x0000, 0x9999,
+		"LaCie",
+		"Rugged USB3-FW",
+		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
+		US_FL_IGNORE_UAS),
+
 /*
  * Apricorn USB3 dongle sometimes returns "USBSUSBSUSBS" in response to SCSI
  * commands in UAS mode.  Observed with the 1.28 firmware; are there others?
-- 
2.31.1


--------------B068DDD7BC96BD3308B81EC2
Content-Type: text/plain; charset=UTF-8;
 name="lsusb.txt"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="lsusb.txt"

QnVzIDAwMiBEZXZpY2UgMDAyOiBJRCAwNTlmOjEwNjEgTGFDaWUsIEx0ZCBSdWdnZWQgVVNC
My1GVwpEZXZpY2UgRGVzY3JpcHRvcjoKICBiTGVuZ3RoICAgICAgICAgICAgICAgIDE4CiAg
YkRlc2NyaXB0b3JUeXBlICAgICAgICAgMQogIGJjZFVTQiAgICAgICAgICAgICAgIDMuMDAK
ICBiRGV2aWNlQ2xhc3MgICAgICAgICAgICAwIAogIGJEZXZpY2VTdWJDbGFzcyAgICAgICAg
IDAgCiAgYkRldmljZVByb3RvY29sICAgICAgICAgMCAKICBiTWF4UGFja2V0U2l6ZTAgICAg
ICAgICA5CiAgaWRWZW5kb3IgICAgICAgICAgIDB4MDU5ZiBMYUNpZSwgTHRkCiAgaWRQcm9k
dWN0ICAgICAgICAgIDB4MTA2MSBSdWdnZWQgVVNCMy1GVwogIGJjZERldmljZSAgICAgICAg
ICAgIDAuMDEKICBpTWFudWZhY3R1cmVyICAgICAgICAgICAyIExhQ2llCiAgaVByb2R1Y3Qg
ICAgICAgICAgICAgICAgMyBSdWdnZWQgVVNCMy1GVwogIGlTZXJpYWwgICAgICAgICAgICAg
ICAgIDEgMDAwMDAwMDAxNTdmOTI4OTIwZmEKICBiTnVtQ29uZmlndXJhdGlvbnMgICAgICAx
CiAgQ29uZmlndXJhdGlvbiBEZXNjcmlwdG9yOgogICAgYkxlbmd0aCAgICAgICAgICAgICAg
ICAgOQogICAgYkRlc2NyaXB0b3JUeXBlICAgICAgICAgMgogICAgd1RvdGFsTGVuZ3RoICAg
ICAgIDB4MDA3OQogICAgYk51bUludGVyZmFjZXMgICAgICAgICAgMQogICAgYkNvbmZpZ3Vy
YXRpb25WYWx1ZSAgICAgMQogICAgaUNvbmZpZ3VyYXRpb24gICAgICAgICAgMCAKICAgIGJt
QXR0cmlidXRlcyAgICAgICAgIDB4ODAKICAgICAgKEJ1cyBQb3dlcmVkKQogICAgTWF4UG93
ZXIgICAgICAgICAgICAgIDg5Nm1BCiAgICBJbnRlcmZhY2UgRGVzY3JpcHRvcjoKICAgICAg
Ykxlbmd0aCAgICAgICAgICAgICAgICAgOQogICAgICBiRGVzY3JpcHRvclR5cGUgICAgICAg
ICA0CiAgICAgIGJJbnRlcmZhY2VOdW1iZXIgICAgICAgIDAKICAgICAgYkFsdGVybmF0ZVNl
dHRpbmcgICAgICAgMAogICAgICBiTnVtRW5kcG9pbnRzICAgICAgICAgICAyCiAgICAgIGJJ
bnRlcmZhY2VDbGFzcyAgICAgICAgIDggTWFzcyBTdG9yYWdlCiAgICAgIGJJbnRlcmZhY2VT
dWJDbGFzcyAgICAgIDYgU0NTSQogICAgICBiSW50ZXJmYWNlUHJvdG9jb2wgICAgIDgwIEJ1
bGstT25seQogICAgICBpSW50ZXJmYWNlICAgICAgICAgICAgICAwIAogICAgICBFbmRwb2lu
dCBEZXNjcmlwdG9yOgogICAgICAgIGJMZW5ndGggICAgICAgICAgICAgICAgIDcKICAgICAg
ICBiRGVzY3JpcHRvclR5cGUgICAgICAgICA1CiAgICAgICAgYkVuZHBvaW50QWRkcmVzcyAg
ICAgMHg4MSAgRVAgMSBJTgogICAgICAgIGJtQXR0cmlidXRlcyAgICAgICAgICAgIDIKICAg
ICAgICAgIFRyYW5zZmVyIFR5cGUgICAgICAgICAgICBCdWxrCiAgICAgICAgICBTeW5jaCBU
eXBlICAgICAgICAgICAgICAgTm9uZQogICAgICAgICAgVXNhZ2UgVHlwZSAgICAgICAgICAg
ICAgIERhdGEKICAgICAgICB3TWF4UGFja2V0U2l6ZSAgICAgMHgwNDAwICAxeCAxMDI0IGJ5
dGVzCiAgICAgICAgYkludGVydmFsICAgICAgICAgICAgICAgMAogICAgICAgIGJNYXhCdXJz
dCAgICAgICAgICAgICAgMTUKICAgICAgRW5kcG9pbnQgRGVzY3JpcHRvcjoKICAgICAgICBi
TGVuZ3RoICAgICAgICAgICAgICAgICA3CiAgICAgICAgYkRlc2NyaXB0b3JUeXBlICAgICAg
ICAgNQogICAgICAgIGJFbmRwb2ludEFkZHJlc3MgICAgIDB4MDIgIEVQIDIgT1VUCiAgICAg
ICAgYm1BdHRyaWJ1dGVzICAgICAgICAgICAgMgogICAgICAgICAgVHJhbnNmZXIgVHlwZSAg
ICAgICAgICAgIEJ1bGsKICAgICAgICAgIFN5bmNoIFR5cGUgICAgICAgICAgICAgICBOb25l
CiAgICAgICAgICBVc2FnZSBUeXBlICAgICAgICAgICAgICAgRGF0YQogICAgICAgIHdNYXhQ
YWNrZXRTaXplICAgICAweDA0MDAgIDF4IDEwMjQgYnl0ZXMKICAgICAgICBiSW50ZXJ2YWwg
ICAgICAgICAgICAgICAwCiAgICAgICAgYk1heEJ1cnN0ICAgICAgICAgICAgICAxNQogICAg
SW50ZXJmYWNlIERlc2NyaXB0b3I6CiAgICAgIGJMZW5ndGggICAgICAgICAgICAgICAgIDkK
ICAgICAgYkRlc2NyaXB0b3JUeXBlICAgICAgICAgNAogICAgICBiSW50ZXJmYWNlTnVtYmVy
ICAgICAgICAwCiAgICAgIGJBbHRlcm5hdGVTZXR0aW5nICAgICAgIDEKICAgICAgYk51bUVu
ZHBvaW50cyAgICAgICAgICAgNAogICAgICBiSW50ZXJmYWNlQ2xhc3MgICAgICAgICA4IE1h
c3MgU3RvcmFnZQogICAgICBiSW50ZXJmYWNlU3ViQ2xhc3MgICAgICA2IFNDU0kKICAgICAg
YkludGVyZmFjZVByb3RvY29sICAgICA5OCAKICAgICAgaUludGVyZmFjZSAgICAgICAgICAg
ICAgMCAKICAgICAgRW5kcG9pbnQgRGVzY3JpcHRvcjoKICAgICAgICBiTGVuZ3RoICAgICAg
ICAgICAgICAgICA3CiAgICAgICAgYkRlc2NyaXB0b3JUeXBlICAgICAgICAgNQogICAgICAg
IGJFbmRwb2ludEFkZHJlc3MgICAgIDB4ODEgIEVQIDEgSU4KICAgICAgICBibUF0dHJpYnV0
ZXMgICAgICAgICAgICAyCiAgICAgICAgICBUcmFuc2ZlciBUeXBlICAgICAgICAgICAgQnVs
awogICAgICAgICAgU3luY2ggVHlwZSAgICAgICAgICAgICAgIE5vbmUKICAgICAgICAgIFVz
YWdlIFR5cGUgICAgICAgICAgICAgICBEYXRhCiAgICAgICAgd01heFBhY2tldFNpemUgICAg
IDB4MDQwMCAgMXggMTAyNCBieXRlcwogICAgICAgIGJJbnRlcnZhbCAgICAgICAgICAgICAg
IDAKICAgICAgICBiTWF4QnVyc3QgICAgICAgICAgICAgIDE1CiAgICAgICAgTWF4U3RyZWFt
cyAgICAgICAgICAgICAzMgogICAgICAgIERhdGEtaW4gcGlwZSAoMHgwMykKICAgICAgRW5k
cG9pbnQgRGVzY3JpcHRvcjoKICAgICAgICBiTGVuZ3RoICAgICAgICAgICAgICAgICA3CiAg
ICAgICAgYkRlc2NyaXB0b3JUeXBlICAgICAgICAgNQogICAgICAgIGJFbmRwb2ludEFkZHJl
c3MgICAgIDB4MDIgIEVQIDIgT1VUCiAgICAgICAgYm1BdHRyaWJ1dGVzICAgICAgICAgICAg
MgogICAgICAgICAgVHJhbnNmZXIgVHlwZSAgICAgICAgICAgIEJ1bGsKICAgICAgICAgIFN5
bmNoIFR5cGUgICAgICAgICAgICAgICBOb25lCiAgICAgICAgICBVc2FnZSBUeXBlICAgICAg
ICAgICAgICAgRGF0YQogICAgICAgIHdNYXhQYWNrZXRTaXplICAgICAweDA0MDAgIDF4IDEw
MjQgYnl0ZXMKICAgICAgICBiSW50ZXJ2YWwgICAgICAgICAgICAgICAwCiAgICAgICAgYk1h
eEJ1cnN0ICAgICAgICAgICAgICAxNQogICAgICAgIE1heFN0cmVhbXMgICAgICAgICAgICAg
MzIKICAgICAgICBEYXRhLW91dCBwaXBlICgweDA0KQogICAgICBFbmRwb2ludCBEZXNjcmlw
dG9yOgogICAgICAgIGJMZW5ndGggICAgICAgICAgICAgICAgIDcKICAgICAgICBiRGVzY3Jp
cHRvclR5cGUgICAgICAgICA1CiAgICAgICAgYkVuZHBvaW50QWRkcmVzcyAgICAgMHg4MyAg
RVAgMyBJTgogICAgICAgIGJtQXR0cmlidXRlcyAgICAgICAgICAgIDIKICAgICAgICAgIFRy
YW5zZmVyIFR5cGUgICAgICAgICAgICBCdWxrCiAgICAgICAgICBTeW5jaCBUeXBlICAgICAg
ICAgICAgICAgTm9uZQogICAgICAgICAgVXNhZ2UgVHlwZSAgICAgICAgICAgICAgIERhdGEK
ICAgICAgICB3TWF4UGFja2V0U2l6ZSAgICAgMHgwNDAwICAxeCAxMDI0IGJ5dGVzCiAgICAg
ICAgYkludGVydmFsICAgICAgICAgICAgICAgMAogICAgICAgIGJNYXhCdXJzdCAgICAgICAg
ICAgICAgMTUKICAgICAgICBNYXhTdHJlYW1zICAgICAgICAgICAgIDMyCiAgICAgICAgU3Rh
dHVzIHBpcGUgKDB4MDIpCiAgICAgIEVuZHBvaW50IERlc2NyaXB0b3I6CiAgICAgICAgYkxl
bmd0aCAgICAgICAgICAgICAgICAgNwogICAgICAgIGJEZXNjcmlwdG9yVHlwZSAgICAgICAg
IDUKICAgICAgICBiRW5kcG9pbnRBZGRyZXNzICAgICAweDA0ICBFUCA0IE9VVAogICAgICAg
IGJtQXR0cmlidXRlcyAgICAgICAgICAgIDIKICAgICAgICAgIFRyYW5zZmVyIFR5cGUgICAg
ICAgICAgICBCdWxrCiAgICAgICAgICBTeW5jaCBUeXBlICAgICAgICAgICAgICAgTm9uZQog
ICAgICAgICAgVXNhZ2UgVHlwZSAgICAgICAgICAgICAgIERhdGEKICAgICAgICB3TWF4UGFj
a2V0U2l6ZSAgICAgMHgwNDAwICAxeCAxMDI0IGJ5dGVzCiAgICAgICAgYkludGVydmFsICAg
ICAgICAgICAgICAgMAogICAgICAgIGJNYXhCdXJzdCAgICAgICAgICAgICAgIDAKICAgICAg
ICBDb21tYW5kIHBpcGUgKDB4MDEpCg==
--------------B068DDD7BC96BD3308B81EC2--
