Return-Path: <linux-usb+bounces-31881-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A95CEFE9C
	for <lists+linux-usb@lfdr.de>; Sat, 03 Jan 2026 13:02:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 93E94301F03A
	for <lists+linux-usb@lfdr.de>; Sat,  3 Jan 2026 12:02:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 996AF2BDC19;
	Sat,  3 Jan 2026 12:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vtskogp2"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 110ED219E8;
	Sat,  3 Jan 2026 12:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767441729; cv=none; b=O6c1+etdZWFFYRPhTWXZPEelhU2HkbbMpgQm3aaiAqnAO3y/Z+oNeTdsrTcPmxyQaMcc52/CN020zsKy2O2QvOrt8DMfm0dHZboLH9bJdjtTinf+MZCaRWD7kMZGjEiz1b1orqM8GaRPXrWJnNI8w5K//DOX4gdmh14fRvJ2CGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767441729; c=relaxed/simple;
	bh=1x1FZr6RcPuO0JFTJZCAvrYneabcp2bRuH04E9/5pX4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=A6IkZh+/2gVTlIHYYhwr5A0rY1wTDUt2E6KKGbVzvKpeaKM/0wGGBAZuuqTP6t+t9CAMWdBySuDm6f8jJMZkyyzh/SDzlNxFPgDrtcauDzAvpyRBp3TZOjl8Ft8uwWZpS0trI7K42uRLHVPvjyrapO8pHSZuft+IDIj3vjHdqHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vtskogp2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA7CCC113D0;
	Sat,  3 Jan 2026 12:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767441725;
	bh=1x1FZr6RcPuO0JFTJZCAvrYneabcp2bRuH04E9/5pX4=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=Vtskogp2qUAVd/DM4TkDqX7xhp75/RE4O/3djH0Ggd1RNArNybeRlzM9h+4xWnEXY
	 XHN81oSHhzHnJVvX/LYYI+eORArVWUOZUrf70THyHL6THPbDXlv/2B4F/adETfbJsJ
	 Bp2HlCanAv3xncnNRucIJI2Hz9n0JHN5pyGnfYOWLrhkiM9L46ZgUE7Q18kaz0uHhC
	 3jxgcirES+Q0OYgP5Nft2bzET7CDZqJ1fERAAEJEVJx/MTyePCUxDX7TCYKv6D6aPb
	 cCken4S8d5opzrahawWNIi6hVZYvZsLvHTe6BvRh4sDzw2xxFpIHDbhi4T3bme/S51
	 r53uT1Zxm/bXA==
Message-ID: <6f30a01c-8fc4-4368-88ef-7c513c505515@kernel.org>
Date: Sat, 3 Jan 2026 13:01:58 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] usb: typec: fusb302: Switch to threaded interrupt
 handler
To: Anand Moon <linux.amoon@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 FUKAUMI Naoki <naoki@radxa.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Yongbo Zhang <giraffesnn123@gmail.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/Rockchip SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:USB TYPEC CLASS" <linux-usb@vger.kernel.org>
References: <20260103083232.9510-1-linux.amoon@gmail.com>
 <20260103083232.9510-4-linux.amoon@gmail.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260103083232.9510-4-linux.amoon@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 3-Jan-26 09:31, Anand Moon wrote:
> The fusb302 driver triggers a "BUG: Invalid wait context" lockdep warning
> under certain configurations (such as when CONFIG_PROVE_RAW_LOCK_NESTING
> is enabled). This occurs because the interrupt handler, fusb302_irq_intn,
> attempts to acquire a regular spinlock (&chip->irq_lock) while running
> in hardirq context can lead to invalid wait context reports if the lock is
> considered "sleepable" or has incompatible nesting levels with the
> underlying interrupt controller's locks.
> 
> lockdep warnings:
> 
> [   38.935276] [      C0] =============================
> [   38.935690] [      C0] [ BUG: Invalid wait context ]
> [   38.936106] [      C0] 6.19.0-rc2-2-ARM64-GCC #2 Tainted: GT
> [   38.936716] [      C0] -----------------------------
> [   38.937129] [      C0] kworker/0:0/8 is trying to lock:
> [   38.937566] [      C0] ffff000112c04190 (&chip->irq_lock){....}-{3:3}, at: fusb302_irq_intn+0x38/0x98 [fusb302]
> [   38.938450] [      C0] other info that might help us debug this:
> [   38.938953] [      C0] context-{2:2}
> [   38.939247] [      C0] 2 locks held by kworker/0:0/8:
> [   38.939670] [      C0]  #0: ffff000100025148 ((wq_completion)events_freezable){+.+.}-{0:0}, at: process_one_work+0x224/0x4b8
> [   38.940645] [      C0]  #1: ffff8000800fbd90 ((work_completion)(&(&host->detect)->work)){+.+.}-{0:0}, at: process_one_work+0x24c/0x4b8
> [   38.941691] [      C0] stack backtrace:
> [   38.942010] [      C0] CPU: 0 UID: 0 PID: 8 Comm: kworker/0:0 Tainted: GT   6.19.0-rc2-2-ARM64-GCC #2 PREEMPT(full)  bd73c5afc1bd41f04ef9699c14f0381f835f4deb
> [   38.942017] [      C0] Tainted: [T]=RANDSTRUCT
> [   38.942019] [      C0] Hardware name: Radxa ROCK 5B (DT)
> [   38.942022] [      C0] Workqueue: events_freezable mmc_rescan
> [   38.942031] [      C0] Call trace:
> [   38.942033] [      C0]  show_stack+0x24/0x40 (C)
> [   38.942041] [      C0]  dump_stack_lvl+0x90/0xd8
> [   38.942047] [      C0]  dump_stack+0x1c/0x3c
> [   38.942051] [      C0]  __lock_acquire+0x5e8/0x9c8
> [   38.942059] [      C0]  lock_acquire+0x134/0x280
> [   38.942065] [      C0]  _raw_spin_lock_irqsave+0x80/0xb0
> [   38.942072] [      C0]  fusb302_irq_intn+0x38/0x98 [fusb302 634bac905a09c450b54f88b96019accd2820228f]
> [   38.942082] [      C0]  __handle_irq_event_percpu+0x138/0x3f0
> [   38.942088] [      C0]  handle_irq_event+0x58/0xd8
> [   38.942093] [      C0]  handle_level_irq+0x108/0x190
> [   38.942099] [      C0]  handle_irq_desc+0x4c/0x78
> [   38.942106] [      C0]  generic_handle_domain_irq+0x24/0x40
> [   38.942113] [      C0]  rockchip_irq_demux+0x128/0x240
> [   38.942120] [      C0]  handle_irq_desc+0x4c/0x78
> [   38.942127] [      C0]  generic_handle_domain_irq+0x24/0x40
> [   38.942133] [      C0]  __gic_handle_irq_from_irqson.isra.0+0x260/0x370
> [   38.942141] [      C0]  gic_handle_irq+0x68/0xa0
> [   38.942146] [      C0]  call_on_irq_stack+0x48/0x68
> [   38.942152] [      C0]  do_interrupt_handler+0x74/0x98
> [   38.942158] [      C0]  el1_interrupt+0x88/0xb0
> [   38.942165] [      C0]  el1h_64_irq_handler+0x1c/0x30
> [   38.942170] [      C0]  el1h_64_irq+0x84/0x88
> [   38.942175] [      C0]  arch_counter_get_cntpct+0x4/0x20 (P)
> [   38.942181] [      C0]  __const_udelay+0x30/0x48
> [   38.942187] [      C0]  mci_send_cmd.constprop.0+0x84/0xc8
> [   38.942194] [      C0]  dw_mci_setup_bus+0x60/0x210
> [   38.942200] [      C0]  dw_mci_set_ios+0x1c8/0x260
> [   38.942206] [      C0]  mmc_set_initial_state+0x110/0x140
> [   38.942211] [      C0]  mmc_rescan_try_freq+0x154/0x198
> [   38.942216] [      C0]  mmc_rescan+0x1cc/0x278
> [   38.942221] [      C0]  process_one_work+0x284/0x4b8
> [   38.942225] [      C0]  worker_thread+0x264/0x3a0
> [   38.942230] [      C0]  kthread+0x11c/0x138
> [   38.942236] [      C0]  ret_from_fork+0x10/0x20
> [   38.969307] [     T11] rockchip-dw-pcie a41000000.pcie: PCI host bridge to bus 0004:40
> [   38.969995] [     T11] pci_bus 0004:40: root bus resource [bus 40-4f]
> 
> Following changes resolves the lockdep warnings and aligns the driver with best
> practices for I2C-based interrupt handling.
> 
> Cc: Hans de Goede <hansg@kernel.org>
> Cc: Yongbo Zhang <giraffesnn123@gmail.com>
> Cc: Sebastian Reichel <sebastian.reichel@collabora.com>
> Fixes: 309b6341d557 ("usb: typec: fusb302: Revert incorrect threaded irq fix")
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>

If you look closer at the code then you will see that
fusb302_irq_intn() is effectively doing its own threaded
interrupt handling this is done to be able to delay
the threaded part till after the i2c-controller is
resumed when a fusb302 irq wakes up the system.

See commit 207338ec5a27 ("usb: typec: fusb302: Improve
suspend/resume handling") for details.

And if you look at the fusb302 git history then you'll
seen an earlier change the switch the interrupt handler
to a threaded IRQ which was reverted (mostly due to it
also making other undesirable changes).

This change is different though. This is actually quite
similar to commit cee3dba7b741 ("mei: vsc: Fix "BUG: Invalid
wait context" lockdep error"). Where I fixed more or less
the same issue in the same way. So I guess this change also
is ok.

Still ideally we would solve this in another way then
switching to a threaded IRQ handler.

As the commit message of the mei-vsc fix mentions
the root cause of these errors is typically an interrupt
chip driver which uses IRQF_NO_THREAD disabling the auto
threading of all interrupt handlers in RT mode.

So the first question here would be to see if that flag is
used in the interrupt chip and if yes, is that flag really
necessary ?

Regards,

Hans











> ---
>  drivers/usb/typec/tcpm/fusb302.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fusb302.c
> index 870a71f953f6..089722b52fbb 100644
> --- a/drivers/usb/typec/tcpm/fusb302.c
> +++ b/drivers/usb/typec/tcpm/fusb302.c
> @@ -1755,9 +1755,10 @@ static int fusb302_probe(struct i2c_client *client)
>  		goto destroy_workqueue;
>  	}
>  
> -	ret = request_irq(chip->gpio_int_n_irq, fusb302_irq_intn,
> -			  IRQF_ONESHOT | IRQF_TRIGGER_LOW,
> -			  "fsc_interrupt_int_n", chip);
> +	ret = request_threaded_irq(chip->gpio_int_n_irq,
> +				   NULL, fusb302_irq_intn,
> +				   IRQF_ONESHOT | IRQF_TRIGGER_LOW,
> +				   "fsc_interrupt_int_n", chip);
>  	if (ret < 0) {
>  		dev_err(dev, "cannot request IRQ for GPIO Int_N, ret=%d", ret);
>  		goto tcpm_unregister_port;


