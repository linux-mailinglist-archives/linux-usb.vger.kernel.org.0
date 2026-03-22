Return-Path: <linux-usb+bounces-35289-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eCZtCG/2v2moBgQAu9opvQ
	(envelope-from <linux-usb+bounces-35289-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 22 Mar 2026 15:02:23 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7271C2E98FA
	for <lists+linux-usb@lfdr.de>; Sun, 22 Mar 2026 15:02:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D0B4E301AD05
	for <lists+linux-usb@lfdr.de>; Sun, 22 Mar 2026 14:01:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 165453630A2;
	Sun, 22 Mar 2026 14:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VU6CRocy"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 417C036309C
	for <linux-usb@vger.kernel.org>; Sun, 22 Mar 2026 14:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774188092; cv=pass; b=WWonxEGgf78uenGGeldBcTMqta4IqRg4INhobjxOaTsi/vO9Qxw3TjMz+d6ZEGimhRJ3Z/qG0ADvjw/OHTlkqTdQvh7V+9DC3oItisl7Ng0ULBt4t74+IPOPcw5BqFvD/i6IA01wGVyBg6PVfRy34NtvjoFb6n3R+K2vqWb48XI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774188092; c=relaxed/simple;
	bh=f4Y4GZpxNK80pHM6+r/uD0ZDgoV5RAsXXgZuZwKvHS4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=CtpdkBqkkEIySVMN3MSsoYBh83iINe1f/G82uJEYbfSYsnGdYRzqjdzXsqpJx6nBeHsbsR+5/5j+opUdhJzzRJOG8YTu06yW5+A/pt44pURqowb+Rs9zUSzl7Dv1u0kBB+PpCG0KcPEKkpitkSa9I6z1cNzgzed0idD1aY5DPq0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VU6CRocy; arc=pass smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-467e044082dso549406b6e.1
        for <linux-usb@vger.kernel.org>; Sun, 22 Mar 2026 07:01:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774188090; cv=none;
        d=google.com; s=arc-20240605;
        b=TY/C0nbNXQELE/8pqQL2Tqq3FwVBDf9+XmcbLiajehTgIN/BctbJ20ypkSwguzCAIb
         Pk/mrqkUQXJhEbKKf9bCFALcG4O2VnpJgscG3mH66hOddijCollU7iQlzGGB7WNR5hFJ
         HkvuK/fihH8mO8EHw3/M31cRaiFHkMFtYwUZjoHTJItvUidv5x1LiMmmJNbmALt1il5N
         qxTw2BrF5RyUv+V7s+gk+YI/ikmeQa9BY7Sb4VmoeYEVngH4zt6RB8L8pavwfp1xqKog
         3tT87qOmC20r9UcLccMfGt+auQLuyCLfs6XVGBFrJFDBOqikdno06dHvUbfnCJ0w0bbV
         /HpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=HjdxNGbc6EUEUZ1jI0PTsos+tLENfT/cGtkQi34+lc8=;
        fh=RJk+pZqpqHiQVCVuJD0Zn0GPfBYL6VTxd4FySlr35Q8=;
        b=F8osWQityj/DTgmdidDu/Z+s0tb7mAK2xfqqwE+bDPpHojPIug6rTnVi1yaUpkkbwx
         BVwGHHxo5I/sTWwV2zdge4LIRK5O6NfhSiFMXoao0R/qLCjuCnT1JGq1mUcX2/yIzP7S
         9JOCA6FHwjZnQI4rg8MBtnRORX+2x8IVBI8ZjK5XE9+JnEYxvpDCq+QvT11NxgwknUNH
         rztsm0MJmnVVK5zmN/KVD0cCIxGh0Guzxu9YRqk9sGYhs4T0vp3DCeS7242UlSAPr/hY
         D0wgu+rk0SqVnW/GvBMkm/G2vj4oEOOh6VVcf3vit6Jkbz5msIS65AvhS7y2m1kpLp+a
         Wbbg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774188090; x=1774792890; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HjdxNGbc6EUEUZ1jI0PTsos+tLENfT/cGtkQi34+lc8=;
        b=VU6CRocyiKTXqYlkBkNM9gAmWE5huH0PfxZxtyU0+fAM5U2N6vLl5vCjw2Mo0rUok/
         z8NWl9uxZMYcFrUdb0MV0lodQF5CedXTx5Aw2R8fOiOnuUFDp/6rNIa07j1RT5GDPuhG
         YT4LnqBC1v1qCGFov/RKF9k8zmCmQ8pu/D4Glo5nEglESIndleXli/rfSFqGzNnyV1sR
         Bv1s4Uwo8d6nJaMXrji6va/yJldrPXOLVqCppAiItOciPGy601wNmc2MWa3YZBMlXUpr
         Lrod7ly/y8DB7qU6W0FBm2GI+IC7qh5TNgv3Ka2YtBTr+/28XI6CmjYSHsDp4AbKvz5a
         0gGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774188090; x=1774792890;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HjdxNGbc6EUEUZ1jI0PTsos+tLENfT/cGtkQi34+lc8=;
        b=D9CciXwPPLre0e3uvFXjBsJeeSXYWil2HjtBa0/YW5fzADsxlQAm5e0PeTIALJnVQi
         4mvBn79lr/PWK7v9gNj9VzeJ9jZxJwbnB9PBbPVAL55yH7lS9ctYXK8YXFuC9QdZ4f4h
         QInLrWyUDPws1NceaACk9gZ/NdxUmHCC6KxMlzfJa2BNh3wtzRO+3jrxuP+bDJBHAOnQ
         PeRvhmMpOh54fS4OpUvVM54KZgznmG/ecCRRRxDuK9NkrS27qICbLQkt97weaUASxO3c
         AfvQyJ/gbJ2cZElWs9BLILSdqkbg5kVaZ7KCC1S/g4ToZjz2KY5YEEbbd5aAA6GNP6kj
         yAEA==
X-Gm-Message-State: AOJu0YxOqi53yFpJHIfubfsLrzKGJosEs2MLr8d2Mt5rqI211R5Te/Y3
	geKIvBMIpZQjsRc0Ly+V+zGLa68IeIos2z2TNNr6qZPN3MPtiKdRb5rG+67hYGsmYSnRm5Z95t9
	t9gBX7zvQVEAzbYrycvtshrnG1pEEUOt/Prs5iDa0RQ==
X-Gm-Gg: ATEYQzyN4m+H3VWjHwekA2RqPP8c31YbqLOyOnX8WwiV61KSnAV6diik2X049mGpQNR
	4F0FQdwlMVoAFPYSNky1h6W44C/xmGMwXC6U1dtphf43ObKek6A6e6B2hz2GcQMc/LLfqOyibBD
	TjW3jR8gaFLtgLwJkst4G/TssMMWzNKf8gS16p4gHoGKvmrbOUP6lz31+dSAL2IT0O0Pocs/yXt
	AAZjxwxQQy1uNoVFHZ4zjGmsxqqyophCXYkmwYZQWyvdpVwZqwwFQYyxBhk48Mr9aVFcBjNKElf
	0l6ZtJub0TYY6dw7nZpWmVBvxv5SsOCeBcPIMpMHLV76z5UUxK30d94sEgy9ArQnqnnqOSGOEZu
	ZfS0RUWHcR2AZPX6jkESihxqs
X-Received: by 2002:a05:6808:144e:b0:45c:96bb:1202 with SMTP id
 5614622812f47-467e5fe3284mr4910422b6e.58.1774188089867; Sun, 22 Mar 2026
 07:01:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Michael Zimmermann <sigmaepsilon92@gmail.com>
Date: Sun, 22 Mar 2026 15:01:19 +0100
X-Gm-Features: AaiRm53S_Slu1MIoUQzPglCe_cV9tEleP7ZEjzwQGR-LoHO7Q6m7efiOTgqfW3Q
Message-ID: <CAN9vWD+13DHCyjq+7hYgTSDx87TLtKXV9-8GMnZPuZnYvjyANA@mail.gmail.com>
Subject: Oops when rebinding f_hid while /dev/hidg* is still opened
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35289-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sigmaepsilon92@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com]
X-Rspamd-Queue-Id: 7271C2E98FA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The steps are as follows:
- setup an hid gadget via configfs
- bind it via the UDC file
- open /dev/hidg0
- unbind it via the UDC file
- bind it via the UDC file
- close /dev/hidg0

This results in an oops (on a Raspberry Pi 4 running Fedora 43 with
kernel 6.17.1-300.fc43.aarch64):
+ echo fe980000.usb
[  273.407057] dwc2 fe980000.usb: bound driver configfs-gadget.g1
+ sleep 3
[  273.624208] dwc2 fe980000.usb: new device is high-speed
[  273.748314] dwc2 fe980000.usb: new device is high-speed
[  273.811272] dwc2 fe980000.usb: new address 30

+ exec
+ echo ''
+ echo fe980000.usb
[  276.423944] dwc2 fe980000.usb: bound driver configfs-gadget.g1
+ exec
[  276.432878]  slab kmalloc-rnd-05-2k start ffff0000023c8000 pointer
offset 1184 size 2048
[  276.440740] list_del corruption. prev->next should be
ffff00000c72e7f0, but was ffff0000023c84a0. (prev=ffff0000023c84a0)
[  276.451905] ------------[ cut here ]------------
[  276.456345] kernel BUG at lib/list_debug.c:62!
[  276.460836] Internal error: Oops - BUG: 00000000f2000800 [#1]  SMP
[  276.467096] Modules linked in: usb_f_hid libcomposite nft_fib_inet
nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet nf_reject_ipv4
nf_reject_ipv6 nft_reject nft_ct nft_chain_nat nf_nat nf_conntrack
nf_defrag_ipv6 nf_defrag_ipv4 nf_tables qrtr bnep brcmfmac_wcc
bcm2835_v4l2(C) bcm2835_mmal_vchiq(C) videobuf2_vmalloc
videobuf2_memops videobuf2_v4l2 videodev btsdio videobuf2_common
cpufreq_dt mc snd_bcm2835(C) vc4 snd_soc_hdmi_codec brcmfmac hci_uart
btqca drm_exec btrtl snd_soc_core btintel btbcm brcmutil bluetooth
cfg80211 snd_compress ac97_bus snd_pcm_dmaengine snd_seq
snd_seq_device pwrseq_core raspberrypi_cpufreq snd_pcm rfkill
pwm_bcm2835 snd_timer iproc_rng200 snd v3d soundcore
drm_display_helper vchiq(C) bcm2711_thermal gpu_sched cec
i2c_mux_pinctrl ledtrig_default_on leds_gpio i2c_mux drm_dma_helper
binfmt_misc vfat fat loop dm_multipath zram lz4hc_compress
lz4_compress xfs mmc_block rpmb_core reset_gpio dwc2
gpio_raspberrypi_exp raspberrypi_hwmon sdhci_iproc broadcom
pwrseq_simple sdhci_pltfm bcm_phy_ptp
[  276.467432]  bcm_phy_lib udc_core i2c_brcmstb sdhci clk_bcm2711_dvp
mmc_core genet i2c_bcm2835 mdio_bcm_unimac bcm2835_wdt bcm2835_dma
phy_generic nvmem_rmem sunrpc be2iscsi bnx2i cnic uio cxgb4i cxgb4 tls
cxgb3i cxgb3 mdio libcxgbi libcxgb qla4xxx iscsi_boot_sysfs iscsi_tcp
libiscsi_tcp libiscsi scsi_transport_iscsi scsi_dh_rdac scsi_dh_emc
scsi_dh_alua i2c_dev fuse nfnetlink aes_neon_bs
[  276.592961] CPU: 0 UID: 0 PID: 1756 Comm: bash Tainted: G         C
         6.17.1-300.fc43.aarch64 #1 PREEMPT(voluntary)
[  276.604226] Tainted: [C]=CRAP
[  276.607215] Hardware name: raspberrypi Raspberry Pi 4 Model B Rev
1.1/Raspberry Pi 4 Model B Rev 1.1, BIOS 2025.10 10/01/2025
[  276.618677] pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[  276.625725] pc : __list_del_entry_valid_or_report+0xb8/0x110
[  276.631451] lr : __list_del_entry_valid_or_report+0xb8/0x110
[  276.637179] sp : ffff80008082bb80
[  276.640527] x29: ffff80008082bb80 x28: ffff00000509a540 x27: 0000000000000000
[  276.647756] x26: 0000000000000000 x25: 0000000000000000 x24: 0000000000000000
[  276.654982] x23: 0000000000000001 x22: ffffbc93e4208d00 x21: ffff00000c72e7f0
[  276.662209] x20: ffffbc93e69cbf90 x19: ffff00000c72e5b8 x18: 00000000ffffffff
[  276.669435] x17: 20747562202c3066 x16: 3765323763303030 x15: 0720072007200720
[  276.676661] x14: 0720072007200720 x13: 0720072007200720 x12: 0720072007200720
[  276.683888] x11: 0000000000000001 x10: 0000000000000001 x9 : ffffbc93e2ef94c8
[  276.691114] x8 : ffffbc93e63b8168 x7 : ffff80008082b8f0 x6 : 0000000000000001
[  276.698341] x5 : 0000000000000000 x4 : 0000000000000001 x3 : 0000000000000000
[  276.705568] x2 : 0000000000000000 x1 : ffff00000509a540 x0 : 000000000000006d
[  276.712794] Call trace:
[  276.715262]  __list_del_entry_valid_or_report+0xb8/0x110 (P)
[  276.720990]  cd_forget+0x3c/0x90
[  276.724250]  evict+0x220/0x250
[  276.727333]  iput_final+0xb8/0x160
[  276.730771]  iput.part.0+0x104/0x130
[  276.734384]  iput+0x24/0x40
[  276.737203]  dentry_unlink_inode+0xc8/0x1a0
[  276.741435]  __dentry_kill+0x84/0x200
[  276.745135]  dput+0x80/0xe8
[  276.747956]  __fput+0x12c/0x300
[  276.751128]  fput_close_sync+0x40/0x120
[  276.755006]  __arm64_sys_close+0x40/0x98
[  276.758972]  invoke_syscall.constprop.0+0x64/0xe8
[  276.763731]  el0_svc_common.constprop.0+0x40/0xe8
[  276.768490]  do_el0_svc+0x24/0x38
[  276.771839]  el0_svc+0x3c/0x168
[  276.775010]  el0t_64_sync_handler+0xa0/0xf0
[  276.779242]  el0t_64_sync+0x1b0/0x1b8
[  276.782947] Code: a94107e3 9129a000 f9400062 97d7bf71 (d4210000)
[  276.789118] ---[ end trace 0000000000000000 ]---
[  276.793784] note: bash[1756] exited with irqs disabled
[  276.799026] dwc2 fe980000.usb: new device is high-speed
Segmentation fault         bash -x trigger_udcbug.sh

I think the issue happens while calling
`list_del_init(&inode->i_devices);` in cd_forget.
I did some research and a similar bug was fixed in:
89ff3dfac604 usb: gadget: f_hid: fix f_hidg lifetime vs cdev

I assume that the difference is, that they only fixed an issue which
occurred while unbinding, but never tried to rebind it afterwards.
I'm not familiar with the code, but could the issue be, that f_hid
calls cdev_init during bind, which memsets the entire cdev structure?

Here's the script I use to trigger this bug:
export CONFIGFS_HOME=/sys/kernel/config
export DEVNAME="fe980000.usb"

mkdir -p $CONFIGFS_HOME/usb_gadget/g1
cd $CONFIGFS_HOME/usb_gadget/g1

mkdir configs/c.1

mkdir -p functions/hid.usb0
echo 0 > functions/hid.usb0/protocol
echo 64 > functions/hid.usb0/report_length
ln -s functions/hid.usb0 configs/c.1

echo "$DEVNAME" > UDC

sleep 3
exec 3<> /dev/hidg0
echo "" > UDC
echo "$DEVNAME" > UDC
exec 3<&-

Thanks
Michael

