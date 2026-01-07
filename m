Return-Path: <linux-usb+bounces-31996-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 19507CFD4C3
	for <lists+linux-usb@lfdr.de>; Wed, 07 Jan 2026 12:01:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 158B730A1AA6
	for <lists+linux-usb@lfdr.de>; Wed,  7 Jan 2026 10:52:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB71B322B7D;
	Wed,  7 Jan 2026 10:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ckVthmuU"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A6A82417C3;
	Wed,  7 Jan 2026 10:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767783170; cv=none; b=DoWbewsXURv8c1k8EBBztXiPsTXqqQzONBcMNzETV3xJZNLfAGy/IZo4TJChVPcXpWvfPDi87Sc4RekgTTJANJR1Ndras7ooWQEt8vfELtTeEkkzxWKCZfspCmkGKpjJTcjgibeWobH7WVvBUvc+jLuPl97RDB11BDl/cEzrr5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767783170; c=relaxed/simple;
	bh=DUPfhQrr6JmsNOZ+CZkxyykOITDhWOpKmSkWkyOkKbs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K7eCkATLOFLlQQhI5t+xsxiL3QmRqTCtYKrS6NtVwrkMjw32eKGzHQvy7Kp0Gqzh4B7NshY8CaAIucq7XgPX0br5C6XQm64g8SFn4/7/7Abpbr1Mj9hWVzb2yAOS1u6L2GjXViQBcHt7/7oQZA+E+JMch1fhhWKoiMjnlh6GPHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ckVthmuU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C0D6C4CEF7;
	Wed,  7 Jan 2026 10:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767783169;
	bh=DUPfhQrr6JmsNOZ+CZkxyykOITDhWOpKmSkWkyOkKbs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ckVthmuUcZvDSlqlewy/Kb/0H0z9BF+bBYcIAw27KQ3c3NmdvXya8myv9+GoPEXrA
	 A5xs9jJ54qtmCIwJAzoSLo6BBxnPuM9s/t0QWsf+tKYaz0kKoS4bGbM5mEwoEb2kXB
	 W+EYW+kRftV9Q7tbpAx6XgsH2bu1pu80ToV5bcABTzafxespe1jlLasXmZmwxNxd4X
	 2KTfcVLSTsFiDvQtVlvQOTH7BuY0t3+0OFzw5k0frvDJYAF81W2HIpmTRriSZqheQ1
	 YO5zupcgJWtnGiJkjaNFgxIcYFUBj3bwGg09gi12jpkYSbqV5oLu1tQ+QPlDQUKNRE
	 h1vtfC+TizTwQ==
Message-ID: <080d9ed6-18f9-437e-89d4-aba8f69120fb@kernel.org>
Date: Wed, 7 Jan 2026 11:52:44 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] usb: typec: fusb302: Switch to threaded interrupt
 handler
To: =?UTF-8?B?5byg5rC45rOi?= <giraffesnn123@gmail.com>
Cc: Anand Moon <linux.amoon@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
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
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <CACpCAL0GLMV-2p1tKAXe6R+N2c4YadH9vpEG3GdPoHTNTQSuow@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 7-Jan-26 10:52, 张永波 wrote:
>> Still ideally we would solve this in another way then
>> switching to a threaded IRQ handler.
>>
>> As the commit message of the mei-vsc fix mentions
>> the root cause of these errors is typically an interrupt
>> chip driver which uses IRQF_NO_THREAD disabling the auto
>> threading of all interrupt handlers in RT mode.
>>
>> So the first question here would be to see if that flag is
>> used in the interrupt chip and if yes, is that flag really
>> necessary ?
> This is very similar to the issue addressed in commit 24b176d8827d
> ("drm/msm/dsi: Remove spurious IRQF_ONESHOT flag").
> The IRQF_ONESHOT flag is preventing forced threading here.
> 
> In irq_setup_forced_threading(), the conversion to threaded interrupts
> is explicitly skipped if any of the IRQF_NO_THREAD, IRQF_PERCPU,
> or IRQF_ONESHOT flags are present. In this case, IRQF_ONESHOT
> appears to be the reason.

Ah, well the code effectively does its own IRQF_ONESHOT handling,
since it needs to do its own threaded-irq like handling for
suspend/resume reasons. It disables the IRQ when it fires and
then only re-enables it once the work has done processing the IRQ.

So it should be perfectly safe to drop the IRQF_ONESHOT flag.

If that also works to resolve the lockdep issue that would be
the preferred way of fixing this IMHO.

Regards,

Hans


