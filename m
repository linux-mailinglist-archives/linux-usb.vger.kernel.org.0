Return-Path: <linux-usb+bounces-38052-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oFLCBHA2FWqwTgcAu9opvQ
	(envelope-from <linux-usb+bounces-38052-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 26 May 2026 07:58:08 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D475D1009
	for <lists+linux-usb@lfdr.de>; Tue, 26 May 2026 07:58:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 22C103030126
	for <lists+linux-usb@lfdr.de>; Tue, 26 May 2026 05:56:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78C5C3BFAE1;
	Tue, 26 May 2026 05:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Os5GTe9w"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 565D230AAA6
	for <linux-usb@vger.kernel.org>; Tue, 26 May 2026 05:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779774981; cv=none; b=No5s+oFq+l/tv7pvpIqadpyJaXL+w6O4xd2VYjXYX3Y7uuTE/LH0fa0bEeYv0a0vVRYZe1TTw5vHK0Ibz1dxtxFIeWS0A8xrnLQODZBJtWLv2hEDHM33GGpHKxsWdFU8latf/D+vC5M4/OVFmbNSM/hk3ElXGcZtYALi91qFeQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779774981; c=relaxed/simple;
	bh=qQtbda1P/oGFIFnlbhP/vFGqkEuuQ0uC4OudUy+fFIM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=Bm5WdcLPZKaaNtEHnGROHGxLN6UBcxQOnO23bMb0ktpEIL+yJewGL59KY2dLmkWxcWVcheUavqF+RzXnu9gvsQpoCtqcFNBJlLod9fy5lprtCE8RMptsfV79lva/PbdzcgbbTXIhgDV/MNTyZnGYenju920qojBggUPEA/b9ItU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Os5GTe9w; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-44a14580111so7602128f8f.0
        for <linux-usb@vger.kernel.org>; Mon, 25 May 2026 22:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779774978; x=1780379778; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/+tzxiMti/hkPabMXB5B0TCtwIofItPhM7EIuDr1tBY=;
        b=Os5GTe9w3OkO7J/qnEijfllW3a0oWXUC3d+MtwllgcYtb1iuymIRy9xnHZhCJ6Kwaj
         utQy4dGN75KkNlls2KCd6ZzMhZ9vXsNjVv4Okojd2HLqg4jHZjGLpvx79xgC9et2wjyo
         xSmosazW04zLMq/rXSh3fUUe9TqEdDHLgQa8vHyQl9YOC5xt6LUxcm/LpUYuaQnkgAjO
         r5qEj0WcAwEh9pnPmfwBLDcynvJ6Xhit78YV+QlD8AmE7Th+37QNlB93lmqiORBoFdcU
         AcvSFN6e0YOVGMlDj3weGNecZO9PRsue6/IqVYqW+kPlhbzP8Wh34LxfVSvjuNaMvNo9
         Kj/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779774978; x=1780379778;
        h=content-transfer-encoding:cc:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/+tzxiMti/hkPabMXB5B0TCtwIofItPhM7EIuDr1tBY=;
        b=nmOyv8hE8AfeG+QXgV2nVIbinJ2CrVw54mxkG0KmyWrPi7gHuIe7Qy2rKm/M1Jml3Q
         3LxdfJaGKBi++TQ9ZZLXz+hEcpWcjF7XMn64IXwrFYt5U77Fz3VA6fnOCeM72tdAbCR3
         7/3bsNZY9EQF+8m2zeDFX6qAw7yX7FBgdW227zd8lY6wB21ZEkj8z//MINYN7rUEmn8t
         oNH5p3MV/p3xYklxvV/7mzwNJjaEpMcMJFX9BVu1dfd8erN/PiOSzPOQwEFxSmucs2eJ
         UDTUf5A6qOCmE38GJPevUibcC1RUHpX412UCM86BcfuSEnIcn8JdVzYk5qj17jw2frsU
         BI7A==
X-Forwarded-Encrypted: i=1; AFNElJ9zkdSCvjiWQQ304IW7HALGiLVUJrEpBfBHPVT0nKOITaeK4nlptuhyhJ8xZlKwbZ3IBH8beDNlxV8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUwjgHFd/Uy0SQ2Chjeemk1O1Uwp6/E4fjBiCycwwp69ZbcJQp
	WZSdBxVwhWucF2QK4LjKzV3lJZTv0g1P0NLV9V4cMUCfoOCjGS5u3n/a
X-Gm-Gg: Acq92OHTak0KgT9mo+FVtM43+1y92L8j+3hMXGibv6Gk0m7qC/HDk7RInuV5vz/F8zq
	0Qe+tv46Lv7PZ/JhliFACOOVaYcFy5kyX1Egzj/Q+h6Jn7JGuqs0YeqnE1mQ2EGiRf5AOYaPaAu
	+XE0x6BYtiA1+VgeptmgCu+Svd8ifgCGFZZO51Rq/VeMIh63PEkp5AtUfWtucUCJfc837TvB7R9
	zU2MH7IcO9BIwiPAEBI6LLDdpS84Z+MJML+Hdn8N8dNvgFy39YCso6bFMaImtmVYqB3l1BoajmH
	668HFy94EAjHzkgZqXD92PZJbZZo9jpo5z/x3OTJKxOO0R5NkaQAwtcVHR6DbV6Gg7g14FKjLUG
	F0VDTxG9akeInNl3FuKqYMI8PHnmERMFJcWW0DOYYPSM3aQUdkbx3S4Ca8vFJK8vEzs9P1nPO4z
	JGL21od2/jSh0HAn+7gLVmjWnK72V6CApYNa5Fb49wLX7SMA==
X-Received: by 2002:a05:6000:1446:b0:43d:7a97:78af with SMTP id ffacd0b85a97d-45eb38e04e3mr29609480f8f.42.1779774977394;
        Mon, 25 May 2026 22:56:17 -0700 (PDT)
Received: from [192.168.1.10] ([95.43.220.235])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-45eb6cce01asm33665917f8f.11.2026.05.25.22.56.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2026 22:56:17 -0700 (PDT)
Message-ID: <89e19e6e-7ee7-4bb0-abd6-60971b7fd601@gmail.com>
Date: Tue, 26 May 2026 08:56:15 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
From: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Subject: [REGRESSION] usb: gadget: u_ether NULL deref in eth_stop after
 gether_detach_gadget
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, khtsai@google.com
Cc: sashal@kernel.org, Merlijn Wajer <merlijn@wizzup.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38052-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ivogdimitrov75@gmail.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 95D475D1009
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

on linux 6.18.31 I am seeing a NULL pointer dereference during RNDIS 
gadget teardown.

[ 7207.040679] udc musb-hdrc.2.auto: unbinding gadget driver [g1]
[ 7207.041442] configfs-gadget.g1 gadget.0: unbind function 'rndis'/c807d802
[ 7207.044097] rndis_deregister:
[ 7207.050445] 8<--- cut here ---
[ 7207.050445] Unable to handle kernel NULL pointer dereference at 
virtual address 00000080 when read
[ 7207.050628] [00000080] *pgd=00000000
[ 7207.050659] Internal error: Oops: 5 [#1] SMP ARM
[ 7207.050659] Modules linked in: phy_cpcap_usb aes_arm_bs aes_arm 
aes_generic ccm bnep usb_f_rndis u_ether usb_f_mass_storage libcomposite 
bluetooth ecdh_generic ecc zram zsmalloc nf_tables nfnetlink 
snd_soc_audio_graph_card option qmi_wwan gnss_motmdm usb_wwan gnss 
snd_soc_motmdm cdc_wdm usbnet usbserial snd_soc_omap_hdmi wl12xx wlcore 
mac80211 libarc4 cfg80211 panel_dsi_cm joydev mousedev evdev omapdrm 
drm_display_helper snd_soc_audio_graph_card2 phy_mapphone_mdm6600 
pwm_vibra snd_soc_simple_card_utils cec pvrsrvkm_omap4_sgx540_120 
phy_generic ff_memless drm_client_lib pwm_omap_dmtimer omap_aes_driver 
emif libaes omap4_keypad omap_sham ohci_platform matrix_keymap ohci_hcd 
omap_mailbox omap2430 ehci_hcd st_accel_spi st_sensors_spi st_accel_i2c 
st_sensors_i2c wlcore_sdio st_accel musb_hdrc st_sensors ak8975 
industrialio_triggered_buffer kfifo_buf udc_core usbcore usb_common 
w1_ds250x cpcap_battery cpcap_adc rtc_cpcap cpcap_charger omap_hdq wire 
snd_soc_omap_mcbsp snd_soc_cpcap cn phy_omap_usb2 serdev_ngsm isl29028
[ 7207.051177]  cpcap_pwrbutton snd_soc_ti_sdma atmel_mxt_ts omap_des 
n_gsm lm75 industrialio libdes snd_soc_core omap_crypto crypto_engine 
hwmon leds_lm3532 snd_pcm_dmaengine display_connector snd_pcm 
drm_kms_helper snd_timer snd drm soundcore led_bl 
drm_panel_orientation_quirks touchscreen_buttons leds_cpcap gpio_keys 
led_class [last unloaded: phy_cpcap_usb]
[ 7207.051361] CPU: 0 UID: 0 PID: 6109 Comm: hildon-usb-gadg Tainted: G 
       W           6.18.31 #8 PREEMPT
[ 7207.051391] Tainted: [W]=WARN
[ 7207.051391] Hardware name: Generic OMAP4 (Flattened Device Tree)
[ 7207.051391] PC is at dev_driver_string+0x0/0x38
[ 7207.051422] LR is at __dynamic_dev_dbg+0x8c/0x118
[ 7207.051422] pc : [<c0926264>]    lr : [<c080f050>]    psr: 40010113
[ 7207.051483] sp : f6265cc8  ip : f6265d64  fp : c1445150
[ 7207.051483] r10: 00002fef  r9 : f6265e48  r8 : 00000000
[ 7207.051483] r7 : bf7e2000  r6 : 00000000  r5 : f6265ce4  r4 : 00000048
[ 7207.051513] r3 : 00000001  r2 : fffffffc  r1 : 00000000  r0 : 00000048
[ 7207.051513] Flags: nZcv  IRQs on  FIQs on  Mode SVC_32  ISA ARM 
Segment none
[ 7207.051544] Control: 10c5387d  Table: 9a8b804a  DAC: 00000051
[ 7207.051544] Register r0 information: non-paged memory
[ 7207.051544] Register r1 information: NULL pointer
[ 7207.051574] Register r2 information: non-paged memory
[ 7207.051574] Register r3 information: non-paged memory
[ 7207.051605] Register r4 information: non-paged memory
[ 7207.051605] Register r5 information: 2-page vmalloc region starting 
at 0xf6264000 allocated at kernel_clone+0xa4/0x3d4
[ 7207.051635] Register r6 information: NULL pointer
[ 7207.051666] Register r7 information: 1-page vmalloc region starting 
at 0xbf7e2000 allocated at load_module+0x800/0x208c
[ 7207.051696] Register r8 information: NULL pointer
[ 7207.051696] Register r9 information: 2-page vmalloc region starting 
at 0xf6264000 allocated at kernel_clone+0xa4/0x3d4
[ 7207.051727] Register r10 information: non-paged memory
[ 7207.051727] Register r11 information: non-slab/vmalloc memory
[ 7207.051757] Register r12 information: 2-page vmalloc region starting 
at 0xf6264000 allocated at kernel_clone+0xa4/0x3d4
[ 7207.051788] Process hildon-usb-gadg (pid: 6109, stack limit = 0xeff2ce29)
[ 7207.051788] Stack: (0xf6265cc8 to 0xf6266000)
[ 7207.051818] 5cc0:                   c0e03a1c 00000000 00000002 
cef5af25 f6265d7c bf7e443c
[ 7207.051818] 5ce0: f6265cd8 00000000 00000000 00000000 00000000 
00000000 00000000 00000000
[ 7207.051818] 5d00: 00000000 00000000 00000000 00000000 00000000 
00000000 00000000 00000000
[ 7207.051849] 5d20: 00000000 00000000 00000000 00000000 00000000 
00000000 00000000 00000000
[ 7207.051849] 5d40: 00000000 00000000 00000000 00000000 00000000 
00000000 00000000 00000000
[ 7207.051879] 5d60: 00000000 cef5af25 f6265d38 c6248000 f6265e48 
bf7e050c bf7e443c 000000e2
[ 7207.051879] 5d80: 0000003b 00000000 00000000 f6265d38 c6248000 
f6265e48 00000000 bf7e4508
[ 7207.051879] 5da0: 00000000 f6265e48 00002fef c0b29a10 00000000 
0000068e 00023864 c6248000
[ 7207.051910] 5dc0: 00000000 cef5af25 f6265d38 f6265d38 f6265e48 
00000001 00000000 c0b29bb0
[ 7207.051910] 5de0: f6265e80 c03959cc 0b3dc968 00000000 00000000 
cef5af25 f6265e40 f6265d38
[ 7207.051940] 5e00: f6265d38 f6265e94 f6265e48 00000000 f6265e48 
c0b349c0 0b3dc968 00000000
[ 7207.051940] 5e20: c50f3040 60010013 6a14845e 00000000 0b3dc968 
00000000 00000000 c50f4820
[ 7207.051940] 5e40: c50f3040 c03959cc c6248110 c6248110 c2ee9060 
f6265e80 c50f3040 cef5af25
[ 7207.051971] 5e60: c2ee9000 c6248000 00000000 00000000 00000000 
00000000 c411e050 bf7b507c
[ 7207.051971] 5e80: 00000000 c0b351dc 0b3dc968 00000000 6a14845e 
c6248108 c6248108 cef5af25
[ 7207.052001] 5ea0: c6248000 c6248000 bf7c1160 c0b35a1c c6248640 
bf7df5bc c3649e00 bf7ba068
[ 7207.052001] 5ec0: bf7be6c0 bf7b0350 c3649e00 c042cc34 00000040 
c3649e00 bf7be6c0 c2ee9000
[ 7207.052001] 5ee0: 00000000 c042ab98 c50f3040 bf7b56c0 00000000 
cef5af25 00000000 c2ee9000
[ 7207.052032] 5f00: 00000000 c50f4820 ffffff9c 00000000 00000002 
c5fa53d0 c2e507f8 c0381e8c
[ 7207.052032] 5f20: c2e507f8 f6265f68 00000000 c03808fc 00000000 
c2ee9000 00000000 c2170000
[ 7207.052062] 5f40: ffffff9c c03877dc f6265f68 f6265f5c 00000000 
00000ff0 c5fa53d0 00000000
[ 7207.052062] 5f60: c5fa53d0 c2e507f8 e7d70be1 0000000a c217003b 
00000000 004c3efc cef5af25
[ 7207.052062] 5f80: beff9a3c beff9a3c 004c5488 004c5220 00000028 
c01002ec c66a9f80 00000028
[ 7207.052093] 5fa0: 004c3efc c0100080 beff9a3c 004c5488 beff9a3c 
b6f046e5 00000000 00000000
[ 7207.052093] 5fc0: beff9a3c 004c5488 004c5220 00000028 00000001 
004c52a0 00000000 004c3efc
[ 7207.052124] 5fe0: b6f0708c beff9a24 b6f0071d b6e87ae8 80010030 
beff9a3c 00000000 00000000
[ 7207.052124] Call trace:
[ 7207.052124]  dev_driver_string from __dynamic_dev_dbg+0x8c/0x118
[ 7207.052124]  __dynamic_dev_dbg from eth_stop+0x70/0x134 [u_ether]
[ 7207.052185]  eth_stop [u_ether] from __dev_close_many+0xd0/0x1f4
[ 7207.052185]  __dev_close_many from netif_close_many+0x7c/0x124
[ 7207.052337]  netif_close_many from 
unregister_netdevice_many_notify+0x220/0x994
[ 7207.052337]  unregister_netdevice_many_notify from 
unregister_netdevice_queue+0x9c/0xec
[ 7207.052398]  unregister_netdevice_queue from unregister_netdev+0x18/0x2c
[ 7207.052398]  unregister_netdev from gether_cleanup+0x14/0x28 [u_ether]
[ 7207.052398]  gether_cleanup [u_ether] from rndis_free_inst+0x2c/0x48 
[usb_f_rndis]
[ 7207.052459]  rndis_free_inst [usb_f_rndis] from 
usb_put_function_instance+0x1c/0x28 [libcomposite]
[ 7207.052459]  usb_put_function_instance [libcomposite] from 
config_item_cleanup+0x64/0xa4
[ 7207.052612]  config_item_cleanup from configfs_rmdir+0x1e8/0x300
[ 7207.052612]  configfs_rmdir from vfs_rmdir+0x90/0x1ec
[ 7207.052642]  vfs_rmdir from do_rmdir+0x12c/0x170
[ 7207.052673]  do_rmdir from ret_fast_syscall+0x0/0x58
[ 7207.052673] Exception stack(0xf6265fa8 to 0xf6265ff0)
[ 7207.052703] 5fa0:                   beff9a3c 004c5488 beff9a3c 
b6f046e5 00000000 00000000
[ 7207.052703] 5fc0: beff9a3c 004c5488 004c5220 00000028 00000001 
004c52a0 00000000 004c3efc
[ 7207.052734] 5fe0: b6f0708c beff9a24 b6f0071d b6e87ae8
[ 7207.052734] Code: e3a02009 eae09cdf 00000477 c104c684 (e5903038)
[ 7207.052764] ---[ end trace 0000000000000000 ]---


I suspect the reason is commit:

   usb: gadget: f_ncm: Fix net_device lifecycle with device_move


The crash appears caused by DBG() inside eth_stop()
dereferencing dev->gadget after gether_detach_gadget()
has already executed:

   void gether_detach_gadget(struct net_device *net)
   {
       ...
       dev->gadget = NULL;
   }

eth_stop() still executes afterwards during unregister_netdev()
triggered from gether_cleanup()/rndis_free_inst().

The likely problematic path is:

   DBG(dev, ...)
     -> dev_dbg(&dev->gadget->dev, ...)

which becomes invalid pointer dereference as dev->gadget is set to NULL 
already:

This seems to be a regression caused by the new decoupled
netdev/gadget lifetime semantics introduced by the patch.

Previously dev->gadget appeared to remain valid for the entire
netdev lifetime.

The issue reproduces on ARM/OMAP4 during configfs RNDIS teardown.


Regards,
Ivaylo Dimitrov

