Return-Path: <linux-usb+bounces-8567-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4618908D8
	for <lists+linux-usb@lfdr.de>; Thu, 28 Mar 2024 20:08:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9B32D1F240E1
	for <lists+linux-usb@lfdr.de>; Thu, 28 Mar 2024 19:08:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 918C8137911;
	Thu, 28 Mar 2024 19:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rwq9JCbg"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81E0C1849
	for <linux-usb@vger.kernel.org>; Thu, 28 Mar 2024 19:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711652929; cv=none; b=uvyUb9YrObpkbkNrXGS8x6uFtsb7CBi3IFXdIkS7AXQqhC/AWyeeMkZjkVKewuEfu8wKtMNkYfEsSUBLt3CHlnw3HjHE1s9i8Sp2D0oz6Rmd/ieAnQOl7TtLbbLdMHx/VHNzVqgopOmJ2dGGfEFWJlsAPIzlqbZcOlPsU6JmgdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711652929; c=relaxed/simple;
	bh=U7rLzvNRcM4oAcp2xI8gikC/c8ZLuP8JApORa7jQK84=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=bEluM6Cd0RL6/TNB9//0Hbr5XTtHUzsYAdH9t74s8WEclQPtcjdjcjqsFYONMahdJjUeOiULM3qwpfpdHve/+AFXkBUt+b/Yec6WjZnaimfcyV2PQ/wQyv5pG2WWmPw/XkJL8UNGQBDgnx1myOKbj69L38dGDjpQu4Yc2xWUFBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rwq9JCbg; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-33ececeb19eso733708f8f.3
        for <linux-usb@vger.kernel.org>; Thu, 28 Mar 2024 12:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711652926; x=1712257726; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0D1Bvk4t0/NOm3xsc+UpwjmIv6aH4RIbR0Z6kD89i98=;
        b=Rwq9JCbgtRMDkXDNcrsIhrLUZrKE7N3Zv8EfSc3O19E9YFOcm6PIsOUj2SQ4M2UptT
         R8Ucvj68uqIno6B06qwKXjqsuVwhkOA4nLD5zpvUNijfxW0vFHbgB5gni0TJHZeZDmAH
         CMSNCk/hTf4hZ6/KrpU+y/Um2JvG56jXIPTXs7+WXMuq8W3UH10eJkHwMKcAJlCTpEj7
         mOqqWCnhAwlTyoTPw5ql7l+3NCDXgUGvmPFrfG9O69JlEc+lxXKpinYOqHyRCU/mga+k
         d48evSAhEw3pfv7YVJlkzwOUECTCbE7xR17GM18GDs1ACOnPl+7TNVByFSXFjG5P5LpW
         vV7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711652926; x=1712257726;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0D1Bvk4t0/NOm3xsc+UpwjmIv6aH4RIbR0Z6kD89i98=;
        b=XoyG7R13jhYNFyl3VV/uKbmmP+9AQqZ/xOIcjUW7HIoKkt4KAN7jRJPwMnXcmsf/eQ
         dEkXFIPxd4USQUdtQe88NMTTaG17OmuBkLe8X/bFmQmSpQVE8oitI3bGV249tE/irsIQ
         k1ReiWmmkt4hfnyDMewVi+EDP1BoxE6WgnjosDUjUA16uz9OCwmFMkjHjywf5DpR8WfD
         Y2ypXUPWNcmvu+oxUvUykmM9eMWFZBFgvkGvuAejGZdOxn0ZRb30Fxal0JlQBnvS3GJT
         6K4eGqIj0/DuhzZqrBbWClz9jUMV2Q7F+HorGJkp9GHZZr5x3IewHNtTBZyp+yZSwukH
         9W1g==
X-Gm-Message-State: AOJu0YwCcqkeW/B9f+Y+t2dsvstiXZM/cZaJau/blcbQAhhGOU0wCBD9
	7AoswzvO3E36Gyy/KM9erwgupDpciunA0VHnoFV6tGUqfuq8gWAZsKR926nI
X-Google-Smtp-Source: AGHT+IEchiL7SE/9CJ9JOZUfHiFeqw/Zc9GCS74Mo1pUSoFXNgFdzGywJniTFfFUTiUUKp/iuI5uAw==
X-Received: by 2002:adf:e849:0:b0:341:e0fd:4dec with SMTP id d9-20020adfe849000000b00341e0fd4decmr2881058wrn.6.1711652925748;
        Thu, 28 Mar 2024 12:08:45 -0700 (PDT)
Received: from [192.168.1.50] ([79.119.240.188])
        by smtp.gmail.com with ESMTPSA id k17-20020adff5d1000000b00341b7388dafsm2407261wrp.77.2024.03.28.12.08.45
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Mar 2024 12:08:45 -0700 (PDT)
Message-ID: <f4df8e45-5dc5-4d81-a414-e19a83b71403@gmail.com>
Date: Thu, 28 Mar 2024 21:08:43 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-usb@vger.kernel.org
From: Bitterblue Smith <rtl8821cerfe2@gmail.com>
Subject: Device with two interfaces - what is the probing order?
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi all,

Given a USB Wifi device with two "identical" interfaces,
in what order are the interfaces probed? Is the order guaranteed?

The driver uses these:

static const struct usb_device_id rtl8192d_usb_ids[] = {
	{
		.match_flags = USB_DEVICE_ID_MATCH_DEVICE,
		.idVendor = 0x0bda,
		.idProduct = 0x8193,
		.driver_info = (kernel_ulong_t)&rtl92du_hal_cfg
	},
	{}
};

static struct usb_driver rtl8192du_driver = {
	.name = "rtl8192du",
	.probe = rtl8192du_probe,
	.disconnect = rtl_usb_disconnect,
	.id_table = rtl8192d_usb_ids,
	.disable_hub_initiated_lpm = 1,
};

The device looks like this:

Bus 003 Device 004: ID 0bda:8193 Realtek Semiconductor Corp. RTL8192DU 802.11an WLAN Adapter
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.00
  bDeviceClass            0 
  bDeviceSubClass         0 
  bDeviceProtocol         0 
  bMaxPacketSize0        64
  idVendor           0x0bda Realtek Semiconductor Corp.
  idProduct          0x8193 RTL8192DU 802.11an WLAN Adapter
  bcdDevice            0.00
  iManufacturer           1 Realtek
  iProduct                2 801.11n NIC
  iSerial                 3 ...
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x0037
    bNumInterfaces          2
    bConfigurationValue     1
    iConfiguration          0 
    bmAttributes         0x80
      (Bus Powered)
    MaxPower              500mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           2
      bInterfaceClass       255 Vendor Specific Class
      bInterfaceSubClass    255 Vendor Specific Subclass
      bInterfaceProtocol    255 Vendor Specific Protocol
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0200  1x 512 bytes
        bInterval               0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x02  EP 2 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0200  1x 512 bytes
        bInterval               0
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       0
      bNumEndpoints           2
      bInterfaceClass       255 Vendor Specific Class
      bInterfaceSubClass    255 Vendor Specific Subclass
      bInterfaceProtocol    255 Vendor Specific Protocol
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x89  EP 9 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0200  1x 512 bytes
        bInterval               0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x0a  EP 10 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0200  1x 512 bytes
        bInterval               0
Device Qualifier (for other device speed):
  bLength                10
  bDescriptorType         6
  bcdUSB               2.00
  bDeviceClass            0 
  bDeviceSubClass         0 
  bDeviceProtocol         0 
  bMaxPacketSize0        64
  bNumConfigurations      1
Device Status:     0x0000
  (Bus Powered)

