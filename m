Return-Path: <linux-usb+bounces-37303-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EO1VFljjAmpEyQEAu9opvQ
	(envelope-from <linux-usb+bounces-37303-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 10:22:48 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A31E51C9BD
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 10:22:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CBCDB30234F2
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 08:22:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57DC436F91E;
	Tue, 12 May 2026 08:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R1MHgwbW"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 875A636F8E9
	for <linux-usb@vger.kernel.org>; Tue, 12 May 2026 08:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778574161; cv=none; b=NZ7ncwKq+BFe9sk9DTLoKobPSEXYvzoty5bhyrHa5lXbPkGcl5jwhG7jEBgu3vWtQ3QsY8jE8hvzWovRJpt67JGUEjSM17FHx2aQPgvk/3kSRgd3yh7d5lTXyjCSpmmdir76Qitr+DR60G1YvKzcI4FOzcHW4Ii8QeMB44umcqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778574161; c=relaxed/simple;
	bh=peL7JkTs2NS+UYgAKxEwxkAEhJWbw73UVtPsLrM1sHE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Wno+eBdF7LrOzYH++6E8n2s8KukIupNr78L+MAlhu5hHMp9PR3tgrWYnSKpuihJ5eFfpSj43wjBeeLEkZ363XuhG0TOT/WpeKKC6Af9Yw9tluNPXF/BIQ3VbCgVJZ/7jsiGN124uwbvJ76IbRuQBpkMMY57ezWECLpFrIgNHX8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R1MHgwbW; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5a858881ad2so5780060e87.3
        for <linux-usb@vger.kernel.org>; Tue, 12 May 2026 01:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778574159; x=1779178959; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PvJeMgbrCU82xcWyDwUyahfaQJD8+fqAy//y7uYzovo=;
        b=R1MHgwbWeQpa6Kgm1HVWBhHlNwjeYBMZx8EqZrZ53pql5nhMWD3fX2nUfQtg8WNlhZ
         cLa/lYUOlaNZiRbZpndSq2wxki7HeE1qVUcKvG2ZoiKx56FyM0T3+hY2G+lFJxdVp1Vt
         h8iCAqx4i4a7tsYaAlder1B1WK6VT2qYbee8w+SLr4giEool2Rz9dm1ySKfZVYFTuFcN
         qi0wuKOnUbJNd4CChO4WIkc7TMcvM+MTDRSzDBcr92T8u8sG9vq6mtvQnG0v4yoKog8D
         oTFMmv9rLPaK+puesAjTZab0CbAK8+tIhmzIwzqguZIfw0SYDvq9JMKKnty8JphB/i17
         pTGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778574159; x=1779178959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PvJeMgbrCU82xcWyDwUyahfaQJD8+fqAy//y7uYzovo=;
        b=nJt6TMngtJy9kJVn4u8+64pOno93FiYnFSoQ/sFDU+Z4pL8ysmC7wghQB727Ri0hMd
         y1oQC4H27O4tOZuGghBEyoZ8mkyIyxOJOBwGN5vInM8ziG5hwm8sN/S63j3CnBBZTEba
         IFngbzW16PyhJBAcAHYicKZBLFhRQSjt6Dw8tQuJsIdgf99OBuMEYVzI0r67znNKe2RD
         n4Y0LToaYK2MdCDq/RGs3JCUIwXoKWYcF3ofe+c5axq045Otm06+hu7Trjv95eHjizMs
         X/YjdV2A/6FDrGy8nUa8M0FVK/SrCTw4u9ScuFMWJhVDyWCDzW2BaPKkSy6EV6KHKd3l
         5D+Q==
X-Forwarded-Encrypted: i=1; AFNElJ9yLmYZMaDvuhp34hJgdODA7LucPizshLoou/5zMEiL8dx9PfDjMV9rmHaNz4sjhhGF2EQjzTjy+7U=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDeDFp32iOBVzo9Dhlr3cz13Jj/35bHqPg6t0EwTICFiMXYJNy
	xZukKQten1IZY+neTUoMci0u18utkhXU5I95RLXsCgNRMRm7/pnHJ/kN
X-Gm-Gg: Acq92OEm6N354prtUcB7gJ0eepIgJYou/bNd5jttapab+/YPGIV8EudFFM/mtzB0HBV
	IbCTtdSXRdFzPSd7zuq1ZToqGphye62nMewnkDYM+EvgphGNlQ7lIsxts8+86/9jKaA9VmzdUbV
	Ry1fBZSg/0mCbBm13xsNA6WsNS6AYpOHkDLkQ5LNsbwaSlareJBA7AmAQBVAn3nVZmBJofv8Fy7
	S8zrnhzU/FlHnZv5mmNeZKOqmZVc6ERvyWkUn7ggqjl3ufSAaYNaWCZnz8InRDtlbixWK9KUrZx
	WEw0VPnm3CRANaHiyotTA3bBU4J7bpMV1rneTFAKdEaVQSHLoge4QWQqFbcsZnCRmJB8GY+U4ws
	z31s9IA9yFZwIOz8WWyISFNQ/cmOvKHpqbmIWUA6UcmE25+xc9SeipMAyD48Qc8Td/6qtmeOUI1
	d7bdUTQNu3LIk0MUzYKEqkYcZsUGCw0gcX
X-Received: by 2002:a05:6512:128d:b0:5a8:6b81:6694 with SMTP id 2adb3069b0e04-5a887ce5e99mr8550473e87.30.1778574158311;
        Tue, 12 May 2026 01:22:38 -0700 (PDT)
Received: from foxbook (bgw15.neoplus.adsl.tpnet.pl. [83.28.86.15])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a955df99sm3246603e87.45.2026.05.12.01.22.37
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 12 May 2026 01:22:38 -0700 (PDT)
Date: Tue, 12 May 2026 10:22:33 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, LKML
 <linux-kernel@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org
Subject: Re: IBM Power S822LC: pci 0021:0d:00.0: xHCI HW did not halt within
 32000 usec status = 0x0
Message-ID: <20260512102233.290d3665.michal.pecio@gmail.com>
In-Reply-To: <6106b5b9-17d2-48be-8215-3320f3d1d261@molgen.mpg.de>
References: <fb68e15d-b8f2-42ac-aa65-0d9fedcfcdbd@molgen.mpg.de>
	<20260506193037.6de9e355.michal.pecio@gmail.com>
	<69fa1c3f-3ea9-42cb-a49a-7da39f72806e@molgen.mpg.de>
	<20260512012006.66aeb0c5.michal.pecio@gmail.com>
	<6106b5b9-17d2-48be-8215-3320f3d1d261@molgen.mpg.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 3A31E51C9BD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-37303-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Tue, 12 May 2026 08:17:08 +0200, Paul Menzel wrote:>=20
> > I honestly don't know what to do with this. I think I would start with
> > looking whether xhci_shutdown() in the old kernel manages to halt it
> > successfully or if it also fails, and what's the USBSTS there.
> >=20
> > It seems that you can get such information by enabling dynamic debug
> >=20
> >    echo 'module xhci_hcd +p' >/proc/dynamic_debug/control
> >=20
> > and capturing old kernel's log up to kexec() through a serial cable. =20
> Unfortunately, nothing is logged over the serial console (BMC SOL) after=
=20
> running `sudo kexec -e` or `sudo systemctl reboot`. I just see:
>=20
>      [69530.180531343,5] OPAL: Switch to big-endian OS
>      [69538.407292205,5] OPAL: Switch to little-endian OS
>=20
> Which is the OPAL firmware, so it might be involved? No idea, if it=20
> touches the xHCI controller.

So some FW involvement is potentially possible.

BTW, another method of doing kexec is to setup a crash kernel and
then trigger panic with /proc/sysrq-trigger.

This probably won't run xhci_shutdown(). Not sure about OPAL FW.
Is the outcome any different?

> But strangely no xHCI messages are there =E2=80=93  also after booting wi=
th
> Petitboot and initialized xHCI controller? No idea, if it points to,
> that during kexec or shutdown nothing is power off?
>=20
> With `sudo systemctl reboot` only the line below are logged:
>
>      [  121.811384] libvirt-guests.sh[3366]: Running guests on default UR=
I:
>      [  121.811988] libvirt-guests.sh[3376]: no running guests.
>      [ =E2=80=A6 (systemd service stop notifications)]
>      [  136.254846] systemd-shutdown[1]: Waiting for process: watch_ldcon=
fig
>      [  218.549684] reboot: Restarting system
>      [69760.484679183,5] OPAL: Reboot request...
>        3.55778|Ignoring boot flags, incorrect version 0x0
>        3.59881|ISTEP  6. 3

Only "reboot: Restarting system" looks like it's kernel. Maybe you need
to tweak loglevel before rebooting or kexecing? Try to get more kernel
messages showing over serial during operation, then kexec.

Regards,
Michal

