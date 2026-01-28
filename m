Return-Path: <linux-usb+bounces-32881-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IKhnFoQDemlE1gEAu9opvQ
	(envelope-from <linux-usb+bounces-32881-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 28 Jan 2026 13:39:32 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EC760A15C8
	for <lists+linux-usb@lfdr.de>; Wed, 28 Jan 2026 13:39:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2A3FC3041BDB
	for <lists+linux-usb@lfdr.de>; Wed, 28 Jan 2026 12:36:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B63234F46C;
	Wed, 28 Jan 2026 12:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ECP9Uwd9"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A541034EF06
	for <linux-usb@vger.kernel.org>; Wed, 28 Jan 2026 12:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769603778; cv=pass; b=LX7Jwbe2irh+14P2i97ZN7cjgV5HoSJxZKvV89R/LRj4UDim/XYxpqGM/p74o5pdvYdIr9EUbvVwPKY9spRQrqIs5a4QVRGhRb66Y5ESvfQGvxOzJAp24LSepDB1pxRZftC40iDw7b2r0Bd4rSkchd8bbGLLPFr2tabKGNIAF/k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769603778; c=relaxed/simple;
	bh=0m5E8IA1paqB7ISR5kKm0HGcgn7kq/aAqBYoPMGhVig=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DED4mP8dGvHjaMM7DMUOEYM/Mcuy34NYIAjmZNEYvoA3VlHbhtC519XzvY52p3wVPk9FoZIm5szOw5dldBE1YCj71nzOe90Yw1jqYGC0Iu8QffX52HeOdDkWYDG/LOX7thaUc0U7NARpEx0F6vgvrLlmj1EX+tVEmcyQzaLdQP4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ECP9Uwd9; arc=pass smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-47d59da3d81so6165185e9.0
        for <linux-usb@vger.kernel.org>; Wed, 28 Jan 2026 04:36:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769603775; cv=none;
        d=google.com; s=arc-20240605;
        b=F7t/AobrMWMyCwfnnslmCi+U6Y3j3/lwI1P28C3o2GOm61jomI3ZOtoYRSIZZwhPnJ
         veTFj46V29HK73cM4QKZ3FxuyWIQ5BN1GzkMchLsLAB5QSkEN6ed/s3/C1jLFkyio0oY
         QAOO94F7OocWd8xL+VaeLOlYgJa8mcBTkMkyFlYfCIpZmCyOLukD0hkoPIDF79s2rXKY
         niEp3T2Sqzm/YEpPTdkoT9ZBtsHs2pRSFYZfhj3w/ZgQt1lBZfkGo7bN6rJ0yYdOgqvh
         0vEytCzWgMe05lMDqw+vxS+RP/sj0Ok5l1kOmx1rVPe1Q51cNQMMrOARS5JKC7L1oHRv
         3QwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=crs0Vju6vr7yYnAWVTgMbD9mwNnywM1py8zBU7RR7yQ=;
        fh=Gn1Toys4UEuFeOzYtE/R1B0wsIhJJ12yJbnlqYCLJts=;
        b=Z+sjw+qKETMqnYPnDkM8ogKK41M/0fN7e1RQDq4h/xgX/GSofS1w33Ar5Kz2L0ndNp
         qgls0Atg7/GmxjVJnMl3/k23wuHduc97G5uRNKlDqdXGNNdegos7XfSJ8O1ydBb+HhJI
         gKbbtHa2i4WGx2s49xV/kxWk4PC53y48Ey1DdsyS5j76+BY8UbCtQWC0iokb1JYgk2jr
         +AOGj2PP1B8xlfBZRyy0SJTrhpmMar7ii6tMmR+qYXMEKllWwlRS4uWI+XKonr2QL3+s
         9nt3mHxk7Qq7ri9pfpc/98xcbaHYjEpXpVW6f48WKJRZ9GLCATrv5+8ycgX9IzLn5gk3
         YhcA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769603775; x=1770208575; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=crs0Vju6vr7yYnAWVTgMbD9mwNnywM1py8zBU7RR7yQ=;
        b=ECP9Uwd9ruxwdmiZXEX+cN49YgWATHnbSG4fx9LESqIrs5r3zrfX5HYrBeFtiL6oqG
         4Hoegcuo5/FE3qET60UFU4/tU/qC+fV8b3D9nX7n85zSQTU8oaE/5oMjyoIOQI8j1hrS
         9DWj/rHqFyfnyWqUa6FPtvJHsSnT4dpui2GHGeo7sk00FJ80Ke7I4NhixMJQ482gcIO2
         kiYoiurWyU2ErMSVCv0tahB6EsM9LlqWopBPhJOnZZjwkj67o3EUXK5puSjmxP1VxdcG
         tdyWrAkSMaxlsnq5+/+zoXl7r0/ISSUOF1eOVkIKGtGuRFhqSnf8C6mCm/jSnLkdCqPV
         Kknw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769603775; x=1770208575;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=crs0Vju6vr7yYnAWVTgMbD9mwNnywM1py8zBU7RR7yQ=;
        b=lFKZeIDNKrhLG2xGA2cQBYT2bi7y0sXjfTha5LpMxDHGXl/In2+6TE4pZLpFNVUUmX
         dTDxn3aUmHhPE57Fsh//DDXwa0IRGoLNejCrkdNn5xBgrXMPuhtIblPu/RlhgjDQRPV+
         pDLyverERDYNVlB2juZQ7eWKbqetOLYFumTEV7eS9Jxjfb6RtM0B4+uA4YXImjJgZPLy
         IzBkf8rFR1SjM/PowckUl7W30qfXnnIq7BW8iVpeL4ipJuFTtctdUWkXAz1cDBqi/B/+
         7ojI6eMpBMBNzizU2QBY71Gbwi0mtxWdv77+GZA+ptPWdZ48bWtOY4O4UNg6DRw3YubS
         bMZg==
X-Gm-Message-State: AOJu0YxT6f/hQBhqaeZfjgSJ4vpzbSbmhCEWLGeFR3hYNlUnYbpGkqsJ
	ZwKFdh3OFU4H6feT4RZfehzU+NkVhmUl2F0yCkjJzvIWMxPfKBGu46M9BrgJ50O1XIe5TwFXSSm
	j1BXmmxGfz2nzLYy8PINtEFaZdovWpwCMcskT
X-Gm-Gg: AZuq6aKOc20y/bmjuicGwCSJvbRXwuiD4OYWEnb2GmU2IcLJy+eMFMwhnJg3ZlbxgG8
	VDLkJrj53/qV3oJMSjK1V8GFc7mvuOwMhGT9fsf7Pad86qeRfr18IMaqjCVgGVjN+cxN1KQksgc
	AHCT/QbW3K47P9zQh+IgGSU719gqnigVuLxjUS0YjSIMjwjH0LPhl1JRyu6NN70hf8BiGQXDec2
	HUq92TTiXFFxK2P7BYyAKoUArfR4jB+18QaOVEA4vnIpTPVBAmCRWALmKwrztZCNuvpKtwvdPZS
	0F3/egsSxFCGslg8hqnjwQBdPoCKYueopd+ol9Ve
X-Received: by 2002:a05:6000:1acc:b0:435:9538:939b with SMTP id
 ffacd0b85a97d-435dd0bdf07mr7389967f8f.8.1769603774762; Wed, 28 Jan 2026
 04:36:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAOf3c5fDit7nvfWUGf+f5Ctmfr9ebg6KqiwZhZYusHyFaeE5CQ@mail.gmail.com>
 <2026012758-dedicate-desecrate-358a@gregkh> <CAOf3c5eJp7432wRk1E0cDTWMccO_m9fWYDKU25-qJ7Owk8mVQA@mail.gmail.com>
 <2026012720-outmatch-worry-b92d@gregkh> <CAOf3c5dCsN2rDURv_Ct_K2agiFRe1zEjrQi1AM8LjTCfUYnLVw@mail.gmail.com>
 <2026012811-sepia-aeration-0238@gregkh>
In-Reply-To: <2026012811-sepia-aeration-0238@gregkh>
From: Ivan <kernvirt@gmail.com>
Date: Wed, 28 Jan 2026 15:36:02 +0300
X-Gm-Features: AZwV_QhV-QUZ03xLcrLR9WYrlRvPQvrZerzkyXKOuy8J1ws6BMYgtD1xwGPsGEM
Message-ID: <CAOf3c5fO33EYtpAY0qOCgJhTKH+MYUB+4CKNR_R1fmEi0cxKEg@mail.gmail.com>
Subject: Re: [BUG] r8152: Tx timeout and xHCI setup device timeout. RTL8153 31.00
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32881-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kernvirt@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[daringfireball.net:url,wikipedia.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,linuxfoundation.org:email]
X-Rspamd-Queue-Id: EC760A15C8
X-Rspamd-Action: no action

=D1=81=D1=80, 28 =D1=8F=D0=BD=D0=B2. 2026=E2=80=AF=D0=B3. =D0=B2 09:11, Gre=
g KH <gregkh@linuxfoundation.org>:
>
>
> A: http://en.wikipedia.org/wiki/Top_post
> Q: Were do I find info about this thing called top-posting?
> A: Because it messes up the order in which people normally read text.
> Q: Why is top-posting such a bad thing?
> A: Top-posting.
> Q: What is the most annoying thing in e-mail?
>
> A: No.
> Q: Should I include quotations after my reply?
>
> http://daringfireball.net/2007/07/on_top
>
> On Tue, Jan 27, 2026 at 07:02:46PM +0300, Ivan wrote:
> > Yes, the log is correct; during the time since boot, I had just
> > finished downloading those 900MB of packages. In this specific case,
> > the interface disappeared just before or during the reboot. After the
> > reboot, the interface did not reappear because the hub remained
> > powered, and a physical reconnect was required to initialize it again.
> > The previous log was short because it contained only kernel messages.
> > This time, I am attaching the full output of journalctl -b for more
> > context.
>
> Thanks, but it looks identical to the previous log, the device, at boot,
> didn't want to talk to the USB host (i.e. your computer), and so
> disconnected itself.  It must have gotten "confused" and so a physical
> disconnect from power fixed it.
>
> That's a lot different from "it was working and then it stopped", so it
> might be a firmware bug in the device?  I don't know, sorry.
>
> If you plug it in, after the system has been booted, does it always work
> properly then?
>
> thanks,
>
> greg k-h

The situation is as follows:
I boot into the OS with a USB hub pre-connected. The system has
internet access, and I start downloading packages. After they are
successfully downloaded, I perform a reboot. In this specific case,
the Ethernet interface disappeared from the system during the reboot.
Out of the 4 crashes I=E2=80=99ve encountered, two occurred during a reboot=
,
and two happened out of nowhere while downloading packages - the
Ethernet interface just dropped, and the download failed accordingly.
ip link shows:
1. lo
3. wlp*
This means the second interface, which is the Ethernet adapter, has
completely disappeared from the system; it is also missing from lsusb.
In the log I attached, I did not disconnect the hub manually - it
simply vanished from the system on its own and did not reappear after
the reboot, as it remained powered and was never turned off during the
restart. To make it appear in the system again, I have to either
reconnect the hub manually or completely power the laptop off and then
on.
I don't know if it's a coincidence or not, but all 4 crashes happened
specifically in tty. As I mentioned before, I cannot catch this crash
in a DE; perhaps it is just a coincidence. I also conducted a 2-hour
test in DE: I received packets from the router over the local network
via iperf using 15 streams at 1 Gbps without any issues. However, in
my log, as you can notice, I caught the crash after only 7 minutes of
downloading packages in the package manager.

thanks

