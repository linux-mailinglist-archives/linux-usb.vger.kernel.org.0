Return-Path: <linux-usb+bounces-14531-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 632ED969701
	for <lists+linux-usb@lfdr.de>; Tue,  3 Sep 2024 10:27:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 15191285077
	for <lists+linux-usb@lfdr.de>; Tue,  3 Sep 2024 08:27:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B1F72139B5;
	Tue,  3 Sep 2024 08:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aB9Dhkrn"
X-Original-To: linux-usb@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC9B205E07
	for <linux-usb@vger.kernel.org>; Tue,  3 Sep 2024 08:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725352035; cv=none; b=pfwHPk69em7uT2LVU4j6aQ079KsN187Be782hkRLZyCkfNKhmelz36ATqMk80zuT4P4ekgLnyxN197Fdadu5wg3gZcuo0+sSqEBUWdWsZ949vZG0yqBNeTCdL2Jp2cvTDP100NtpIss4c+E6mbUsYRjspgHTHGFx2CcPVphlJWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725352035; c=relaxed/simple;
	bh=JM+UzVzN2X1BJlZYQbgSK/cg+c8DszVeVxI7Npaipfo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rht4VjEn7ghGidMaza3RLPJtSwe6QPCs7Lt6iTie1H7QAZP3AMA/6YVxuH+XwyH6BenWIHIneCLJzDMg3Cm+TypfBOvs2WnBG0AI9FN+xPF72ENlr/2ySO5yIPkbgMNYbg0KhqwjWUrIee8P3lqJVfVWfaKdBABpoaO3s3z6th0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aB9Dhkrn; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725352032;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SQvL7LZaA4b20/+0DqQPZRRvdK7BBL5AnON4S+Zxmn4=;
	b=aB9Dhkrn3FOxWSARjeM2MEcxOIsuUwHEid8C9uFcw7UgyKgx0GMccO1dE2Gxu0Q4hJoDPt
	QWl5eGMMA1sxPqJ68Wk1q2knwBzKarIL79sN6AY9YqcXe23Bylqbtt8fPFHSE4WKCk+FbI
	++CBqZnFTjmWSnPRB/IEDsxXQAMTUtc=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-197-pyjbCthRPdCGBjoWgo2sxQ-1; Tue, 03 Sep 2024 04:27:11 -0400
X-MC-Unique: pyjbCthRPdCGBjoWgo2sxQ-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-5c260907f5bso1049909a12.0
        for <linux-usb@vger.kernel.org>; Tue, 03 Sep 2024 01:27:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725352030; x=1725956830;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SQvL7LZaA4b20/+0DqQPZRRvdK7BBL5AnON4S+Zxmn4=;
        b=Cqk0yXYCymuAIbfCdhNm8ILhXuaF2RJOzr/pP2hZHtUugWd+iOZEXyEyPqoJuZgHcS
         qtu7BeCO80Y2mlqDE5nyoKfZEQ9zy1/eG6okSjbmQp2NIt1WG0OAdFrgKKgpp90aJGzO
         SKNqUy+3F6nRa5EZf628JYtKaRT5QLuaBEBRhCokG/lYWhROjy5NMk84EVb2EvTbdYij
         GkGfckpiPRlK4vPLy74FTuPFL/YOOnCZib/z+ejADLR8JLqen3YSyQ8bAcr7N/p3nScw
         y7qjgblZFq/zL4lbes0yANSSpupv7rPYK2rUMYOTZasQ2FKYAYXGBL7qoMYt46G/woxL
         QdYw==
X-Forwarded-Encrypted: i=1; AJvYcCWTzxtyBaQNMzmsLBuqustKECukfI/qwFhqgU+o0vkJL72j+mqMxVSodaEOaOvmAcLtJoDTOI9+keo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVfFf7+bXFrdf1c3yK6SVCmlg8d9V6Hhfm2K7B6JISH24IOshU
	oe9Y5mRGkLOAh9FQjiqjp+5MDztjKhLyaHcmDTJtuCtq/fbCBcz4KFIsjL6s5GlrmfYy3peJ2pG
	ikClbVEUZETpIqM1zqm2duNGodU17EqWmQvf6TY2D1tF5eEtQYf124Hg+UQ==
X-Received: by 2002:a05:6402:3485:b0:5c2:4cbe:ac1c with SMTP id 4fb4d7f45d1cf-5c25f22d543mr4046207a12.4.1725352030218;
        Tue, 03 Sep 2024 01:27:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZkT4IwliSyOul1sm+Ls6jB9kvfwfo2otYij4PfY15gdZaWfssNk4SbA6NFcQWLh0QS++FMQ==
X-Received: by 2002:a05:6402:3485:b0:5c2:4cbe:ac1c with SMTP id 4fb4d7f45d1cf-5c25f22d543mr4046188a12.4.1725352029687;
        Tue, 03 Sep 2024 01:27:09 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c226ce4fb9sm6517563a12.87.2024.09.03.01.27.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Sep 2024 01:27:09 -0700 (PDT)
Message-ID: <6f4e23ce-2f32-44fc-93d9-ab7d0867b0ee@redhat.com>
Date: Tue, 3 Sep 2024 10:27:08 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] power: supply: Change usb_types from an array into a
 bitmask
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sebastian Reichel <sre@kernel.org>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi
 <cw00.choi@samsung.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Enric Balletbo Serra <enric.balletbo@collabora.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-phy@lists.infradead.org
References: <20240831142039.28830-1-hdegoede@redhat.com>
 <20240831142039.28830-7-hdegoede@redhat.com>
 <2024090340-mumbo-worsening-9a55@gregkh>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <2024090340-mumbo-worsening-9a55@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Greg,

Thank you for the reviews.

On 9/3/24 9:04 AM, Greg Kroah-Hartman wrote:
> On Sat, Aug 31, 2024 at 04:20:39PM +0200, Hans de Goede wrote:
>> The bit_types array just hold a list of valid enum power_supply_usb_type
>> values which map to 0 - 9. This can easily be represented as a bitmap.
>>
>> This reduces the size of struct power_supply_desc and further reduces
>> the data section size by drivers no longer needing to store the array.
>>
>> This also unifies how usb_types are handled with charge_behaviours,
>> which allows power_supply_show_usb_type() to be removed.
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> 
> Nice!
> 
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

I assume this also counts as an ack for merging this through
the linux-power-supply tree ?

Regards,

Hans




