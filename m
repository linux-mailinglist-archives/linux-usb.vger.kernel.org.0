Return-Path: <linux-usb+bounces-17681-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F070B9D0A8C
	for <lists+linux-usb@lfdr.de>; Mon, 18 Nov 2024 09:04:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 50652B22693
	for <lists+linux-usb@lfdr.de>; Mon, 18 Nov 2024 08:04:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5170176242;
	Mon, 18 Nov 2024 08:04:04 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from sundtek.de (sundtek.de [85.10.198.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4443D16132F
	for <linux-usb@vger.kernel.org>; Mon, 18 Nov 2024 08:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.10.198.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731917044; cv=none; b=Iigky2JUCVKQ0ew5kdyk7eCzhmHKYIK5JGx5443h1mUl3h4+YehnmTAb+ddjiICAXVBV2CMNfa8q8smPWAgk5bEuuIS4qHrUf0FC3S8BxBIUIXRND6ceIMWbh3OxwSw1pE3vrLPziuNfg1z3JOWTLOJScqGuSgLh41akn5yeHZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731917044; c=relaxed/simple;
	bh=SOTUAFvehKvqfZVHWM3GBNVrfrnbyLKuf2EPdinlpoE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JNaY5XDFcBABKYGm66jHESgDbjYtSlCZyIzoe/t1olZeetShxduLfvf51dSmx+k72zhXvaNAOlFdaOvj06M0hGpMxiX7WByDrVemXxmYSpz+G5ETBLH0C02frlpecQXPCi2+3SWU5GG0JyLOB55E42YFvQYhcNZ0b1svvZP4dV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sundtek.de; spf=pass smtp.mailfrom=sundtek.de; arc=none smtp.client-ip=85.10.198.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sundtek.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sundtek.de
Received: from Debian-exim by sundtek.de with spam-scanned (Exim 4.95)
	(envelope-from <linuxusb.ml@sundtek.de>)
	id 1tCwjm-0008qB-DN
	for linux-usb@vger.kernel.org;
	Mon, 18 Nov 2024 09:04:00 +0100
Received: from 220-143-194-41.dynamic-ip.hinet.net ([220.143.194.41] helo=[192.168.2.197])
	by sundtek.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <linuxusb.ml@sundtek.de>)
	id 1tCwjZ-0008pm-3W;
	Mon, 18 Nov 2024 09:03:45 +0100
Message-ID: <ed42d945bd0d52771f3749cb93f2e19f0fc9879f.camel@sundtek.de>
Subject: Re: [PATCH] XHCI NULL Pointer check in xhci_check_bw_table
From: Markus Rechberger <linuxusb.ml@sundtek.de>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Date: Mon, 18 Nov 2024 16:03:40 +0800
In-Reply-To: <2024111814-guiding-crewmate-7da8@gregkh>
References: <b90d48df16cf74bb682af870cd71d7c5cc4a9d97.camel@sundtek.de>
	 <03c1ae453f2781dbcf3a5ea607640c696b748848.camel@sundtek.de>
	 <2024111828-canon-smoking-8d1c@gregkh>
	 <3a38115585916e970df139f7d4e3db23ee395782.camel@sundtek.de>
	 <2024111814-guiding-crewmate-7da8@gregkh>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: linuxusb.ml@sundtek.de
X-SA-Exim-Scanned: No (on sundtek.de); SAEximRunCond expanded to false

On Mon, 2024-11-18 at 07:55 +0100, Greg KH wrote:
> On Mon, Nov 18, 2024 at 02:48:06PM +0800, Markus Rechberger wrote:
> > On Mon, 2024-11-18 at 07:30 +0100, Greg KH wrote:
> > > On Mon, Nov 18, 2024 at 07:27:03AM +0800, Markus Rechberger
> > > wrote:
> > > > This patch fixes a NULL Pointer exception when a device using
> > > > the
> > > > XHCI
> > > > controller driver is not properly initialized. It's relatively
> > > > easy
> > > > to
> > > > reproduce with a faulty connection to a USB Harddisk / USB
> > > > Ethernet
> > > > adapter.=C2=A0
> > > > The way I used for testing this patch was to short USB D+/D-
> > > > and
> > > > pull
> > > > them to ground.
> > > >=20
> > > > We manufacture our own USB devices and use Linux for testing,
> > > > lately we
> > > > upgraded the system to Ubuntu noble with Kernel 6.8.0 and our
> > > > system
> > > > also crashed multiple times just when plugging in some devices
> > > > (no
> > > > commands need to be executed).
> > > > We connect/disconnect devices > 100 times (eg uploading
> > > > firmware,
> > > > do
> > > > electrical tests etc).
> > > >=20
> > > > I would rate this issue as highly critical.
> > > > The problem is triggered via some fallback code in hub.c, a
> > > > second
> > > > patch will follow which
> > > > removes the endpoint reset in the particular fallback.
> > > >=20
> > > > 2024-11-16T22:14:09.701229+08:00 sundtek-UX32VD kernel: usb 3-
> > > > 2:
> > > > new
> > > > full-speed USB device number 64 using xhci_hcd
> > > > 2024-11-16T22:14:09.816295+08:00 sundtek-UX32VD kernel: usb 3-
> > > > 2:
> > > > device
> > > > descriptor read/64, error -71
> > > > 2024-11-16T22:14:10.006157+08:00 sundtek-UX32VD kernel: audit:
> > > > type=3D1400 audit(1731766450.004:3206): apparmor=3D"DENIED"
> > > > operation=3D"open" class=3D"file" profile=3D"snap.skype.skype"
> > > > name=3D"/sys/devices/pci0000:00/ACPI0003:00/power_supply/AC0/onli
> > > > ne"
> > > > pid=3D4839 comm=3D"skypeforlinux" requested_mask=3D"r"
> > > > denied_mask=3D"r"
> > > > fsuid=3D1000 ouid=3D0
> > > > 2024-11-16T22:14:10.035263+08:00 sundtek-UX32VD kernel: usb 3-
> > > > 2:
> > > > device
> > > > descriptor read/64, error -71
> > > > 2024-11-16T22:14:10.251221+08:00 sundtek-UX32VD kernel: usb 3-
> > > > 2:
> > > > new
> > > > full-speed USB device number 65 using xhci_hcd
> > > > 2024-11-16T22:14:10.365247+08:00 sundtek-UX32VD kernel: usb 3-
> > > > 2:
> > > > device
> > > > descriptor read/64, error -71
> > > > 2024-11-16T22:14:10.587264+08:00 sundtek-UX32VD kernel: usb 3-
> > > > 2:
> > > > device
> > > > descriptor read/64, error -71
> > > > 2024-11-16T22:14:10.689265+08:00 sundtek-UX32VD kernel: usb
> > > > usb3-
> > > > port2:
> > > > attempt power cycle
> > > > 2024-11-16T22:14:11.006217+08:00 sundtek-UX32VD kernel: audit:
> > > > type=3D1400 audit(1731766451.004:3207): apparmor=3D"DENIED"
> > > > operation=3D"open" class=3D"file" profile=3D"snap.skype.skype"
> > > > name=3D"/sys/devices/pci0000:00/ACPI0003:00/power_supply/AC0/onli
> > > > ne"
> > > > pid=3D4839 comm=3D"skypeforlinux" requested_mask=3D"r"
> > > > denied_mask=3D"r"
> > > > fsuid=3D1000 ouid=3D0
> > > > 2024-11-16T22:14:11.069247+08:00 sundtek-UX32VD kernel: usb 3-
> > > > 2:
> > > > new
> > > > full-speed USB device number 66 using xhci_hcd
> > > > 2024-11-16T22:14:11.069347+08:00 sundtek-UX32VD kernel: usb 3-
> > > > 2:
> > > > Device
> > > > not responding to setup address.
> > > > 2024-11-16T22:14:11.273256+08:00 sundtek-UX32VD kernel: usb 3-
> > > > 2:
> > > > Device
> > > > not responding to setup address.
> > > > 2024-11-16T22:14:12.122162+08:00 sundtek-UX32VD kernel: usb 3-
> > > > 2:
> > > > device
> > > > not accepting address 66, error -71
> > > > 2024-11-16T22:14:12.122196+08:00 sundtek-UX32VD kernel: BUG:
> > > > kernel
> > > > NULL pointer dereference, address: 0000000000000020
> > > > 2024-11-16T22:14:12.122203+08:00 sundtek-UX32VD kernel: #PF:
> > > > supervisor
> > > > read access in kernel mode
> > > > 2024-11-16T22:14:12.122206+08:00 sundtek-UX32VD kernel: #PF:
> > > > error_code(0x0000) - not-present page
> > > > 2024-11-16T22:14:12.122210+08:00 sundtek-UX32VD kernel: PGD 0
> > > > P4D 0
> > > > 2024-11-16T22:14:12.122214+08:00 sundtek-UX32VD kernel: Oops:
> > > > 0000
> > > > [#1]
> > > > PREEMPT SMP PTI
> > > > 2024-11-16T22:14:12.122216+08:00 sundtek-UX32VD kernel: CPU: 2
> > > > PID:
> > > > 15600 Comm: kworker/2:1 Not tainted 6.8.0-48-generic #48-Ubuntu
> > > > 2024-11-16T22:14:12.122219+08:00 sundtek-UX32VD kernel:
> > > > Hardware
> > > > name:
> > > > ASUSTeK COMPUTER INC. UX32VD/UX32VD, BIOS UX32VD.214 01/29/2013
> > > > 2024-11-16T22:14:12.122221+08:00 sundtek-UX32VD kernel:
> > > > Workqueue:
> > > > usb_hub_wq hub_event
> > > > 2024-11-16T22:14:12.122224+08:00 sundtek-UX32VD kernel: RIP:
> > > > 0010:xhci_check_bw_table+0x100/0x4d0
> > > > 2024-11-16T22:14:12.122227+08:00 sundtek-UX32VD kernel: Code:
> > > > c7 c2
> > > > 60
> > > > 35 70 9f 48 c7 c6 70 aa 79 9e 4c 89 55 c0 4c 89 5d d0 e8 d0 c7
> > > > 01
> > > > 00 4c
> > > > 8b 5d d0 4c 8b 55 c0 4c 8b 4d b8 41 8d 47 ff <41> 8b 4a 20 31
> > > > d2 45
> > > > 8b
> > > > 72 08 89 45 d0 41 03 02 41 f7 f7 ba 80 00
> > > > 2024-11-16T22:14:12.122231+08:00 sundtek-UX32VD kernel: RSP:
> > > > 0018:ffffc3774ebeb758 EFLAGS: 00010046
> > > > 2024-11-16T22:14:12.122234+08:00 sundtek-UX32VD kernel: RAX:
> > > > 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
> > > > 2024-11-16T22:14:12.122236+08:00 sundtek-UX32VD kernel: RDX:
> > > > 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
> > > > 2024-11-16T22:14:12.122239+08:00 sundtek-UX32VD kernel: RBP:
> > > > ffffc3774ebeb7c0 R08: 0000000000000000 R09: ffff9fcad3566000
> > > > 2024-11-16T22:14:12.122242+08:00 sundtek-UX32VD kernel: R10:
> > > > 0000000000000000 R11: ffff9fc9cc687260 R12: ffffc37741131000
> > > > 2024-11-16T22:14:12.122245+08:00 sundtek-UX32VD kernel: R13:
> > > > 0000000000000000 R14: ffff9fcad3566000 R15: 0000000000000001
> > > > 2024-11-16T22:14:12.122247+08:00 sundtek-UX32VD kernel: FS:=20
> > > > 0000000000000000(0000) GS:ffff9fcb65700000(0000)
> > > > knlGS:0000000000000000
> > > > 2024-11-16T22:14:12.122250+08:00 sundtek-UX32VD kernel: CS:=C2=A0
> > > > 0010
> > > > DS:
> > > > 0000 ES: 0000 CR0: 0000000080050033
> > > > 2024-11-16T22:14:12.122252+08:00 sundtek-UX32VD kernel: CR2:
> > > > 0000000000000020 CR3: 000000021c23c005 CR4: 00000000001706f0
> > > > 2024-11-16T22:14:12.122254+08:00 sundtek-UX32VD kernel: Call
> > > > Trace:
> > > > 2024-11-16T22:14:12.122257+08:00 sundtek-UX32VD kernel:=C2=A0 <TASK=
>
> > > > 2024-11-16T22:14:12.122259+08:00 sundtek-UX32VD kernel:=C2=A0 ?
> > > > show_regs+0x6d/0x80
> > > > 2024-11-16T22:14:12.122261+08:00 sundtek-UX32VD kernel:=C2=A0 ?
> > > > __die+0x24/0x80
> > > > 2024-11-16T22:14:12.122263+08:00 sundtek-UX32VD kernel:=C2=A0 ?
> > > > page_fault_oops+0x99/0x1b0
> > > > 2024-11-16T22:14:12.122265+08:00 sundtek-UX32VD kernel:=C2=A0 ?
> > > > kernelmode_fixup_or_oops.isra.0+0x69/0x90
> > > > 2024-11-16T22:14:12.122267+08:00 sundtek-UX32VD kernel:=C2=A0 ?
> > > > __bad_area_nosemaphore+0x19d/0x2c0
> > > > 2024-11-16T22:14:12.122269+08:00 sundtek-UX32VD kernel:=C2=A0 ?
> > > > update_sg_lb_stats+0x97/0x5c0
> > > > 2024-11-16T22:14:12.122271+08:00 sundtek-UX32VD kernel:=C2=A0 ?
> > > > bad_area_nosemaphore+0x16/0x30
> > > > 2024-11-16T22:14:12.122273+08:00 sundtek-UX32VD kernel:=C2=A0 ?
> > > > do_user_addr_fault+0x29c/0x670
> > > > 2024-11-16T22:14:12.122275+08:00 sundtek-UX32VD kernel:=C2=A0 ?
> > > > exc_page_fault+0x83/0x1b0
> > > > 2024-11-16T22:14:12.122276+08:00 sundtek-UX32VD kernel:=C2=A0 ?
> > > > asm_exc_page_fault+0x27/0x30
> > > > 2024-11-16T22:14:12.122279+08:00 sundtek-UX32VD kernel:=C2=A0 ?
> > > > xhci_check_bw_table+0x100/0x4d0
> > > > 2024-11-16T22:14:12.122281+08:00 sundtek-UX32VD kernel:=C2=A0 ?
> > > > xhci_check_bw_table+0x357/0x4d0
> > > > 2024-11-16T22:14:12.122283+08:00 sundtek-UX32VD kernel:=20
> > > > xhci_reserve_bandwidth+0x298/0xb20
> > > > 2024-11-16T22:14:12.122286+08:00 sundtek-UX32VD kernel:=C2=A0 ?
> > > > update_load_avg+0x82/0x850
> > > > 2024-11-16T22:14:12.122288+08:00 sundtek-UX32VD kernel:=20
> > > > xhci_configure_endpoint+0xa8/0x730
> > > > 2024-11-16T22:14:12.122291+08:00 sundtek-UX32VD kernel:=20
> > > > xhci_check_ep0_maxpacket.isra.0+0x14e/0x1d0
> > > > 2024-11-16T22:14:12.122293+08:00 sundtek-UX32VD kernel:=20
> > > > xhci_endpoint_reset+0x254/0x4a0
> > > > 2024-11-16T22:14:12.122295+08:00 sundtek-UX32VD kernel:=C2=A0 ?
> > > > _raw_spin_lock_irqsave+0xe/0x20
> > > > 2024-11-16T22:14:12.122298+08:00 sundtek-UX32VD kernel:=20
> > > > usb_hcd_reset_endpoint+0x28/0xa0
> > > > 2024-11-16T22:14:12.122300+08:00 sundtek-UX32VD kernel:=20
> > > > usb_enable_endpoint+0x8c/0xa0
> > > > 2024-11-16T22:14:12.122302+08:00 sundtek-UX32VD kernel:=20
> > > > hub_port_connect+0x176/0xb70
> > > > 2024-11-16T22:14:12.122305+08:00 sundtek-UX32VD kernel:=20
> > > > hub_port_connect_change+0x88/0x2b0
> > > > 2024-11-16T22:14:12.122307+08:00 sundtek-UX32VD kernel:=20
> > > > port_event+0x651/0x810
> > > > 2024-11-16T22:14:12.122309+08:00 sundtek-UX32VD kernel:=20
> > > > hub_event+0x14a/0x450
> > > > 2024-11-16T22:14:12.122311+08:00 sundtek-UX32VD kernel:=20
> > > > process_one_work+0x178/0x350
> > > > 2024-11-16T22:14:12.122313+08:00 sundtek-UX32VD kernel:=20
> > > > worker_thread+0x306/0x440
> > > > 2024-11-16T22:14:12.122316+08:00 sundtek-UX32VD kernel:=C2=A0 ?
> > > > _raw_spin_lock_irqsave+0xe/0x20
> > > > 2024-11-16T22:14:12.122318+08:00 sundtek-UX32VD kernel:=C2=A0 ?
> > > > __pfx_worker_thread+0x10/0x10
> > > > 2024-11-16T22:14:12.122321+08:00 sundtek-UX32VD kernel:=20
> > > > kthread+0xf2/0x120
> > > > 2024-11-16T22:14:12.122323+08:00 sundtek-UX32VD kernel:=C2=A0 ?
> > > > __pfx_kthread+0x10/0x10
> > > > 2024-11-16T22:14:12.122325+08:00 sundtek-UX32VD kernel:=20
> > > > ret_from_fork+0x47/0x70
> > > > 2024-11-16T22:14:12.122327+08:00 sundtek-UX32VD kernel:=C2=A0 ?
> > > > __pfx_kthread+0x10/0x10
> > > > 2024-11-16T22:14:12.122329+08:00 sundtek-UX32VD kernel:=20
> > > > ret_from_fork_asm+0x1b/0x30
> > > > 2024-11-16T22:14:12.122331+08:00 sundtek-UX32VD kernel:=C2=A0
> > > > </TASK>
> > > > 2024-11-16T22:14:12.122334+08:00 sundtek-UX32VD kernel: Modules
> > > > linked
> > > > in: cpuid ufs qnx4 hfsplus hfs minix ntfs msdos jfs
> > > > nls_ucs2_utils
> > > > xfs
> > > > usbtest rfcomm snd_seq_dummy snd_hrtimer qrtr uhid hid cmac
> > > > algif_hash
> > > > algif_skcipher af_alg bnep sunrpc snd_hda_codec_hdmi
> > > > intel_rapl_msr
> > > > intel_rapl_common binfmt_misc snd_hda_codec_realtek
> > > > x86_pkg_temp_thermal snd_hda_codec_generic intel_powerclamp
> > > > coretemp
> > > > kvm_intel snd_hda_intel snd_intel_dspcfg snd_intel_sdw_acpi
> > > > uvcvideo
> > > > snd_hda_codec kvm videobuf2_vmalloc snd_hda_core uvc btusb
> > > > snd_hwdep
> > > > irqbypass videobuf2_memops snd_pcm btrtl videobuf2_v4l2 iwldvm
> > > > rtsx_usb_ms btintel videodev btbcm rapl btmtk at24 mei_pxp
> > > > mei_hdcp
> > > > memstick nls_iso8859_1 mac80211 asus_nb_wmi videobuf2_common
> > > > mfd_aaeon
> > > > libarc4 mc i915 snd_seq_midi bluetooth snd_seq_midi_event
> > > > snd_rawmidi
> > > > intel_cstate asus_wmi iwlwifi ledtrig_audio ecdh_generic
> > > > sparse_keymap
> > > > platform_profile i2c_i801 ecc mxm_wmi drm_buddy wmi_bmof
> > > > snd_seq
> > > > i2c_smbus cfg80211 ttm snd_seq_device snd_timer
> > > > drm_display_helper
> > > > snd
> > > > acpi_als mei_me cec soundcore
> > > > 2024-11-16T22:14:12.122337+08:00 sundtek-UX32VD kernel:=20
> > > > industrialio_triggered_buffer rc_core lpc_ich mei i2c_algo_bit
> > > > int3400_thermal kfifo_buf int3402_thermal industrialio
> > > > int3403_thermal
> > > > acpi_thermal_rel asus_wireless int340x_thermal_zone joydev
> > > > input_leds
> > > > mac_hid serio_raw sch_fq_codel msr parport_pc ppdev lp parport
> > > > efi_pstore nfnetlink dmi_sysfs ip_tables x_tables autofs4 btrfs
> > > > blake2b_generic raid10 raid456 async_raid6_recov async_memcpy
> > > > async_pq
> > > > async_xor async_tx xor raid6_pq libcrc32c raid1 raid0
> > > > rtsx_usb_sdmmc
> > > > rtsx_usb crct10dif_pclmul crc32_pclmul polyval_clmulni
> > > > polyval_generic
> > > > ghash_clmulni_intel sha256_ssse3 sha1_ssse3 video psmouse ahci
> > > > xhci_pci
> > > > libahci xhci_pci_renesas wmi aesni_intel crypto_simd cryptd
> > > > 2024-11-16T22:14:12.122340+08:00 sundtek-UX32VD kernel: CR2:
> > > > 0000000000000020
> > > > 2024-11-16T22:14:12.122342+08:00 sundtek-UX32VD kernel: ---[
> > > > end
> > > > trace
> > > > 0000000000000000 ]---
> > > > 2024-11-16T22:14:12.122344+08:00 sundtek-UX32VD kernel: RIP:
> > > > 0010:xhci_check_bw_table+0x100/0x4d0
> > > > 2024-11-16T22:14:12.122346+08:00 sundtek-UX32VD kernel: Code:
> > > > c7 c2
> > > > 60
> > > > 35 70 9f 48 c7 c6 70 aa 79 9e 4c 89 55 c0 4c 89 5d d0 e8 d0 c7
> > > > 01
> > > > 00 4c
> > > > 8b 5d d0 4c 8b 55 c0 4c 8b 4d b8 41 8d 47 ff <41> 8b 4a 20 31
> > > > d2 45
> > > > 8b
> > > > 72 08 89 45 d0 41 03 02 41 f7 f7 ba 80 00
> > > > 2024-11-16T22:14:12.122349+08:00 sundtek-UX32VD kernel: RSP:
> > > > 0018:ffffc3774ebeb758 EFLAGS: 00010046
> > > > 2024-11-16T22:14:12.122352+08:00 sundtek-UX32VD kernel: RAX:
> > > > 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
> > > > 2024-11-16T22:14:12.122355+08:00 sundtek-UX32VD kernel: RDX:
> > > > 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
> > > > 2024-11-16T22:14:12.122357+08:00 sundtek-UX32VD kernel: RBP:
> > > > ffffc3774ebeb7c0 R08: 0000000000000000 R09: ffff9fcad3566000
> > > > 2024-11-16T22:14:12.122359+08:00 sundtek-UX32VD kernel: R10:
> > > > 0000000000000000 R11: ffff9fc9cc687260 R12: ffffc37741131000
> > > > 2024-11-16T22:14:12.122361+08:00 sundtek-UX32VD kernel: R13:
> > > > 0000000000000000 R14: ffff9fcad3566000 R15: 0000000000000001
> > > > 2024-11-16T22:14:12.122363+08:00 sundtek-UX32VD kernel: FS:=20
> > > > 0000000000000000(0000) GS:ffff9fcb65700000(0000)
> > > > knlGS:0000000000000000
> > > > 2024-11-16T22:14:12.122366+08:00 sundtek-UX32VD kernel: CS:=C2=A0
> > > > 0010
> > > > DS:
> > > > 0000 ES: 0000 CR0: 0000000080050033
> > > > 2024-11-16T22:14:12.122368+08:00 sundtek-UX32VD kernel: CR2:
> > > > 0000000000000020 CR3: 000000011ffde004 CR4: 00000000001706f0
> > > > 2024-11-16T22:14:12.122371+08:00 sundtek-UX32VD kernel: note:
> > > > kworker/2:1[15600] exited with irqs disabled
> > > > 2024-11-16T22:14:12.122373+08:00 sundtek-UX32VD kernel: note:
> > > > kworker/2:1[15600] exited with preempt_count 1
> > > >=20
> > > > Signed-off-by: Markus Rechberger <linuxusb.ml@sundtek.de>
> > > >=20
> > > > This patch diff --git a/drivers/usb/host/xhci.c
> > > > b/drivers/usb/host/xhci.c
> > > > index 899c0effb5d3..f054e262176c 100644
> > > > --- a/drivers/usb/host/xhci.c
> > > > +++ b/drivers/usb/host/xhci.c
> > > > @@ -2380,6 +2380,17 @@ static int xhci_check_bw_table(struct
> > > > xhci_hcd
> > > > *xhci,
> > > > =C2=A0	}
> > > > =C2=A0
> > > > =C2=A0	bw_table =3D virt_dev->bw_table;
> > > > +
> > > > +	/* second line of defense, this should not happen if
> > > > bw_table
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 is not initialized this calcu=
lation should not be
> > > > called
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 any issue with bw_table is su=
pposed to be handled
> > > > earlier
> > > > +	*/
> > > > +	if (bw_table =3D=3D NULL) {
> > > > +		xhci_warn(xhci, "bw_table =3D=3D NULL, this should
> > > > not
> > > > happen\n"
> > > > +				"please report\n");
> > > > +		return -ENOMEM;
> > > > +	}
> > > > +
> > > > =C2=A0	/* We need to translate the max packet size and max
> > > > ESIT
> > > > payloads into
> > > > =C2=A0	 * the units the hardware uses.
> > > > =C2=A0	 */
> > > >=20
> > > >=20
> > >=20
> > > > diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
> > > > index 899c0effb5d3..f054e262176c 100644
> > > > --- a/drivers/usb/host/xhci.c
> > > > +++ b/drivers/usb/host/xhci.c
> > > > @@ -2380,6 +2380,17 @@ static int xhci_check_bw_table(struct
> > > > xhci_hcd *xhci,
> > > > =C2=A0	}
> > > > =C2=A0
> > > > =C2=A0	bw_table =3D virt_dev->bw_table;
> > > > +
> > > > +	/* second line of defense, this should not happen if
> > > > bw_table
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 is not initialized this calcu=
lation should not be
> > > > called
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 any issue with bw_table is su=
pposed to be handled
> > > > earlier
> > > > +	*/
> > > > +	if (bw_table =3D=3D NULL) {
> > > > +		xhci_warn(xhci, "bw_table =3D=3D NULL, this should
> > > > not
> > > > happen\n"
> > > > +				"please report\n");
> > > > +		return -ENOMEM;
> > > > +	}
> > > > +
> > > > =C2=A0	/* We need to translate the max packet size and max
> > > > ESIT
> > > > payloads into
> > > > =C2=A0	 * the units the hardware uses.
> > > > =C2=A0	 */
> > >=20
> > >=20
> > > Hi,
> > >=20
> > > This is the friendly patch-bot of Greg Kroah-Hartman.=C2=A0 You have
> > > sent
> > > him
> > > a patch that has triggered this response.=C2=A0 He used to manually
> > > respond
> > > to these common problems, but in order to save his sanity (he
> > > kept
> > > writing the same thing over and over, yet to different people), I
> > > was
> > > created.=C2=A0 Hopefully you will not take offence and will fix the
> > > problem
> > > in your patch and resubmit it so that it can be accepted into the
> > > Linux
> > > kernel tree.
> > >=20
> > > You are receiving this message because of the following common
> > > error(s)
> > > as indicated below:
> > >=20
> > > - Your patch is malformed (tabs converted to spaces, linewrapped,
> > > etc.)
> > > =C2=A0 and can not be applied.=C2=A0 Please read the file,
> > > =C2=A0 Documentation/process/email-clients.rst in order to fix this.
> > >=20
> > > - Your patch was attached, please place it inline so that it can
> > > be
> > > =C2=A0 applied directly from the email message itself.
> > >=20
> > > - This looks like a new version of a previously submitted patch,
> > > but
> > > you
> > > =C2=A0 did not list below the --- line any changes from the previous
> > > version.
> > > =C2=A0 Please read the section entitled "The canonical patch format"
> > > in
> > > the
> > > =C2=A0 kernel file, Documentation/process/submitting-patches.rst for
> > > what
> > > =C2=A0 needs to be done here to properly describe this.
> > >=20
> >=20
> > I'm sorry for that, can you handle the patch another way? The Linux
> > mailclients I use are not
> > convenient thunderbird having massive issues with timestamps (so I
> > can't use it at all), evolution lacking some features (eg. don't
> > convert tabs).
>=20
> Can you just use 'git send-email'?
>=20
> Thunderbird works for many people, as does evolution, so those
> shouldn't
> be an issue.=C2=A0 There's a whole document in the kernel Documentation/
> directory about how to set up different email clients.
>=20
> > I understand that patch consistency has to be maintained across the
> > kernel project, but I can't
> > submit them accordingly with my current setup.
>=20
> It's not "consistency", it's "this will not apply at all as it is
> corrupted" so I don't think this would work for any other project
> either, sorry.
>=20
> Also, your changelog text is wonky, please trim it down to something
> readable and relevant.=C2=A0 Look at other commits in the tree for
> examples.
>=20
> And finally, use scripts/checkpatch.pl before sending your patch out
> again, your comment style is "different".
>=20


Thanks the documentation lead to a solution with evolution.
I'll send it again later.

Best Regards,
Markus

> thanks,
>=20
> greg k-h


