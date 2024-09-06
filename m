Return-Path: <linux-usb+bounces-14808-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE7596FC46
	for <lists+linux-usb@lfdr.de>; Fri,  6 Sep 2024 21:40:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 048711C23B49
	for <lists+linux-usb@lfdr.de>; Fri,  6 Sep 2024 19:40:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 438441D54EE;
	Fri,  6 Sep 2024 19:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EK58HtVE"
X-Original-To: linux-usb@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8668114B956
	for <linux-usb@vger.kernel.org>; Fri,  6 Sep 2024 19:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725651609; cv=none; b=GXJ070PXDF6W+/O7R6ICLN/BxWBpgkMGWJnbWAo58i5lolY9wP81scnVJ9JLhpM0CZywz2EQSgjJW3Ig+YGTCmVSI+vQ5e/UOCi+PFaxyTQe5TPOW2cObFG0y18VCcBhJUo/UnIK029yBZZFrwZjT3g8HwWuXuzxNyr7poDfiwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725651609; c=relaxed/simple;
	bh=ubhEi2N40+HqSPraugZMWo3waf5b7tsmGupNdS14qNc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L87/Qfhytz7jr9SL6UEnWLWEgZTxL7tBrv9H0UesqQxEe6HsfomSDe3M52Q2uWie/cO6GjfRN9CTeamh2kNGR4Dy5CKj5CMccnFoTXP/O641GE1hjJg9exwakqYq7o3/l+7hrZLLJvgW5ORMcfoXY1cKsmwMzaqYS8wdoCfBBuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EK58HtVE; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725651606;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QD4sswOvFNOSxFaW9xG96Lo/c8U5eyFNN2y6wwCQYZI=;
	b=EK58HtVE2p48lgtRUziwu6zGO7+GhnCpdl97sbEcRim1I9sLUxNMDiP/VRwew6eLd9g7Sf
	i9/6Mx3Ovq6kufshf1Ax7kt0l3/59LSIde5grNLrnhALTb7k3yDI83dHfwKUHgcLDeJjpX
	TPMxkJ3/iDqXCItAcIcUmSCqyIBmk0Y=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-98-c7IJ11y5M5uK3n-OGTcL-w-1; Fri, 06 Sep 2024 15:40:05 -0400
X-MC-Unique: c7IJ11y5M5uK3n-OGTcL-w-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-5c24f1e3933so2029009a12.3
        for <linux-usb@vger.kernel.org>; Fri, 06 Sep 2024 12:40:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725651604; x=1726256404;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QD4sswOvFNOSxFaW9xG96Lo/c8U5eyFNN2y6wwCQYZI=;
        b=vy4bF3inF+5iIsOPpD9SucfFdddgKbvz8hMJGk9Vqgr/bb6HRgAMhBDXdv8dDUW/AH
         KeJTH4y0OVkERZJN/nNI8Lxou2S5sC35QDEkXWw0KCbexipGtUD3isgcRUK0cGWOJt+p
         sSE9I2ZgNBAK0/ed0tWeL1rN/F5suRpu+lvO/OhOokLsfqs8OQ3ptAWetUwAHC+xDy+s
         IlwTkDeOXpfdOQd9xxbe8EAlgLvtzeP+oqfMr4KlZtSxKchiOvcWeToW9LO0o39yl9uy
         q72HiLBrOHeUmLjh6tmmwLRiEJTNra/h/l/vYkc2PvhgKmrnOQzCaZVsCh5SDL7T8j4W
         iNtg==
X-Forwarded-Encrypted: i=1; AJvYcCW7fHE+pZCsmw2WajmC1ZmFBlViivlIuWNs0wXY/tBle3UjWMUEWMt78Zx3RcYPSr4Mn1t9jd/NuGQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz15VinnptMsueaNgmVxp8xg1OfGXGkF4y8npoHt+8t0NIx1udS
	9noxZhFIRAHf+SSA2fpTsU+IVAHHSzuuMIwEQg2j/FrEn4xNfNiKWmZAP+bhlqvPksgc/TlkEDU
	TLeLaL6ZneK4V/YEz61GcAdWT+nrhVT8Bve9uC84KUUxKA9siN4Nq9ibmig==
X-Received: by 2002:a17:907:36c4:b0:a86:a481:248c with SMTP id a640c23a62f3a-a8a885f48a8mr286770166b.19.1725651604086;
        Fri, 06 Sep 2024 12:40:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHmPSKQE5YYieqDXBjoYvsayTlJQHCHoWV/kGiDOeetSv3rZblWHsNHZfovXPUG+rUbt/09Ig==
X-Received: by 2002:a17:907:36c4:b0:a86:a481:248c with SMTP id a640c23a62f3a-a8a885f48a8mr286767566b.19.1725651603458;
        Fri, 06 Sep 2024 12:40:03 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8a80eb0955sm177884566b.43.2024.09.06.12.40.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Sep 2024 12:40:02 -0700 (PDT)
Message-ID: <b8553def-19ea-41d5-b665-4859ddb7b6d5@redhat.com>
Date: Fri, 6 Sep 2024 21:40:01 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] platform/x86/hp: Avoid spurious wakeup on HP ProOne
 440
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Alan Stern <stern@rowland.harvard.edu>
Cc: Kai-Heng Feng <kai.heng.feng@canonical.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, jorge.lopez2@hp.com,
 acelan.kao@canonical.com, platform-driver-x86@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, linux-usb@vger.kernel.org
References: <20240906053047.459036-1-kai.heng.feng@canonical.com>
 <3e12ef27-30e4-4b5a-acd6-5d3023a82941@redhat.com>
 <322162d3-ce9d-27fd-6ac3-204d46e7256e@linux.intel.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <322162d3-ce9d-27fd-6ac3-204d46e7256e@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

HI,

On 9/6/24 8:39 PM, Ilpo Järvinen wrote:
> On Fri, 6 Sep 2024, Hans de Goede wrote:
>> On 9/6/24 7:30 AM, Kai-Heng Feng wrote:
>>> The HP ProOne 440 has a power saving design that when the display is
>>> off, it also cuts the USB touchscreen device's power off.
>>>
>>> This can cause system early wakeup because cutting the power off the
>>> touchscreen device creates a disconnect event and prevent the system
>>> from suspending:
>>> [  445.814574] hub 2-0:1.0: hub_suspend
>>> [  445.814652] usb usb2: bus suspend, wakeup 0
>>> [  445.824629] xhci_hcd 0000:00:14.0: Port change event, 1-11, id 11, portsc: 0x202a0
>>> [  445.824639] xhci_hcd 0000:00:14.0: resume root hub
>>> [  445.824651] xhci_hcd 0000:00:14.0: handle_port_status: starting usb1 port polling.
>>> [  445.844039] xhci_hcd 0000:00:14.0: PM: pci_pm_suspend(): hcd_pci_suspend+0x0/0x20 returns -16
>>> [  445.844058] xhci_hcd 0000:00:14.0: PM: dpm_run_callback(): pci_pm_suspend+0x0/0x1c0 returns -16
>>> [  445.844072] xhci_hcd 0000:00:14.0: PM: failed to suspend async: error -16
>>> [  446.276101] PM: Some devices failed to suspend, or early wake event detected
>>>
>>> So add a quirk to make sure the following is happening:
>>> 1. Let the i915 driver suspend first, to ensure the display is off so
>>>    system also cuts the USB touchscreen's power.
>>> 2. Wait a while to let the USB disconnect event fire and get handled.
>>> 3. Since the disconnect event already happened, the xhci's suspend
>>>    routine won't be interrupted anymore.
>>>
>>> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
>>
>> Thanks, patch looks good to me:
>>
>> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
>>
>> Ilpo, do you plan to do another fixes pull-request for 6.11,
>> or shall I add this to for-next to target 6.12-rc1 ?
>>
>> Either way works for me. If you plan to do another fixes
>> pull-request, note that I plan to post a v2 of the panasonic
>> patches this Monday.
> 
> Hi Hans,
> 
> I was thinking that perhaps one more is necessary the next week.

Ok sounds good, but given Alan's remarks lets hold of on merging
this one until we are sure this is not something which can / should
be fixed on the USB side, or with a hwdb entry to change the hub
wakeup setting for the hub to which the touchscreen is attached.

Regards,

Hans



