Return-Path: <linux-usb+bounces-37620-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Cr/FBM4C2qgEgUAu9opvQ
	(envelope-from <linux-usb+bounces-37620-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 18:02:27 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5323857080E
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 18:02:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C33AD30C5582
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 15:55:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01C1A481238;
	Mon, 18 May 2026 15:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="E6QCjhwX"
X-Original-To: linux-usb@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC6D2F8EB1;
	Mon, 18 May 2026 15:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779119701; cv=none; b=n16NU567ChnO7TKBLJ59NXM2NG2rq9gfGBrVf4dDXQQK6ZOJMUi1T3fqqfjyiBqa5Q325j0oP/G+X0SPY8u1/h34R7VVXMjCruucUxlK5BFyd+/JvFn7biJJ1CYltRDzthZEIljvodrMe+DXsPKk/S6v0wOEshSTPRCLch0z69g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779119701; c=relaxed/simple;
	bh=qakDjAVU+arfIU7P7d6pUGoSeIQndxDuwCLX0GpXsn0=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=rVZEBUoriywCykfmXLWQlKRzc1wWdglAii+QSfgehowr6Kwbsj6zrN7TXQEQ3gRXC6VWnooailmlAjRHeTwQq+X87JWp/mmVvo5nsRZ3aMLxZk0EV3tx3yqujv8kYkcEDH2vNH/jKCxyfXLhneRtPshmLwnNj8IH2h4AX2eVFrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=E6QCjhwX; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:Message-ID:References:
	In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=6G5o6QhbtovBrInaMe/yQbxu2EcDdsajQ939/B77niM=; b=E6QCjhwXiSnZ+ZBNObqdaoG87x
	p83Oq6t12DzsoZXL3xg/5YA8qCY7c2RbGOj2AzOK3neZ/IXI74KLBi3SeNs8kkUPdHeoXKqmbT9AP
	9loyUHjXK3EjdcbR1gTFlHOkSbLbQbJVglzLIbK0aXTyCTSDMt2rXbnU0WzMR8igBtB1TGfkmoSXR
	+HarwQvuaoJGhK4UXOThMAeDw7YrI07DbZgpvFEhUoxhVs0l2NFKUWKuIQwSYbqg2e4nDxso/gUeV
	g+TSIFtQJgno2+tRrBqHxUR057SPxbRwdXgyFYwjGEAkEyF8201LRmbCrlvhlrCjJz2f98N2jp7a3
	mkcr+kVg==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine2.igalia.com with esmtps 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wP0Ic-002hxE-BC; Mon, 18 May 2026 17:54:34 +0200
Received: from webmail.service.igalia.com ([192.168.21.45])
	by mail.igalia.com with esmtp (Exim)
	id 1wP0IZ-0052gx-8n; Mon, 18 May 2026 17:54:34 +0200
Received: from localhost ([127.0.0.1] helo=webmail.igalia.com)
	by webmail.service.igalia.com with esmtp (Exim 4.98.2)
	(envelope-from <mfo@igalia.com>)
	id 1wP0IY-00000002C2Y-2RDu;
	Mon, 18 May 2026 17:54:31 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 18 May 2026 12:54:30 -0300
From: Mauricio Faria de Oliveira <mfo@igalia.com>
To: Stanislaw Gruszka <stf_xl@wp.pl>
Cc: Matthieu CASTET <castet.matthieu@free.fr>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, kernel-dev@igalia.com,
 linux-atm-general@lists.sourceforge.net, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 syzbot+ce1e5a1b4e086b43e56d@syzkaller.appspotmail.com,
 syzbot+306212936b13e520679d@syzkaller.appspotmail.com
Subject: Re: [PATCH] usb: atm: ueagle-atm: use synchronous request_firmware()
In-Reply-To: <20260516091920.GA9154@wp.pl>
References: <20260515-ueagle-atm_req-fw-sync-v1-1-406ca3939e2a@igalia.com>
 <20260516091920.GA9154@wp.pl>
Message-ID: <553f402beef6864520d0789f506fa4e2@igalia.com>
X-Sender: mfo@igalia.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Report: NO, Score=-6.1, Tests=ALL_TRUSTED=-3,AWL=-1.201,BAYES_00=-1.9,URIBL_BLOCKED=0.001,URIBL_DBL_BLOCKED_OPENDNS=0.001,URIBL_ZEN_BLOCKED_OPENDNS=0.001
X-Spam-Score: -60
X-Spam-Bar: ------
X-Spamd-Result: default: False [1.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37620-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[wp.pl];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[free.fr,linuxfoundation.org,igalia.com,lists.sourceforge.net,vger.kernel.org,syzkaller.appspotmail.com];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mfo@igalia.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[igalia.com:-];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,ce1e5a1b4e086b43e56d,306212936b13e520679d];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 5323857080E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-05-16 06:19, Stanislaw Gruszka wrote:
> Hi, thanks for working on this
> 
> On Fri, May 15, 2026 at 08:52:16PM -0300, Mauricio Faria de Oliveira wrote:
>> ueagle-atm uses the asynchronous request_firmware_nowait() in .probe(),
>> but does not wait for its completion, not even in .disconnect(); so, if the
>> device is unplugged meanwhile, its teardown runs concurrently with that.
>> 
>> Even though this inconsistency is worth addressing on its own, it has also
>> triggered several bug reports in syzbot over the years (some auto-closed)
>> where the firmware sysfs fallback mechanism (CONFIG_FW_LOADER_USER_HELPER)
>> creates a firmware subdirectory in the device directory during its removal,
>> which might hit unexpected conditions in kernfs, apparently, depending at
>> which point the add and remove operations raced. (See links.)
>> 
>> The pattern is:
>> 
>> usb ?-?: Direct firmware load for ueagle-atm/eagle?.fw failed with error -2
>> usb ?-?: Falling back to sysfs fallback for: ueagle-atm/eagle?.fw
>> <ERROR>
>> Call trace:
>>  ...
>>  kernfs_create_dir_ns
>>  sysfs_create_dir_ns
>>  create_dir
>>  kobject_add_internal
>>  kobject_add_varg
>>  kobject_add
>>  class_dir_create_and_add
>>  get_device_parent
>>  device_add
>>  fw_load_sysfs_fallback
>>  fw_load_from_user_helper
>>  firmware_fallback_sysfs
>>  _request_firmware
>>  request_firmware_work_func
>>  ...
>> 
>> While the kernfs side is being looked at, the ueagle-atm side can be fixed
>> by converting .probe() to the synchronous request_firmware(), which blocks
>> the device directory removal until it is finished, preventing such errors.

Thanks for the prompt feedback.

> The async firmware loading was introduced intentionally to avoid
> device initialization failure when the firmware is not available in 
> the initramfs. Also possible blocking of probe and boot for FW request
> timeout.
> 
> See the original discussion in the driver submission thread:
> https://lore.kernel.org/lkml/20051101224510.GB28193@kroah.com/

Sure, I'll take a look.

> I prefer not to change this. If synchronization with disconnect
> is required, I would rather keep request_firmware_nowait() and add 
> explicit completion handling. Andrey some time ago posted a patch 
> for this:
> https://lore.kernel.org/lkml/20250410093146.3776801-1-aitsygunka@yandex.ru/
> 
> I refused the patch because it appears to only avoid pr_debug, but if
> it fixes actual problem, we can take it.

Ok, I found it earlier, but opted otherwise as I missed the rationale.

I'll be happy to check it for resending; I had a slightly different
implementation in mind when I considered a similar approach (using a
struct completion in the existing data structure), but I'll double check
it whether it's doable, and get back to you.

Thanks for the pointers.

> 
> Regards
> Stanislaw
> 
>> This has been tested with a synthetic reproducer to check the error path
>> and with a USB gadget (virtual device) to check the firmware upload path.
>> (The latter was written by AI/Claude; no other code/text in this commit.)
>> 
>> Links (year first reported):
>>  2025 https://syzbot.org/bug?extid=ce1e5a1b4e086b43e56d
>>  2025 https://syzbot.org/bug?extid=9af8471255ac36e34fd4
>>  2024 https://syzbot.org/bug?extid=306212936b13e520679d
>>  2022 https://syzbot.org/bug?extid=782984d6f1701b526edb
>>  2021 https://syzbot.org/bug?id=f3f221579f4ef7e9691281f3c6f56c05f83e8490
>>  2021 https://syzbot.org/bug?id=84d86f0d71394829df6fc53daf6642c045983881
>>  2021 https://syzbot.org/bug?id=3302dc1c0e2b9c94f2e8edb404eabc9267bc6f90
>> 
>> Reported-by: syzbot+ce1e5a1b4e086b43e56d@syzkaller.appspotmail.com
>> Closes: https://syzbot.org/bug?extid=ce1e5a1b4e086b43e56d
>> Reported-by: syzbot+306212936b13e520679d@syzkaller.appspotmail.com
>> Closes: https://syzbot.org/bug?extid=306212936b13e520679d
>> Fixes: b72458a80c75 ("[PATCH] USB: Eagle and ADI 930 usb adsl modem driver")
>> Assisted-by: Claude:claude-sonnet-4.6 # test USB gadget
>> Signed-off-by: Mauricio Faria de Oliveira <mfo@igalia.com>
>> ---
>> Testing:
>> =======
>> 
>> Firmware upload path:
>> --------------------
>> 
>> This has been tested with a USB gadget (virtual device) written by Claude [1].
>> It ACKs the firmware upload commands, so the driver considers that successful:
>> 
>>   [  296.997194] usb 1-1: [ueagle-atm] firmware uploaded
>>   
>> Log (blocks separated for clarity):
>> 
>>   # echo 'file drivers/base/firmware_loader/* +p' >/sys/kernel/debug/dynamic_debug/control
>> 
>>   # insmod ueagle_gadget.ko
>> 
>>   [  294.840943] ueagle_gadget gadget.0: [ueagle-gadget] bound: VID=0x1039 PID=0x2101 bcdDev=0x2581
>>   [  294.841341] [ueagle-gadget] registered (VID=0x1039 PID=0x2101)
>>   
>>   [  295.066627] usb 1-1: new full-speed USB device number 4 using dummy_hcd
>>   [  295.222302] usb 1-1: New USB device found, idVendor=1039, idProduct=2101, bcdDevice=25.81
>>   [  295.222315] usb 1-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
>>   [  295.227343] ueagle_gadget gadget.0: [ueagle-gadget] SET_CONFIGURATION 1
>>   [  295.228029] usb 1-1: [ueagle-atm] ADSL device founded vid (0X1039) pid (0X2101) Rev (0X2581): Eagle I
>>   
>>   [  295.343162] usb 1-1: reset full-speed USB device number 4 using dummy_hcd
>>   [  295.482615] ueagle_gadget gadget.0: [ueagle-gadget] SET_CONFIGURATION 1
>>   
>>   [  295.482682] usb 1-1: [ueagle-atm] pre-firmware device, uploading firmware
>>   [  295.482723] firmware_class: __allocate_fw_priv: fw-ueagle-atm/eagleI.fw fw_priv=00000000470f8800
>>   [  295.482839] usb 1-1: loading /lib/firmware/updates/7.1.0-rc2-next-20260508-dirty/ueagle-atm/eagleI.fw failed for no such file or directory.
>>   [  295.482900] usb 1-1: loading /lib/firmware/updates/ueagle-atm/eagleI.fw failed for no such file or directory.
>>   [  295.482960] usb 1-1: loading /lib/firmware/7.1.0-rc2-next-20260508-dirty/ueagle-atm/eagleI.fw failed for no such file or directory.
>>   [  295.483037] usb 1-1: Loading firmware from /lib/firmware/ueagle-atm/eagleI.fw
>>   [  295.483040] usb 1-1: direct-loading ueagle-atm/eagleI.fw
>>   [  295.483065] firmware_class: fw_set_page_data: fw-ueagle-atm/eagleI.fw fw_priv=00000000470f8800 data=00000000c4ccb93b size=10981
>>   
>>   [  295.483186] usb 1-1: Loaded FW: ueagle-atm/eagleI.fw, sha256: 8c5047be3b02ed4a8b98c22ed03c010afae1782f6056d8bf2f32bbdde834a74a
>>   [  295.483191] usb 1-1: [ueagle-atm] loading firmware ueagle-atm/eagleI.fw
>>   [  295.487856] ueagle_gadget gadget.0: [ueagle-gadget] LOAD_INTERNAL addr=0x7f92 (F8051_USBCS reset), len=1
>>   [  296.997153] ueagle_gadget gadget.0: [ueagle-gadget] LOAD_INTERNAL addr=0x7f92 (F8051_USBCS reset), len=1
>>   [  296.997194] usb 1-1: [ueagle-atm] firmware uploaded
>>   [  296.997199] firmware_class: __free_fw_priv: fw-ueagle-atm/eagleI.fw fw_priv=00000000470f8800 data=00000000c4ccb93b size=10981
>>   
>>   # rmmod ueagle_gadget
>> 
>>   [  362.899931] ueagle_gadget gadget.0: [ueagle-gadget] disconnected
>>   [  362.899947] ueagle_gadget gadget.0: [ueagle-gadget] unbound
>>   [  362.978201] [ueagle-gadget] unregistered
>>   [  363.080344] usb 1-1: USB disconnect, device number 4
>>   [  363.085192] firmware_class: fw_name_devm_release: fw_name-ueagle-atm/eagleI.fw devm-0000000037b7f4fe released
>> 
>> Error path:
>> ----------
>> 
>> This has been tested with a synthetic reproducer [2]:
>> 
>>   # echo 'file drivers/base/firmware_loader/* +p' >/sys/kernel/debug/dynamic_debug/control
>>   # echo 'file drivers/usb/atm/ueagle-atm.c +p' >/sys/kernel/debug/dynamic_debug/control
>>   # echo 2 >/sys/module/ueagle_atm/parameters/debug
>>   
>>   # mv /lib/firmware/ueagle-atm/eagleI.fw \
>>        /lib/firmware/ueagle-atm/eagleI.fw.NOT-FOUND
>>   
>>   # cat ueagle-atm.syzlang
>>   syz_usb_connect(0x3, 0x2d, &(0x7f00000002c0)=ANY=[@ANYBLOB="12011003faff82083910012181250102030109021b00028c4400600904"], &(0x7f0000000240)={0x0, 0x0, 0x0, 0x0})
>>   
>>   # ./syz-execprog -procs=1 -enable='' ueagle-atm.syzlang
>> 
>> Modified: 
>> 
>>   .probe() fails with -ETIMEDOUT from the firmware load timeout of 60 seconds per
>>   struct firmware_fallback_config fw_fallback_config = { .loading_timeout = 60, }
>>   
>>   [  176.023944] usb 1-1: new high-speed USB device number 2 using dummy_hcd
>>   ...
>>   [  176.158744] usb 1-1: New USB device found, idVendor=1039, idProduct=2101, bcdDevice=25.81
>>   ...
>>   [  176.363215] usb 1-1: [ueagle-atm vdbg]  entering uea_probe
>>   [  176.363221] usb 1-1: [ueagle-atm] ADSL device founded vid (0X1039) pid (0X2101) Rev (0X2581): Eagle I
>>   [  177.113140] usb 1-1: [ueagle-atm vdbg]  entering uea_load_firmware
>>   [  177.113156] usb 1-1: [ueagle-atm] pre-firmware device, uploading firmware
>>   
>>   [  177.113194] firmware_class: __allocate_fw_priv: fw-ueagle-atm/eagleI.fw fw_priv=000000005bf63c12
>>   [  177.113404] usb 1-1: loading /lib/firmware/updates/7.1.0-rc2-next-20260508-dirty/ueagle-atm/eagleI.fw failed for no such file or directory.
>>   [  177.113617] usb 1-1: loading /lib/firmware/updates/ueagle-atm/eagleI.fw failed for no such file or directory.
>>   [  177.113775] usb 1-1: loading /lib/firmware/7.1.0-rc2-next-20260508-dirty/ueagle-atm/eagleI.fw failed for no such file or directory.
>>   [  177.113905] usb 1-1: loading /lib/firmware/ueagle-atm/eagleI.fw failed for no such file or directory.
>>   
>>   [  177.113926] usb 1-1: Direct firmware load for ueagle-atm/eagleI.fw failed with error -2
>>   [  177.113934] usb 1-1: Falling back to sysfs fallback for: ueagle-atm/eagleI.fw
>>   
>>   [  177.114706] test kernfs_activate(): sleep 3s
>>   [  180.125483] test kernfs_activate(): slept 3s
>>   [  180.126005] firmware ueagle-atm!eagleI.fw: firmware: requesting ueagle-atm/eagleI.fw
>>   [  242.849608] test __kernfs_remove(): done
>>   
>>   [  242.849648] firmware_class: __free_fw_priv: fw-ueagle-atm/eagleI.fw fw_priv=000000005bf63c12 data=0000000000000000 size=0
>>   [  242.849670] usb 1-1: [UEAGLE-ATM] firmware ueagle-atm/eagleI.fw is not available
>>   [  242.849674] usb 1-1: [ueagle-atm vdbg]  leaving  uea_load_firmware
>>   [  242.849681] ueagle-atm 1-1:140.0: probe with driver ueagle-atm failed with error -110
>>   [  242.854626] usb 1-1: USB disconnect, device number 2
>> 
>> Original:
>> 
>>   [  184.103791] usb 1-1: new high-speed USB device number 2 using dummy_hcd
>>   ...
>>   [  184.390454] usb 1-1: New USB device found, idVendor=1039, idProduct=2101, bcdDevice=25.81
>>   ...
>>   [  184.770574] usb 1-1: [ueagle-atm vdbg]  entering uea_probe
>>   [  184.770582] usb 1-1: [ueagle-atm] ADSL device founded vid (0X1039) pid (0X2101) Rev (0X2581): Eagle I
>>   [  185.526950] usb 1-1: [ueagle-atm vdbg]  entering uea_load_firmware
>>   [  185.526967] usb 1-1: [ueagle-atm] pre-firmware device, uploading firmware
>>   
>>   [  185.527004] usb 1-1: [ueagle-atm] loading firmware ueagle-atm/eagleI.fw
>>   [  185.530762] usb 1-1: [ueagle-atm vdbg]  leaving  uea_load_firmware
>>   
>>   [  185.535543] firmware_class: __allocate_fw_priv: fw-ueagle-atm/eagleI.fw fw_priv=00000000e8499bd6
>>   [  185.535677] usb 1-1: loading /lib/firmware/updates/7.1.0-rc2-next-20260508-dirty/ueagle-atm/eagleI.fw failed for no such file or directory.
>>   [  185.535743] usb 1-1: loading /lib/firmware/updates/ueagle-atm/eagleI.fw failed for no such file or directory.
>>   [  185.535820] usb 1-1: loading /lib/firmware/7.1.0-rc2-next-20260508-dirty/ueagle-atm/eagleI.fw failed for no such file or directory.
>>   [  185.535886] usb 1-1: loading /lib/firmware/ueagle-atm/eagleI.fw failed for no such file or directory.
>> 
>>   [  185.535898] usb 1-1: Direct firmware load for ueagle-atm/eagleI.fw failed with error -2
>>   [  185.535906] usb 1-1: Falling back to sysfs fallback for: ueagle-atm/eagleI.fw
>> 
>>   [  185.535994] test kernfs_activate(): sleep 3s
>>   [  185.542397] usb 1-1: USB disconnect, device number 2
>>   [  185.560753] usb 1-1: [ueagle-atm vdbg]  entering uea_disconnect
>>   [  185.560766] usb 1-1: [ueagle-atm vdbg]  leaving  uea_disconnect
>>   [  185.584851] test __kernfs_remove(): done
>>   [  188.566069] test kernfs_activate(): slept 3s
>> 
>>   [  188.566086] ==================================================================
>>   [  188.566092] BUG: KASAN: slab-use-after-free in kernfs_root+0x68/0x80
>>   [  188.566110] Read of size 8 at addr ffff88800b387a30 by task kworker/0:1/11
>>   [  188.566119]
>>   [  188.566127] CPU: 0 UID: 0 PID: 11 Comm: kworker/0:1 Not tainted 7.1.0-rc2-next-20260508-dirty #92 PREEMPT_{RT,(lazy)}
>>   [  188.566139] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
>>   [  188.566146] Workqueue: events request_firmware_work_func
>>   [  188.566162] Call Trace:
>>   [  188.566171]  <TASK>
>>   [  188.566177]  dump_stack_lvl+0x64/0x80
>>   [  188.566192]  print_report+0xce/0x620
>>   [  188.566213]  kasan_report+0xce/0x100
>>   [  188.566229]  kernfs_root+0x68/0x80
>>   [  188.566236]  kernfs_next_descendant_post+0x1b/0x270
>>   [  188.566245]  kernfs_activate+0x79/0x110
>>   [  188.566253]  kernfs_add_one+0x267/0x3d0
>>   [  188.566262]  kernfs_create_dir_ns+0xcc/0x140
>>   [  188.566507]  sysfs_create_dir_ns+0x130/0x280
>>   [  188.566556]  kobject_add_internal+0x21b/0x9c0
>>   [  188.566564]  kobject_add+0x13a/0x200
>>   [  188.566601]  device_add+0x21e/0x1540
>>   [  188.566632]  firmware_fallback_sysfs+0x232/0x980
>>   [  188.566642]  _request_firmware+0xa53/0x1100
>>   [  188.566691]  request_firmware_work_func+0xeb/0x360
>>   [  188.566709]  process_one_work+0x610/0x1150
>>   [  188.566741]  worker_thread+0x50d/0xd60
>>   [  188.566771]  kthread+0x318/0x400
>>   [  188.566790]  ret_from_fork+0x447/0x6a0
>>   [  188.566853]  ret_from_fork_asm+0x1a/0x30
>>   [  188.566866]  </TASK>
>>   [  188.566869]
>>   [  188.566871] Allocated by task 11:
>>   [  188.566876]  kasan_save_stack+0x33/0x60
>>   [  188.566884]  kasan_save_track+0x14/0x30
>>   [  188.566891]  __kasan_slab_alloc+0x6e/0x70
>>   [  188.566898]  kmem_cache_alloc_noprof+0x1a5/0x4d0
>>   [  188.566907]  __kernfs_new_node+0xce/0x950
>>   [  188.566913]  kernfs_new_node+0xeb/0x170
>>   [  188.566920]  kernfs_create_dir_ns+0x2b/0x140
>>   [  188.566927]  sysfs_create_dir_ns+0x130/0x280
>>   [  188.566935]  kobject_add_internal+0x21b/0x9c0
>>   [  188.566941]  kobject_add+0x13a/0x200
>>   [  188.566947]  device_add+0x21e/0x1540
>>   [  188.566956]  firmware_fallback_sysfs+0x232/0x980
>>   [  188.566963]  _request_firmware+0xa53/0x1100
>>   [  188.566969]  request_firmware_work_func+0xeb/0x360
>>   [  188.566976]  process_one_work+0x610/0x1150
>>   [  188.566985]  worker_thread+0x50d/0xd60
>>   [  188.566993]  kthread+0x318/0x400
>>   [  188.567001]  ret_from_fork+0x447/0x6a0
>>   [  188.567007]  ret_from_fork_asm+0x1a/0x30
>>   [  188.567015]
>>   [  188.567016] Freed by task 20:
>>   [  188.567021]  kasan_save_stack+0x33/0x60
>>   [  188.567027]  kasan_save_track+0x14/0x30
>>   [  188.567032]  kasan_save_free_info+0x3b/0x60
>>   [  188.567040]  __kasan_slab_free+0x43/0x70
>>   [  188.567046]  kmem_cache_free+0xc3/0x510
>>   [  188.567055]  rcu_core+0x5d1/0x1a50
>>   [  188.567063]  rcu_cpu_kthread+0x148/0x6f0
>>   [  188.567070]  smpboot_thread_fn+0x347/0x8e0
>>   [  188.567080]  kthread+0x318/0x400
>>   [  188.567087]  ret_from_fork+0x447/0x6a0
>>   [  188.567093]  ret_from_fork_asm+0x1a/0x30
>>   [  188.567101]
>>   [  188.567103] Last potentially related work creation:
>>   [  188.567107]  kasan_save_stack+0x33/0x60
>>   [  188.567113]  kasan_record_aux_stack+0x8c/0xa0
>>   [  188.567121]  __call_rcu_common.constprop.0+0x76/0xa20
>>   [  188.567129]  kernfs_put.part.0+0x1aa/0x540
>>   [  188.567135]  __kernfs_remove.part.0+0x3f2/0x820
>>   [  188.567142]  kernfs_remove+0x9e/0xd0
>>   [  188.567149]  __kobject_del+0xc3/0x340
>>   [  188.567158]  kobject_del+0x35/0x50
>>   [  188.567163]  device_del+0x5ef/0x960
>>   [  188.567170]  usb_disconnect+0x504/0x970
>>   [  188.567181]  hub_event+0x2898/0x4670
>>   [  188.567187]  process_one_work+0x610/0x1150
>>   [  188.567196]  worker_thread+0x50d/0xd60
>>   [  188.567204]  kthread+0x318/0x400
>>   [  188.567212]  ret_from_fork+0x447/0x6a0
>>   [  188.567217]  ret_from_fork_asm+0x1a/0x30
>>   [  188.567225]
>>   [  188.567227] The buggy address belongs to the object at ffff88800b387a28
>>   [  188.567227]  which belongs to the cache kernfs_node_cache of size 136
>>   [  188.567235] The buggy address is located 8 bytes inside of
>>   [  188.567235]  freed 136-byte region [ffff88800b387a28, ffff88800b387ab0)
>>   [  188.567243]
>>   [  188.567245] The buggy address belongs to the physical page:
>>   [  188.567251] page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0xb387
>>   [  188.567259] flags: 0x100000000000000(node=0|zone=1)
>>   [  188.567267] page_type: f5(slab)
>>   [  188.567277] raw: 0100000000000000 ffff888006ead640 dead000000000100 dead000000000122
>>   [  188.567284] raw: 0000000000000000 0000000000140014 00000000f5000000 0000000000000000
>>   [  188.567288] page dumped because: kasan: bad access detected
>>   [  188.567291]
>>   [  188.567293] Memory state around the buggy address:
>>   [  188.567297]  ffff88800b387900: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>>   [  188.567302]  ffff88800b387980: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>>   [  188.567308] >ffff88800b387a00: fc fc fc fc fc fa fb fb fb fb fb fb fb fb fb fb
>>   [  188.567311]                                      ^
>>   [  188.567316]  ffff88800b387a80: fb fb fb fb fb fb fc fc fc fc fc fc fc fc 00 00
>>   [  188.567320]  ffff88800b387b00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 fc
>>   [  188.567324] ==================================================================
>>   [  188.568915] Disabling lock debugging due to kernel taint
>> 
>> References:
>> 
>> [1] https://gist.github.com/mfoliveira/c6b77fbae3d8083be6944477aedbc5d2
>> [2] https://gist.github.com/mfoliveira/cd1d78561e2db80dd87103e835e3ebec
>> ---
>>  drivers/usb/atm/ueagle-atm.c | 22 ++++++++++------------
>>  1 file changed, 10 insertions(+), 12 deletions(-)
>> 
>> diff --git a/drivers/usb/atm/ueagle-atm.c b/drivers/usb/atm/ueagle-atm.c
>> index f3ae72feb5bfc313ccfa1ab6a9bb40fcd8f5800a..8f8c63f613cccb7cce29bff62afe82587776f6b5 100644
>> --- a/drivers/usb/atm/ueagle-atm.c
>> +++ b/drivers/usb/atm/ueagle-atm.c
>> @@ -597,20 +597,15 @@ static int uea_send_modem_cmd(struct usb_device *usb,
>>  	return (ret == size) ? 0 : -EIO;
>>  }
>>  
>> -static void uea_upload_pre_firmware(const struct firmware *fw_entry,
>> -								void *context)
>> +static int uea_upload_pre_firmware(const struct firmware *fw_entry,
>> +				   struct usb_device *usb)
>>  {
>> -	struct usb_device *usb = context;
>>  	const u8 *pfw;
>>  	u8 value;
>>  	u32 crc = 0;
>>  	int ret, size;
>>  
>>  	uea_enters(usb);
>> -	if (!fw_entry) {
>> -		uea_err(usb, "firmware is not available\n");
>> -		goto err;
>> -	}
>>  
>>  	pfw = fw_entry->data;
>>  	size = fw_entry->size;
>> @@ -668,9 +663,11 @@ static void uea_upload_pre_firmware(const struct firmware *fw_entry,
>>  
>>  err_fw_corrupted:
>>  	uea_err(usb, "firmware is corrupted\n");
>> +	ret = -EINVAL;
>>  err:
>>  	release_firmware(fw_entry);
>>  	uea_leaves(usb);
>> +	return ret;
>>  }
>>  
>>  /*
>> @@ -680,6 +677,7 @@ static int uea_load_firmware(struct usb_device *usb, unsigned int ver)
>>  {
>>  	int ret;
>>  	char *fw_name = EAGLE_FIRMWARE;
>> +	const struct firmware *firmware;
>>  
>>  	uea_enters(usb);
>>  	uea_info(usb, "pre-firmware device, uploading firmware\n");
>> @@ -702,13 +700,13 @@ static int uea_load_firmware(struct usb_device *usb, unsigned int ver)
>>  		break;
>>  	}
>>  
>> -	ret = request_firmware_nowait(THIS_MODULE, 1, fw_name, &usb->dev,
>> -					GFP_KERNEL, usb,
>> -					uea_upload_pre_firmware);
>> -	if (ret)
>> +	ret = request_firmware(&firmware, fw_name, &usb->dev);
>> +	if (ret) {
>>  		uea_err(usb, "firmware %s is not available\n", fw_name);
>> -	else
>> +	} else {
>>  		uea_info(usb, "loading firmware %s\n", fw_name);
>> +		ret = uea_upload_pre_firmware(firmware, usb);
>> +	}
>>  
>>  	uea_leaves(usb);
>>  	return ret;
>> 
>> ---
>> base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
>> change-id: 20260515-ueagle-atm_req-fw-sync-204761fa0809
>> 
>> Best regards,
>> -- 
>> Mauricio Faria de Oliveira <mfo@igalia.com>
>>

-- 
Mauricio

