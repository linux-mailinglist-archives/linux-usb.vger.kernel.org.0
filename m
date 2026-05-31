Return-Path: <linux-usb+bounces-38196-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CXJKH2EJHGr4IwkAu9opvQ
	(envelope-from <linux-usb+bounces-38196-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 31 May 2026 12:11:45 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE1161583C
	for <lists+linux-usb@lfdr.de>; Sun, 31 May 2026 12:11:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D9CF4301C15D
	for <lists+linux-usb@lfdr.de>; Sun, 31 May 2026 10:11:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F6E6365A1D;
	Sun, 31 May 2026 10:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IUEuzebm"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 077672F8EA5
	for <linux-usb@vger.kernel.org>; Sun, 31 May 2026 10:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780222290; cv=pass; b=kPCFXy1Cb8Qehwa/9NncCmhdwE/Y3YKqH/pq1w8ySH35DUGachCqG3H9FQ5elwquYlG7BlkllILD3B+yM2ffr9vneLEtKHKXBHIz0D9c1NEjz/kYx8Y5sldXMinkDqNs9SunKMCP5ttuItgySkX/13cQiVI7bskF8RBhkevoaIM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780222290; c=relaxed/simple;
	bh=X7YACX4AY/uVMck29wne2UR63zhnd6qTUnKfFnG6HlA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oV3+78GwTpBkmIti7Uy92dh2idzDzno2rA28HwrtWFNve4tfrLLol2fXPwLaH0GGSOIYCH+TdubJem107ui5Vxtope85QSZjMRL4dwcCRJlQkws6MXT9xeNRNS6X0r+90x0cn7RZr2QL39CSejgI9Kx3ZBHkTTHHWv54TA9DJxc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IUEuzebm; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-68c3421b009so2609512a12.1
        for <linux-usb@vger.kernel.org>; Sun, 31 May 2026 03:11:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780222287; cv=none;
        d=google.com; s=arc-20240605;
        b=EabDsXsjJsjwc/s/dRlwIKFrVAp/og+DHRZhnv1J3BuFiZxkGEtHPeQWdpj1ZAzkej
         GoFaMWBw0JekzXB7dH646gc/PUIjEyNW9N0hUebjhfM8eqxtHcbpZ4dj+PkP/Nse65l+
         EPixURU0TVjBYhcjcp/Qc70sY0i9VCeqCi2guS/xyjkllBY3FjZp0trrwnS1DKSBpIJW
         1ly2WRuqdVaeNnzNau71zkhtrJ5dy5YhEUIPswdi89tX3pNiVwmv6z9fI/mg7R6tgOWH
         B+NINzOW21/PTFRJxqQOych7RpkxgE5gX5GITNCXYvJZ/0d/HZpUaZlW7hCwu0RGqVws
         MgQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=X7YACX4AY/uVMck29wne2UR63zhnd6qTUnKfFnG6HlA=;
        fh=0g9ROlWvuhx3ZbXw65ftZjGUX3Z+GfUoHpMd3SEEz2Y=;
        b=VKWlFpwMBgoijtGMJ2XbwN4bZI9uGGdZA1b5oKMMLfMMXQIHYPNAneMvVtWA2ZCQix
         IK/dLmbvsdEOdguTCYEeILdfBgGTQ+rLImTTR0U13NTeQQwROoTHKip+BrG/fabnLo6E
         1NYCNgDjlOTurJFom53oe5dN5ptaRBzDtOFXcw2zHMPGoHTSz6E3oDkjAen9bCKEOnnN
         df1AcPq87Dt1j3N4P2GZmqBLVN6v23G5RELUmVOEYUtc4B8HkQCQHTDrqxaq7RDn0JqY
         SDwvhg9BVk/B7N2iIzZ0IkSFuITkWWEUSSaNKacaHJ6krhExNw4R4OC+6m/um9+pE6zM
         OsAA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780222287; x=1780827087; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=X7YACX4AY/uVMck29wne2UR63zhnd6qTUnKfFnG6HlA=;
        b=IUEuzebm92x8qaz4287kFDyc9YjucvKeNfo5InLiCsj9eHbX5EcnDZKggTb0puFx7c
         2pvQ54oDMF+4AVP/8b+IKmo6X6tN8wN2Bz37RsgzFSl8+kcX86zhLqIHbftgWuygDkqE
         F3Y5Yp0qEjxm79bQR0oVnu1TnIT52EolVA1EsUVg9BvVWMwq3P6sT9RQ35xv/tM0RzxD
         MsaPhqihnniDXhJOatMNJLPNN9BYUvdLJBYv15JXjCmS4J24iqAFBlGL5orTTEj1G6hZ
         zbxSwv6AGN8wMYbBwkq9n0SmTzwR6L6mfUqtUq/bxRXCapnq+yntEVIKKbU//QcrUa0m
         2K2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780222287; x=1780827087;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X7YACX4AY/uVMck29wne2UR63zhnd6qTUnKfFnG6HlA=;
        b=PWIFejuMrkUsFjKxj/1xhVXrOTGQFkwPiWw4AgoDegyI9Tfn6A4q9eIXKDfRQgHkJ7
         ciG7NOdcbOsLKKGzODpofFPazZMviURHI1gGkseT1yZMp2mJX+UUUrFCv9QOwhOKjjFI
         Rt56Pqsy8pQhMuwV8l88bL3vyA/MzGYqyw51ej+ewb8k/KtbC57mv9+EOVX/xyPuM4rS
         WrIaNV+olQPgsURKPIk2/Z5H6eGAgwZPH8Qf/aLUrScHxesw7ArXQZwM5FbGbgT2S+OY
         jr8E9mTnFrUT8lGBSqutmfpu4v0Sr6J1TgBqqocR7LJnSjSQdnDW78F3hJFw4RaDkQhb
         A+Ww==
X-Gm-Message-State: AOJu0YxBM2nctgmev0TFYKcwZncdp0lbBm41MwQ0IsveeC9GQTECmXzk
	UFdqYgM7GwSOb5rFdaWPVlSPRRJvxHkbG69oFKn0DMTuNBFBBOIxb19LsjDV9EglV6/xT+OLI7J
	5AgLeW+DlLWOUqyTAgqsyoh9n7LGTRUc=
X-Gm-Gg: Acq92OH5qcXNp0wophxBi4M2W1icRMTmZTD8xesPeoPGfRq2Rj6rHxg72DIX4sfmDi6
	t5X20zSq7q93W30QUJWd57SGixNBR3se1WSQu0F9U8qbK4XYkEzHj4wwNUGCg/NQmB2vcCfa+Fy
	LJpVYOW4l3bQ49Zn33atply9Q9ksYU299VZyBIIFJ7JiIlzgg/o2FY5ze4cf4JP6ccBGVWJFj36
	MXdxUCr7tzDRZn3rEsbQuabif1VCzGA5cZb6IY6EnQHoxNuGY/VvsDyd5jNn5GGGliJljFDOF+c
	et6JWu1hSTCKU0XJ+g==
X-Received: by 2002:a17:906:f595:b0:bd3:329e:81e0 with SMTP id
 a640c23a62f3a-be9a5a5225bmr502062666b.9.1780222287256; Sun, 31 May 2026
 03:11:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAFgddh+JWdT4LLwMc5qjM8q_pBu-fRo2qADR5ovAKoGHWMQrRw@mail.gmail.com>
 <20260531101612.332151d8.michal.pecio@gmail.com>
In-Reply-To: <20260531101612.332151d8.michal.pecio@gmail.com>
From: Nikhil Solanke <nikhilsolanke5@gmail.com>
Date: Sun, 31 May 2026 15:41:14 +0530
X-Gm-Features: AVHnY4Inq6JBKcJ494GvcPq0lgGavxYGuo3xc40xWRjsGdpk9SOUgPNLCCSEH8s
Message-ID: <CAFgddhLGHvTmRxWtguXTpgZV_Mq5ZW=CVK_ZkqbOgUF9Y5bCsA@mail.gmail.com>
Subject: Re: USB: Request for guidance investigating configuration descriptor
 enumeration failure
To: Michal Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org, gregkh@linuxfoundation.org, 
	mathias.nyman@linux.intel.com, sakari.ailus@linux.intel.com, 
	katieeliu@tencent.com, johannes.bruederl@gmail.com, kees@kernel.org, 
	dengjie03@kylinos.cn, limiao@kylinos.cn, wse@tuxedocomputers.com, 
	dev@a1rm4x.com, vahnenko2003@gmail.com, cs@tuxedo.de, lijiayi@kylinos.cn, 
	oneukum@suse.com, stern@rowland.harvard.edu, bence98@sch.bme.hu, 
	eeodqql09@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38196-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nikhilsolanke5@gmail.com,linux-usb@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,linuxfoundation.org,linux.intel.com,tencent.com,gmail.com,kernel.org,kylinos.cn,tuxedocomputers.com,a1rm4x.com,tuxedo.de,suse.com,rowland.harvard.edu,sch.bme.hu];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linux-hardware.org:url]
X-Rspamd-Queue-Id: BCE1161583C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

> Does it mean there are multiple clone devices pretending to be
> something which originally had this VID:PID? I ask because
> linux-hardware.org has many cases of this ID enumerating normally.

Yes. So these third party controllers on the market, advertise
themselves as compatible with PS3/4/5, android, Xbox, nintendo, etc.
From what i have observed, at least for the Xbox compatibility
(basically Xinput mode), these devices do one of the following:
1. Pretend to be an official xbox-360 or maybe xbox one s, by showing
themselves as having 045e:028e ids which is used by microsoft.
2. Use a different id altogether, but still expose all the
functionality mirroring the official Xbox controllers.

Since these have different compatibilities, each "mode" has its own
unique vid:pid pair. My game controller, in this case, has 045e:028e
for its Xinput/Xbox mode. And for the android mode, it has 3537:1094.
These modes can often be switched manually, usually by holding down
the menu button on the controller. This is so that users can switch
from xinput mode to dinput mode due to compatibility reasons.

Now, I haven't dabbled into the PS mode at all, so I can't say
anything about it. However, in android mode, most of these controllers
don't expose the rumble functionality at all that would otherwise be
present in the xinput mode.

> By "VM" you mean that it's connected to Windows and works normally,
> then you pass it through to a Linux guest and the guest breaks it?
> I suppose it remains broken until power cycled? And I suppose it
> breaks after connecting to a Linux host, so a Windows guest can't
> use it normally either?

I actually didn't test for Linux guest on Windows host. I only tested
Linux guest on a Linux host. I had utilized PCI Passthrough to
passthrough the entire usb hub itself that is present in my laptop.
This, to my knowledge, completely negates any interaction of the
device with the VM host on the USB path. It only interacts with the
guest directly. The Linux guest also couldn't properly enumerate the
device (failing with "unable to read config index 0 descriptor/start:
-71"). Then i tried a Windows guest with same configuration (i.e. PCI
passthrough of the usb root hub), the device enumerated successfully!.
Of course, I also tried it on bare metal Linux distro and Windows
operating systems without virtualization. The results were the same as
their VM counterparts.

Also a side note: during initial enumeration, when it presents itself
as 045e:028e, that ID only appears in the usbmon trace. Because the
device didn't finish enumeration, lsusb doesn't show that VID:PID.
Only after it fails and falls back to Android mode does lsusb show the
Android mode's VID:PID. Therefore, to even try applying existing
quirks, the user must use usbmon to find the initial VID:PID. This
might seem like common sense to you and other developers, but it
wasn't to me or any other normal user. So my workaround also displays
the VID:PID that failed to enumerate in dmesg. This helps an average
non-technical user to apply the quirks, let's say, by following a
tutorial or guide to resolve any issue (at the start, I was trying to
apply those quirks to the Android mode's VID:PID. only later i
discovered that it presents itself as another vid:pid). Asking them to
install a tracing utility is a bit much, in my opinion.

> I ask because I found Windows Wireshark traces not to be fully complete
> and running Wireshark on a Linux host with Windows VM could be better.

I'm sorry; I didn't understand what you meant by "not fully complete."
As I mentioned in the note, I did truncate the packets sent and
received before the device's enumeration began, but that was for
Linux. The Windows traces I obtained were originally just like what I
had attached. There weren't any other packets captured, unlike what we
see on Linux with those USBHUB packets. Perhaps I missed some
USBPcap/Wireshark configuration? I tested it on a fresh Windows
install and a fresh Wireshark install. Nothing else besides that.

> In this case it looks like setup packet wLength field somehow affects
> device behavior, which is odd because Windows works just fine.

Yes, and it's even odder because the device accepts and enumerates
perfectly fine with a wLength of 9 in Android mode.

> Timing issue? I noticed that Windows gets the preceding device
> descriptor response after 2ms, while all Linux traces show 2.3ms.
> May indicate that the device is in a different state somehow.

Could be, but that still doesn't explain why a larger wLength doesn't
trigger the error. And also these errors are very consistent.

Thanks,
NIkhil Solanke

On Sun, 31 May 2026 at 13:46, Michal Pecio <michal.pecio@gmail.com> wrote:
>
> On Sat, 30 May 2026 02:52:28 +0530, Nikhil Solanke wrote:
> > I have been investigating a USB enumeration issue affecting at least
> > one controller exposing an Xbox-compatible interface (VID:PID
> > 045e:028e).
>
> Does it mean there are multiple clone devices pretending to be
> something which originally had this VID:PID? I ask because
> linux-hardware.org has many cases of this ID enumerating normally.
>
> Only one instance of the other ID, also enumerating normally:
> https://linux-hardware.org/?id=usb:3537-1094
>
> > The device consistently fails enumeration under Linux during the
> > initial configuration descriptor read. The failure is reproducible on
> > multiple physical machines and also inside a VM.
>
> It seems quite unlikely, but any chance that all the USB controllers
> you tried were xHCI and the problem wouldn't occur on EHCI/OHCI/UHCI?
>
> By "VM" you mean that it's connected to Windows and works normally,
> then you pass it through to a Linux guest and the guest breaks it?
> I suppose it remains broken until power cycled? And I suppose it
> breaks after connecting to a Linux host, so a Windows guest can't
> use it normally either?
>
> I ask because I found Windows Wireshark traces not to be fully complete
> and running Wireshark on a Linux host with Windows VM could be better.
>
> > The standard Linux path requests the initial configuration descriptor
> > using USB_DT_CONFIG_SIZE (9 bytes). By introducing a new usbcore quirk
> > and modifying usb_get_configuration() so that affected devices request
> > 10 bytes instead of 9, enumeration succeeds reliably and the
> > controller remains in its expected XInput mode.
> >
> > Additional testing:
> >
> > 9-byte request: fails
> > 48-byte request: succeeds
> > 16-byte request: succeeds
> > 10-byte request: succeeds
> >
> > I do not currently understand the underlying protocol-level reason for
> > this behavior and would prefer to investigate the root cause rather
> > than submit a workaround.
>
> The difference is in the setup packet which is sent to the device and
> how large a response will be accepted by the host conroller without
> an error which would be reported as -EOVERFLOW in Linux.
>
> In this case it looks like setup packet wLength field somehow affects
> device behavior, which is odd because Windows works just fine.
>
> Timing issue? I noticed that Windows gets the preceding device
> descriptor response after 2ms, while all Linux traces show 2.3ms.
> May indicate that the device is in a different state somehow.
>
> Regards,
> Michal

