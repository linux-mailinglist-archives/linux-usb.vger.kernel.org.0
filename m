Return-Path: <linux-usb+bounces-1451-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 990E77C5051
	for <lists+linux-usb@lfdr.de>; Wed, 11 Oct 2023 12:38:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BC6D11C20FE2
	for <lists+linux-usb@lfdr.de>; Wed, 11 Oct 2023 10:38:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D49E510A25;
	Wed, 11 Oct 2023 10:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZWv8BMhV"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4382E10964
	for <linux-usb@vger.kernel.org>; Wed, 11 Oct 2023 10:37:58 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C48BCA7
	for <linux-usb@vger.kernel.org>; Wed, 11 Oct 2023 03:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697020676;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B9T69CSeczQTNAGc3fH4cJghTMdZtaq9dJk8j6ttMDE=;
	b=ZWv8BMhVZGbq4E8yYG3IRN92PB+fU6LIdRdcR2BEDjVrL66rUxK7fhLJ53PQf2UTT6yzyD
	6YEw6LLuHRBkOCumx1WKZQBbB+7MXE4fzCpi+RNGwFqiCVYqOXwjCc10pLNP1jyI44shjw
	dYeq3x6DNft/wF9AtWt/pkLw+H2WPFA=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-402-JRda2HzZPoOp9wPr4S8xnQ-1; Wed, 11 Oct 2023 06:37:54 -0400
X-MC-Unique: JRda2HzZPoOp9wPr4S8xnQ-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-9b2e030e4caso88069766b.1
        for <linux-usb@vger.kernel.org>; Wed, 11 Oct 2023 03:37:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697020673; x=1697625473;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B9T69CSeczQTNAGc3fH4cJghTMdZtaq9dJk8j6ttMDE=;
        b=lStu7q3fMzYJYgrL4bKvDjtf+g3BIJNPJxAeP1yMLyHnb0Um5nRYPUoCeezQTB/SCb
         tS3iumztdgDbgVM9IbcNb4EYueB0oxPPqIf53eC1rbYCEjHOrB2gmV4BjUwiHKK79YGW
         0acXYZOuN0GmdduBwhglClSyX+ddpZQTpFfwsTW1ehcwlpDac2AHPS1LNc2/ljJl4Sgn
         P7CNHRGDr9h6caTwVXHMWTtdmBlAP2bnutSTIbkxN4hS4C7qj1Gzmx5agXZPDwQgXQnY
         e3eXAHLohsReJQHmIpba98Js/jPaJG3XEqxpNFx27Gira2NKd4rmW3/6AfQsmFT6c8k/
         1xdw==
X-Gm-Message-State: AOJu0YygHQOE2ylrdxBM3axssHqY7bMh77OBvX66V9P4+pFpHt1hUGR3
	zor/xXFUfYuZyZIGXXdbhstK+8YRJfpXhIIsjFIebEzSHcsoF0iMDiirLNXOT68Kw8tjUFuMaJT
	SQY5RaasIxLzrv8npUBqx
X-Received: by 2002:a05:6402:2547:b0:531:14c4:ae30 with SMTP id l7-20020a056402254700b0053114c4ae30mr16765433edb.0.1697020673665;
        Wed, 11 Oct 2023 03:37:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpqK//D1TgfDznC+Wtwpoxq0pK4T0TpAW3VYUjkeuymqvaSZAJeCmcSYMMkbgvTRmAH89JYQ==
X-Received: by 2002:a05:6402:2547:b0:531:14c4:ae30 with SMTP id l7-20020a056402254700b0053114c4ae30mr16765416edb.0.1697020673313;
        Wed, 11 Oct 2023 03:37:53 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id s14-20020a056402014e00b005309eb7544fsm8660244edu.45.2023.10.11.03.37.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Oct 2023 03:37:52 -0700 (PDT)
Message-ID: <6a87b43a-0648-28d4-6c69-e0f684e44eb6@redhat.com>
Date: Wed, 11 Oct 2023 12:37:51 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v20 1/4] usb: Add support for Intel LJCA device
Content-Language: en-US, nl
To: Andy Shevchenko <andriy.shevchenko@intel.com>,
 Wentong Wu <wentong.wu@intel.com>
Cc: gregkh@linuxfoundation.org, oneukum@suse.com, wsa@kernel.org,
 andi.shyti@linux.intel.com, broonie@kernel.org,
 bartosz.golaszewski@linaro.org, linus.walleij@linaro.org,
 linux-usb@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-spi@vger.kernel.org, sakari.ailus@linux.intel.com,
 zhifeng.wang@intel.com, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <1696833205-16716-1-git-send-email-wentong.wu@intel.com>
 <1696833205-16716-2-git-send-email-wentong.wu@intel.com>
 <ZSZ3IPgLk7uC5UGI@smile.fi.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZSZ3IPgLk7uC5UGI@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Hi,

On 10/11/23 12:21, Andy Shevchenko wrote:
> On Mon, Oct 09, 2023 at 02:33:22PM +0800, Wentong Wu wrote:
>> Implements the USB part of Intel USB-I2C/GPIO/SPI adapter device
>> named "La Jolla Cove Adapter" (LJCA).
>>
>> The communication between the various LJCA module drivers and the
>> hardware will be muxed/demuxed by this driver. Three modules (
>> I2C, GPIO, and SPI) are supported currently.
>>
>> Each sub-module of LJCA device is identified by type field within
>> the LJCA message header.
>>
>> The sub-modules of LJCA can use ljca_transfer() to issue a transfer
>> between host and hardware. And ljca_register_event_cb is exported
>> to LJCA sub-module drivers for hardware event subscription.
>>
>> The minimum code in ASL that covers this board is
>> Scope (\_SB.PCI0.DWC3.RHUB.HS01)
>>     {
>>         Device (GPIO)
>>         {
>>             Name (_ADR, Zero)
>>             Name (_STA, 0x0F)
>>         }
>>
>>         Device (I2C)
>>         {
>>             Name (_ADR, One)
>>             Name (_STA, 0x0F)
>>         }
>>
>>         Device (SPI)
>>         {
>>             Name (_ADR, 0x02)
>>             Name (_STA, 0x0F)
>>         }
>>     }
> 
> This commit message is not true anymore, or misleading at bare minimum.
> The ACPI specification is crystal clear about usage _ADR and _HID, i.e.
> they must NOT be used together for the same device node. So, can you
> clarify how the DSDT is organized and update the commit message and
> it may require (quite likely) to redesign the architecture of this
> driver. Sorry I missed this from previous rounds as I was busy by
> something else.

This part of the commit message unfortunately is not accurate.
_ADR is not used in either DSDTs of shipping hw; nor in the code.

The code in question parsing the relevant part of the DSDT looks
like this:

static int ljca_match_device_ids(struct acpi_device *adev, void *data)
{
        struct ljca_match_ids_walk_data *wd = data;
        const char *uid = acpi_device_uid(adev);

        if (acpi_match_device_ids(adev, wd->ids))
                return 0;

        if (!wd->uid)
                goto match;

        if (!uid)
                /*
                 * Some DSDTs have only one ACPI companion for the two I2C
                 * controllers and they don't set a UID at all (e.g. Dell
                 * Latitude 9420). On these platforms only the first I2C
                 * controller is used, so if a HID match has no UID we use
                 * "0" as the UID and assign ACPI companion to the first
                 * I2C controller.
                 */
                uid = "0";
        else
                uid = strchr(uid, wd->uid[0]);

        if (!uid || strcmp(uid, wd->uid))
                return 0;

match:
        wd->adev = adev;

        return 1;
}

Notice that it check _UID (for some child devices, only those of
which there may be more then 1 have a UID set in the DSDT) and
that in case of requested but missing UID it assumes UID = "0"
for compatibility with older DSDTs which lack the UID.

And relevant DSDT bits from early hw (TigerLake Dell Latitude 9420)
Note no UID for the I2C node even though the LJCA USB IO expander
has 2 I2C controllers :

    Scope (_SB.PC00.XHCI.RHUB.HS06)
    {
            Device (VGPO)
            {
                Name (_HID, "INTC1074")  // _HID: Hardware ID
                Name (_DDN, "Intel UsbGpio Device")  // _DDN: DOS Device Name
            }

            Device (VI2C)
            {
                Name (_HID, "INTC1075")  // _HID: Hardware ID
                Name (_DDN, "Intel UsbI2C Device")  // _DDN: DOS Device Name
            }
    }

And for newer hw (Lenovo Thinkpad X1 yoga gen7, alder lake):

        Scope (_SB.PC00.XHCI.RHUB.HS08)
        {
            Device (VGPO)
            {
                Name (_HID, "INTC1096")  // _HID: Hardware ID
                Name (_DDN, "Intel UsbGpio Device")  // _DDN: DOS Device Name
            }

            Device (VIC0)
            {
                Name (_HID, "INTC1097")  // _HID: Hardware ID
                Name (_DDN, "Intel UsbI2C Device")  // _DDN: DOS Device Name
                Name (_UID, Zero)  // _UID: Unique ID
            }

            Device (VIC1)
            {
                Name (_HID, "INTC1097")  // _HID: Hardware ID
                Name (_DDN, "Intel UsbI2C Device")  // _DDN: DOS Device Name
                Name (_UID, One)  // _UID: Unique ID
            }

            Device (VSPI)
            {
                Name (_HID, "INTC1098")  // _HID: Hardware ID
                Name (_DDN, "Intel UsbSPI Device")  // _DDN: DOS Device Name
            }
        }

Note UIDs are used for the I2C controllers but not for the singleton
SPI and GPIO controllers.

TL;DR: there is nothing to worry about here, but the commit message
should be updated to reflect reality.

Regards,

Hans


