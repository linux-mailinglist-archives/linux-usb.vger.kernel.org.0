Return-Path: <linux-usb+bounces-9352-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3D58A4B1A
	for <lists+linux-usb@lfdr.de>; Mon, 15 Apr 2024 11:06:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D3054B23B20
	for <lists+linux-usb@lfdr.de>; Mon, 15 Apr 2024 09:06:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F2093BBF4;
	Mon, 15 Apr 2024 09:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="K2y0UCaA"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B24EE3A1DA
	for <linux-usb@vger.kernel.org>; Mon, 15 Apr 2024 09:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713171999; cv=none; b=EN+8uNvo8L28oJPxTr6Z6d3i2A2yvM+UDGDzrN4Rgn2Q9eeM6T0tYldIyaducjJm52s+uSKjPqzXZNcuUItkZYqrYrEG1nOM1s06i6UNHo9FSdUUBPiVTD+Go/EpL4rkCiFVADWJ8rOq06GpAmOaCvleerm5Bu0rCFLUCmlzNGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713171999; c=relaxed/simple;
	bh=SwgpO4YQWdvbI0vVe0TBO0b37BYnsUM314dFrnGo/S0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tigrjzJpSacpnSmAqXMyGm4MdNoY2Q7fDyu2qKblBxEwF+5yz6T/zfiP1hF/wtWMVXjw2UjyCgCOxUTRNDYwZSAbgkiIR+R7HrfRjom7ukPdXU2fVjXHsvPLK6MZsk6wTf2t4XaMflnhKrKzTjja454BJzvPLgmkoPVXvxQTk5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=K2y0UCaA; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a5200202c1bso364309166b.0
        for <linux-usb@vger.kernel.org>; Mon, 15 Apr 2024 02:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713171995; x=1713776795; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+WfufnjkFLuKt8mgR0uon21xMcAu2tPaD6DqiB7Iflk=;
        b=K2y0UCaARaTxLmjZMHjA9cx+156xdMsZ/VeUgbEd0qoJtPdpUxMnW+3z8H9bnoqe3J
         ukEfW5MVfHkL3HuUCxZBNvD4iP1Z9Gkdb5W1dRjXm05kgQkboGRtWU/qm5N7MYQPJlDl
         ZxEvi+EyA7OBbwdvwIfZG4ct/Knv9iNjyFAa+AZX8hlid1UGLg4bN1QFJA3svmwsgVZ/
         hxqK5Sb7eSj5tnKqhJm0i703RA2wREEQhhEZeVgf+yjeVM7k3PE8o5RmzBYqcYhtxj3f
         cZQla6hkLkfWB03+oHcvATnRXcDNgikg6iaCyxrotzd4LfuEgyMBuD3Iqq+LJEiDVjnP
         aJLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713171995; x=1713776795;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+WfufnjkFLuKt8mgR0uon21xMcAu2tPaD6DqiB7Iflk=;
        b=tkStUSSRkyiLRWM8LU/Nl6H9W8f4KHd4wLZq7peIclJGEWDnR/tHZHJEkBaS/PBRnl
         ZDRkq64Yxud6Yj4y9TobC2M6E3Ao+Z+eNyCp33HPLmjtoygaAZA9Etk8N+nzkXuoM2JG
         jtRrK9ikec7ODRLcFjaV+ZaCd6HBoiJb4AtWDiXrL8+7DkSVF/gkFgSiLZjqCB4I0FIc
         uhLJRCWvwSVw3iKM92XTvjjHQplE5DJQlkBbRHIZrlO4DiMRrQ4wlTqgm3uJY4yOMAkK
         QOGAD4AISX+sUKv09Ir57M0iOQvXDhQTtJFec3THI38iuWeptqEZNuiB1R7RtSEiqWYe
         +mFA==
X-Forwarded-Encrypted: i=1; AJvYcCWzTEk+l/5lYjuDEaOcfLIuVYqjj3zNwhs12VZy0UeFdGDTzbay12gkOfQbvIlhHsG3cViXbi/ot5eloqwDKKDklLd8aRAc0h1c
X-Gm-Message-State: AOJu0Yz/FswWHgOpLzOE7jotBFUKXRnHFSP3IWi3P7HFr9FiaiH2XLIw
	jvoAYmhUd+5Pu1RFENi2UFvfhqTfIJSORRs3WoSUGgdR/DK3Vz8X5BMXSVF8s1E=
X-Google-Smtp-Source: AGHT+IG9Os75CE2mZeTq4ynaVMOKZR0K1Da/JMGlDSPMt3uTOA+A8muKztNGs7OdjmfiZ183zyUO4w==
X-Received: by 2002:a17:907:3605:b0:a52:54f7:bb01 with SMTP id bk5-20020a170907360500b00a5254f7bb01mr4672944ejc.53.1713171994933;
        Mon, 15 Apr 2024 02:06:34 -0700 (PDT)
Received: from ?IPV6:2001:a61:1366:6801:d8:8490:cf1a:3274? ([2001:a61:1366:6801:d8:8490:cf1a:3274])
        by smtp.gmail.com with ESMTPSA id zh17-20020a170906881100b00a5271ae4458sm623641ejb.16.2024.04.15.02.06.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Apr 2024 02:06:34 -0700 (PDT)
Message-ID: <a6ad34d3-9cce-4178-8271-0e09ced2b6f4@suse.com>
Date: Mon, 15 Apr 2024 11:06:33 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: cdc-wdm: close race between read and workqueue
To: =?UTF-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>,
 Aleksander Morgado <aleksandermj@chromium.org>
Cc: oneukum@suse.com, linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
 linux@roeck-us.net, linux-kernel@vger.kernel.org, ejcaruso@chromium.org
References: <385a3519-b45d-48c5-a6fd-a3fdb6bec92f@chromium.org>
 <87mspvi0lk.fsf@miraculix.mork.no>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <87mspvi0lk.fsf@miraculix.mork.no>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 15.04.24 08:47, Bjørn Mork wrote:

> I'm not sure I understand what problem that patch is supposed to fix.
> Which means that everything I write could be completely wrong...

wdm_in_callback() can schedule service_outs_intr(), which can call
service_outstanding_interrupt(), which sets WDM_RESPONDING and submits
desc->response.
That is not problematic in itself, but wdm_read() also calls
service_outstanding_interrupt(), which can lead to teh same URB
being submitted twice (which caused me to write the patch)
or, apparently, in this case, it leads to discarding a buffer
by resubmitting and completing an URB.

> But to me it looks like the described issue is exactly what you should
> expect if that change ever triggers.  I believe we must resubmit the

Yes, it does.

> urb from service_outstanding_interrupt(). That's why it was added. See
> the explanation Robert wrote when introducing it:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/usb/class/cdc-wdm.c?id=c1da59dad0ebd3f9bd238f3fff82b1f7ffda7829

Well, the explanation is correct in that we must read
data available. However, if the RESPONDING flag is set
and the URB submitted, we are already doing so.

> As for the XMM behaviour: it's been a long time since I tried any of
> those, but AFAIR one the major differences compared to Qualcomm was the
> strict queue handling in the firmware.  This caused a number of problems
> where the cdc-wdm driver wanted to skip a message for some reason.  So
> I'm not surprised that a bug like this is triggered by one of those
> modems. That's probably the only thing they are good for :-)

I am not sure where exactly the issue lies here. Suggestions for
debugging?

	Regards
		Oliver


