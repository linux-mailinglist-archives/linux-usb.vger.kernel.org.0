Return-Path: <linux-usb+bounces-38084-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gDHVCrKeFmq1ngcAu9opvQ
	(envelope-from <linux-usb+bounces-38084-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 27 May 2026 09:35:14 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A1CA5E0846
	for <lists+linux-usb@lfdr.de>; Wed, 27 May 2026 09:35:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 66B81300B62E
	for <lists+linux-usb@lfdr.de>; Wed, 27 May 2026 07:34:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B92D37755C;
	Wed, 27 May 2026 07:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b="SzA+Rl7F"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx3.wp.pl (mx3.wp.pl [212.77.101.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0186C26E706
	for <linux-usb@vger.kernel.org>; Wed, 27 May 2026 07:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.77.101.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779867245; cv=none; b=LZxd61aItj4h8SJineIh3PCaxDmosJlaW0eGcaNhypkRi+J7QbD9cVBjjFRwcl/12ffzji6a1BrIaRHwqfTC8uHccdI5cx1SLBBI+IjI7RSlt+EjI6hPJqygJ2BNyw74Q2CftGTn2K2ibgEisxStEiFzfNUwZk0LC9Hr1PYbZGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779867245; c=relaxed/simple;
	bh=gNrJ1cAQ5EOtkaIRzxodxihMsgfrgNnrDTkhLugA4Q8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dwx3ffkOqZN/5iM0bWul+AWDLztym0+Bdw4xfSmhVlod2Ua1Fj3whIMiB0Tce16cPLJ39+0ZhnKct8cnmyjcJt50ZkaPN6cLvDWTGv/TMSqEn8oI2rdnXxz7U5sam6/0+6GfOMC1fMQjABONDqv109PxauCVSQccDEHIPf92/ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl; spf=pass smtp.mailfrom=wp.pl; dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b=SzA+Rl7F; arc=none smtp.client-ip=212.77.101.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wp.pl
Received: (wp-smtpd smtp.wp.pl 4323 invoked from network); 27 May 2026 09:33:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1779867234; bh=7shVlV2NbInj5l/4WYLIHk3x+Zu42tXum+N2vpG6KOE=;
          h=From:To:Cc:Subject;
          b=SzA+Rl7FN2W60UL1Uu0oFrPTRuh4n0rxZfRhmInLPBGyIiF+pFE9yDtT82GictPYX
           LfVKM1edYXAFSlUqJ7GuLHlWnkb/Nrb74xQgoW24PYBmBsm245LHsT9XN5ji5HALx1
           FM82aMrCc1Quz5uLisvD0E23Wr1J07OCcZKRf6yJ48aC6/WLOCXFnY68k40oGmJQrX
           l5L2t7e2GxNvd1mRRyHNEP6JQ5fFjW5IUQUHLGTLgI2CdAlhMoqtBnI57KVgVNbQ+8
           /2pfaR4noX20fW+Q09yjNOi+a4sYAKll1n79m1/3htewbrz0M8/byMhev1UXzP/4Aj
           YmjrAGGEfzt1A==
Received: from 77-236-11-252.static.play.pl (HELO localhost) (stf_xl@wp.pl@[77.236.11.252])
          (envelope-sender <stf_xl@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with TLS_AES_256_GCM_SHA384 encrypted SMTP
          for <mfo@igalia.com>; 27 May 2026 09:33:54 +0200
Date: Wed, 27 May 2026 09:33:53 +0200
From: Stanislaw Gruszka <stf_xl@wp.pl>
To: Mauricio Faria de Oliveira <mfo@igalia.com>
Cc: Matthieu CASTET <castet.matthieu@free.fr>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrew Morton <akpm@osdl.org>, kernel-dev@igalia.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@suse.de>,
	Andrey Tsygunka <aitsygunka@yandex.ru>,
	syzbot+ce1e5a1b4e086b43e56d@syzkaller.appspotmail.com,
	syzbot+306212936b13e520679d@syzkaller.appspotmail.com,
	syzbot+457452d30bcdda75ead2@syzkaller.appspotmail.com
Subject: Re: [PATCH v3] usb: atm: ueagle-atm: wait for pre-firmware load in
 .disconnect()
Message-ID: <20260527073353.GA47101@wp.pl>
References: <20260526-ueagle-atm_req-fw-sync-v3-1-93c01961daaf@igalia.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260526-ueagle-atm_req-fw-sync-v3-1-93c01961daaf@igalia.com>
X-WP-MailID: e2525af89261f2ed04f11e4fd75332ac
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000001 [wXJy]                               
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[wp.pl,none];
	R_DKIM_ALLOW(-0.20)[wp.pl:s=20241105];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38084-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[wp.pl];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[free.fr,linuxfoundation.org,osdl.org,igalia.com,vger.kernel.org,suse.de,yandex.ru,syzkaller.appspotmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stf_xl@wp.pl,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[wp.pl:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb,ce1e5a1b4e086b43e56d,306212936b13e520679d,457452d30bcdda75ead2];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,appspotmail.com:email,syzbot.org:url]
X-Rspamd-Queue-Id: 7A1CA5E0846
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 26, 2026 at 02:09:44PM -0300, Mauricio Faria de Oliveira wrote:
> ueagle-atm uses the asynchronous request_firmware_nowait() in .probe(),
> but does not wait for its completion, not even in .disconnect(); so, if the
> device is unplugged meanwhile, its teardown runs concurrently with that.
> 
> Even though this inconsistency is worth addressing on its own, it has also
> triggered several bug reports in syzbot over the years (some auto-closed)
> where the firmware sysfs fallback mechanism (CONFIG_FW_LOADER_USER_HELPER)
> creates a firmware subdirectory in the device directory during its removal,
> which might hit unexpected conditions in kernfs, apparently, depending at
> which point the add and remove operations raced. (See links.)
> 
> The pattern is:
> 
> usb ?-?: Direct firmware load for ueagle-atm/eagle?.fw failed with error -2
> usb ?-?: Falling back to sysfs fallback for: ueagle-atm/eagle?.fw
> <ERROR>
> Call trace:
>  ...
>  kernfs_create_dir_ns
>  sysfs_create_dir_ns
>  create_dir
>  kobject_add_internal
>  kobject_add_varg
>  kobject_add
>  class_dir_create_and_add
>  get_device_parent
>  device_add
>  fw_load_sysfs_fallback
>  fw_load_from_user_helper
>  firmware_fallback_sysfs
>  _request_firmware
>  request_firmware_work_func
>  ...
> 
> (Some variations are observed, after fw_load_sysfs_fallback(), e.g., [1].)
> 
> While the kernfs side is being looked at, the ueagle-atm side can be fixed
> by waiting for the pre-firmware load in the .disconnect() handler.
> 
> This change has a similar approach to previous work by Andrey Tsygunka [2]
> (wait_for_completion() in .disconnect()), but it is relatively different in
> design/implementation; using the Originally-by tag for credit assignment.
> 
> This has been tested with:
> - synthetic reproducer to check the error path;
> - USB gadget (virtual device) to check the firmware upload path;
> - QEMU device emulator to check the device ID re-enumeration path;
> (The latter two were written by Claude; no other code/text in this commit.)
> 
> Links (year first reported):
>  2025 https://syzbot.org/bug?extid=ce1e5a1b4e086b43e56d
>  2025 https://syzbot.org/bug?extid=9af8471255ac36e34fd4
>  2024 https://syzbot.org/bug?extid=306212936b13e520679d
>  2023 https://syzkaller.appspot.com/bug?extid=457452d30bcdda75ead2
>  2022 https://syzbot.org/bug?extid=782984d6f1701b526edb
>  2021 https://syzbot.org/bug?id=f3f221579f4ef7e9691281f3c6f56c05f83e8490
>  2021 https://syzbot.org/bug?id=84d86f0d71394829df6fc53daf6642c045983881
>  2021 https://syzbot.org/bug?id=3302dc1c0e2b9c94f2e8edb404eabc9267bc6f90
> 
> [1] https://syzkaller.appspot.com/bug?extid=457452d30bcdda75ead2
> [2] https://lore.kernel.org/lkml/20250410093146.3776801-2-aitsygunka@yandex.ru/
> 
> Reported-by: syzbot+ce1e5a1b4e086b43e56d@syzkaller.appspotmail.com
> Closes: https://syzbot.org/bug?extid=ce1e5a1b4e086b43e56d
> Reported-by: syzbot+306212936b13e520679d@syzkaller.appspotmail.com
> Closes: https://syzbot.org/bug?extid=306212936b13e520679d
> Reported-by: syzbot+457452d30bcdda75ead2@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=457452d30bcdda75ead2
> Originally-by: Andrey Tsygunka <aitsygunka@yandex.ru>
> Fixes: b72458a80c75 ("[PATCH] USB: Eagle and ADI 930 usb adsl modem driver")
> Assisted-by: Claude:claude-opus-4.7 # usb gadget & qemu device for testing
> Signed-off-by: Mauricio Faria de Oliveira <mfo@igalia.com>
Acked-by: Stanislaw Gruszka <stf_xl@wp.pl>

> ---
> Testing:
> =======
> 
> Tested with virtual devices and synthetic reproducer (hardware unavailable).
> 
> With two ueagle-atm patches currently in:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git
>   usb-testing branch
> 
> With:
> 
>   # echo 1 >/sys/module/printk/parameters/ignore_loglevel
>   # echo 2 >/sys/module/ueagle_atm/parameters/debug
>   # echo 'file drivers/usb/atm/ueagle-atm.c +p' >/sys/kernel/debug/dynamic_debug/control
>   # echo 'file drivers/base/firmware_loader/* +p' >/sys/kernel/debug/dynamic_debug/control
> 
> Section 'Error path' shows an actual case of waiting for a few seconds in .disconnect().
> Other sections show non-waiting cases where firmware upload is successful (more likely).
> 
> Firmware upload path:
> --------------------
> 
> This has been tested with a USB gadget (virtual device) written by Claude [1].
> It ACKs pre-firmware upload commands, so the driver considers that successful:
> 
>   [  204.237892] usb 3-1: [ueagle-atm] firmware uploaded
>   
> Log (blocks separated for clarity):
> 
>   # insmod ueagle_gadget.ko
>   ...
>   [  203.414370] [ueagle-gadget] registered (VID=0x1039 PID=0x2101)
>   [  203.624444] usb 3-1: new full-speed USB device number 3 using dummy_hcd
>   ...
>   [  203.760088] usb 3-1: [ueagle-atm dbg] uea_probe: ADSL device found with vid (0X1039) pid (0X2101) Rev (0X2581): Eagle I
>   
>   [  204.004847] usb 3-1: [ueagle-atm] pre-firmware device, uploading firmware
>   [  204.004922] usb 3-1: [ueagle-atm] loading firmware ueagle-atm/eagleI.fw
>   [  204.009581] firmware_class: __allocate_fw_priv: fw-ueagle-atm/eagleI.fw fw_priv=00000000067944c4
>   [  204.009692] usb 3-1: loading /lib/firmware/updates/.../ueagle-atm/eagleI.fw failed for no such file or directory.
>   [  204.009763] usb 3-1: loading /lib/firmware/updates/ueagle-atm/eagleI.fw failed for no such file or directory.
>   [  204.009822] usb 3-1: loading /lib/firmware/.../ueagle-atm/eagleI.fw failed for no such file or directory.
>   [  204.034914] usb 3-1: Loading firmware from /lib/firmware/ueagle-atm/eagleI.fw
>   [  204.034933] usb 3-1: direct-loading ueagle-atm/eagleI.fw
>   [  204.034965] firmware_class: fw_set_page_data: fw-ueagle-atm/eagleI.fw fw_priv=00000000067944c4 data=000000007f403c77 size=10981
>   
>   [  204.035204] usb 3-1: Loaded FW: ueagle-atm/eagleI.fw, sha256: 8c5047be3b02ed4a8b98c22ed03c010afae1782f6056d8bf2f32bbdde834a74a
>   [  204.044467] ueagle_gadget gadget.0: [ueagle-gadget] LOAD_INTERNAL addr=0x7f92 (F8051_USBCS reset), len=1
>   [  204.237855] ueagle_gadget gadget.0: [ueagle-gadget] LOAD_INTERNAL addr=0x7f92 (F8051_USBCS reset), len=1
>   [  204.237892] usb 3-1: [ueagle-atm] firmware uploaded
>   [  204.237898] firmware_class: __free_fw_priv: fw-ueagle-atm/eagleI.fw fw_priv=00000000067944c4 data=000000007f403c77 size=10981
>   
>   # rmmod ueagle_gadget
>   
>   [  395.760610] ueagle_gadget gadget.0: [ueagle-gadget] disconnected
>   [  395.762723] ueagle_gadget gadget.0: [ueagle-gadget] unbound
>   [  395.763033] [ueagle-gadget] unregistered
>   [  395.767035] usb 3-1: USB disconnect, device number 3
>   [  395.767456] usb 3-1: [ueagle-atm dbg] uea_disconnect: pre-firmware device, waiting firmware upload
>   [  395.767466] usb 3-1: [ueagle-atm dbg] uea_disconnect: pre-firmware device, finished waiting
>   [  395.780360] firmware_class: fw_name_devm_release: fw_name-ueagle-atm/eagleI.fw devm-00000000905aab2b released
> 
> Device re-enumeration path:
> ---------------------------
> 
> This has been tested with a QEMU device emulator written by Claude [2].
> It ACKs pre-firmware upload commands, so the driver considers that successful,
> then re-enumerates the USB device to the post-firmware device ID.
> 
>   [   53.018638] usb 1-1: new high-speed USB device number 2 using xhci_hcd
>   ...
>   [   53.161065] usb 1-1: [ueagle-atm dbg] uea_probe: ADSL device found with vid (0X1039) pid (0X2101) Rev (0X0): Eagle I
>   [   53.279989] usb 1-1: reset high-speed USB device number 2 using xhci_hcd
>   
>   [   53.408011] usb 1-1: [ueagle-atm] pre-firmware device, uploading firmware
>   [   53.408070] usb 1-1: [ueagle-atm] loading firmware ueagle-atm/eagleI.fw
>   [   53.412221] firmware_class: __allocate_fw_priv: fw-ueagle-atm/eagleI.fw fw_priv=00000000573d611f
>   [   53.446730] usb 1-1: loading /lib/firmware/updates/.../ueagle-atm/eagleI.fw failed for no such file or directory.
>   [   53.446806] usb 1-1: loading /lib/firmware/updates/ueagle-atm/eagleI.fw failed for no such file or directory.
>   [   53.446890] usb 1-1: loading /lib/firmware/.../ueagle-atm/eagleI.fw failed for no such file or directory.
>   [   53.469798] usb 1-1: Loading firmware from /lib/firmware/ueagle-atm/eagleI.fw
>   [   53.469811] usb 1-1: direct-loading ueagle-atm/eagleI.fw
>   [   53.469843] firmware_class: fw_set_page_data: fw-ueagle-atm/eagleI.fw fw_priv=00000000573d611f data=00000000c9c958dc size=10981
>   
>   [   53.470082] usb 1-1: Loaded FW: ueagle-atm/eagleI.fw, sha256: 8c5047be3b02ed4a8b98c22ed03c010afae1782f6056d8bf2f32bbdde834a74a
>   [   53.599908] usb 1-1: [ueagle-atm] firmware uploaded
>   [   53.599926] firmware_class: __free_fw_priv: fw-ueagle-atm/eagleI.fw fw_priv=00000000573d611f data=00000000c9c958dc size=10981
>   
>   [   53.600247] usb 1-1: USB disconnect, device number 2
>   [   53.613568] usb 1-1: [ueagle-atm dbg] uea_disconnect: pre-firmware device, waiting firmware upload
>   [   53.613594] usb 1-1: [ueagle-atm dbg] uea_disconnect: pre-firmware device, finished waiting
>   [   53.629523] firmware_class: fw_name_devm_release: fw_name-ueagle-atm/eagleI.fw devm-00000000682651e8 released
>   
>   [   53.873101] usb 1-1: new high-speed USB device number 3 using xhci_hcd
>   ...
>   [   54.011640] usb 1-1: New USB device found, idVendor=1039, idProduct=2100, bcdDevice=20.0b
>   ...
>   [   54.026724] usb 1-1: [ueagle-atm dbg] uea_probe: ADSL device found with vid (0X1039) pid (0X2100) Rev (0X200B): Eagle I
>   [   54.154845] usb 1-1: reset high-speed USB device number 3 using xhci_hcd
>   ...
> 
> Error path:
> ----------
> 
> This has been tested with a synthetic reproducer [3]:
> 
>   # mv /lib/firmware/ueagle-atm/eagleI.fw \
>        /lib/firmware/ueagle-atm/eagleI.fw.NOT-FOUND
>   
>   # cat ueagle-atm.syzlang
>   syz_usb_connect(0x3, 0x2d, &(0x7f00000002c0)=ANY=[@ANYBLOB="12011003faff82083910012181250102030109021b00028c4400600904"], &(0x7f0000000240)={0x0, 0x0, 0x0, 0x0})
>   
>   # ./syz-execprog -procs=1 -enable='' ueagle-atm.syzlang
> 
> Modified: 
> 
>   [   53.437324] usb 3-1: new high-speed USB device number 2 using dummy_hcd
>   ...
>   [   53.578680] usb 3-1: New USB device found, idVendor=1039, idProduct=2101, bcdDevice=25.81
>   ...
>   [   53.790811] usb 3-1: [ueagle-atm dbg] uea_probe: ADSL device found with vid (0X1039) pid (0X2101) Rev (0X2581): Eagle I
>   
>   [   54.534023] usb 3-1: [ueagle-atm] pre-firmware device, uploading firmware
>   [   54.534060] usb 3-1: [ueagle-atm] loading firmware ueagle-atm/eagleI.fw
>   [   54.544413] firmware_class: __allocate_fw_priv: fw-ueagle-atm/eagleI.fw fw_priv=0000000011cebda9
>   [   54.549369] usb 3-1: loading /lib/firmware/updates/.../ueagle-atm/eagleI.fw failed for no such file or directory.
>   [   54.549447] usb 3-1: loading /lib/firmware/updates/ueagle-atm/eagleI.fw failed for no such file or directory.
>   [   54.549535] usb 3-1: loading /lib/firmware/.../ueagle-atm/eagleI.fw failed for no such file or directory.
>   [   54.549607] usb 3-1: loading /lib/firmware/ueagle-atm/eagleI.fw failed for no such file or directory.
>   
>   [   54.549618] usb 3-1: Direct firmware load for ueagle-atm/eagleI.fw failed with error -2
>   [   54.549627] usb 3-1: Falling back to sysfs fallback for: ueagle-atm/eagleI.fw
>   
>   [   54.549800] test kernfs_activate(): sleep 3s
>   [   54.617101] usb 3-1: USB disconnect, device number 2
>   [   54.623904] usb 3-1: [ueagle-atm dbg] uea_disconnect: pre-firmware device, waiting firmware upload
>   
>   [   57.589519] test kernfs_activate(): slept 3s
>   [   57.589708] firmware ueagle-atm!eagleI.fw: firmware: requesting ueagle-atm/eagleI.fw
>   [   57.615334] test __kernfs_remove(): done
>   [   57.615375] firmware_class: __free_fw_priv: fw-ueagle-atm/eagleI.fw fw_priv=0000000011cebda9 data=0000000000000000 size=0
>   [   57.615398] usb 3-1: [UEAGLE-ATM] firmware is not available
>   [   57.615425] usb 3-1: [ueagle-atm dbg] uea_disconnect: pre-firmware device, finished waiting
> 
> Original:
> 
>   [   45.622349] usb 3-1: new high-speed USB device number 2 using dummy_hcd
>   ...
>   [   45.998868] usb 3-1: New USB device found, idVendor=1039, idProduct=2101, bcdDevice=25.81
>   ...
>   [   46.325820] usb 3-1: [ueagle-atm dbg] uea_probe: ADSL device found with vid (0X1039) pid (0X2101) Rev (0X2581): Eagle I
>   
>   [   47.141820] usb 3-1: [ueagle-atm] pre-firmware device, uploading firmware
>   [   47.141866] usb 3-1: [ueagle-atm] loading firmware ueagle-atm/eagleI.fw
>   [   47.191338] firmware_class: __allocate_fw_priv: fw-ueagle-atm/eagleI.fw fw_priv=00000000ad970730
>   [   47.251273] usb 3-1: loading /lib/firmware/updates/.../ueagle-atm/eagleI.fw failed for no such file or directory.
>   [   47.251314] usb 3-1: loading /lib/firmware/updates/ueagle-atm/eagleI.fw failed for no such file or directory.
>   [   47.315769] usb 3-1: loading /lib/firmware/.../ueagle-atm/eagleI.fw failed for no such file or directory.
>   [   47.315813] usb 3-1: loading /lib/firmware/ueagle-atm/eagleI.fw failed for no such file or directory.
>   
>   [   47.315819] usb 3-1: Direct firmware load for ueagle-atm/eagleI.fw failed with error -2
>   [   47.315823] usb 3-1: Falling back to sysfs fallback for: ueagle-atm/eagleI.fw
>   
>   [   47.315871] test kernfs_activate(): sleep 3s
>   [   47.379964] usb 3-1: USB disconnect, device number 2
>   [   47.381235] test __kernfs_remove(): done
>   [   50.363795] test kernfs_activate(): slept 3s
>   [   50.363809] ==================================================================
>   [   50.363814] BUG: KASAN: slab-use-after-free in kernfs_root+0x68/0x80
>   [   50.363834] Read of size 8 at addr ffff88800c015ee0 by task kworker/1:1/48
>   [   50.363843]
>   [   50.363851] CPU: 1 UID: 0 PID: 48 Comm: kworker/1:1 Not tainted ... #105 PREEMPT_{RT,(lazy)}
>   [   50.363865] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.17.0-0-gb52ca86e094d-prebuilt.qemu.org 04/01/2014
>   [   50.363872] Workqueue: events request_firmware_work_func
>   [   50.363890] Call Trace:
>   [   50.363895]  <TASK>
>   [   50.363901]  dump_stack_lvl+0x64/0x80
>   [   50.364100]  print_report+0xce/0x620
>   [   50.364123]  kasan_report+0xce/0x100
>   [   50.364142]  kernfs_root+0x68/0x80
>   [   50.364151]  kernfs_next_descendant_post+0x1b/0x270
>   [   50.364162]  kernfs_activate+0x79/0x110
>   [   50.364172]  kernfs_add_one+0x267/0x3d0
>   [   50.364182]  kernfs_create_dir_ns+0xcc/0x140
>   [   50.364193]  sysfs_create_dir_ns+0x130/0x280
>   [   50.364241]  kobject_add_internal+0x21b/0x9c0
>   [   50.364252]  kobject_add+0x13a/0x200
>   [   50.364291]  device_add+0x21e/0x1540
>   [   50.364322]  firmware_fallback_sysfs+0x232/0x980
>   [   50.364334]  _request_firmware+0xa53/0x1100
>   [   50.364390]  request_firmware_work_func+0xeb/0x360
>   [   50.364413]  process_one_work+0x610/0x1150
>   [   50.364445]  worker_thread+0x50d/0xd60
>   [   50.364477]  kthread+0x318/0x400
>   [   50.364496]  ret_from_fork+0x447/0x6a0
>   [   50.364560]  ret_from_fork_asm+0x1a/0x30
>   [   50.364573]  </TASK>
>   [   50.364576]
>   [   50.364578] Allocated by task 48:
>   [   50.364583]  kasan_save_stack+0x33/0x60
>   [   50.364593]  kasan_save_track+0x14/0x30
>   [   50.364601]  __kasan_slab_alloc+0x6e/0x70
>   [   50.364609]  kmem_cache_alloc_noprof+0x1a5/0x4d0
>   [   50.364620]  __kernfs_new_node+0xce/0x950
>   [   50.364628]  kernfs_new_node+0xeb/0x170
>   [   50.364636]  kernfs_create_dir_ns+0x2b/0x140
>   [   50.364644]  sysfs_create_dir_ns+0x130/0x280
>   [   50.364651]  kobject_add_internal+0x21b/0x9c0
>   [   50.364660]  kobject_add+0x13a/0x200
>   [   50.364668]  device_add+0x21e/0x1540
>   [   50.364675]  firmware_fallback_sysfs+0x232/0x980
>   [   50.364683]  _request_firmware+0xa53/0x1100
>   [   50.364692]  request_firmware_work_func+0xeb/0x360
>   [   50.364700]  process_one_work+0x610/0x1150
>   [   50.364709]  worker_thread+0x50d/0xd60
>   [   50.364718]  kthread+0x318/0x400
>   [   50.364726]  ret_from_fork+0x447/0x6a0
>   [   50.364733]  ret_from_fork_asm+0x1a/0x30
>   [   50.364741]
>   [   50.364743] Freed by task 29:
>   [   50.364747]  kasan_save_stack+0x33/0x60
>   [   50.364754]  kasan_save_track+0x14/0x30
>   [   50.364762]  kasan_save_free_info+0x3b/0x60
>   [   50.364768]  __kasan_slab_free+0x43/0x70
>   [   50.364776]  kmem_cache_free+0xc3/0x510
>   [   50.364782]  rcu_core+0x5d1/0x1a50
>   [   50.364791]  rcu_cpu_kthread+0x148/0x6f0
>   [   50.364799]  smpboot_thread_fn+0x347/0x8e0
>   [   50.364809]  kthread+0x318/0x400
>   [   50.364816]  ret_from_fork+0x447/0x6a0
>   [   50.364823]  ret_from_fork_asm+0x1a/0x30
>   [   50.364831]
>   [   50.364833] Last potentially related work creation:
>   [   50.364836]  kasan_save_stack+0x33/0x60
>   [   50.364843]  kasan_record_aux_stack+0x8c/0xa0
>   [   50.364849]  __call_rcu_common.constprop.0+0x76/0xa20
>   [   50.364858]  kernfs_put.part.0+0x1aa/0x540
>   [   50.364866]  __kernfs_remove.part.0+0x3f2/0x820
>   [   50.364874]  kernfs_remove+0x9e/0xd0
>   [   50.364882]  __kobject_del+0xc3/0x340
>   [   50.364890]  kobject_del+0x35/0x50
>   [   50.364898]  device_del+0x5ef/0x960
>   [   50.364904]  usb_disconnect+0x504/0x970
>   [   50.364914]  hub_event+0x2898/0x4670
>   [   50.364922]  process_one_work+0x610/0x1150
>   [   50.364931]  worker_thread+0x50d/0xd60
>   [   50.364940]  kthread+0x318/0x400
>   [   50.364948]  ret_from_fork+0x447/0x6a0
>   [   50.364954]  ret_from_fork_asm+0x1a/0x30
>   [   50.364962]
>   [   50.364964] The buggy address belongs to the object at ffff88800c015ed8
>   [   50.364964]  which belongs to the cache kernfs_node_cache of size 136
>   [   50.364971] The buggy address is located 8 bytes inside of
>   [   50.364971]  freed 136-byte region [ffff88800c015ed8, ffff88800c015f60)
>   [   50.364979]
>   [   50.364982] The buggy address belongs to the physical page:
>   [   50.364986] page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0xc015
>   [   50.364994] flags: 0x100000000000000(node=0|zone=1)
>   [   50.365003] page_type: f5(slab)
>   [   50.365013] raw: 0100000000000000 ffff888006ead640 dead000000000122 0000000000000000
>   [   50.365021] raw: 0000000000000000 0000000000140014 00000000f5000000 0000000000000000
>   [   50.365025] page dumped because: kasan: bad access detected
>   [   50.365029]
>   [   50.365030] Memory state around the buggy address:
>   [   50.365034]  ffff88800c015d80: fb fb fb fb fb fb fb fb fb fb fc fc fc fc fc fc
>   [   50.365040]  ffff88800c015e00: fc fc fa fb fb fb fb fb fb fb fb fb fb fb fb fb
>   [   50.365045] >ffff88800c015e80: fb fb fb fc fc fc fc fc fc fc fc fa fb fb fb fb
>   [   50.365049]                                                        ^
>   [   50.365054]  ffff88800c015f00: fb fb fb fb fb fb fb fb fb fb fb fb fc fc fc fc
>   [   50.365059]  ffff88800c015f80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>   [   50.365062] ==================================================================
>   [   50.537450] Disabling lock debugging due to kernel taint
> 
> References:
> 
> [1] https://gist.github.com/mfoliveira/c6b77fbae3d8083be6944477aedbc5d2
> [2] https://gist.github.com/mfoliveira/c33f6bb523a6bd518cc321f27e509d44
> [3] https://gist.github.com/mfoliveira/cd1d78561e2db80dd87103e835e3ebec
> ---
> Changes in v3:
> - Fix error path in .probe(): use kfree() instead of complete(),
>   as .disconnect() is not called if .probe() fails.
>   (Thanks: Stanislaw Gruszka <stf_xl@wp.pl>).
> - Link to v2: https://lore.kernel.org/r/20260522-ueagle-atm_req-fw-sync-v2-1-eee7f6b823a7@igalia.com
> 
> Changes in v2:
> - Changed approach from sync request_firmware() in .probe() 
>   to wait for request_firmware_async() in .disconnect().
> - Referenced previous work by Andrey Tsygunka <aitsygunka@yandex.ru>
> - Link to v1: https://lore.kernel.org/r/20260515-ueagle-atm_req-fw-sync-v1-1-406ca3939e2a@igalia.com
> ---
>  drivers/usb/atm/ueagle-atm.c | 36 +++++++++++++++++++++++++++++++-----
>  1 file changed, 31 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/usb/atm/ueagle-atm.c b/drivers/usb/atm/ueagle-atm.c
> index ed2611aacb252fce829b4a33589c47912aadbe67..1e12fc19f8726d052b4571a1e11f3b009d251c22 100644
> --- a/drivers/usb/atm/ueagle-atm.c
> +++ b/drivers/usb/atm/ueagle-atm.c
> @@ -594,7 +594,9 @@ static int uea_send_modem_cmd(struct usb_device *usb,
>  static void uea_upload_pre_firmware(const struct firmware *fw_entry,
>  								void *context)
>  {
> -	struct usb_device *usb = context;
> +	struct usb_interface *intf = context;
> +	struct usb_device *usb = interface_to_usbdev(intf);
> +	struct completion *fw_done = usb_get_intfdata(intf);
>  	const u8 *pfw;
>  	u8 value;
>  	u32 crc = 0;
> @@ -663,15 +665,17 @@ static void uea_upload_pre_firmware(const struct firmware *fw_entry,
>  	uea_err(usb, "firmware is corrupted\n");
>  err:
>  	release_firmware(fw_entry);
> +	complete(fw_done);
>  }
>  
>  /*
>   * uea_load_firmware - Load usb firmware for pre-firmware devices.
>   */
> -static int uea_load_firmware(struct usb_device *usb, unsigned int ver)
> +static int uea_load_firmware(struct usb_interface *intf, unsigned int ver)
>  {
>  	int ret;
>  	char *fw_name = EAGLE_FIRMWARE;
> +	struct usb_device *usb = interface_to_usbdev(intf);
>  
>  	uea_info(usb, "pre-firmware device, uploading firmware\n");
>  
> @@ -694,7 +698,7 @@ static int uea_load_firmware(struct usb_device *usb, unsigned int ver)
>  	}
>  
>  	ret = request_firmware_nowait(THIS_MODULE, 1, fw_name, &usb->dev,
> -					GFP_KERNEL, usb,
> +					GFP_KERNEL, intf,
>  					uea_upload_pre_firmware);
>  	if (ret)
>  		uea_err(usb, "firmware %s is not available\n", fw_name);
> @@ -2557,8 +2561,23 @@ static int uea_probe(struct usb_interface *intf, const struct usb_device_id *id)
>  
>  	usb_reset_device(usb);
>  
> -	if (UEA_IS_PREFIRM(id))
> -		return uea_load_firmware(usb, UEA_CHIP_VERSION(id));
> +	if (UEA_IS_PREFIRM(id)) {
> +		struct completion *fw_done;
> +
> +		/* Wait for the firmware load to be done, in .disconnect() */
> +		fw_done = kzalloc_obj(*fw_done);
> +		if (!fw_done)
> +			return -ENOMEM;
> +
> +		init_completion(fw_done);
> +		usb_set_intfdata(intf, fw_done);
> +
> +		ret = uea_load_firmware(intf, UEA_CHIP_VERSION(id));
> +		if (ret)
> +			kfree(fw_done);
> +
> +		return ret;
> +	}
>  
>  	ret = usbatm_usb_probe(intf, id, &uea_usbatm_driver);
>  	if (ret == 0) {
> @@ -2588,6 +2607,13 @@ static void uea_disconnect(struct usb_interface *intf)
>  		usbatm_usb_disconnect(intf);
>  		mutex_unlock(&uea_mutex);
>  		uea_info(usb, "ADSL device removed\n");
> +	} else if (usb->config->desc.bNumInterfaces == 1) {
> +		struct completion *fw_done = usb_get_intfdata(intf);
> +
> +		uea_dbg(usb, "pre-firmware device, waiting firmware upload\n");
> +		wait_for_completion(fw_done);
> +		uea_dbg(usb, "pre-firmware device, finished waiting\n");
> +		kfree(fw_done);
>  	}
>  }
>  
> 
> ---
> base-commit: 22d91cef94b5b86cff0d68ebfce7741740672704
> change-id: 20260515-ueagle-atm_req-fw-sync-204761fa0809
> 
> Best regards,
> -- 
> Mauricio Faria de Oliveira <mfo@igalia.com>
> 

