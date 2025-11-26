Return-Path: <linux-usb+bounces-30982-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 5823EC8C269
	for <lists+linux-usb@lfdr.de>; Wed, 26 Nov 2025 23:05:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id CD43035ABD3
	for <lists+linux-usb@lfdr.de>; Wed, 26 Nov 2025 22:05:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25AD0342523;
	Wed, 26 Nov 2025 22:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WS9TcaZy"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59DFA2E8E0C
	for <linux-usb@vger.kernel.org>; Wed, 26 Nov 2025 22:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764194697; cv=none; b=DVIguqx9pJ2rhZIxxatxZe81uZpjSH02tR70PsY9b/iYJF9FWhR7N5NHBrMU4DU+gw/BJBG4HGiO/Wkvw/oDo9C5/2KE9yawJMA1jnkrKQm+aZIlE/S3i8yztZtcXq3wXwcLq90dObTnTjEvqpdW49ADN8VSrVrL9A2mbZOtMvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764194697; c=relaxed/simple;
	bh=gqLSwHsrGZkhN+aFNTbmKSZgZc3SbCkcYs3ExiI7vJk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b8JaFl0pa5GqYizp66qF4tetGe1c7w2vG9IAmhkSFFHqXyVeqbJ83gF743JO9K4OzVitrIW6Z2mvvQFDY5fqSKcmXwQFgWMAwPvE7y/IN6z8RTogm6nBM5uTBzZuFtovclw4Zg5fCSp6pGUrLWxfRdTPMHndA/skGMDHfl71GXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WS9TcaZy; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7bb3092e4d7so212999b3a.0
        for <linux-usb@vger.kernel.org>; Wed, 26 Nov 2025 14:04:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764194694; x=1764799494; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ay1HyD/YXcJtqug9NBApq+fmqHdHRxdWGXWcfRUTS3Q=;
        b=WS9TcaZy5nuL1InS9I6cg8WwqY/z6Ctxns7IUCSRhChQqYh2yMEnMxO6jaD0ZdbyR+
         lVu8SiRoFXlsdMDMV1CePKlW1YyuOBd+ndZfLwgYqh/2/FY5mpExu57DZS0IeCcO8OeG
         1/KVfvchS0fOaNRA1IO2NFXi3qA6Zf4hfhQl8kqXdChI7hNItu+Gmsr6tSxjSY/Ke2xq
         gQjTpgMcNNtAex69WlIKxy1C/15AF300gW8aVpKg3n+cKng6u/z7id6POkFNbK1W9LtM
         G6QlTjUF8jXOw7youvpnryZqExjsOFb7YBWMDNgK2UXe5jjurBkHkqsJMEdTheqORaVX
         x+3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764194694; x=1764799494;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ay1HyD/YXcJtqug9NBApq+fmqHdHRxdWGXWcfRUTS3Q=;
        b=FWTWPTlhT36p59N8d3ukhnncLg3IeZL/HpxovJKaD5FEJiw++NePdDGGgab52aYU34
         TOA7FRUKbI9jpd+itOVToYWE25MWg0B+Lc3NnjEBaxV+YYpAvtK2NEUpSlge/uPsSC3U
         XmCbZcdf7VdahtFOGhbhmoVieeBsvdHtw7yDzUKrT1Le3apbGjGwTdeFzTwNuYMA5oXr
         S0TCbldop4QutHDi6i+UVDNw6qxwJDJ9EUuIOra07ubhTD8a1arT619LdgH3AD2MdU8B
         jxj4IrUN1n14IE0ZqsTmyfCdEaUSVUcvhwee5R1jM4kf5n+GBX2be7LQ1UmDrtMQL6x+
         mIaA==
X-Forwarded-Encrypted: i=1; AJvYcCUMn1yw1Qfx0eTZ4XAwThhQUvZRMsKkUT1OiTb2vdYdL7BSgzRMel76ZIL7UUrovH4VXFaB8Q3pMsg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSv4K3j+/uWvYPMHy6vAasJF5JziBmUprLog0DulaQMRyMmTS1
	oDemai5QdUH3pf99wAGSphA3hHNWwpzABz5+FC7jMCizUcgSw6VRc3gN19RBf0aLew==
X-Gm-Gg: ASbGncu/hkKw6H5GCr2pPBnigYIl7IcQKg6OhMGLNx0M8wvpYGBdmNQzOB3TvsDDdlv
	8GsBeHHYu8QXR2SxN9RowYld3Y2FsRvf2oxIq16HOjrKM0UcvUaxPU64z7R82Pn8zcheCdTBy9W
	3vB09IeqlklzWibYuz5wsSuWCfbBRmtUmxl/AzIE6ki5CrEuT/LYEF2uG0VjOdqJayzSXBk+YY8
	5d/uskMsOrNfOZaqKYfel2aCtB6abiVHid5oI7zeeIpZSEmD/1tUs5dPkcSJqsWpBZ4ymDt8Trw
	FP2ZlDt7n3k82JyaCsqx4re1hxG2cpF2PIsf8Uf7X5o9meREV9s/iemg8nA4i6ej8ktBP80VIqR
	ZQ7wNVRS/KkQsUeJQFBYl8eD39znfE6Lf3786MazBpnnhcgvZSuIAXIPCMjzJQO2zKjvktNuckl
	jyESAYyZyOZs3kxZV7tHpDhkBkjOzw/zA7aL0xtaxsReK7Yj13wqbTclMLZGfqAwmaGkFv/sIew
	LjSRy6iS6HJXw==
X-Google-Smtp-Source: AGHT+IHgCBAVlJ/1/Oj2H+nvmtjVOEfs8Cj4GuvQ7p3t9lR/WHGAMof8mvn31hs8D+Fx43GprBkfMw==
X-Received: by 2002:a05:6a20:244d:b0:343:64dc:8cc with SMTP id adf61e73a8af0-3614eb15e9fmr24287915637.12.1764194693250;
        Wed, 26 Nov 2025 14:04:53 -0800 (PST)
Received: from ?IPV6:2a00:79e0:2e7c:8:c116:b1c9:632d:a902? ([2a00:79e0:2e7c:8:c116:b1c9:632d:a902])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bd75def6346sm20451772a12.4.2025.11.26.14.04.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Nov 2025 14:04:52 -0800 (PST)
Message-ID: <be908072-fd0a-48dc-97e0-b120539f5584@google.com>
Date: Wed, 26 Nov 2025 14:04:51 -0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] power: supply: max77759: add charger driver
To: kernel test robot <lkp@intel.com>,
 Amit Sunil Dhamne via B4 Relay <devnull+amitsd.google.com@kernel.org>,
 Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Lee Jones <lee@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Badhri Jagan Sridharan <badhri@google.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 RD Babiera <rdbabiera@google.com>, Kyle Tso <kyletso@google.com>
References: <20251123-max77759-charger-v1-5-6b2e4b8f7f54@google.com>
 <202511261521.hSYp4ttf-lkp@intel.com>
Content-Language: en-US
From: Amit Sunil Dhamne <amitsd@google.com>
In-Reply-To: <202511261521.hSYp4ttf-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 11/25/25 11:38 PM, kernel test robot wrote:
> Hi Amit,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on 39f90c1967215375f7d87b81d14b0f3ed6b40c29]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Amit-Sunil-Dhamne-via-B4-Relay/dt-bindings-power-supply-Add-Maxim-MAX77759-charger/20251123-163840
> base:   39f90c1967215375f7d87b81d14b0f3ed6b40c29
> patch link:    https://lore.kernel.org/r/20251123-max77759-charger-v1-5-6b2e4b8f7f54%40google.com
> patch subject: [PATCH 5/6] power: supply: max77759: add charger driver
> config: um-randconfig-001-20251126 (https://download.01.org/0day-ci/archive/20251126/202511261521.hSYp4ttf-lkp@intel.com/config)
> compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251126/202511261521.hSYp4ttf-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202511261521.hSYp4ttf-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>     /usr/bin/ld: warning: .tmp_vmlinux1 has a LOAD segment with RWX permissions
>     /usr/bin/ld: drivers/power/supply/max77759_charger.o: in function `max77759_charger_probe':
>>> max77759_charger.c:(.ltext+0x27b): undefined reference to `devm_regulator_register'
>     /usr/bin/ld: drivers/power/supply/max77759_charger.o: in function `enable_usb_otg':
>>> max77759_charger.c:(.ltext+0x983): undefined reference to `rdev_get_drvdata'
>     /usr/bin/ld: drivers/power/supply/max77759_charger.o: in function `disable_usb_otg':
>     max77759_charger.c:(.ltext+0x9c3): undefined reference to `rdev_get_drvdata'
>     /usr/bin/ld: drivers/power/supply/max77759_charger.o: in function `usb_otg_status':
>     max77759_charger.c:(.ltext+0xa06): undefined reference to `rdev_get_drvdata'
>     clang: error: linker command failed with exit code 1 (use -v to see invocation)
I believe this is because of a missing "depends on REGULATOR". Will fix 
it in the next revision.

