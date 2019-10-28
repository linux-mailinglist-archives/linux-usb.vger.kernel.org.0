Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE4B0E6F61
	for <lists+linux-usb@lfdr.de>; Mon, 28 Oct 2019 10:52:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732544AbfJ1JwX convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Mon, 28 Oct 2019 05:52:23 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:56314 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730895AbfJ1JwX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 28 Oct 2019 05:52:23 -0400
Received: from mail-pl1-f197.google.com ([209.85.214.197])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <kai.heng.feng@canonical.com>)
        id 1iP1hG-0001zh-09
        for linux-usb@vger.kernel.org; Mon, 28 Oct 2019 09:52:22 +0000
Received: by mail-pl1-f197.google.com with SMTP id x18so5669939plm.10
        for <linux-usb@vger.kernel.org>; Mon, 28 Oct 2019 02:52:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=ucd8G3ncCjjGAR+QruBIbeyIMVOY8PJbSpfeucAn18s=;
        b=bJkyW5e4iPCpuxPbj4ilm9dAA95egIxLxHcdwZR406lsSf4yX/foaNdk8R+K+XU1Wm
         oO9baa1GQctYLfva6SMYTyYhI3bS2kww5250z6ecPHOyzfX7K59JNYSsjV5/ksslFiao
         kXf/DaiEm4IRb7/xVv8GqsFrlpWnk86yo5SLWmKxxJEmaqhXC8H9PBN6G04jaTYCK4dD
         HJezCQ7xNVU+LQgLr1QV225KNsw2Nbv0cx/Cokv94LcPLhXBAEWoiypidkdJIYguKpmu
         knwyVS2F/5X4Xd6eRSX0G/lzUaoobialgEYrlb5J1CdmzzABbV31oVYK09Z5+NOV5Dg6
         D4hw==
X-Gm-Message-State: APjAAAUoRuVlvA/Prq3xFIQQ2sfMn4Vixq+wQvsG0U1IOUCUEv4+X3L4
        3aYDkELdGskBqJDNAnuC7WREfiPQuFgH6FiO5+ZH4DBMuSX9bAr8XRPEk83RKgxckKfSdXGO5To
        xO+U55Sf44AzUB3o7+psKDvv4EY8fdJUgj03OJg==
X-Received: by 2002:a63:165b:: with SMTP id 27mr19770766pgw.420.1572256340310;
        Mon, 28 Oct 2019 02:52:20 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyuaevUyIwsBsO17w+abwittBHPXUZ7Jv2gyLyiWwnNViaUN5dJY0+6QbfKjXTeFouFVnZ9Kw==
X-Received: by 2002:a63:165b:: with SMTP id 27mr19770721pgw.420.1572256339916;
        Mon, 28 Oct 2019 02:52:19 -0700 (PDT)
Received: from 2001-b011-380f-3c42-74a9-e8b4-eac5-9609.dynamic-ip6.hinet.net (2001-b011-380f-3c42-74a9-e8b4-eac5-9609.dynamic-ip6.hinet.net. [2001:b011:380f:3c42:74a9:e8b4:eac5:9609])
        by smtp.gmail.com with ESMTPSA id x25sm6334088pfq.73.2019.10.28.02.52.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 28 Oct 2019 02:52:19 -0700 (PDT)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3601\))
Subject: Re: [PATCH 1/2] r8152: Pass driver_info to REALTEK_USB_DEVICE() macro
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <0835B3720019904CB8F7AA43166CEEB2F18EF1C4@RTITMBSVM03.realtek.com.tw>
Date:   Mon, 28 Oct 2019 17:52:16 +0800
Cc:     "davem@davemloft.net" <davem@davemloft.net>,
        "oliver@neukum.org" <oliver@neukum.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: 8BIT
Message-Id: <C307CD73-9CDE-4B70-9928-E8B0303CCDB5@canonical.com>
References: <20191025105919.689-1-kai.heng.feng@canonical.com>
 <0835B3720019904CB8F7AA43166CEEB2F18EF1C4@RTITMBSVM03.realtek.com.tw>
To:     Hayes Wang <hayeswang@realtek.com>
X-Mailer: Apple Mail (2.3601)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



> On Oct 28, 2019, at 17:41, Hayes Wang <hayeswang@realtek.com> wrote:
> 
> Kai-Heng Feng [mailto:kai.heng.feng@canonical.com]
>> Sent: Friday, October 25, 2019 6:59 PM
> [...]
>> -#define REALTEK_USB_DEVICE(vend, prod)	\
>> +#define REALTEK_USB_DEVICE(vend, prod, info)	\
>> 	.match_flags = USB_DEVICE_ID_MATCH_DEVICE | \
>> 		       USB_DEVICE_ID_MATCH_INT_CLASS, \
>> 	.idVendor = (vend), \
>> 	.idProduct = (prod), \
>> -	.bInterfaceClass = USB_CLASS_VENDOR_SPEC \
>> +	.bInterfaceClass = USB_CLASS_VENDOR_SPEC, \
>> +	.driver_info = (info) \
>> }, \
>> { \
>> 	.match_flags = USB_DEVICE_ID_MATCH_INT_INFO | \
>> @@ -6739,25 +6740,26 @@ static void rtl8152_disconnect(struct
>> usb_interface *intf)
>> 	.idProduct = (prod), \
>> 	.bInterfaceClass = USB_CLASS_COMM, \
>> 	.bInterfaceSubClass = USB_CDC_SUBCLASS_ETHERNET, \
>> -	.bInterfaceProtocol = USB_CDC_PROTO_NONE
>> +	.bInterfaceProtocol = USB_CDC_PROTO_NONE, \
>> +	.driver_info = (info) \
> 
> This part is for ECM mode. Add driver_info here is useless,
> because it is never be used. The driver always changes
> the ECM mode to vendor mode.

Thanks for the explanation.
Since we are going to compare IDs directly in probe(), I'll just drop this patch.

Kai-Heng

> 
> Best Regards,
> Hayes
> 
> 

