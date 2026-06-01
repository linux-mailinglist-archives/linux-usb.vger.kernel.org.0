Return-Path: <linux-usb+bounces-38221-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QJcOJEIsHWo4WAkAu9opvQ
	(envelope-from <linux-usb+bounces-38221-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 01 Jun 2026 08:52:50 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 09ECA61A6B7
	for <lists+linux-usb@lfdr.de>; Mon, 01 Jun 2026 08:52:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 066D63029753
	for <lists+linux-usb@lfdr.de>; Mon,  1 Jun 2026 06:49:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB085361DA6;
	Mon,  1 Jun 2026 06:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KGE+H3OX"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D2931197B
	for <linux-usb@vger.kernel.org>; Mon,  1 Jun 2026 06:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780296556; cv=none; b=rMSQxQEXRZgUMRpRqaNkGKFTAZG7glhWqyFmZdK6A98JkukxQbaoaSkyahLA2k4oMFpqss6XrzF5TmHEADIT1mB5Wa5+jvzg3xYKzv8sCC17sOa2io97NxScU2RZqRvsDOp9RuJrTxyMO/9yWpaRbk/qZE10zahobK8uvL2ZowE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780296556; c=relaxed/simple;
	bh=vikKeA61PpQZCuYl9z/3n7KKA+6dHRaFtoJxYTF2XlY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N45WSkFY1CzV6vZL/hgoHAJlKXQgTprKhu7Kmisp90QDbYpQ+Xb+pk5qZXlbRfPbkJ1XugoktJlZIgNar/SBKHrZEwMTlzEvFUkS0Sio6SBOoW7ZXb4b1t4GMtr1vDWtFYakV+IRJ15dGesQJyJbH/v1YQQfmYUYM1uEdPRmu9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KGE+H3OX; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-490ac357c55so3230965e9.1
        for <linux-usb@vger.kernel.org>; Sun, 31 May 2026 23:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780296553; x=1780901353; darn=vger.kernel.org;
        h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=LN6YfZahq7ZgSKyv9Xg0kecsw9dasTZcxdJnByT+pM0=;
        b=KGE+H3OXfDDb0KMbDWfIHCW7JHs6Fr48xlYauGsPHYI6o1iJyyRQWb/+4Wj47G12eK
         sAe0HMm4Kx4dTLxhFVzTPJFpchKjbZXR6OxarFhtv2Vyn2NtPrHkafvfBysCJ2g8oZS8
         2lQhcnOiE9QvQkej6UqJp1IR6ChIW6CKBMI3w3LiRnCpz1UuTQiI7Fz22dN/BJE3OCGG
         eLrwgwWxJA7T6vhbTIUHcz1Wo8QERstL6aGkCxFM6pdN0HrEYAYZVhBxQSNjHBrQ/wdh
         Y8g2qWfDhBqTaXYR9oLQtN+lJWY2CI22eBa7Wco7gpjw8rCE57eKrDrdx6Ne8TFKNpTp
         jk2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780296553; x=1780901353;
        h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LN6YfZahq7ZgSKyv9Xg0kecsw9dasTZcxdJnByT+pM0=;
        b=EXWsmGUftLdONHWFQzdsBgTkd6lH9gyKocMAdtG2xHs7G2v7R9sYCCc+2fT56R5dtM
         7YglBbKp2RD23fweXkiTcbxDVxOVYGHrKY85g0vDbeo3+EkZFDkLItWhCkV/wzFj5e5V
         qGv67VbN77dVTlt0tUTuDAXxeQrxA8uU54vTD4dVw5OnAo300miIrqs1CSfPj5AY1W/S
         B5dY0vaFUTAeQHEClE3oYBZxd5MwmLKnaJl0BoJDvr/I5Q+XALVqwZ8LjAY6+jfRzXtc
         qKyHrPE8zzJmjCcI/TplSC5DDqONiRnV3Lou7GsGjsaT2f7KqFu7m7Nt+DyOBZ0GZiPX
         cTUA==
X-Forwarded-Encrypted: i=1; AFNElJ90K9a9kOxROw4xrKS+LniAz72+Yoo+OucJ5o2H3MYJN5VazIPlZL9JoYVhp16go9gIkxsyly9k334=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc7jy0Vm4bvQdmcsddTblPdqXi8R8uaazDaXsAtmMFZMgo0yjH
	MNlPi5KBc49RU1f1aZcJQvH6oXv5DzV3GMRIQGrwRO7gjpUIjxeWAEPs
X-Gm-Gg: Acq92OFfeDvZoStbYWGsApJ1Ut4lIUtJCbdW8mWb2uEWKjtZB9EX+VrPrWskntNA4/L
	m7oHwYLMpI4S1nRdnVFb9vxhuZgdiJL2GkFZQcFEcc/Ib2jbkreiwehKysSFhTsv5noG+va/V4k
	ilI1s5Ttq26WDpEQfwFb8l2Fyri08FeH2uGK9SFHzXVAK93/dKdsY5ETRhOj3eOh7pu4biQDGTN
	5IjZCG7FNsDFr9sooFC7fbWgwMU+ysqZ0U0vu2NIK5b+9XBoC33gxs9Zfdt1QmgtEyUQZp64Cge
	gZ8oygbtiiJYs1YyfOb3z0WUbTN5oCbZ7hCrg3OWZ2LIqGenUo6AOBAbbkJsVKsZqQZ5cA7SFMh
	gJFE8jNEEpzRBAZpLOQA6lR0KJuq5nEI3qI4Bch2+qEB2DIu5K/uohkfUZ2jDyLQw+QUVus+gwk
	gvtHP2LZz7Fs4kPWMNQLv16PF2W3X1vniNZe9gVdU+bULd6w==
X-Received: by 2002:a05:600c:3e1a:b0:48d:35e:82cb with SMTP id 5b1f17b1804b1-490a2958595mr181611995e9.28.1780296553328;
        Sun, 31 May 2026 23:49:13 -0700 (PDT)
Received: from foxbook (bfe246.neoplus.adsl.tpnet.pl. [83.28.42.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909c0b896csm159972875e9.1.2026.05.31.23.49.11
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sun, 31 May 2026 23:49:13 -0700 (PDT)
Date: Mon, 1 Jun 2026 08:49:09 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Nikhil Solanke <nikhilsolanke5@gmail.com>, linux-usb@vger.kernel.org,
 gregkh@linuxfoundation.org, mathias.nyman@linux.intel.com,
 sakari.ailus@linux.intel.com, katieeliu@tencent.com,
 johannes.bruederl@gmail.com, kees@kernel.org, dengjie03@kylinos.cn,
 limiao@kylinos.cn, wse@tuxedocomputers.com, dev@a1rm4x.com,
 vahnenko2003@gmail.com, cs@tuxedo.de, lijiayi@kylinos.cn, oneukum@suse.com,
 bence98@sch.bme.hu, eeodqql09@gmail.com
Subject: Re: USB: Request for guidance investigating configuration
 descriptor enumeration failure
Message-ID: <20260601084846.433bfc51.michal.pecio@gmail.com>
In-Reply-To: <3b79ba92-1c51-420b-a5d2-8a358cafdbf6@rowland.harvard.edu>
References: <CAFgddh+JWdT4LLwMc5qjM8q_pBu-fRo2qADR5ovAKoGHWMQrRw@mail.gmail.com>
	<20260531101612.332151d8.michal.pecio@gmail.com>
	<CAFgddhLGHvTmRxWtguXTpgZV_Mq5ZW=CVK_ZkqbOgUF9Y5bCsA@mail.gmail.com>
	<20260531123843.736bd69a.michal.pecio@gmail.com>
	<3b79ba92-1c51-420b-a5d2-8a358cafdbf6@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/BBiQ+3s9IqqI2ehlv7LMzew"
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38221-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,linuxfoundation.org,linux.intel.com,tencent.com,kernel.org,kylinos.cn,tuxedocomputers.com,a1rm4x.com,tuxedo.de,suse.com,sch.bme.hu];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	HAS_ATTACHMENT(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 09ECA61A6B7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

--MP_/BBiQ+3s9IqqI2ehlv7LMzew
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Sun, 31 May 2026 10:12:50 -0400, Alan Stern wrote:
> On Sun, May 31, 2026 at 12:38:43PM +0200, Michal Pecio wrote:
> > I also found this article, which claims that Windows uses
> > wLength=255 for its config descriptor request "for compatibility
> > reasons". But your pcap doesn't show anything like that and so do
> > mine (Windows 10).
> > 
> > https://thewindowsupdate.com/2018/10/12/how-does-usb-stack-enumerate-a-device/
> > 
> > So I don't know what's true anymore. Running Windows under a Linux
> > host with individual device passthrough (e.g. qemu) could show what
> > really happens. Even better would be a USB bus analyzer. I don't
> > have one :(  
> 
> I do.  But I don't have one of those Xbox clone devices to test.  And 
> I don't think I have access to any computers with EHCI controllers 
> running Windows 10/11.

The thing to check would be how Windows enumerates any random device,
since I expect that Microsoft designs their own peripherals to work in
Windows out of the box without special quirks.

I have done a quick test with QEMU today. Launched it with

    -device qemu-xhci

booted Windows 10 22H2 and typed in QEMU monitor

    device_add usb-tablet,pcap=qemu-tablet-w10.pcap

The result is attached. The first device descriptor request uses
wLength=64, followed by proper length, and the first configuration
descriptor requests uses wLength=255.

Then there is some other stuff, and another request for the device
descriptor followed by a 9 byte request for configuration. These may
be the requests being logged by Wireshark, but I haven't installed
Wireshark in this VM yet to confirm and correlate.

So this is why I don't trust Wireshark on Windows very much.

And yes, if more people can confirm that Windows behaves like that,
I think that a quirk which mimics this exact behavior could prove more
useful than a wLength=10 one.

We don't know why the device behaves like that. Maybe it's a buffer
overflow in its FW, maybe it fingerprints the host to automagically
select "proper" mode of operation. Maybe the next such device will
check for 255 bytes exactly.

Regards,
Michal

--MP_/BBiQ+3s9IqqI2ehlv7LMzew
Content-Type: application/vnd.tcpdump.pcap
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=qemu-tablet-w10.pcap

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

--MP_/BBiQ+3s9IqqI2ehlv7LMzew--

