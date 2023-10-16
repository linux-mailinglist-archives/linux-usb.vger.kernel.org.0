Return-Path: <linux-usb+bounces-1653-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B35057CA0AE
	for <lists+linux-usb@lfdr.de>; Mon, 16 Oct 2023 09:35:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 562E0281506
	for <lists+linux-usb@lfdr.de>; Mon, 16 Oct 2023 07:35:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B413E1642D;
	Mon, 16 Oct 2023 07:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZBUXoc8a"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D8B168CC
	for <linux-usb@vger.kernel.org>; Mon, 16 Oct 2023 07:35:37 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8763EB4
	for <linux-usb@vger.kernel.org>; Mon, 16 Oct 2023 00:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697441735;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W5sTI1b2MESB7gMCaMCVhRQAJarvVq2SnKhZxnWdEek=;
	b=ZBUXoc8aeMIMRi4IY0wAUzfhflrHQrpaN9zZOz6Hkxn5nWjS2ZoRBTP4G8LQxjYTWxUUfY
	G0iXFQoui8iUyy4VQXBQoRnwDTts5SBAXjvoNOYfgmoGsZjDHNA6trbdhfSHAZhdgYK8SZ
	DN6KUt585aQVxQgB5Pw+epQ7j5yQcmQ=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-93-ucoOsvUfNk2KIk3VJMOATg-1; Mon, 16 Oct 2023 03:35:29 -0400
X-MC-Unique: ucoOsvUfNk2KIk3VJMOATg-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-9b9ecd8c351so282037766b.1
        for <linux-usb@vger.kernel.org>; Mon, 16 Oct 2023 00:35:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697441728; x=1698046528;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W5sTI1b2MESB7gMCaMCVhRQAJarvVq2SnKhZxnWdEek=;
        b=sVctkLa+93jKPPKIlnVhzAo1JajPz/XCFkji5SHQcUnkw4R1cwazf5g1PGqF7Gbso2
         IFT8Qj9SC1pjQpv9Vi0gzEEA9PK6T6uKVPKPiVqzWvhcEifpQVd/w8tjU01v+CEiFjGO
         CBdIiA2ML/ei6Eg3YST0TaOgE7dvgKIeJLV7UJZZU2Lf6swpv7Sa7wsgNlcr5/xmkhBs
         JsZWSnK2aphEXQ1vNGyNc9XaU+Vf2l5q+0prlJ5fkfSUSvYd4z/X3zWan4U8Z25uF8sH
         9aM7l0CRCjXuvdfkWEU0qOygyH3CRfjolw2BKEltGQ7ROAodJhoolZwnzQHej8lwuSXM
         68/w==
X-Gm-Message-State: AOJu0YzAKVCS2Jjr6NGMoSCZXkcxIgIr3H9MlSW/2pp7bHRcR/EULKKl
	G66SYiOm/Xu4ObqDNYOw8Z5sGcNZjmJ6nqGVJ8VWa/PIJtLcHGt6A2V9SJ9BSvYIcRtdgaXtfXj
	2m2aDnE4Alo505T4V3EGL
X-Received: by 2002:a17:907:608e:b0:9be:ef46:6b9c with SMTP id ht14-20020a170907608e00b009beef466b9cmr5011498ejc.70.1697441728149;
        Mon, 16 Oct 2023 00:35:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEPHQgkWUS0nO8Kux/hwaHjzzpGovdcAU2gG2lS6RZujLr93I17prloU1tE+4cFr6DLZW5kGw==
X-Received: by 2002:a17:907:608e:b0:9be:ef46:6b9c with SMTP id ht14-20020a170907608e00b009beef466b9cmr5011469ejc.70.1697441727791;
        Mon, 16 Oct 2023 00:35:27 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id c22-20020a170906529600b0099c53c4407dsm3490401ejm.78.2023.10.16.00.35.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Oct 2023 00:35:26 -0700 (PDT)
Message-ID: <9810930b-dd76-9b1d-fb63-87a7a6059d0b@redhat.com>
Date: Mon, 16 Oct 2023 09:35:25 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v20 1/4] usb: Add support for Intel LJCA device
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
 <5d2e9eba-a941-ea9a-161a-5b97d09d5d35@redhat.com>
 <ZSmjEKfYzFuAHXW+@smile.fi.intel.com>
 <9a080d06-586d-686f-997e-674cb8d16099@redhat.com>
 <DM6PR11MB43169A9ADDA7681DB7D9347C8DD7A@DM6PR11MB4316.namprd11.prod.outlook.com>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <DM6PR11MB43169A9ADDA7681DB7D9347C8DD7A@DM6PR11MB4316.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Hi,

On 10/16/23 07:52, Wu, Wentong wrote:
>> From: Hans de Goede <hdegoede>
>>
>> Hi Andy,
>>
>> On 10/13/23 22:05, Shevchenko, Andriy wrote:
>>> On Thu, Oct 12, 2023 at 01:14:23PM +0200, Hans de Goede wrote:
>>
>> <snip>
>>
>>>> Ah ok, I see. So the code:
>>>>
>>>> 1. First tries to find the matching child acpi_device for the auxdev
>>>> by ADR
>>>>
>>>> 2. If 1. fails then falls back to HID + UID matching
>>>>
>>>> And there are DSDTs which use either:
>>>>
>>>> 1. Only use _ADR to identify which child device is which, like the example
>>>>    DSDT snippet from the commit msg.
>>>>
>>>> 2. Only use _HID + _UID like the 2 example DSDT snippets from me
>>>> email
>>>>
>>>> But there never is a case where both _ADR and _HID are used at the
>>>> same time (which would be an ACPI spec violation as Andy said).
>>>>
>>>> So AFAICT there is no issue here since  _ADR and _HID are never user
>>>> at the same time and the commit message correctly describes scenario
>>>> 1. from above, so the commit message is fine too.
>>>>
>>>> So I believe that we can continue with this patch series in its
>>>> current v20 form, which has already been staged for going into -next
>>>> by Greg.
>>>>
>>>> Andy can you confirm that moving ahead with the current version is ok
>>>> ?
>>>
>>> Yes as we have a few weeks to fix corner cases.
>>>
>>> What I'm worrying is that opening door for _ADR that seems never used
>>> is kinda an overkill here (resolving non-existing problem).
>>
>> I assume that there actually some DSDTs using the _ADR approach and that this
>> support is not there just for fun.
> 
> right, it's not for fun, we use _ADR here is to reduce the maintain effort because
> currently it defines _HID for every new platform and the drivers have to be updated
> accordingly, while _ADR doesn't have that problem.

Hmm, this sounds to me like _ADR is currently not actually being used in any
shipping DSDTs ?

Adding support for it to the driver seems a bit premature then IMHO ?

Also HIDs can perfectly be re-used for compatible hardware in
a newer generation so that is really not a good argument to use _ADR
instead.

Regards,

Hans



