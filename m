Return-Path: <linux-usb+bounces-9131-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7189B89DB46
	for <lists+linux-usb@lfdr.de>; Tue,  9 Apr 2024 15:55:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DD21D1F214E4
	for <lists+linux-usb@lfdr.de>; Tue,  9 Apr 2024 13:55:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18D60131E5D;
	Tue,  9 Apr 2024 13:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="BzGslrMt"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A73C131E38
	for <linux-usb@vger.kernel.org>; Tue,  9 Apr 2024 13:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712670549; cv=none; b=N9jLyVucR8fm7xrRQnviG9eee/V67LdBCT0mQN/J79kEt+nIpiOxfYDnVL//deJzLnfJRR6vsxSj7rBV/sfLsUgAoUidtZTsGdMAMzKNIsUmaz7ZqMINMDWuKedARTgpSfpTXuAF15+edizRVjLR6hq0ZxzO+8efxo4fHTDD/Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712670549; c=relaxed/simple;
	bh=wM6peVVvl7MgVpdlk7gWiYguSw06x4u1k5dwUnp3dxM=;
	h=Content-Type:Message-ID:Date:MIME-Version:To:Cc:From:Subject; b=XAMlVp5ZKv5FKrb0LK/W32GKA9PetVlsJ+AANAwR/qT/nJQQo9o5hVLuVTFwPQ45Z3EvIrB+Z/JHXXyVF2/abQGcGJ+q/3Cm/McAZFuZW1S0taB0BSVvm7aQHCkHJ6JAU/qUkHrbEJHFgqNc0wtKHDONxoi7GNcKgni64zMFp+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=BzGslrMt; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2d8b194341eso4406181fa.3
        for <linux-usb@vger.kernel.org>; Tue, 09 Apr 2024 06:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1712670545; x=1713275345; darn=vger.kernel.org;
        h=subject:from:cc:to:content-language:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=V0NJEcLtlxRNFaRk4UQ8IVwgUEJW0pWbdYZuVQzaD1s=;
        b=BzGslrMtQD2pzODZmsyxNHvZPD6kaE5ox5F+h6I5AqY9NOK25RVtFmgqaLgEvQrBVq
         24L3gJsCy/3d4HOfacojTQUYRDi8xSGdn5rwaqAlyIJznUJ6e8lbE8bNIhiknHxu3Pmo
         WnsRpx/qKNG4xWZahAyINpWu0dn3IbBwLxLHRA9m2Ncux/EciMKJTp2U81EIgIFy0s3l
         PV4D6iR2+zriI/frUUFMt0koKNRoubT6zpU114aHlDowqBtw5/fP6EYEYPOHLTO5IY6r
         J0xjo003Fcw9S3MVpP3IX7XuWFoIIahBvLjXn/IYc1u8YbhWFNi9tyUbvFrkATRJhIOS
         7bDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712670545; x=1713275345;
        h=subject:from:cc:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V0NJEcLtlxRNFaRk4UQ8IVwgUEJW0pWbdYZuVQzaD1s=;
        b=l3OB8DWRz9WyZnbqwdvgnG9y3XB1WUDHmvp0LRJjdU+IQBFfLQbTkiq62SjmqN9cWh
         S5V6AR9weDOrKVAdhjcoNbWEFu5bXB76XPPRAsCPOVED1FFA7ue8HZFNUvp0juYNPJWO
         89oNZespmgYS4Fbh+O97lzwJ/gUa8VBFKODvLhPdtCgPJyLGZUn3wrVn526XJvTFJzqC
         C9mOg7z2BATHsc4pv+z8rnuB17yeztWwnLlgfHZvvDzuON2u81odSY7GcHzZHE6KoxcB
         75r2axCKutsBelYRUeDUIUKF6V8i5M9ORZHJ5qwsuo1RmojPY7oB4WwuA2qvyOIpH4/r
         J1fg==
X-Gm-Message-State: AOJu0Yx8SXstCpspj8hbUzKsbzanO1wam1XJ3yf6WN+OJt0ygsAOJeNB
	I4TxYytNVhshGay8BYtltaeUHvJoU0eUkoT1IWMHKNB65uHWgIt5XNaFJ0O6fvsxBCtKrYYmt8H
	6
X-Google-Smtp-Source: AGHT+IGhMBhegzK8ej6WlLGgirhZaTbzdK1mDDoErDXtnHJcH5Ma8DcYThDg7os8PT39O1mmHwfaUw==
X-Received: by 2002:a05:6512:ac5:b0:516:d280:f588 with SMTP id n5-20020a0565120ac500b00516d280f588mr9888256lfu.42.1712670544847;
        Tue, 09 Apr 2024 06:49:04 -0700 (PDT)
Received: from ?IPV6:2001:a61:1366:6801:b2db:904d:e0b0:46ec? ([2001:a61:1366:6801:b2db:904d:e0b0:46ec])
        by smtp.gmail.com with ESMTPSA id o9-20020aa7c509000000b0056bf6287f32sm5209052edq.26.2024.04.09.06.49.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Apr 2024 06:49:04 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------VzikJjLr21pqMg9wAXeW5TeF"
Message-ID: <9efbd569-7059-4575-983f-0ea30df41871@suse.com>
Date: Tue, 9 Apr 2024 15:49:01 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Alan Stern <stern@rowland.harvard.edu>
Cc: USB list <linux-usb@vger.kernel.org>, Takashi Iwai <tiwai@suse.de>
From: Oliver Neukum <oneukum@suse.com>
Subject: Regression due to 59cf44575456 ("USB: core: Fix oversight in
 SuperSpeed initialization")

This is a multi-part message in MIME format.
--------------VzikJjLr21pqMg9wAXeW5TeF
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

with the following device:

Bus 002 Device 002: ID fb5d:0001 BHYVE HID Tablet
Device Descriptor:
   bLength                18
   bDescriptorType         1
   bcdUSB               3.00
   bDeviceClass            0
   bDeviceSubClass         0
   bDeviceProtocol         0
   bMaxPacketSize0         8
   idVendor           0xfb5d
   idProduct          0x0001
   bcdDevice            0.00
   iManufacturer           1 BHYVE
   iProduct                2 HID Tablet
   iSerial                 3 01
   bNumConfigurations      1
   Configuration Descriptor:
     bLength                 9
     bDescriptorType         2
     wTotalLength       0x0028
     bNumInterfaces          1
     bConfigurationValue     1
     iConfiguration          4 HID Tablet Device
     bmAttributes         0xa0
       (Bus Powered)
       Remote Wakeup
     MaxPower                0mA
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        0
       bAlternateSetting       0
       bNumEndpoints           1
       bInterfaceClass         3 Human Interface Device
       bInterfaceSubClass      1 Boot Interface Subclass
       bInterfaceProtocol      2 Mouse
       iInterface              0
         HID Device Descriptor:
           bLength                 9
           bDescriptorType        33
           bcdHID              10.01
           bCountryCode            0 Not supported
           bNumDescriptors         1
           bDescriptorType        34 Report
           wDescriptorLength      74
          Report Descriptors:
            ** UNAVAILABLE **
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x81  EP 1 IN
         bmAttributes            3
           Transfer Type            Interrupt
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0008  1x 8 bytes
         bInterval              10
         bMaxBurst               0
Binary Object Store Descriptor:
   bLength                 5
   bDescriptorType        15
   wTotalLength       0x000f
   bNumDeviceCaps          1
   SuperSpeed USB Device Capability:
     bLength                10
     bDescriptorType        16
     bDevCapabilityType      3
     bmAttributes         0x00
     wSpeedsSupported   0x0008
       Device can operate at SuperSpeed (5Gbps)
     bFunctionalitySupport   3
       Lowest fully-functional device speed is SuperSpeed (5Gbps)
     bU1DevExitLat          10 micro seconds
     bU2DevExitLat          32 micro seconds
Device Status:     0x0000
   (Bus Powered)

we are getting a regression on enumeration. It used to work with the
code prior to your patch. Takashi is proposing the attached fixed.
It looks like we are a bit too restrictive and should just try.

	Regards
		Oliver
--------------VzikJjLr21pqMg9wAXeW5TeF
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-USB-hub-Workaround-for-buggy-max-packet-size-with-su.patch"
Content-Disposition: attachment;
 filename*0="0001-USB-hub-Workaround-for-buggy-max-packet-size-with-su.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbTogVGFrYXNoaSBJd2FpIDx0aXdhaUBzdXNlLmRlPgpTdWJqZWN0OiBbUEFUQ0hdIFVT
QjogaHViOiBXb3JrYXJvdW5kIGZvciBidWdneSBtYXggcGFja2V0IHNpemUgd2l0aCBzdXBl
cgogc3BlZWQKUGF0Y2gtbWFpbmxpbmU6IE5vdCB5ZXQsIHRlc3RpbmcKUmVmZXJlbmNlczog
YnNjIzEyMjA1NjkKClNpZ25lZC1vZmYtYnk6IFRha2FzaGkgSXdhaSA8dGl3YWlAc3VzZS5k
ZT4KCi0tLQogZHJpdmVycy91c2IvY29yZS9odWIuYyB8IDEzICsrKysrKysrKystLS0KIDEg
ZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvdXNiL2NvcmUvaHViLmMgYi9kcml2ZXJzL3VzYi9jb3JlL2h1Yi5j
CmluZGV4IGUzOGE0MTI0ZjYxMC4uNjQxOTNlZmZjNDU2IDEwMDY0NAotLS0gYS9kcml2ZXJz
L3VzYi9jb3JlL2h1Yi5jCisrKyBiL2RyaXZlcnMvdXNiL2NvcmUvaHViLmMKQEAgLTQ4MzAs
NyArNDgzMCw3IEBAIGh1Yl9wb3J0X2luaXQoc3RydWN0IHVzYl9odWIgKmh1Yiwgc3RydWN0
IHVzYl9kZXZpY2UgKnVkZXYsIGludCBwb3J0MSwKIAljb25zdCBjaGFyCQkqZHJpdmVyX25h
bWU7CiAJYm9vbAkJCWRvX25ld19zY2hlbWU7CiAJY29uc3QgYm9vbAkJaW5pdGlhbCA9ICFk
ZXZfZGVzY3I7Ci0JaW50CQkJbWF4cDA7CisJaW50CQkJbWF4cDAsIGVwMF9tYXhwOwogCXN0
cnVjdCB1c2JfZGV2aWNlX2Rlc2NyaXB0b3IJKmJ1ZiwgKmRlc2NyOwogCiAJYnVmID0ga21h
bGxvYyhHRVRfREVTQ1JJUFRPUl9CVUZTSVpFLCBHRlBfTk9JTyk7CkBAIC01MDcwLDcgKzUw
NzAsOCBAQCBodWJfcG9ydF9pbml0KHN0cnVjdCB1c2JfaHViICpodWIsIHN0cnVjdCB1c2Jf
ZGV2aWNlICp1ZGV2LCBpbnQgcG9ydDEsCiAJCWVsc2UKIAkJCWkgPSAwOwkJLyogSW52YWxp
ZCAqLwogCX0KLQlpZiAodXNiX2VuZHBvaW50X21heHAoJnVkZXYtPmVwMC5kZXNjKSA9PSBp
KSB7CisJZXAwX21heHAgPSB1c2JfZW5kcG9pbnRfbWF4cCgmdWRldi0+ZXAwLmRlc2MpOwor
CWlmIChlcDBfbWF4cCA9PSBpKSB7CiAJCTsJLyogSW5pdGlhbCBlcDAgbWF4cGFja2V0IGd1
ZXNzIGlzIHJpZ2h0ICovCiAJfSBlbHNlIGlmICgodWRldi0+c3BlZWQgPT0gVVNCX1NQRUVE
X0ZVTEwgfHwKIAkJCQl1ZGV2LT5zcGVlZCA9PSBVU0JfU1BFRURfSElHSCkgJiYKQEAgLTUw
ODIsOSArNTA4MywxNSBAQCBodWJfcG9ydF9pbml0KHN0cnVjdCB1c2JfaHViICpodWIsIHN0
cnVjdCB1c2JfZGV2aWNlICp1ZGV2LCBpbnQgcG9ydDEsCiAJCQlkZXZfd2FybigmdWRldi0+
ZGV2LCAiVXNpbmcgZXAwIG1heHBhY2tldDogJWRcbiIsIGkpOwogCQl1ZGV2LT5lcDAuZGVz
Yy53TWF4UGFja2V0U2l6ZSA9IGNwdV90b19sZTE2KGkpOwogCQl1c2JfZXAwX3JlaW5pdCh1
ZGV2KTsKKwl9IGVsc2UgaWYgKHVkZXYtPnNwZWVkID49IFVTQl9TUEVFRF9TVVBFUiAmJiBp
bml0aWFsKSB7CisJCS8qIEZJWE1FOiBzaG91bGQgYmUgbW9yZSByZXN0cmljdGl2ZT8gKi8K
KwkJLyogSW5pdGlhbCBndWVzcyBpcyB3cm9uZzsgdXNlIHRoZSBkZXNjcmlwdG9yJ3MgdmFs
dWUgKi8KKwkJZGV2X3dhcm4oJnVkZXYtPmRldiwgIlVzaW5nIGVwMCBtYXhwYWNrZXQ6ICVk
XG4iLCBpKTsKKwkJdWRldi0+ZXAwLmRlc2Mud01heFBhY2tldFNpemUgPSBjcHVfdG9fbGUx
NihpKTsKKwkJdXNiX2VwMF9yZWluaXQodWRldik7CiAJfSBlbHNlIHsKIAkJLyogSW5pdGlh
bCBndWVzcyBpcyB3cm9uZyBhbmQgZGVzY3JpcHRvcidzIHZhbHVlIGlzIGludmFsaWQgKi8K
LQkJZGV2X2VycigmdWRldi0+ZGV2LCAiSW52YWxpZCBlcDAgbWF4cGFja2V0OiAlZFxuIiwg
bWF4cDApOworCQlkZXZfZXJyKCZ1ZGV2LT5kZXYsICJJbnZhbGlkIGVwMCBtYXhwYWNrZXQ6
ICVkLCBleHBlY3RlZCAlZFxuIiwgbWF4cDAsIGVwMF9tYXhwKTsKIAkJcmV0dmFsID0gLUVN
U0dTSVpFOwogCQlnb3RvIGZhaWw7CiAJfQotLSAKMi4zNS4zCgo=

--------------VzikJjLr21pqMg9wAXeW5TeF--

