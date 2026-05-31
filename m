Return-Path: <linux-usb+bounces-38195-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id pVHAH13uG2oCHgkAu9opvQ
	(envelope-from <linux-usb+bounces-38195-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 31 May 2026 10:16:29 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 606C2614FB1
	for <lists+linux-usb@lfdr.de>; Sun, 31 May 2026 10:16:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3D6BF3002B5C
	for <lists+linux-usb@lfdr.de>; Sun, 31 May 2026 08:16:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE79E3264D8;
	Sun, 31 May 2026 08:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="STkE49dY"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D16241C8C
	for <linux-usb@vger.kernel.org>; Sun, 31 May 2026 08:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780215381; cv=none; b=GjKKwvBhZXYs5F0OnST8CukoEDYOZXd2ezQEDFjXhQ8K12B4WDn9pPMNYWRBn8WIrcFXaIsnbl2uj2z8M3qy/tQv8t715TM1ZxLD5AWcTXJHB8lYZk66lXmCLPmsHb99xzJ+Q5Op8TDzhQYouZ9freTMUbrKynoOi6X/0jYbBwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780215381; c=relaxed/simple;
	bh=yr6bk6MPtMuRIauDz2s361ZhbZjPbSGRXQJDU033mec=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GRkYxmWmuyF+45VCEVEUz42rkpi2giDeq+znvrUMS0s3InJDkhRrv/pjy435+j+J1cYPGCeHSd7KkGNeGYb6+wlzF5ZoSUFtpXfoZoJtPqVv9IDNdgbvRaa6ErkVFXcZXvypOhe+1PrBKyZQEFrUdGUzTMVp4giO1FxOrjfD9zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=STkE49dY; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-45eeba68948so2282610f8f.1
        for <linux-usb@vger.kernel.org>; Sun, 31 May 2026 01:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780215378; x=1780820178; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5S8TAw+ueVdEMs+zfu9rvAoHelVyvZiCVWiEoyL65Lc=;
        b=STkE49dYRoBOaKRAvBpZ3O001VCUOlWJ/ikefVAEeG8EEhsDIpCOy0JcZKxGaWhJeF
         8L7e7zBY7NisiXW3XxnyUwH0tq9v6EPK5B2AH/VUl8YiW57O9qlpNa+5PitiymLGqnBh
         TBiRvkmX8sT5+2lOnXGDuJoDuP/zpl9gYu8QBC4raL+mKPei/xLgoiJWKnX0cTcjPl7G
         2EbWvkhSMo6VHqvT90Lr9H2CPn4s16aJYKjPQ8a35WqWZzJIQz+oSzjEWQhCVBlxE1qO
         1ie5i1Qa0CXEeIrs+kgSQppZBw9PApRTruLsZ5Q7jJbFlzdd+6prc+yoDAescnhDAsXG
         MBAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780215378; x=1780820178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5S8TAw+ueVdEMs+zfu9rvAoHelVyvZiCVWiEoyL65Lc=;
        b=f+HwnEGLoz0RXy3Rl/KWrcp6rmaYMppAiHmCxYuEfddRe/RjZ0AQJyhVIDdfJq1krb
         n93SAlrGTWLknbSri9VdEdADmLM5XAjj2QCxnyym0ZcJOGYh7iHOqwttQNSkrUvwRcQ+
         wk5NgPS6VOvlWs6acqqB1+fSQYXpPtyB5E58g8rmklIlA3oybTu4onTBdsjwxWkbRrd4
         Vc6/UTRcZMVrjLiq8AigvZUUsqupwKG5C6xFPwoJiv/f6nSCWKKBclg0Z7uR4xBQx0A6
         Dns3sdZLAqNmNHErttQRmAgWjloAD7c4kPmFIt/ykigKIVc42LykC6HW25SDhpjIqIyI
         ZVLA==
X-Gm-Message-State: AOJu0YzhGqDzRavE45mCtGZJKdRlUEEnbAEzegSND8FJupwRhu06WU24
	h8Ega6ihSLlV+B4RSNeqgz6tNpkSGmiFpn80+WCq5bEyrnZozj1Epo1r
X-Gm-Gg: Acq92OHNdAi/nx11TRYCqIJcoax/zs1oBvtHnSxCak2ny2QlkC4CAGyw1DysZ/M5DO8
	r1LI4WDkeh7ktWoox42lfCIJBVhsZEZwjZFr5Ay7CmYD7greYPryYauLXgDcuVdN1e4rOltz0ML
	/wwN4Dicn8CTNC0d9Axyy+39cUGW5xP1bqaO8y/4xLIUZZRjRGu7RkoAUPk1FVrqdUPJWbJWdkv
	4xv8tvHkA8XgDQlHK6REMcR2rx/WIiuMhFZJnzyA4GF8Thna/FQxbqj54oD3dluNFFc6d2OjzPo
	55XFm2Veo33J2iTWdNcHvbSnUsyrZtsrAKkD7Neo44pdiT6FG5SZGgcl22ZKyFt+RLMDhUe3A4Z
	H805iS8zoUcUApvkoGzu7qflB9c/4owVvs7j0IJM9qxRUDZQcG86Bs7nTXob2TicS0e1q9GhVoV
	dRYimx17ADAXc+NuGt7JyBNGN6r4YUwnNmRh97ZWKBgucMmg==
X-Received: by 2002:a05:600c:c4a4:b0:490:6e12:a40f with SMTP id 5b1f17b1804b1-490a291cce1mr115060575e9.12.1780215378118;
        Sun, 31 May 2026 01:16:18 -0700 (PDT)
Received: from foxbook (bfe246.neoplus.adsl.tpnet.pl. [83.28.42.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490a25e4fe7sm115806985e9.0.2026.05.31.01.16.16
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sun, 31 May 2026 01:16:17 -0700 (PDT)
Date: Sun, 31 May 2026 10:16:12 +0200
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
Message-ID: <20260531101612.332151d8.michal.pecio@gmail.com>
In-Reply-To: <CAFgddh+JWdT4LLwMc5qjM8q_pBu-fRo2qADR5ovAKoGHWMQrRw@mail.gmail.com>
References: <CAFgddh+JWdT4LLwMc5qjM8q_pBu-fRo2qADR5ovAKoGHWMQrRw@mail.gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38195-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 606C2614FB1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, 30 May 2026 02:52:28 +0530, Nikhil Solanke wrote:
> I have been investigating a USB enumeration issue affecting at least
> one controller exposing an Xbox-compatible interface (VID:PID
> 045e:028e).

Does it mean there are multiple clone devices pretending to be
something which originally had this VID:PID? I ask because
linux-hardware.org has many cases of this ID enumerating normally.

Only one instance of the other ID, also enumerating normally:
https://linux-hardware.org/?id=usb:3537-1094

> The device consistently fails enumeration under Linux during the
> initial configuration descriptor read. The failure is reproducible on
> multiple physical machines and also inside a VM.

It seems quite unlikely, but any chance that all the USB controllers
you tried were xHCI and the problem wouldn't occur on EHCI/OHCI/UHCI?

By "VM" you mean that it's connected to Windows and works normally,
then you pass it through to a Linux guest and the guest breaks it?
I suppose it remains broken until power cycled? And I suppose it
breaks after connecting to a Linux host, so a Windows guest can't
use it normally either?

I ask because I found Windows Wireshark traces not to be fully complete
and running Wireshark on a Linux host with Windows VM could be better.

> The standard Linux path requests the initial configuration descriptor
> using USB_DT_CONFIG_SIZE (9 bytes). By introducing a new usbcore quirk
> and modifying usb_get_configuration() so that affected devices request
> 10 bytes instead of 9, enumeration succeeds reliably and the
> controller remains in its expected XInput mode.
> 
> Additional testing:
> 
> 9-byte request: fails
> 48-byte request: succeeds
> 16-byte request: succeeds
> 10-byte request: succeeds
> 
> I do not currently understand the underlying protocol-level reason for
> this behavior and would prefer to investigate the root cause rather
> than submit a workaround.

The difference is in the setup packet which is sent to the device and
how large a response will be accepted by the host conroller without
an error which would be reported as -EOVERFLOW in Linux.

In this case it looks like setup packet wLength field somehow affects
device behavior, which is odd because Windows works just fine.

Timing issue? I noticed that Windows gets the preceding device
descriptor response after 2ms, while all Linux traces show 2.3ms.
May indicate that the device is in a different state somehow.

Regards,
Michal

