Return-Path: <linux-usb+bounces-1689-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6457CB13A
	for <lists+linux-usb@lfdr.de>; Mon, 16 Oct 2023 19:20:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 85E57281784
	for <lists+linux-usb@lfdr.de>; Mon, 16 Oct 2023 17:20:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A3E231A7C;
	Mon, 16 Oct 2023 17:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HZc/JTan"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB7B30FBA
	for <linux-usb@vger.kernel.org>; Mon, 16 Oct 2023 17:20:24 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E3FAAB
	for <linux-usb@vger.kernel.org>; Mon, 16 Oct 2023 10:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697476822;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IB8ijEdDwJemoPTssoo1rbFdLIyoQawFS03Tg5RD9fQ=;
	b=HZc/JTankE+lWC8WPpMmNGtvpnI5USQJZ5JLRSZ/X5LEYnuhQy39GjlpBmPxw3EZ6eLZAd
	lGpR/OrCfWT0DXftNrVxnMvRWh5u88wNyXZNeHEaPeeed9J+oAn9hKI2qNlMUowW9gzXvW
	p6mhZgGBLQvj8KO5760q+wtjJc8/MnU=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-209-Hw01YByeNB6i4Swzk5qUSA-1; Mon, 16 Oct 2023 13:20:20 -0400
X-MC-Unique: Hw01YByeNB6i4Swzk5qUSA-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-9b65c46bca8so64876766b.1
        for <linux-usb@vger.kernel.org>; Mon, 16 Oct 2023 10:20:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697476819; x=1698081619;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IB8ijEdDwJemoPTssoo1rbFdLIyoQawFS03Tg5RD9fQ=;
        b=enf0NDQsN/To0zYKJ2k6AC/lccvq5fDCnlG5D7ih9MU05QbgFHl8UgO8k9G3/Pk4Z8
         Z8sH3iI+A2SazPk7Mt01Vk4ePlWXCYW0JIycdrPcg/p7z3UoKeTgKYy3MkL6wFioFr2s
         It4DquU7y0k6QZgywz3V6RcHL6Q44bn8Am3kcwUZNz/pa6xb09PPoHbv5Whcd/9FBOnP
         oyZm/m287MnYstEQz+9qXmMOGdYXSLFoP//hpe+bIOR2fbgONq36T7YkiDv/ITj60F5N
         iU6SClMGOvOVe50zu0hlojebHnceV3OV8KPVRkSkmkd4hr6S5Snr0XKASUxMKjlQf0O3
         hA6Q==
X-Gm-Message-State: AOJu0YxxdNx484hKehlNwqqmYIfs9qMRy1SH1hYsRiN4e5JHCD275c3a
	rjiT54stGsuYXEV+XqDhM3q6oeW0kzHqx4Z/R+mAnWxUA9Q/mAhCUGhpMjC0UG/Z0RNZXOwR83i
	I7534u0ts8TvcpmX74/iQ
X-Received: by 2002:a17:906:4fc7:b0:9be:dce3:6e07 with SMTP id i7-20020a1709064fc700b009bedce36e07mr5538507ejw.32.1697476819507;
        Mon, 16 Oct 2023 10:20:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFyQXWWwAP/eW5eefiiR9ndnCb91EORwxQ3opyiCWlj496ZaVbyT5HGgZWO9aC83VCWTOXj4A==
X-Received: by 2002:a17:906:4fc7:b0:9be:dce3:6e07 with SMTP id i7-20020a1709064fc700b009bedce36e07mr5538478ejw.32.1697476819117;
        Mon, 16 Oct 2023 10:20:19 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id r20-20020a1709062cd400b009ad8084e08asm4363084ejr.0.2023.10.16.10.20.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Oct 2023 10:20:18 -0700 (PDT)
Message-ID: <5747b78e-1956-8249-8f5e-85426b3efd01@redhat.com>
Date: Mon, 16 Oct 2023 19:20:17 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v20 1/4] usb: Add support for Intel LJCA device
To: "Shevchenko, Andriy" <andriy.shevchenko@intel.com>,
 "Wu, Wentong" <wentong.wu@intel.com>
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
References: <6a87b43a-0648-28d4-6c69-e0f684e44eb6@redhat.com>
 <DM6PR11MB4316BE44F53E276384FF06C88DCCA@DM6PR11MB4316.namprd11.prod.outlook.com>
 <5d2e9eba-a941-ea9a-161a-5b97d09d5d35@redhat.com>
 <ZSmjEKfYzFuAHXW+@smile.fi.intel.com>
 <9a080d06-586d-686f-997e-674cb8d16099@redhat.com>
 <DM6PR11MB43169A9ADDA7681DB7D9347C8DD7A@DM6PR11MB4316.namprd11.prod.outlook.com>
 <ZSzogNhlX9njvOIU@smile.fi.intel.com>
 <DM6PR11MB4316382324D15985A70E531C8DD7A@DM6PR11MB4316.namprd11.prod.outlook.com>
 <2023101653-shiftless-scorebook-19e3@gregkh>
 <DM6PR11MB4316711C71937AE3C0516C7B8DD7A@DM6PR11MB4316.namprd11.prod.outlook.com>
 <ZS1fSPhfREVlELLD@smile.fi.intel.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZS1fSPhfREVlELLD@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Hi,

On 10/16/23 18:05, Shevchenko, Andriy wrote:
> On Mon, Oct 16, 2023 at 06:44:21PM +0300, Wu, Wentong wrote:
>>> From: gregkh@linuxfoundation.org
>>> On Mon, Oct 16, 2023 at 03:05:09PM +0000, Wu, Wentong wrote:
>>>>> From: Shevchenko, Andriy
>>>>> On Mon, Oct 16, 2023 at 08:52:28AM +0300, Wu, Wentong wrote:
> 
> ...
> 
>>>>> But this does not confirm if you have such devices. Moreover, My
>>>>> question about _CID per function stays the same. Why firmware is not using
>>> it?
>>>>
>>>> Yes, both _ADR and _CID can stop growing list in the driver. And for
>>>> _ADR, it also only require one ID per function. I don't know why BIOS
>>>> team doesn't select _CID, but I have suggested use _ADR internally,
>>>> and , to make things moving forward, the driver adds support for _ADR here
>>> first.
>>>>
>>>> But you're right, _CID is another solution as well, we will discuss it
>>>> with firmware team more.
>>>
>>> Should I revert this series now until this gets sorted out?
>>
>> Current _ADR support is a solution, I don't think _CID is better than _ADR to both
>> stop growing list in driver and support the shipped hardware at the same time.
>>
>> Andy, what's your idea? 
> 
> In my opinion if _CID can be made, it's better than _ADR. As using _ADR like
> you do is a bit of grey area in the ACPI specification. I.o.w. can you get
> a confirmation, let's say, from Microsoft, that they will go your way for other
> similar devices?
> 
> Btw, Microsoft has their own solution actually using _ADR for the so called
> "wired" USB devices. Is it your case? If so, I'm not sure why _HID has been
> used from day 1...
> 
> Also I suggest to wait for Hans' opinion on the topic.

I definitely don't think we should revert the entire series since this
supports actual hw which has already been shipping for years.

But if the _ADR support is only there to support future hw and
it is not even certain yet that that future hw is actually going
to be using _ADR support then I believe that a follow-up patch
to drop _ADR support for now is in order. We can then re-introduce
it (revert the follow up patch) if future hw actually starts
using _ADR support.

Specifically what I'm suggesting is something like the following:

diff --git a/drivers/usb/misc/usb-ljca.c b/drivers/usb/misc/usb-ljca.c
index c9decd0396d4..e1bbaf964786 100644
--- a/drivers/usb/misc/usb-ljca.c
+++ b/drivers/usb/misc/usb-ljca.c
@@ -457,8 +457,8 @@ static void ljca_auxdev_acpi_bind(struct ljca_adapter *adap,
 				  u64 adr, u8 id)
 {
 	struct ljca_match_ids_walk_data wd = { 0 };
-	struct acpi_device *parent, *adev;
 	struct device *dev = adap->dev;
+	struct acpi_device *parent;
 	char uid[4];
 
 	parent = ACPI_COMPANION(dev);
@@ -466,17 +466,7 @@ static void ljca_auxdev_acpi_bind(struct ljca_adapter *adap,
 		return;
 
 	/*
-	 * get auxdev ACPI handle from the ACPI device directly
-	 * under the parent that matches _ADR.
-	 */
-	adev = acpi_find_child_device(parent, adr, false);
-	if (adev) {
-		ACPI_COMPANION_SET(&auxdev->dev, adev);
-		return;
-	}
-
-	/*
-	 * _ADR is a grey area in the ACPI specification, some
+	 * Currently LJCA hw does not use _ADR instead current
 	 * platforms use _HID to distinguish children devices.
 	 */
 	switch (adr) {

As a follow-up patch to the existing series.

Regards,

Hans



