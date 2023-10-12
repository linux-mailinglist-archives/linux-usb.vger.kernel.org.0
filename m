Return-Path: <linux-usb+bounces-1505-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3FC57C6C0C
	for <lists+linux-usb@lfdr.de>; Thu, 12 Oct 2023 13:14:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E5B891C210A2
	for <lists+linux-usb@lfdr.de>; Thu, 12 Oct 2023 11:14:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B92F22F10;
	Thu, 12 Oct 2023 11:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GGMHvrSJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DF79DF71
	for <linux-usb@vger.kernel.org>; Thu, 12 Oct 2023 11:14:41 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F509F7
	for <linux-usb@vger.kernel.org>; Thu, 12 Oct 2023 04:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697109278;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DRaC+0mMS0mqrKmBhT+mt/F7wkHtGnlArsECVSA7S7c=;
	b=GGMHvrSJ/LEPCjawYSi5M//QSouh0uz7yzM3ly4GD8XD0yNcr5ZJKgwcOWFhGeio4Ot6jp
	VV0k8sc3BlG/uw8lcWXAXbnlBdnlv4YVp8//GeA2FdPNIjkaShPlT8+gcvnUWbAyQX8ywR
	PsN/w0Ir1LgTKKAqTnX3aMTebZhuGkc=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-604-2tcJWeKPP0qUqW2fwgjHAQ-1; Thu, 12 Oct 2023 07:14:26 -0400
X-MC-Unique: 2tcJWeKPP0qUqW2fwgjHAQ-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-9bd7c682b33so63735866b.3
        for <linux-usb@vger.kernel.org>; Thu, 12 Oct 2023 04:14:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697109265; x=1697714065;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DRaC+0mMS0mqrKmBhT+mt/F7wkHtGnlArsECVSA7S7c=;
        b=DXOQ5mMi4U8E5MSMkJsFuTIywCEyjug+BkA6UtXGtNDwL2AHgcckr7KPiz3NDr+rcx
         TkIydXZcb/iQCrI1v8F7etK8tBKvup/f8j4hZ3q2JROlk3YXqFtAcAB/hFRwqFhEOJWX
         wTXcdwaChDE1kDqI6cck+F/p+Dbin1ZRQfkA1R4WJs8061DawkEFIPgWQMUd6btdZU4H
         168+ppMMIx+Q7PdLb0v9dD4qi3bmEkRpCr320ZiHQs9Q3wsKNcJts+zW9CqRSLfUREwE
         rvZa3YzUQ+tlV91gGVXyyLHkl0OxmfblVCF1QBe6nJTdv+k4iRR0eZOw8SEnTd1mTOHt
         orjA==
X-Gm-Message-State: AOJu0YybHAfYzYrupS/08wjEftAW29wp/oVYExfynPZ8ru1ms90WYD1v
	WQ0HbDsUU3iR4WI7AhIz8RbVtSjhqd/tFigNi1G69DFyChUiPusG/l8h70QPWm2CvNI7VhLByzx
	XYTgwNoRD/e8FVNG3126g
X-Received: by 2002:a17:907:720b:b0:9a1:f4e8:87b9 with SMTP id dr11-20020a170907720b00b009a1f4e887b9mr25620925ejc.45.1697109265290;
        Thu, 12 Oct 2023 04:14:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHs8ShNQHDZ6hbq2SG2uMzUpUZfypOCB88v9DfbsSj8Zps3xEVjhs2Lqn/YHWow7aMfu9rhnQ==
X-Received: by 2002:a17:907:720b:b0:9a1:f4e8:87b9 with SMTP id dr11-20020a170907720b00b009a1f4e887b9mr25620912ejc.45.1697109264928;
        Thu, 12 Oct 2023 04:14:24 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id ks8-20020a170906f84800b0099b6becb107sm11078691ejb.95.2023.10.12.04.14.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Oct 2023 04:14:24 -0700 (PDT)
Message-ID: <5d2e9eba-a941-ea9a-161a-5b97d09d5d35@redhat.com>
Date: Thu, 12 Oct 2023 13:14:23 +0200
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
To: "Wu, Wentong" <wentong.wu@intel.com>,
 "Shevchenko, Andriy" <andriy.shevchenko@intel.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "oneukum@suse.com" <oneukum@suse.com>, "wsa@kernel.org" <wsa@kernel.org>,
 "andi.shyti@linux.intel.com" <andi.shyti@linux.intel.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "bartosz.golaszewski@linaro.org" <bartosz.golaszewski@linaro.org>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
 "Wang, Zhifeng" <zhifeng.wang@intel.com>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <1696833205-16716-1-git-send-email-wentong.wu@intel.com>
 <1696833205-16716-2-git-send-email-wentong.wu@intel.com>
 <ZSZ3IPgLk7uC5UGI@smile.fi.intel.com>
 <6a87b43a-0648-28d4-6c69-e0f684e44eb6@redhat.com>
 <DM6PR11MB4316BE44F53E276384FF06C88DCCA@DM6PR11MB4316.namprd11.prod.outlook.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <DM6PR11MB4316BE44F53E276384FF06C88DCCA@DM6PR11MB4316.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
	SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
	version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Hi,

On 10/11/23 14:50, Wu, Wentong wrote:
>> From: Hans de Goede <hdegoede>
>>
>> Hi,
>>
>> On 10/11/23 12:21, Andy Shevchenko wrote:
>>> On Mon, Oct 09, 2023 at 02:33:22PM +0800, Wentong Wu wrote:
>>>> Implements the USB part of Intel USB-I2C/GPIO/SPI adapter device
>>>> named "La Jolla Cove Adapter" (LJCA).
>>>>
>>>> The communication between the various LJCA module drivers and the
>>>> hardware will be muxed/demuxed by this driver. Three modules ( I2C,
>>>> GPIO, and SPI) are supported currently.
>>>>
>>>> Each sub-module of LJCA device is identified by type field within the
>>>> LJCA message header.
>>>>
>>>> The sub-modules of LJCA can use ljca_transfer() to issue a transfer
>>>> between host and hardware. And ljca_register_event_cb is exported to
>>>> LJCA sub-module drivers for hardware event subscription.
>>>>
>>>> The minimum code in ASL that covers this board is Scope
>>>> (\_SB.PCI0.DWC3.RHUB.HS01)
>>>>     {
>>>>         Device (GPIO)
>>>>         {
>>>>             Name (_ADR, Zero)
>>>>             Name (_STA, 0x0F)
>>>>         }
>>>>
>>>>         Device (I2C)
>>>>         {
>>>>             Name (_ADR, One)
>>>>             Name (_STA, 0x0F)
>>>>         }
>>>>
>>>>         Device (SPI)
>>>>         {
>>>>             Name (_ADR, 0x02)
>>>>             Name (_STA, 0x0F)
>>>>         }
>>>>     }
>>>
>>> This commit message is not true anymore, or misleading at bare minimum.
>>> The ACPI specification is crystal clear about usage _ADR and _HID, i.e.
>>> they must NOT be used together for the same device node. So, can you
>>> clarify how the DSDT is organized and update the commit message and it
>>> may require (quite likely) to redesign the architecture of this
>>> driver. Sorry I missed this from previous rounds as I was busy by
>>> something else.
>>
>> This part of the commit message unfortunately is not accurate.
>> _ADR is not used in either DSDTs of shipping hw; nor in the code.
> 
> We have covered the _ADR in the code like below, it first try to find the
> child device based on _ADR, if not found, it will check the _HID, and there
> is clear comment in the function.
> 
> /* bind auxiliary device to acpi device */
> static void ljca_auxdev_acpi_bind(struct ljca_adapter *adap,
> 				   struct auxiliary_device *auxdev,
> 				   u64 adr, u8 id)
> {
> 	struct ljca_match_ids_walk_data wd = { 0 };
> 	struct acpi_device *parent, *adev;
> 	struct device *dev = adap->dev;
> 	char uid[4];
> 
> 	parent = ACPI_COMPANION(dev);
> 	if (!parent)
> 		return;
> 
> 	/*
> 	 * get auxdev ACPI handle from the ACPI device directly
> 	 * under the parent that matches _ADR.
> 	 */
> 	adev = acpi_find_child_device(parent, adr, false);
> 	if (adev) {
> 		ACPI_COMPANION_SET(&auxdev->dev, adev);
> 		return;
> 	}
> 
> 	/*
> 	 * _ADR is a grey area in the ACPI specification, some
> 	 * platforms use _HID to distinguish children devices.
> 	 */
> 	switch (adr) {
> 	case LJCA_GPIO_ACPI_ADR:
> 		wd.ids = ljca_gpio_hids;
> 		break;
> 	case LJCA_I2C1_ACPI_ADR:
> 	case LJCA_I2C2_ACPI_ADR:
> 		snprintf(uid, sizeof(uid), "%d", id);
> 		wd.uid = uid;
> 		wd.ids = ljca_i2c_hids;
> 		break;
> 	case LJCA_SPI1_ACPI_ADR:
> 	case LJCA_SPI2_ACPI_ADR:
> 		wd.ids = ljca_spi_hids;
> 		break;
> 	default:
> 		dev_warn(dev, "unsupported _ADR\n");
> 		return;
> 	}
> 
> 	acpi_dev_for_each_child(parent, ljca_match_device_ids, &wd);

Ah ok, I see. So the code:

1. First tries to find the matching child acpi_device for the auxdev by ADR

2. If 1. fails then falls back to HID + UID matching

And there are DSDTs which use either:

1. Only use _ADR to identify which child device is which, like the example
   DSDT snippet from the commit msg.

2. Only use _HID + _UID like the 2 example DSDT snippets from me email

But there never is a case where both _ADR and _HID are used at
the same time (which would be an ACPI spec violation as Andy said).

So AFAICT there is no issue here since  _ADR and _HID are never
user at the same time and the commit message correctly describes
scenario 1. from above, so the commit message is fine too.

So I believe that we can continue with this patch series in
its current v20 form, which has already been staged for
going into -next by Greg.

Andy can you confirm that moving ahead with the current
version is ok ?

Regards,

Hans




