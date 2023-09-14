Return-Path: <linux-usb+bounces-29-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 351A879FE2F
	for <lists+linux-usb@lfdr.de>; Thu, 14 Sep 2023 10:22:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B30D7B20947
	for <lists+linux-usb@lfdr.de>; Thu, 14 Sep 2023 08:22:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F13DC19BD7;
	Thu, 14 Sep 2023 08:21:12 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7970C8E7
	for <linux-usb@vger.kernel.org>; Thu, 14 Sep 2023 08:21:12 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1EF5F1BFC
	for <linux-usb@vger.kernel.org>; Thu, 14 Sep 2023 01:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694679671;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gORgBWCz3hCk/bsvpm1Zfcrjb1Hz/L3M1pTUN8fqGWo=;
	b=FrbIcTd2PwRN+LUPdKPp17Ebta46Svgd9tlSkn314tUuOpEAOOnfLU7l5z7kJSqCLNQx64
	5YjrHttfbe+/22Hilu7HWP3w1QIm4q5zKzWVVnQpCpGNjci2GL4pjd1mR06ryR8aKBtjtk
	4G8gkBj5Z3yuTPNFMDhjQZw03uuL21o=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-504-ZS_NVnL9MkmMy4xrfW2q-A-1; Thu, 14 Sep 2023 04:21:09 -0400
X-MC-Unique: ZS_NVnL9MkmMy4xrfW2q-A-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-9ad8a967a30so57922566b.0
        for <linux-usb@vger.kernel.org>; Thu, 14 Sep 2023 01:21:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694679668; x=1695284468;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gORgBWCz3hCk/bsvpm1Zfcrjb1Hz/L3M1pTUN8fqGWo=;
        b=g9sQ9LGdiNNigX0jIwjiVRLWEZJ4+zCS1ZcbPgbArdk7nQRAzjQPqVBf8VLC1MVeHV
         DokIF5w37+YlI+2vS8mPfzNXUeyeR/gZ8NFs7ttDUkqgH86QOA3TEN02vmttm3ej58Dg
         8nh8RVGO4sp70vR3bTS8qsnWWTUVpWkfY8jJno3sZC1+aXOyCKoEHBqwZHnvp52tdcUV
         CUBRjOeWJOnPmACARLu0RA/FhxjPOHlHxLezdMgPMUYZiuWiN2nrBJK3irL2ca1QQdqq
         uwgOp/KDgMLzmh1xF1fnK4F/MGJb/YrptkdD0pXJ+se1Ur+0ardItVJx0Jfl3Af7hy3N
         yASA==
X-Gm-Message-State: AOJu0Yzpiaq6YB9+oAWRIiGN0CMUfxCXDe+1ffSt10LKnKZ8DrbhaV/x
	xjr0N048u/Xu6ZB5DNzfmVAlBRay8guYuypF3DXbjGzdo3VMmRvGmJw5eidwIMk998zx6mvrxbq
	KCld9PQtMA7GsJybuORFF
X-Received: by 2002:a17:906:3297:b0:9a5:ceab:f496 with SMTP id 23-20020a170906329700b009a5ceabf496mr4081149ejw.58.1694679668725;
        Thu, 14 Sep 2023 01:21:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFIHVU/Fju08DmHRKzYeSJRU9Ob1ijnlRZaI7gxrw6vRuFB2bAZhoQPlpyfvbxJKGQRPZ+NXA==
X-Received: by 2002:a17:906:3297:b0:9a5:ceab:f496 with SMTP id 23-20020a170906329700b009a5ceabf496mr4081120ejw.58.1694679668430;
        Thu, 14 Sep 2023 01:21:08 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id x5-20020a1709065ac500b00993664a9987sm647322ejs.103.2023.09.14.01.21.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Sep 2023 01:21:07 -0700 (PDT)
Message-ID: <05b9b252-653c-7cf7-9b96-59d9f662b81e@redhat.com>
Date: Thu, 14 Sep 2023 10:21:06 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v16 1/4] usb: Add support for Intel LJCA device
Content-Language: en-US, nl
To: "Wu, Wentong" <wentong.wu@intel.com>, Oliver Neukum <oneukum@suse.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Cc: "arnd@arndb.de" <arnd@arndb.de>, "mka@chromium.org" <mka@chromium.org>,
 "lee@kernel.org" <lee@kernel.org>, "wsa@kernel.org" <wsa@kernel.org>,
 "kfting@nuvoton.com" <kfting@nuvoton.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "maz@kernel.org" <maz@kernel.org>, "brgl@bgdev.pl" <brgl@bgdev.pl>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>,
 "andi.shyti@linux.intel.com" <andi.shyti@linux.intel.com>,
 "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
 "bartosz.golaszewski@linaro.org" <bartosz.golaszewski@linaro.org>,
 "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>,
 "Wang, Zhifeng" <zhifeng.wang@intel.com>
References: <1694569212-10080-1-git-send-email-wentong.wu@intel.com>
 <1694569212-10080-2-git-send-email-wentong.wu@intel.com>
 <a3b75e11-9cf0-4ee3-be90-fba73bd5df3d@suse.com>
 <DM6PR11MB43162A9B2AC68B2686BBE2598DF7A@DM6PR11MB4316.namprd11.prod.outlook.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <DM6PR11MB43162A9B2AC68B2686BBE2598DF7A@DM6PR11MB4316.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 9/14/23 03:05, Wu, Wentong wrote:
>> From: Oliver Neukum <oneukum@suse.com>
>>
>> On 13.09.23 03:40, Wentong Wu wrote:
>>
>>> +struct ljca_bank_descriptor {
>>> +	u8 bank_id;
>>> +	u8 pin_num;
>>> +
>>> +	/* 1 bit for each gpio, 1 means valid */
>>> +	u32 valid_pins;
>>
>> No endianness?
> 
> On both sides, the endianness is same.

Right, but normally USB drivers are also written so that they can work on big-endian CPUs.

I realize that this driver will likely never be used with a big-endian CPU but still it is good practice to make the driver work on big-endian CPUs too. Even if it is just to set a good example when other drivers copy the code.

So this should be:

struct ljca_bank_descriptor {
	u8 bank_id;
	u8 pin_num;

	/* 1 bit for each gpio, 1 means valid */
	__le32 valid_pins;
} __packed;

And then when reading valid_pins you should use:

	u32 valid_pins = get_unaligned_le32(&ljca_bank_descriptor.valid_pins);

On x86_64 the compiler should optimize all of this away to
just a regular read.

Regards,

Hans



