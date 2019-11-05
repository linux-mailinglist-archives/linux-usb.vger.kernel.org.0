Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CFF32EFC35
	for <lists+linux-usb@lfdr.de>; Tue,  5 Nov 2019 12:18:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730811AbfKELSM convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Tue, 5 Nov 2019 06:18:12 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:44323 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726867AbfKELSL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 5 Nov 2019 06:18:11 -0500
Received: from mail-pg1-f198.google.com ([209.85.215.198])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <kai.heng.feng@canonical.com>)
        id 1iRwqf-0001Ok-TW
        for linux-usb@vger.kernel.org; Tue, 05 Nov 2019 11:18:10 +0000
Received: by mail-pg1-f198.google.com with SMTP id u197so2245915pgc.17
        for <linux-usb@vger.kernel.org>; Tue, 05 Nov 2019 03:18:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=Km3R3s47dSFWdMC4Cz64HHioZnQfD68q08sgp8NIQSc=;
        b=Wk9UcvlVz5VDCM0WE8ozLPaZsyP4/rKOeS0ikjBrm0GzimtI1V4WmmNTf9VUBF3H91
         ednyuGZ1YX+XzPaidjbXmrRJRIIscHj1+M0JMLeBhScki9mgaVRU+hs1I0a8KVro9ZU4
         c9ATp4JLhab6iUBa1hjx8rcbnvbaYuf/tUsupG9yfWE2kXYT6Y+6otiHezrFFFuvy7Up
         bytfYr9pQ+Eif9VgM2cN48N11faFfDEXmWN5NOC8HYVFrtN80CftJcm+TXo9MYC4Jnz4
         asu23JMxNp7Uwj/zBUiLVpSLsb2rhyX3XnwG0zYus/2xjCzoQUKQAfawO1TmSwb0MKlo
         +ByA==
X-Gm-Message-State: APjAAAXsFYZaKrByaHCejoU8T4mj69cZjPuY3gidVlTncunIa9dCjSXN
        K428TMO3dNeVWctqR982Csq5hZoDtzVhx5yxebCuKjnXHYIMIMIbYtSFQltXB0xCEhGlPjkh4Fu
        DnSPth8V0p2beHoIdDSpVTPxovWSEASJB1s/wxA==
X-Received: by 2002:a17:90a:ba89:: with SMTP id t9mr1274714pjr.138.1572952688473;
        Tue, 05 Nov 2019 03:18:08 -0800 (PST)
X-Google-Smtp-Source: APXvYqxO8n1Go9j0jLNj1favhse9HIXjVbJcZl0TBphaEAK8FkPrBbBvrBdxyfggSCBMeP2Jidt7Sg==
X-Received: by 2002:a17:90a:ba89:: with SMTP id t9mr1274669pjr.138.1572952688057;
        Tue, 05 Nov 2019 03:18:08 -0800 (PST)
Received: from 2001-b011-380f-3c42-8c9f-6944-7206-b2a2.dynamic-ip6.hinet.net (2001-b011-380f-3c42-8c9f-6944-7206-b2a2.dynamic-ip6.hinet.net. [2001:b011:380f:3c42:8c9f:6944:7206:b2a2])
        by smtp.gmail.com with ESMTPSA id i11sm18202076pgd.7.2019.11.05.03.18.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 05 Nov 2019 03:18:07 -0800 (PST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3601.0.10\))
Subject: Re: [PATCH v2] r8152: Add macpassthru support for ThinkPad
 Thunderbolt 3 Dock Gen 2
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <0835B3720019904CB8F7AA43166CEEB2F18F4E9E@RTITMBSVM03.realtek.com.tw>
Date:   Tue, 5 Nov 2019 19:18:04 +0800
Cc:     "davem@davemloft.net" <davem@davemloft.net>,
        "oliver@neukum.org" <oliver@neukum.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: 8BIT
Message-Id: <193EF03A-1EF7-4604-BF3A-61201A78D724@canonical.com>
References: <20191105081526.4206-1-kai.heng.feng@canonical.com>
 <0835B3720019904CB8F7AA43166CEEB2F18F4E9E@RTITMBSVM03.realtek.com.tw>
To:     Hayes Wang <hayeswang@realtek.com>
X-Mailer: Apple Mail (2.3601.0.10)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



> On Nov 5, 2019, at 16:55, Hayes Wang <hayeswang@realtek.com> wrote:
> 
> Kai-Heng Feng [mailto:kai.heng.feng@canonical.com]
>> Sent: Tuesday, November 05, 2019 4:15 PM
>> To: davem@davemloft.net; oliver@neukum.org
> [...]
>> +	if (test_bit(LENOVO_MACPASSTHRU, &tp->flags)) {
>> +		bypass_test = true;
>> +		mac_obj_name = "\\MACA";
>> +		mac_obj_type = ACPI_TYPE_STRING;
>> +		mac_strlen = 0x16;
>> 	} else {
>> -		/* test for RTL8153-BND and RTL8153-BD */
>> -		ocp_data = ocp_read_byte(tp, MCU_TYPE_USB, USB_MISC_1);
>> -		if ((ocp_data & BND_MASK) == 0 && (ocp_data & BD_MASK) == 0) {
>> -			netif_dbg(tp, probe, tp->netdev,
>> -				  "Invalid variant for MAC pass through\n");
>> -			return -ENODEV;
>> +		bypass_test = false;
>> +		mac_obj_name = "\\_SB.AMAC";
>> +		mac_obj_type = ACPI_TYPE_BUFFER;
>> +		mac_strlen = 0x17;
>> +	}
>> +
>> +	if (!bypass_test) {
> 
> Maybe you could combine this with the "else" above.
> Then, the variable "bypass_test" could be removed.

Ok, will do in V3.

> And the declaration of "ocp_data" could be moved after the "else".

Isn't putting declarations at the top of the function the preferred way?

Kai-Heng

> 
>> +		/* test for -AD variant of RTL8153 */
>> +		ocp_data = ocp_read_word(tp, MCU_TYPE_USB, USB_MISC_0);
>> +		if ((ocp_data & AD_MASK) == 0x1000) {
>> +			/* test for MAC address pass-through bit */
>> +			ocp_data = ocp_read_byte(tp, MCU_TYPE_USB, EFUSE);
>> +			if ((ocp_data & PASS_THRU_MASK) != 1) {
>> +				netif_dbg(tp, probe, tp->netdev,
>> +						"No efuse for RTL8153-AD MAC pass
>> through\n");
>> +				return -ENODEV;
>> +			}
>> +		} else {
>> +			/* test for RTL8153-BND and RTL8153-BD */
>> +			ocp_data = ocp_read_byte(tp, MCU_TYPE_USB, USB_MISC_1);
>> +			if ((ocp_data & BND_MASK) == 0 && (ocp_data & BD_MASK)
>> == 0) {
>> +				netif_dbg(tp, probe, tp->netdev,
>> +						"Invalid variant for MAC pass through\n");
>> +				return -ENODEV;
>> +			}
>> 		}
>> 	}
>> 
>> 	/* returns _AUXMAC_#AABBCCDDEEFF# */
>> -	status = acpi_evaluate_object(NULL, "\\_SB.AMAC", NULL, &buffer);
>> +	status = acpi_evaluate_object(NULL, mac_obj_name, NULL, &buffer);
>> 	obj = (union acpi_object *)buffer.pointer;
>> 	if (!ACPI_SUCCESS(status))
>> 		return -ENODEV;
>> -	if (obj->type != ACPI_TYPE_BUFFER || obj->string.length != 0x17) {
>> +	if (obj->type != mac_obj_type || obj->string.length != mac_strlen) {
>> 		netif_warn(tp, probe, tp->netdev,
>> 			   "Invalid buffer for pass-thru MAC addr: (%d, %d)\n",
>> 			   obj->type, obj->string.length);
>> 		goto amacout;
>> 	}
>> +
>> 	if (strncmp(obj->string.pointer, "_AUXMAC_#", 9) != 0 ||
>> 	    strncmp(obj->string.pointer + 0x15, "#", 1) != 0) {
>> 		netif_warn(tp, probe, tp->netdev,
>> @@ -6629,6 +6649,10 @@ static int rtl8152_probe(struct usb_interface *intf,
>> 		netdev->hw_features &= ~NETIF_F_RXCSUM;
>> 	}
>> 
>> +	if (le16_to_cpu(udev->descriptor.idVendor) == VENDOR_ID_LENOVO &&
>> +	    le16_to_cpu(udev->descriptor.idProduct) == 0x3082)
>> +		set_bit(LENOVO_MACPASSTHRU, &tp->flags);
>> +
>> 	if (le16_to_cpu(udev->descriptor.bcdDevice) == 0x3011 && udev->serial
>> &&
>> 	    (!strcmp(udev->serial, "000001000000") ||
>> 	     !strcmp(udev->serial, "000002000000"))) {
>> @@ -6755,6 +6779,7 @@ static const struct usb_device_id rtl8152_table[] = {
>> 	{REALTEK_USB_DEVICE(VENDOR_ID_LENOVO,  0x304f)},
>> 	{REALTEK_USB_DEVICE(VENDOR_ID_LENOVO,  0x3062)},
>> 	{REALTEK_USB_DEVICE(VENDOR_ID_LENOVO,  0x3069)},
>> +	{REALTEK_USB_DEVICE(VENDOR_ID_LENOVO,  0x3082)},
>> 	{REALTEK_USB_DEVICE(VENDOR_ID_LENOVO,  0x7205)},
>> 	{REALTEK_USB_DEVICE(VENDOR_ID_LENOVO,  0x720c)},
>> 	{REALTEK_USB_DEVICE(VENDOR_ID_LENOVO,  0x7214)},
>> --
>> 2.17.1
> 
> 
> Best Regards,
> Hayes

