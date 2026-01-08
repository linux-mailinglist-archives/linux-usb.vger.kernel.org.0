Return-Path: <linux-usb+bounces-32046-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A8CBD02143
	for <lists+linux-usb@lfdr.de>; Thu, 08 Jan 2026 11:18:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D229B319E07F
	for <lists+linux-usb@lfdr.de>; Thu,  8 Jan 2026 09:36:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 704B0334C10;
	Thu,  8 Jan 2026 08:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K/8GWXsL"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC45E32A3F1;
	Thu,  8 Jan 2026 08:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767861179; cv=none; b=i1OEV8lAn1dcD4m9XFyEk1Q0YsId68eqMYINE3H4qZYyyX2GEcuxCoLTzAQw7P0p8yiklnfWXzGwjnEJif9Aojp0knXJRV7QGdfhmjy9aaHKA7QvLnssBF80uYxnGiyvEN4z4fUljUY/7KX9MfwHOmZHa5QavCodZa+6PuwTX9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767861179; c=relaxed/simple;
	bh=ltY6mc7NU7aREJqbvN6dWGD7GfTdXZD+6vLY1vjaX3g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jIYO3VaKCKl9zOWXF7AQVW3mK+Ym7VLrJn+I8ZpvygZAn//2juWgMbLxFb9xxLuyhHiM1L5BDOZ1BcbFXsg71Srd3tZY0LiLguUhz1xGEOO6kTu3cYLnJUs/e4j5H4YtmThd0hm+ISDIyzBt9/5Y+2f9eeUwkWFf0VOuGoYD1vA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K/8GWXsL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74378C116C6;
	Thu,  8 Jan 2026 08:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767861176;
	bh=ltY6mc7NU7aREJqbvN6dWGD7GfTdXZD+6vLY1vjaX3g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=K/8GWXsLWXhvg+q7onRuZRXHMqahq4RaBcTacESC7Jh93809wGXQm7rhE5jcgEyVR
	 yYRgJlBP6ngSgoQEZjKlwL5uKeA//m6lEonatZ1FlLU6PPbzlKAsxrvEgYY3MCQG9e
	 NcOahYgvhveBjgtjzUYlqirwMEbF/wT0ezYQ/nb6bdwpcP4Z2NdHd/p0pAvbBeI+E3
	 p91TdjTSkd/UBWCRx7TKhUbTIxuRVFixjhZJ9BcaFUaaedWjqQsvhAKxpUgJRzIq47
	 6+S9CvTO84Pf9CwL/yOrvOCAORy51UTF4kW5bI9D47UG4W/Se+7AQhWMU1rqAl4ySf
	 2RN40IMWsIadw==
Message-ID: <ee3d4cf0-dccb-4ce0-9e69-a95507168e6a@kernel.org>
Date: Thu, 8 Jan 2026 09:32:51 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] usb: typec: fusb302: Switch to threaded interrupt
 handler
To: Anand Moon <linux.amoon@gmail.com>
Cc: =?UTF-8?B?5byg5rC45rOi?= <giraffesnn123@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 FUKAUMI Naoki <naoki@radxa.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/Rockchip SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:USB TYPEC CLASS" <linux-usb@vger.kernel.org>
References: <20260103083232.9510-1-linux.amoon@gmail.com>
 <20260103083232.9510-4-linux.amoon@gmail.com>
 <6f30a01c-8fc4-4368-88ef-7c513c505515@kernel.org>
 <CACpCAL0GLMV-2p1tKAXe6R+N2c4YadH9vpEG3GdPoHTNTQSuow@mail.gmail.com>
 <080d9ed6-18f9-437e-89d4-aba8f69120fb@kernel.org>
 <CANAwSgRqpAopSGcZ=isLxALFcuPW0E4DBZzMhQvwRBhHMK0thg@mail.gmail.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <CANAwSgRqpAopSGcZ=isLxALFcuPW0E4DBZzMhQvwRBhHMK0thg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 8-Jan-26 07:58, Anand Moon wrote:
> Hi Hans,
> 
> On Wed, 7 Jan 2026 at 16:22, Hans de Goede <hansg@kernel.org> wrote:
>>
>> Hi,
>>
>> On 7-Jan-26 10:52, 张永波 wrote:
>>>> Still ideally we would solve this in another way then
>>>> switching to a threaded IRQ handler.
>>>>
>>>> As the commit message of the mei-vsc fix mentions
>>>> the root cause of these errors is typically an interrupt
>>>> chip driver which uses IRQF_NO_THREAD disabling the auto
>>>> threading of all interrupt handlers in RT mode.
>>>>
>>>> So the first question here would be to see if that flag is
>>>> used in the interrupt chip and if yes, is that flag really
>>>> necessary ?
>>> This is very similar to the issue addressed in commit 24b176d8827d
>>> ("drm/msm/dsi: Remove spurious IRQF_ONESHOT flag").
>>> The IRQF_ONESHOT flag is preventing forced threading here.
>>>
>>> In irq_setup_forced_threading(), the conversion to threaded interrupts
>>> is explicitly skipped if any of the IRQF_NO_THREAD, IRQF_PERCPU,
>>> or IRQF_ONESHOT flags are present. In this case, IRQF_ONESHOT
>>> appears to be the reason.
>>
>> Ah, well the code effectively does its own IRQF_ONESHOT handling,
>> since it needs to do its own threaded-irq like handling for
>> suspend/resume reasons. It disables the IRQ when it fires and
>> then only re-enables it once the work has done processing the IRQ.
>>
>> So it should be perfectly safe to drop the IRQF_ONESHOT flag.
>>
> Yes, the warning disappears
>> If that also works to resolve the lockdep issue that would be
>> the preferred way of fixing this IMHO.
>>
> After applying these changes, the device initially triggered a hard reset;
> And the board reboots. I need to find another way to fix this warning.

Hmm, I guess that without the oneshot flag fusb302_irq_intn() might
trigger a second time before it disables the IRQ causing an IRQ enable
unbalance issue.

So lets just go with your original fix of moving this to a threaded
IRQ handler.

Regards,

Hans



