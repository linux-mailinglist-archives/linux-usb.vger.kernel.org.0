Return-Path: <linux-usb+bounces-38168-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qFILCV0EGmrK0ggAu9opvQ
	(envelope-from <linux-usb+bounces-38168-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 29 May 2026 23:25:49 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8030F608DA8
	for <lists+linux-usb@lfdr.de>; Fri, 29 May 2026 23:25:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7C8BF305B122
	for <lists+linux-usb@lfdr.de>; Fri, 29 May 2026 21:22:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 314933AD53D;
	Fri, 29 May 2026 21:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lIJMxgRY"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6876E330666
	for <linux-usb@vger.kernel.org>; Fri, 29 May 2026 21:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780089762; cv=pass; b=QY5e1h9d1D5dm3MDfbLxn98UDWwbdrc7y/QWyIDK2P1mZ8P6yjjSiDL1g+u9wAbmglqGc6OE9Q2TMRmMu/5JM53rYSQH4sjtRVTt+gRGCFjgIMubL+JTrxHmaei5IcyWJyg9gMqlaWp+O4VFn93XFhhMcq+KACZocL9vNA4soFw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780089762; c=relaxed/simple;
	bh=r7FKUTv0rTMwPilIO33m+qlBp3mi/6NKrZDqGk0soCY=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=oYF1kn8p3HXrLCo/UqWzBb77cmkl0DlYvWw2xk8M7TgT8Lez0h8Y1eRi3hnsCGM3JNsplqrIOjJJIcBX/uva51gMHyNV7rdOCZDvuHRwTIWSSOSY6xugZnqoOgLodQt1Cp+Vj210S5weBYGroDbcSEblRySz5U2zx6N7EbuoGKU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lIJMxgRY; arc=pass smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-bce386d5b85so2163654466b.1
        for <linux-usb@vger.kernel.org>; Fri, 29 May 2026 14:22:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780089760; cv=none;
        d=google.com; s=arc-20240605;
        b=JrRYRYUItDKVGBXrw/xalLxK4h8YMrssr0d11b536FREY59W5SXuoDfe+13mQiFagZ
         ED4qyhm3u0PLlboTwlL1iBZZsz/p2763kxCOJmUjLRzwN7uHfSsNziUU1CcO9Bho37VC
         1rLwKGM9rFlTLyZnpbJ9B+dijK2Dud2TbPEzxTmtM2Hce7l1xnu6DkW2NYTQQWirusEp
         O10cwWZ2KIdGMU5naDvFbBDz0DdVn13QvTxJf410NQ8x726FD3h4nGMVpcbSEg5yBntw
         a7JbLwmD1eQ80YL/a24qHgGVei1aICGx6SwyTXgYC8HwISKZLJxa4Rid9L50HNjUPz3Z
         rxMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=r7FKUTv0rTMwPilIO33m+qlBp3mi/6NKrZDqGk0soCY=;
        fh=udS2n01VEd/tZhxL3W6vy3001s3KmtVEV88ocz95Mmo=;
        b=FkcmJJnvzi696GtF/xXjyxurcFgcTLXMsjv1Ok+FRqnKkwdGCFxWmefsgHTVIdEzro
         IKmzcEUmn/7MCqMQgYJBTheuRVpk4/kKRs5s74NdqOPrSmJRS5UijROm1YCBv9TEpIjU
         l+Z/U8phsd9DfKaLZ5XaHkGN1oiy8Sxmk5SIvo6Y/FqKRr0wYXNIhIXUSQ/qTSjkcQuh
         84/wMLvOks1ZiNNrXaXsQXhzWvwYIGQbTom2lS0v/LVGf+RbbS/BZ1YkuEYEccMWjcxP
         gcLlzZTFdg38AoMcqf4TngVSguxjddVk07cLv4O5s0rABb2+Eh8q49io46Ifqx7JtBHc
         qBLA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780089760; x=1780694560; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=r7FKUTv0rTMwPilIO33m+qlBp3mi/6NKrZDqGk0soCY=;
        b=lIJMxgRYxKlRs27JC40KbYaGeUkJm3zEeBX4Tk6pc7PpOdCo5n8xzet1pY0MoEarUF
         0wS1PxNMEHhanGR7MKcyPpet3VRsQ3g0RW3+SvVYIY/61+fTOeXjl2cwLAowqn4oRk2h
         +gVKCOTsplKrUvyagGG4AAwbUlVn4/QRghM0X/gpwvY2ydx9A8ehSfZ0/2l52oNQmke4
         AeSs5JumxU8yuUTyQSV9Kk59YW0qmOOFziqy9nLoVrcrbnyoOgncqfkrCq8MRl7iSIlI
         s02mNDK9E5o3mx4b2GpRJjY94KKP1+C0z7vFycjXw6saGOdCMA+Du1PrSFZOgGCKYM3R
         fCiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780089760; x=1780694560;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r7FKUTv0rTMwPilIO33m+qlBp3mi/6NKrZDqGk0soCY=;
        b=mcjWwc1ibR53a9N4FUPJ9NH6COUYsivhw3RKPYOJUowglp8LljrOybYujG47rl2JCO
         BMKf6y+N+odR7JnvE4OVqAijEaUXUgi40ef9xX5qhW4irHKzrG9h6msOkM/p1a+tIviu
         Ti7T62CPEfGbBqr4iiBJDViTd4q3xBngE3ZzVVnEmyiSuqX+7GXNi/tZwx0BL73uoclP
         IuKz/0n6skLu1z27ztMypWFCkupLTOX19jWoZy8m4MscMqDo/s8O2BSnFdnw9yHugFNR
         +isFwBRtRGR0TQw37S0GQR6+1/RNaO7uT/thUPTLNcO5Rm5hH3ZLzIclxjpf2A4Hgn7R
         x7hA==
X-Gm-Message-State: AOJu0YxiYMEqC/E9DGcimvSXRoXqR9iVdHboIyq4wvNiTLen96T4ODG0
	SuvejuMDlqo8GlCJqi/AxsqmIKv4q/eKVxFi9lWAYY7cSLGB5OE8HrB2hHU5Bq1Ph/ol+y7AO1U
	zyj0+BT9oxb8CXPb0eqns5wkrPcHwRGuS4xXs
X-Gm-Gg: Acq92OGYEpu7RCRsF9Zwep7OqQPSFaxr9mkox8RhblnTXmShMxdzUKMgCg1IHliR4ov
	b9TgW3PkzqGF4mu9Rhgkm+mWaFORAQs3rdOyQSMbXcv+3rMs9pw6ruDGmYomO3yBb19AHaU6fDE
	awep3q0z7fTFxAxUQvhQXVSqbpljlsqOtQp5xxOsqIu3oADEpG9kxuoRMJIQNwc3ntMyoZAXXjv
	miNkbPkAXyUk3e03scJ3iw0KebnHg6SAVv1joPf6h1o1VRSrVfQ8YH1y2fSrE9SDkTR1g2nOP1M
	BffK/lRgTcOLg1iNtQ==
X-Received: by 2002:a17:907:6eaa:b0:bdc:fbfa:bc75 with SMTP id
 a640c23a62f3a-beab83a781amr63877766b.43.1780089759651; Fri, 29 May 2026
 14:22:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Nikhil Solanke <nikhilsolanke5@gmail.com>
Date: Sat, 30 May 2026 02:52:28 +0530
X-Gm-Features: AVHnY4IY-qj_hpNxZlZCuG-YJDQgjII0ogicDpMpEFenuEGv2SPGPc087IzouOw
Message-ID: <CAFgddh+JWdT4LLwMc5qjM8q_pBu-fRo2qADR5ovAKoGHWMQrRw@mail.gmail.com>
Subject: USB: Request for guidance investigating configuration descriptor
 enumeration failure
To: linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org, mathias.nyman@linux.intel.com, 
	sakari.ailus@linux.intel.com, katieeliu@tencent.com, 
	johannes.bruederl@gmail.com, kees@kernel.org, dengjie03@kylinos.cn, 
	limiao@kylinos.cn, wse@tuxedocomputers.com, dev@a1rm4x.com, 
	vahnenko2003@gmail.com, cs@tuxedo.de, lijiayi@kylinos.cn, oneukum@suse.com, 
	stern@rowland.harvard.edu, bence98@sch.bme.hu, eeodqql09@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38168-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,linux.intel.com,tencent.com,gmail.com,kernel.org,kylinos.cn,tuxedocomputers.com,a1rm4x.com,tuxedo.de,suse.com,rowland.harvard.edu,sch.bme.hu];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nikhilsolanke5@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 8030F608DA8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello,

I have been investigating a USB enumeration issue affecting at least
one controller exposing an Xbox-compatible interface (VID:PID
045e:028e).

The device consistently fails enumeration under Linux during the
initial configuration descriptor read. The failure is reproducible on
multiple physical machines and also inside a VM.

Observations:
- Reproduces successfully on latest mainline linux kernel and also the
latest lts kernel release
- Windows successfully enumerates the device.
- Linux fails while reading the initial configuration descriptor.
- The issue reproduces across different hosts.
- The device falls back to a secondary mode (with different vendor id
and product id) (meant for android support) when enumeration fails.
This android mode gets enumerated and initialized properly but we lose
a few capabilities that get exposed when its in the Xinput mode.

So I collected and investigated USB captures from both Windows and
Linux via Wireshark.

Interesting finding:

The standard Linux path requests the initial configuration descriptor
using USB_DT_CONFIG_SIZE (9 bytes). By introducing a new usbcore quirk
and modifying usb_get_configuration() so that affected devices request
10 bytes instead of 9, enumeration succeeds reliably and the
controller remains in its expected XInput mode.

Additional testing:

9-byte request: fails
48-byte request: succeeds
16-byte request: succeeds
10-byte request: succeeds

I do not currently understand the underlying protocol-level reason for
this behavior and would prefer to investigate the root cause rather
than submit a workaround.

Could anyone suggest:

which USB core paths would be most useful to instrument,

whether there are existing examples of devices failing specifically at
the initial configuration descriptor size probe,

and whether usbmon alone is sufficient here or if
host-controller-level tracing would be more appropriate?

I would be happy to provide:
Windows and Linux Wireshark captures,
kernel logs,
and the experimental workaround patch.

Thanks.
Nikhil Solanke

