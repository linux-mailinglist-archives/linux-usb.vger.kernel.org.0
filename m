Return-Path: <linux-usb+bounces-529-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A99567ABEBC
	for <lists+linux-usb@lfdr.de>; Sat, 23 Sep 2023 10:01:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 5A6972853A9
	for <lists+linux-usb@lfdr.de>; Sat, 23 Sep 2023 08:01:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42B9063DF;
	Sat, 23 Sep 2023 08:01:49 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E1896132
	for <linux-usb@vger.kernel.org>; Sat, 23 Sep 2023 08:01:47 +0000 (UTC)
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F97B1BE
	for <linux-usb@vger.kernel.org>; Sat, 23 Sep 2023 01:01:45 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4054496bde3so14375635e9.1
        for <linux-usb@vger.kernel.org>; Sat, 23 Sep 2023 01:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695456104; x=1696060904; darn=vger.kernel.org;
        h=user-agent:mime-version:date:content-transfer-encoding:face
         :references:in-reply-to:cc:to:reply-to:subject:message-id:from
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=cmJZ5MvU4l2O5w581tF17PsY56n0VBOR+Y2qaWbmfGE=;
        b=eFqmIvYvnkDH2n6iOuGvYCnzrupVBsldXssZmxgbua/oLiXJGQNunimzPWem4A48QY
         9CoI8bF1TkcqBdz9h84enoIcAPv+WsSPx2zTryFQNuV5A0s4GNYKcCwlxV74PVyT+8O4
         LiSrtZj+LxhJ45TsY9+Ugl5jkij+jqkJ6ECyfGEFur0f5wuq0OQPkgBgS6NR7wi59HVD
         ssy2YXVVdfn5TPzweDDpjkl5LPmr6grsc8Db4B10cNpq5sh/kqu7qtqDyejDPkb4ich2
         IFqKFoyx8kDx48aOce8Ss2xaGG0ceqehH7IYtSIIKiOGhpLHGDNGnW75ZyENYEUd5T0J
         kV+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695456104; x=1696060904;
        h=user-agent:mime-version:date:content-transfer-encoding:face
         :references:in-reply-to:cc:to:reply-to:subject:message-id:from
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cmJZ5MvU4l2O5w581tF17PsY56n0VBOR+Y2qaWbmfGE=;
        b=ehi6/V/fGPK/dt+HOSDp9lbp6VzQZlhZcUReKufAjKD26HUyCgePHzeZw6JvOqX9+6
         /C+aaxRlfJxGNQWIm1bc7TEDc1m0uCr426y+tosp9cChMLnA81hb81CZRwbXjHUkPCl/
         HoChDabfoob0uqkxrZ8VNfoLHCMzDpECGlhVixKUf7vrJAUMyt3h5Y7oKv1pngsMDlS+
         V2D0c7dbtOe2LGS0xu5uJOpBR//6GLHCsP2aB+zcJf8A7NONd/+jrtRsAiOMbWS/1PgW
         F77Z57VQAT/l3It3+gCHS2/96I5hsaySMYTcT8EqGtXsMc55eP93+cxGJ+iGZ9oshTst
         jUIQ==
X-Gm-Message-State: AOJu0Ywod9ah7gE6iUobIHrU4inQHB7S2kVzy4qEHsEp/koY8hmUpGr9
	3opVl0L0iBxjzmTxICHr8lClztVci8g=
X-Google-Smtp-Source: AGHT+IF9q4j21qobnsZahafvYKFgpaVWt8dk3Z+tSj9mTd2KeJmRrnOdIRTIPjeubeWWU9XSQyH8Ag==
X-Received: by 2002:a7b:cd0a:0:b0:401:8225:14ee with SMTP id f10-20020a7bcd0a000000b00401822514eemr1295105wmj.41.1695456103392;
        Sat, 23 Sep 2023 01:01:43 -0700 (PDT)
Received: from mobalindesk.lan.lan (dynamic-077-006-155-024.77.6.pool.telefonica.de. [77.6.155.24])
        by smtp.googlemail.com with ESMTPSA id o17-20020a05600c379100b003fe1a96845bsm9412696wmr.2.2023.09.23.01.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Sep 2023 01:01:42 -0700 (PDT)
Sender: Massimo B <burcheri.massimo@gmail.com>
From: Massimo Burcheri <massimo@burcheri.de>
X-Google-Original-From: Massimo Burcheri <burcheri.massimo+linux-usb@gmail.com>
Message-ID: <1352baa835ecd1a6b7f49e0d08f440858a99189d.camel@gmail.com>
Subject: Re: JMicron JMS567 and UAS
Reply-To: burcheri.massimo+linux-usb@gmail.com
To: Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb <linux-usb@vger.kernel.org>
In-Reply-To: <40f5fdcb-9de5-42a6-9898-a428c0116adf@rowland.harvard.edu>
References: <5d8cad13445172d02a371f162ceaea1a68819819.camel@gmail.com>
	 <a5b48a53-9dff-4a84-9a58-1c08f0e0781b@rowland.harvard.edu>
	 <072417fd7806d86e930bccb882460dbbfaa5ca52.camel@gmail.com>
	 <0919e02b-e395-438c-b4d6-314d7e108639@rowland.harvard.edu>
	 <7f8396ae597a78969811011034a7e5f759a6564e.camel@gmail.com>
	 <40f5fdcb-9de5-42a6-9898-a428c0116adf@rowland.harvard.edu>
Face:
 iVBORw0KGgoAAAANSUhEUgAAADAAAAAwAQMAAABtzGvEAAAAA3NCSVQICAjb4U/gAAAABlBMVEX///8AAABVwtN+AAAACXBIWXMAAA7EAAAOxAGVKw4bAAABGUlEQVQYlUWQsUoDQRCGv71LjB7KSSBwwZCTgFhY2EYIHmJnZRMLo5AXUMRCBMHcE6iPoGBlINpoZXGVeQTFKqSxMgYtTBFcZw7EKfZn2Z2Z7//hr2ysZ+5tqFLmWKVaKKs0vWd9TJx2AibmoQcupj6CCZirqTgzA5hmsdtQWe5/xAREX7uJ3MLP9x4lyieNO5mcOxyM8HH79y/4Cdn9R3JDsts/uGO82yOMJf/ah1Y8tfQEIQt7Z7rCawtNiUpHFgYUdgTxgI1NAW6SvxoqWabbw0Bd5jpQibTNBC1F4nIMk2TWhTqIs+fSVpzfCsVR9eaiJf5W6mtWXK7O+vKR4nWkSYSuFbP4No3Ht6dpSN9pSMYmaXI1/usXT0FM3SoTKAAAAAAASUVORK5CYII=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 23 Sep 2023 10:01:32 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.48.4 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Fri, 2023-09-22 at 09:59 -0400, Alan Stern wrote:
> Maybe the problem isn't blacklisting at all; maybe your JMS567 device's=
=20
> firmware just doesn't support UAS.
>=20
> I don't think you have posted the "lsusb -v" output for this device.=C2=
=A0=20
> What does it say?

Bus 004 Device 012: ID 152d:0567 JMicron Technology Corp. / JMicron USA Tec=
hnology Corp. JMS567 SATA 6Gb/s bridge
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               3.00
  bDeviceClass            0=20
  bDeviceSubClass         0=20
  bDeviceProtocol         0=20
  bMaxPacketSize0         9
  idVendor           0x152d JMicron Technology Corp. / JMicron USA Technolo=
gy Corp.
  idProduct          0x0567 JMS567 SATA 6Gb/s bridge
  bcdDevice           52.03
  iManufacturer           1 JMicron
  iProduct                2 External USB 3.0
  iSerial                 3 20170220000C3
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x002c
    bNumInterfaces          1
    bConfigurationValue     1
    iConfiguration          0=20
    bmAttributes         0xc0
      Self Powered
    MaxPower                8mA
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
Binary Object Store Descriptor:
  bLength                 5
  bDescriptorType        15
  wTotalLength       0x0016
  bNumDeviceCaps          2
  USB 2.0 Extension Device Capability:
    bLength                 7
    bDescriptorType        16
    bDevCapabilityType      2
    bmAttributes   0x00000f0e
      BESL Link Power Management (LPM) Supported
    BESL value     3840 us=20
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
    bU2DevExitLat          32 micro seconds
Device Status:     0x000d
  Self Powered
  U1 Enabled
  U2 Enabled

Best regards,
Massimo

