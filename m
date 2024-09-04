Return-Path: <linux-usb+bounces-14632-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F02A696B69E
	for <lists+linux-usb@lfdr.de>; Wed,  4 Sep 2024 11:28:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A506728A91E
	for <lists+linux-usb@lfdr.de>; Wed,  4 Sep 2024 09:28:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A146D1CF5C4;
	Wed,  4 Sep 2024 09:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OuwYr5/8"
X-Original-To: linux-usb@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF171CF5C0
	for <linux-usb@vger.kernel.org>; Wed,  4 Sep 2024 09:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725442012; cv=none; b=cGtICIL7dXvOH7JGScEylA1y3+eWcNOXKGCNbFK9vVnm/C6Ft3jG60gZccy3tAY3Yctcivdl5Y2fsDwke1WYJhXUydi4bCrVrntB/+8wdM7PJzJ2A7kIG9cKA5fD1h3aAf1/kj0yuRmYSSDhqa5/d+FHoUKGmpwbkp0nic/oF6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725442012; c=relaxed/simple;
	bh=W/d06opoeL8MLeISK+zT1fvSzSKcyQU5Tg+nXjeJ/aI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o4EFDzadNxGZVOJ5KGf/eG6G4w50f5bFpDtr8AXihsP30BGghAebAragpNwqfAKbxA8S6cx5R2EWI3EqIsvDAVNdjXIMkhaKDqAq2iGjlPrltHe+v2cqALmfDyu7DUjuzyhGmXRx4z55tWKoRSGB4zTuE56sYy34uDPwNL14pMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OuwYr5/8; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725442009;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SGMDfa3Bec/ArdYvFpR6Hu7GEx9nNeUcYfjXHJm4mxI=;
	b=OuwYr5/82gf1xZctbVGwQoBVJXxxDZ0Mi6f+rK5zHDIQabADVbw3ff3LXvJsWwxKr84lSZ
	194HcotTZeG+ofRw4OkTD4ODLwKFdPwDWIlcfXo3ocD0I5ygk+ABqTvXwGYLG4i1eJ+Lw/
	0l+Yw6rg7G5Rj+4iZ3TMHHuievxQNc4=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-597-qT9xoGw6OyKJpISUWiDTWQ-1; Wed, 04 Sep 2024 05:26:48 -0400
X-MC-Unique: qT9xoGw6OyKJpISUWiDTWQ-1
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-53349795d48so2127140e87.0
        for <linux-usb@vger.kernel.org>; Wed, 04 Sep 2024 02:26:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725442004; x=1726046804;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SGMDfa3Bec/ArdYvFpR6Hu7GEx9nNeUcYfjXHJm4mxI=;
        b=gVSfOB5WNcI03AL3Bo8BS4I6e/AB2Bv6FBMwrFFrZFR41Vqo+C4GhTFEmOME3swrha
         8RMV05lcsk30T2U5m8GR5ey8xWJu6ophzGdwT9w0AOfFgXSupHGpTusaAY8tf+v4cEES
         NB0VfQ+ItY9XN70OikPha6PlN5H1jlEhxKMbyfgApQRQuYalaP7qVPil+/p9ndmtWeh0
         ptP15+C2lamIrpxAfH94FbYhZVd/giDAXA6E8UT513fqCW/v3lyPCeVENFmFbzwuGiMV
         IEk+tNEa3OCDTBmvh3vuQbt/UzZmIAXCw9wepXBcW9FtGUwDwqmpGVY02/qC2xgFw20j
         3/AQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvI1J2rroKPjJnN2OSFnls/WSgrDw1dGYAAA+zCkS9lmocX8MfT/hd5b09D553+IjEg5SkzYJaM+E=@vger.kernel.org
X-Gm-Message-State: AOJu0YymTu/IiHz6ba74p4CvOd1Y3wf7A5+ULsSF5RKG6xqOPmgw/kPR
	F7iMYQltE9MVFLv1olTREpewWrwXqmvsQHDVpTY7tSaapk77ymHKt1OZNbdZMY+uoEfDm1WK6lK
	cUlGpEmw09TVBPc5Zl5rjCL8jq6+pnpgg9g+lc/KEPECqYA6ODdj0D9hOwg==
X-Received: by 2002:a05:6512:3a95:b0:52e:97b3:42a1 with SMTP id 2adb3069b0e04-53546b271damr10358680e87.24.1725442003565;
        Wed, 04 Sep 2024 02:26:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFDnqP0JR7XUOSJNlvelC6lZrlFyXexs7kVqkjHiQ57R3hhUrCbDj2RrDPJJmY4gaF4BOb/5g==
X-Received: by 2002:a05:6512:3a95:b0:52e:97b3:42a1 with SMTP id 2adb3069b0e04-53546b271damr10358588e87.24.1725442001207;
        Wed, 04 Sep 2024 02:26:41 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8988feb0e5sm797577066b.12.2024.09.04.02.26.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Sep 2024 02:26:40 -0700 (PDT)
Message-ID: <8febdf39-ea1a-4e03-afc8-bd6e0c3b8624@redhat.com>
Date: Wed, 4 Sep 2024 11:26:40 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] power: supply: Change usb_types from an array into a
 bitmask
To: Sebastian Reichel <sre@kernel.org>
Cc: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi
 <cw00.choi@samsung.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Enric Balletbo Serra <enric.balletbo@collabora.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-phy@lists.infradead.org
References: <20240831142039.28830-1-hdegoede@redhat.com>
 <ez5ja55dl7w7ynq2wv4efsvvqtk4xyalf4k6agtsuhpgrtlpg3@d6ghlle4cu2q>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ez5ja55dl7w7ynq2wv4efsvvqtk4xyalf4k6agtsuhpgrtlpg3@d6ghlle4cu2q>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 9/4/24 12:04 AM, Sebastian Reichel wrote:
> Hi,
> 
> On Sat, Aug 31, 2024 at 04:20:33PM GMT, Hans de Goede wrote:
>> When support for the "charge_behaviour" property was added the list of
>> available values was made a bitmask in power_supply_desc.
>>
>> "usb_types" is very similar in that:
>> 1. It is an enum
>> 2. The list of available values is stored in power_supply_desc
>> 3. When shown it shows all available values, with the active one surrounded
>>    by square brackets.
>>
>> But "usb_types" uses an array with valid enum values instead of a bitmask.
>> This uses more memory then the bitmap approach and it makes it impossible
>> to have a shared generic show() function for properties which show
>> available values, with the active one surrounded by square brackets.
>>
>> This patch-set moves "usb_types" over to a bitmask in power_supply_desc
>> to indicate the available values.
>>
>> Patches 1 - 3:
>>
>> It turns out that the ucs1002-power driver contained a surprise in that
>> it supports writing to "usb_type" even though the ABI doc says it is
>> read-only. Since we cannot break shipped userspace API, the ship has sailed
>> on this one. The first patch documents that writing "usb_type" is allowed,
>> but only for power-supply devices which provide USB power rather then
>> consume it.
>>
>> Enum properties accept writing the FOO_TEXT[] string values, passing
>> the enum value matching the FOO_TEXT entry to set_property(), the second
>> patch adjusts ucs1002_set_usb_type() to directly accept enum values.
>>
>> The rt9467 driver was another driver which allowed writing to "usb_type"
>> but there the use made no sense, so it is simply dropped.
>>
>> Patches 4 - 6:
>>
>> These patches implement the actual moving of usb_types to a bitmask.
>>
>> Patch 6 is a bit of a bigbang patch moving all drivers over in one go,
>> touching a couple of drivers outside drivers/power/supply: 1 in
>> drivers/extcon/ 1 in drivers/phy/ and 5 in drivers/usb/typec/ since
>> the changes outside of drivers/power/supply are small I've chosen to
>> make all the changes in one go rather then have some sort of
>> intermediate state where both ways are supported.
>>
>> For merging this I believe it would be best for an immutable branch / tag
>> to be created on the linux-power-supply tree and then send a pull-request
>> to the extcon, phy and usb-typec maintainers to merge the tag.
>>
>> extcon, phy and typec maintainers can you please give your Acked-by for
>> patch 6/6 for merging these changes through the linux-power-supply tree?
>>
>> This set is based on top of the latest linux-power-supply/for-next.
> 
> As we are quite close before the merge window I just took it with
> just the Ack from Greg. The changes in PHY and Extcon are quite
> small.

Great, thank you.

Regards,

Hans




> I did prepare an immutable branch in case it is needed by
> any of the other involved trees:
> 
> The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:
> 
>   Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-power-supply.git tags/ib-psy-usb-types-signed
> 
> for you to fetch changes up to 364ea7ccaef917a3068236a19a4b31a0623b561a:
> 
>   power: supply: Change usb_types from an array into a bitmask (2024-09-03 23:20:28 +0200)
> 
> ----------------------------------------------------------------
> Immutable branch for usb_types change for v6.12
> 
> Changing usb_types type from array to bitmap in the power_supply_desc
> struct requires updating power-supply drivers living in different
> subsystem, so it is handled via an immutable branch.
> 
> ----------------------------------------------------------------
> Hans de Goede (6):
>       power: supply: "usb_type" property may be written to
>       power: supply: ucs1002: Adjust ucs1002_set_usb_type() to accept string values
>       power: supply: rt9467-charger: Remove "usb_type" property write support
>       power: supply: sysfs: Add power_supply_show_enum_with_available() helper
>       power: supply: sysfs: Move power_supply_show_enum_with_available() up
>       power: supply: Change usb_types from an array into a bitmask
> 
>  Documentation/ABI/testing/sysfs-class-power     |  7 ++-
>  drivers/extcon/extcon-intel-cht-wc.c            | 15 ++----
>  drivers/phy/ti/phy-tusb1210.c                   | 11 ++---
>  drivers/power/supply/axp20x_usb_power.c         | 13 ++---
>  drivers/power/supply/bq256xx_charger.c          | 15 ++----
>  drivers/power/supply/cros_usbpd-charger.c       | 22 +++------
>  drivers/power/supply/lenovo_yoga_c630_battery.c |  7 +--
>  drivers/power/supply/mp2629_charger.c           | 15 ++----
>  drivers/power/supply/mt6360_charger.c           | 13 ++---
>  drivers/power/supply/mt6370-charger.c           | 13 ++---
>  drivers/power/supply/power_supply_core.c        |  4 --
>  drivers/power/supply/power_supply_sysfs.c       | 66 ++++++++-----------------
>  drivers/power/supply/qcom_battmgr.c             | 37 +++++++-------
>  drivers/power/supply/qcom_pmi8998_charger.c     | 13 ++---
>  drivers/power/supply/rk817_charger.c            |  9 +---
>  drivers/power/supply/rn5t618_power.c            | 13 ++---
>  drivers/power/supply/rt9467-charger.c           | 16 ++----
>  drivers/power/supply/rt9471.c                   | 15 ++----
>  drivers/power/supply/ucs1002_power.c            | 26 +++++-----
>  drivers/usb/typec/anx7411.c                     | 11 ++---
>  drivers/usb/typec/rt1719.c                      | 11 ++---
>  drivers/usb/typec/tcpm/tcpm.c                   | 11 ++---
>  drivers/usb/typec/tipd/core.c                   |  9 +---
>  drivers/usb/typec/ucsi/psy.c                    | 11 ++---
>  include/linux/power_supply.h                    |  3 +-
>  25 files changed, 132 insertions(+), 254 deletions(-)
> 
> -- Sebastian


