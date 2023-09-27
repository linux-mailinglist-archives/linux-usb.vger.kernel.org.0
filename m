Return-Path: <linux-usb+bounces-655-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B95D97B0964
	for <lists+linux-usb@lfdr.de>; Wed, 27 Sep 2023 17:53:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 8042428216F
	for <lists+linux-usb@lfdr.de>; Wed, 27 Sep 2023 15:53:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1C8C48EA4;
	Wed, 27 Sep 2023 15:53:45 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF3C0111AB
	for <linux-usb@vger.kernel.org>; Wed, 27 Sep 2023 15:53:43 +0000 (UTC)
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C45BF1BDF
	for <linux-usb@vger.kernel.org>; Wed, 27 Sep 2023 08:53:41 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-5333fb34be3so13496678a12.1
        for <linux-usb@vger.kernel.org>; Wed, 27 Sep 2023 08:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695830020; x=1696434820; darn=vger.kernel.org;
        h=user-agent:mime-version:date:content-transfer-encoding:face
         :references:in-reply-to:cc:to:reply-to:subject:message-id:from:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EblRpKT4YNl3IVPaeHJAXmLKI/NP17DrSz5iFIVNMU8=;
        b=PGFqNyeLtysvrvLfxlKNj1tEQAOzJeDPSq0tAtTcyE7D1DSTnlWlqfqlfy4cMOVL8f
         wGvudeMvzksVZwsnvmzYwl57yoR+h8NgGQV8hT0fNJyxck64wT1bK8qv53pr8esdfORT
         6L5x1I+XoamizJNOO8ebwniODrusRgd6wGrdDnzd0QvyKDzd0jTeydlGg7Q/sXwL5l4h
         xK2R6c38UjmG/oGg6I0Q85sZyO5NQVY6eNocEXvsHEU0wG14ex1bY5u7BdTpKugL+KeU
         FSUZbEreaDmWjuXaAwKpee0IHH/UjzGPD1kBi4SULiorMYGE0pSt1Qfirnu+1Qk4gBFg
         NstA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695830020; x=1696434820;
        h=user-agent:mime-version:date:content-transfer-encoding:face
         :references:in-reply-to:cc:to:reply-to:subject:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EblRpKT4YNl3IVPaeHJAXmLKI/NP17DrSz5iFIVNMU8=;
        b=SjXbUTWYdindqc2qZs4El5MozfaNJtAVJ2Yl9Ht6Lkx+NiFINqy6kgIr3z4FQ+IvG3
         Qq8P1dKQRROXFNPOGITUr2XZateCiXahSpNCrpyq9ccoTHhkTU8CTXFiHtH/dla0qth7
         iZfrUJlXyUmAdyOHVwc27reYIvrO6hm/wW7BorLyu5eMVOObwr7p5p3p0nsUS1NmM5Jc
         snjC/zXr93QOpCBaMFBSLExcbfLkcylWlzyLu08sLxxrSBtGIuACc1K/JhmE7GaMXlwM
         D//dKTtIuU3L9VjCbgOC6ng/FTufb0poekqFYt3wUWhw9D8MizWOAuMbD89bnb1bEn2p
         7bfQ==
X-Gm-Message-State: AOJu0Yx63rf28pxH0EEPcKh+cBJaIhBrRQT+6ddxqsDWtUFhTWSsLtD1
	uAkcZ9WOgJkHUsUWQt82Fhk=
X-Google-Smtp-Source: AGHT+IGSu0TchUFkBPThHl3YzI1XldWrzWQoQHzgE0fhKPQKR+yd+xEvYMiKhahyxe1OjfKNjsQdXw==
X-Received: by 2002:a50:ee0b:0:b0:52e:86b3:a4a6 with SMTP id g11-20020a50ee0b000000b0052e86b3a4a6mr2261286eds.29.1695830019909;
        Wed, 27 Sep 2023 08:53:39 -0700 (PDT)
Received: from gentoo (dynamic-095-119-186-142.95.119.pool.telefonica.de. [95.119.186.142])
        by smtp.googlemail.com with ESMTPSA id dk20-20020a0564021d9400b0053490ca10e3sm1159649edb.62.2023.09.27.08.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 08:53:39 -0700 (PDT)
From: Massimo Burcheri <burcheri.massimo@gmail.com>
X-Google-Original-From: Massimo Burcheri <burcheri.massimo+linux-usb@gmail.com>
Message-ID: <7135f5242e9f963ae4c260d3e14124ea0a7412de.camel@gmail.com>
Subject: Re: SanDisk Extreme Pro 55AF and UAS
Reply-To: burcheri.massimo+linux-usb@gmail.com
To: Oliver Neukum <oneukum@suse.com>
Cc: linux-usb <linux-usb@vger.kernel.org>
In-Reply-To: <d910b948-7448-46d3-ba98-42bc6e644626@suse.com>
References: <8d8df33f29e9abc0c20909c028863e3b9674921d.camel@gmail.com>
	 <d910b948-7448-46d3-ba98-42bc6e644626@suse.com>
Face:
 iVBORw0KGgoAAAANSUhEUgAAADAAAAAwAQMAAABtzGvEAAAAA3NCSVQICAjb4U/gAAAABlBMVEX///8AAABVwtN+AAAACXBIWXMAAA7EAAAOxAGVKw4bAAABGUlEQVQYlUWQsUoDQRCGv71LjB7KSSBwwZCTgFhY2EYIHmJnZRMLo5AXUMRCBMHcE6iPoGBlINpoZXGVeQTFKqSxMgYtTBFcZw7EKfZn2Z2Z7//hr2ysZ+5tqFLmWKVaKKs0vWd9TJx2AibmoQcupj6CCZirqTgzA5hmsdtQWe5/xAREX7uJ3MLP9x4lyieNO5mcOxyM8HH79y/4Cdn9R3JDsts/uGO82yOMJf/ah1Y8tfQEIQt7Z7rCawtNiUpHFgYUdgTxgI1NAW6SvxoqWabbw0Bd5jpQibTNBC1F4nIMk2TWhTqIs+fSVpzfCsVR9eaiJf5W6mtWXK7O+vKR4nWkSYSuFbP4No3Ht6dpSN9pSMYmaXI1/usXT0FM3SoTKAAAAAAASUVORK5CYII=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 27 Sep 2023 17:53:24 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.48.4 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Tue, 2023-09-19 at 15:47 +0200, Oliver Neukum wrote:

> Probably your device. Are you using bus powered devices?

Bus powered device.
Why does the drive still run fine with uas on other machines?
Why did it run with uas also on the now failing machine, until something ha=
d
changed?
What could be broken due to test with a longer 1 meter cable?

Does uas have higher spec requirements to the USB bus? I thought it's just
another protocol run on USB3 with SuperSpeed (5Gbps). Using that drive on t=
he
failing machine still works with the usb-storage module using the older Bul=
k-
only protocol.

Here is the full lsusb -v of that device, currently running with uas on thi=
s
machine:

Bus 004 Device 015: ID 0781:55af SanDisk Corp. Extreme Pro 55AF
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               3.20
  bDeviceClass            0=20
  bDeviceSubClass         0=20
  bDeviceProtocol         0=20
  bMaxPacketSize0         9
  idVendor           0x0781 SanDisk Corp.
  idProduct          0x55af=20
  bcdDevice           10.87
  iManufacturer           2 SanDisk
  iProduct                3 Extreme Pro 55AF
  iSerial                 1 323134385331643031333831
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x0079
    bNumInterfaces          1
    bConfigurationValue     1
    iConfiguration          0=20
    bmAttributes         0x80
      (Bus Powered)
    MaxPower              896mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           2
      bInterfaceClass         8 Mass Storage
      bInterfaceSubClass      6 SCSI
      bInterfaceProtocol     80 Bulk-Only
      iInterface              0=20
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst              15
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x02  EP 2 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst              15
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       1
      bNumEndpoints           4
      bInterfaceClass         8 Mass Storage
      bInterfaceSubClass      6 SCSI
      bInterfaceProtocol     98=20
      iInterface              0=20
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst              15
        MaxStreams             32
        Data-in pipe (0x03)
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x02  EP 2 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst              15
        MaxStreams             32
        Data-out pipe (0x04)
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst              15
        MaxStreams             32
        Status pipe (0x02)
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x04  EP 4 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst               0
        Command pipe (0x01)
Binary Object Store Descriptor:
  bLength                 5
  bDescriptorType        15
  wTotalLength       0x002a
  bNumDeviceCaps          3
  USB 2.0 Extension Device Capability:
    bLength                 7
    bDescriptorType        16
    bDevCapabilityType      2
    bmAttributes   0x0000f41e
      BESL Link Power Management (LPM) Supported
    BESL value     1024 us=20
    Deep BESL value    61440 us=20
  SuperSpeed USB Device Capability:
    bLength                10
    bDescriptorType        16
    bDevCapabilityType      3
    bmAttributes         0x00
    wSpeedsSupported   0x000e
      Device can operate at Full Speed (12Mbps)
      Device can operate at High Speed (480Mbps)
      Device can operate at SuperSpeed (5Gbps)
    bFunctionalitySupport   1
      Lowest fully-functional device speed is Full Speed (12Mbps)
    bU1DevExitLat          10 micro seconds
    bU2DevExitLat        2047 micro seconds
  SuperSpeedPlus USB Device Capability:
    bLength                20
    bDescriptorType        16
    bDevCapabilityType     10
    bmAttributes         0x00000001
      Sublink Speed Attribute count 2
      Sublink Speed ID count 1
    wFunctionalitySupport   0x1100
      Min functional Speed Attribute ID: 0
      Min functional RX lanes: 1
      Min functional TX lanes: 1
    bmSublinkSpeedAttr[0]   0x000a4030
      Speed Attribute ID: 0 10Gb/s Symmetric RX SuperSpeedPlus
    bmSublinkSpeedAttr[1]   0x000a40b0
      Speed Attribute ID: 0 10Gb/s Symmetric TX SuperSpeedPlus
Device Status:     0x000c
  (Bus Powered)
  U1 Enabled
  U2 Enabled


Best regards,
Massimo

