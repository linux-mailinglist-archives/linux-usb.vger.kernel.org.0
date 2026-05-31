Return-Path: <linux-usb+bounces-38197-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EIqSGb4PHGqQJQkAu9opvQ
	(envelope-from <linux-usb+bounces-38197-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 31 May 2026 12:38:54 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BD17D6159C4
	for <lists+linux-usb@lfdr.de>; Sun, 31 May 2026 12:38:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 65B2E3029768
	for <lists+linux-usb@lfdr.de>; Sun, 31 May 2026 10:38:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1841C36D9FA;
	Sun, 31 May 2026 10:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qk3pu1XG"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26666370AC3
	for <linux-usb@vger.kernel.org>; Sun, 31 May 2026 10:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780223930; cv=none; b=ND7jkV6V6r9OGC3o86ftRK+UTgUoNuBsJHlkq/jAd6e6OnM/KYzliGPXg21vmuwRMxy+a4R153t2db2t4+siny7FiH5JT1OhJkPH9h0CLRTXB7STIdeO6uuqcjgszLyEv9XoqaaYviahVf+p6RTkgtpH6VqF2c3iAgMGefxY8SM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780223930; c=relaxed/simple;
	bh=ykW3cA5mU5h55567JQQ6eMA62N7pXwLwEC+MR0QAER8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YC1zdsCRtGKY/yRizuZavbxcWak5lMZNbfyVsZddurwIG1zGKVRCcoejgK68z6rXaAHwTbK0QviP2uj1YVcCtnzi5N8Pg8AcmMUjJ/dW/vMGc2MSStcUmT+xwmA2XNrToPbUyQo9ATBNG/Nmnfk3EcaUWtgTMBxEE9Rtz7MA4vM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qk3pu1XG; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-490a7629893so4528755e9.0
        for <linux-usb@vger.kernel.org>; Sun, 31 May 2026 03:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780223927; x=1780828727; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kr+h88xVPwLz6NIB3ELmU+oCJWO31tA43scRiCDjvAY=;
        b=qk3pu1XGNPFBJT8O/RpI9RvYgVS9cZ8tacAfpAt/AoJmdVZcR8lnq1AMFasMkQKpxt
         Zqlgryoc08wUfoUbshnYeXwWdxLBu6NnrzgFnw2WbY7txpHbmdwRre4hO2EKVAS/VUIU
         MGCLSBr/n7SLPPB6nYC3ODFRHu4CI74cLc8gy7/lVMDwPpGo069ydPf46C+HcAOnGJVV
         IQ2N8kVki8lO/eoz+afJqSU3EYN4iwvQ1UI6c0cp4kUlE83GHIgn/C3q5/ELtwQ6yCa/
         2qov3WiOZQvnk+7tYlxBdDO6OP4J7za+1SjRnRxE/ARKFqUxeAFGyYAdeyOgvZfRZYpE
         8oGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780223927; x=1780828727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Kr+h88xVPwLz6NIB3ELmU+oCJWO31tA43scRiCDjvAY=;
        b=N6eBykIIxv1nw51iSjU1rt0natpj5+uEk7R30HKJtNka6IHkHdUGcGvqN5tlOUkc0T
         tNMtrQuGSzjwb62mXOuuIamLtbBmSejiYIUBFpN1XXjxNEy7+An0OeR/RwYHgmepxCd0
         1zycoSfAfib+7EDOrJ7rAHtM/bYl8AKsCKpdw6aJfLQYAPGVrO8ndwj/8N3jmIZEBJk6
         MGA4hgq2kpvgkTckNmIwDTPOmgoJpkNBazOFLQaRvAA/rr0q5BwWFShVU5noJBNWo0Pe
         m9VtkIFWIz0w8pGM7TPZ4qKV0X6I7eAPd77qGs2QaZkaGXDz/NGFWwShhOzXEV22H46z
         VrMQ==
X-Gm-Message-State: AOJu0YxfYtWNinEjWu4qrS30tfnDeXb5RwxpuEDJBfxfjUPm+Yr4hgti
	k8qPXIpyp3ddXYyKFWsiUcAUVZ6StWrSoKTlzpsrniDjaEla37VWGq/i
X-Gm-Gg: Acq92OEsOpFvx3Qz3VAqYFDfQ7llWNTQiZnb+FfEs42IrqUbNX+X0ypXcOELlmbU78U
	06wQcsRi61P6cANZqFzYaSd++zOSCWa90ra2PDs21Wx8DAzoW6YT+QlKQk5Wd3GxltJjQQVNrVB
	tHxlOnxnLb3FC+GxxCYeXj1EAj8tiiRXvfiTYmEDxE0GexhQbXXEfpjoQgiDrl5BCqoXtVZRSMk
	+gZtZIrPtMMN8xDlJGvoDokgVoxpt7bCr9AdTGFsrDFSQQkoK8RygFCyGBo+pI5cCIlBsAY9wgD
	CbxSXizByLjcHWhhgfL05s+JDyhdRN6/rlz6DQdrh0QP4j5L6SjWEej4hnstdN1ix90qZkxmaGq
	Xc0v0e6rqjc46L/357Sa/FZ9qvTiLDeVbN0y3Y3UnyyaFjzI8Nh9k9Ww2SdFTD98FnO/k9PZg46
	IJzDfrxWa5aSoc1d3hChhfWtMAMu0gT9ltwOLPogHlvBU9pA==
X-Received: by 2002:a05:600c:8508:b0:490:6237:521d with SMTP id 5b1f17b1804b1-490a2910ab0mr127034305e9.13.1780223927462;
        Sun, 31 May 2026 03:38:47 -0700 (PDT)
Received: from foxbook (bfe246.neoplus.adsl.tpnet.pl. [83.28.42.246])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef34a03f8sm18043896f8f.7.2026.05.31.03.38.45
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sun, 31 May 2026 03:38:47 -0700 (PDT)
Date: Sun, 31 May 2026 12:38:43 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Nikhil Solanke <nikhilsolanke5@gmail.com>
Cc: linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
 mathias.nyman@linux.intel.com, sakari.ailus@linux.intel.com,
 katieeliu@tencent.com, johannes.bruederl@gmail.com, kees@kernel.org,
 dengjie03@kylinos.cn, limiao@kylinos.cn, wse@tuxedocomputers.com,
 dev@a1rm4x.com, vahnenko2003@gmail.com, cs@tuxedo.de, lijiayi@kylinos.cn,
 oneukum@suse.com, stern@rowland.harvard.edu, bence98@sch.bme.hu,
 eeodqql09@gmail.com
Subject: Re: USB: Request for guidance investigating configuration
 descriptor enumeration failure
Message-ID: <20260531123843.736bd69a.michal.pecio@gmail.com>
In-Reply-To: <CAFgddhLGHvTmRxWtguXTpgZV_Mq5ZW=CVK_ZkqbOgUF9Y5bCsA@mail.gmail.com>
References: <CAFgddh+JWdT4LLwMc5qjM8q_pBu-fRo2qADR5ovAKoGHWMQrRw@mail.gmail.com>
	<20260531101612.332151d8.michal.pecio@gmail.com>
	<CAFgddhLGHvTmRxWtguXTpgZV_Mq5ZW=CVK_ZkqbOgUF9Y5bCsA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38197-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,linuxfoundation.org,linux.intel.com,tencent.com,gmail.com,kernel.org,kylinos.cn,tuxedocomputers.com,a1rm4x.com,tuxedo.de,suse.com,rowland.harvard.edu,sch.bme.hu];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: BD17D6159C4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, 31 May 2026 15:41:14 +0530, Nikhil Solanke wrote:
> > By "VM" you mean that it's connected to Windows and works normally,
> > then you pass it through to a Linux guest and the guest breaks it?
> > I suppose it remains broken until power cycled? And I suppose it
> > breaks after connecting to a Linux host, so a Windows guest can't
> > use it normally either?  
> 
> I actually didn't test for Linux guest on Windows host. I only tested
> Linux guest on a Linux host. I had utilized PCI Passthrough to
> passthrough the entire usb hub itself that is present in my laptop.
> This, to my knowledge, completely negates any interaction of the
> device with the VM host on the USB path. It only interacts with the
> guest directly. The Linux guest also couldn't properly enumerate the
> device (failing with "unable to read config index 0 descriptor/start:
> -71"). Then i tried a Windows guest with same configuration (i.e. PCI
> passthrough of the usb root hub), the device enumerated successfully!

Well, that's not surprising. As you noted, with PCI passthrough the
guest has full control over all USB transfers to the device.

What about xHCI vs EHCI?
 
> Also a side note: during initial enumeration, when it presents itself
> as 045e:028e, that ID only appears in the usbmon trace. Because the
> device didn't finish enumeration, lsusb doesn't show that VID:PID.
> Only after it fails and falls back to Android mode does lsusb show the
> Android mode's VID:PID. Therefore, to even try applying existing
> quirks, the user must use usbmon to find the initial VID:PID. This
> might seem like common sense to you and other developers, but it
> wasn't to me or any other normal user. So my workaround also displays
> the VID:PID that failed to enumerate in dmesg. This helps an average
> non-technical user to apply the quirks, let's say, by following a
> tutorial or guide to resolve any issue (at the start, I was trying to
> apply those quirks to the Android mode's VID:PID. only later i
> discovered that it presents itself as another vid:pid).

Annoying, and not the first such case. Perhaps VID:PID should always
be printed earlier, as soon as the device descriptor is obtained.

> > I ask because I found Windows Wireshark traces not to be fully
> > complete and running Wireshark on a Linux host with Windows VM
> > could be better.  
> 
> I'm sorry; I didn't understand what you meant by "not fully complete."
> As I mentioned in the note, I did truncate the packets sent and
> received before the device's enumeration began, but that was for
> Linux. The Windows traces I obtained were originally just like what I
> had attached. There weren't any other packets captured, unlike what we
> see on Linux with those USBHUB packets. Perhaps I missed some
> USBPcap/Wireshark configuration? I tested it on a fresh Windows
> install and a fresh Wireshark install. Nothing else besides that.

That's what I mean. There is plenty of missing communication with hubs,
which "should be there", particularly when the device is connected to
an external hub. And IIRC some descriptors (like BOS) are missing too
in Windows Wireshark traces.

I don't know if it can be fixed, and how.

I also found this article, which claims that Windows uses wLength=255
for its config descriptor request "for compatibility reasons". But your
pcap doesn't show anything like that and so do mine (Windows 10).

https://thewindowsupdate.com/2018/10/12/how-does-usb-stack-enumerate-a-device/

So I don't know what's true anymore. Running Windows under a Linux host
with individual device passthrough (e.g. qemu) could show what really
happens. Even better would be a USB bus analyzer. I don't have one :(

Maybe 255 would make sense for the quirk, if we can't find the true
root cause and any better solution.

Regards,
Michal

