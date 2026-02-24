Return-Path: <linux-usb+bounces-33649-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4EMPMa2XnWnwQgQAu9opvQ
	(envelope-from <linux-usb+bounces-33649-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 24 Feb 2026 13:21:01 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8EC186D90
	for <lists+linux-usb@lfdr.de>; Tue, 24 Feb 2026 13:21:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5C9B7306A396
	for <lists+linux-usb@lfdr.de>; Tue, 24 Feb 2026 12:20:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39C83396B8E;
	Tue, 24 Feb 2026 12:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ccaBZ5YO"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CFD938B7D8
	for <linux-usb@vger.kernel.org>; Tue, 24 Feb 2026 12:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771935605; cv=pass; b=r43VoMF3IFvo+RFAN+o9toOIXU4gndJz81oWKouyZBZxc8tQODuYTD8F3U/V5r+aFYDU8OzMUnLSWDK/1SD/s7J9OoGjQcJzFmMkKU2+60mTSmmToUurKQAGjuUg2RgwqlHHg0JZCe8TZ0dWis/8E0JmrLJK7L8vU9DoNnhF/eQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771935605; c=relaxed/simple;
	bh=oUJm9B0gvQB8NRBMVwgcmGcWGlRuXlIpLSIVTM41h1U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FNXF5i/pVbq2xwz/uF+nr2ZCIZHjB1syMigjAQKvWo07Vl/0fDSZFW3peSL20dwnRfqG2HsEc3d/cZdjyzuosLiDXj9qLb6e9RctH6lGE+PNBF+Fp6WBEDWoqM+/F9WN7ZUgm0lcwYGuushaQBIqaTA4U4kKMBByEBpp6WLTdQw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ccaBZ5YO; arc=pass smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-59e5eaa491cso6956499e87.0
        for <linux-usb@vger.kernel.org>; Tue, 24 Feb 2026 04:20:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771935602; cv=none;
        d=google.com; s=arc-20240605;
        b=NXNjvsZHGQRfdf4vWW3u2AzJQ2X8bUZRXYbS/ZJHdsiqEG5ocfYNOhHIEn8mJhYiLM
         J3hqrRe+f640Lv1NAVYM4aUArlmOS10Nb5kFFW2SDUkhTI94IczBBpdLmahFifjHOHAC
         hp0JKQeknY7F8n9pIolmvnWSsR/WtwydU9j0/jaEWfoqy8E/T6uJb01W/JoAqYQKH9U1
         wK+ET1QumtDpafEPR+pKHg9EGbfk56FcgKGtI3o5FmsTCk65GN+W7nnSQU2AzIG++EgC
         2+Lw9qZSIB/IDX82XqSEhHqH0sgU13nIXcxq+dizvlnJJ1PFAWqvRd5NtmhOhl4ssm9Q
         obzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZOvcOqJz90w9q8QgLeEZ+fcwzfRg6biuVxHTmPnlKrk=;
        fh=ZtxlJqjoFKydEkeqPRMa3j86zlXh7LSbQa/CXWvhvGg=;
        b=a3NgXNrrLcCsVHK0IHvP8R4VadXl7TmOf3FZO9ZzVzGQygIb5g3TJZDSq93FHogr4t
         mCk2nohOHKPmhBfpdPLPU1Uj3Xp4FGJnrghGQSj2SZi+SYAH1TO4Sk+SJ1RNoiOsxqrw
         Ctq8V/BJtJyNV6Z4w+SuPSOEOVjeQXFvHg85d7duGLM6X830sz/shl0H3KBFGts7Tyyu
         G4XxiV//yyuyFpAu6lb2pfpCOh+dJM/MgBDA0nfpzK2dxr/Z2+I04bd15RpsLZOpxVSv
         g48R6n+wBQxEKge4gCg/xmo4MV7gDmZl5HpIItKrpsHR4EnBXPecRJ14pcCQ7hF8GE1L
         cofg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771935602; x=1772540402; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZOvcOqJz90w9q8QgLeEZ+fcwzfRg6biuVxHTmPnlKrk=;
        b=ccaBZ5YOdbu+KAB5MlhNbPkkK5NgRRE0kD38m9q3QeXictMB3E3tLj74lW6efjeQcg
         /LU0O9P40qJs5GGrA40260VbtNCNu8dtczLXzA4/ymM91o1x8uxNeHpx1llx6Pniwtgb
         wzrHZylInbSaO1M/Q4p6eRI9IOQ50wPaV4Oh4PD6T4+HS0i1At6kIRny9lGKz5MZETKw
         wDl8My0xnL5zK9tw1nDj8gu5AEUieo7Fh7omvdBY4v7JFmXMjg75R2nQkISY6hvpcRRU
         /MXSlOQW+9gSjstwp6Y8K75mGxP/8w0nI/3r8Jf1PQQRiDRTW8YOV9+0kF9G4jXeHIzW
         55fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771935602; x=1772540402;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZOvcOqJz90w9q8QgLeEZ+fcwzfRg6biuVxHTmPnlKrk=;
        b=hYh5nV43hl+wdgk24rzmDGRVv2YS9Cwztkirl22OYkC/z5KXJYwAVVdEelkCCdJDTp
         qUZhMnjbwmCFZaDc3AcZb5xy9rjKu+Dpp+VG2JjXuEKJLRt4FmtF0Fb2evP8rowzB90T
         Yzot+PMSIuRcpkaBTUNGivrcdl+ynBbtOj3e5dhpNbrBlGbbtltU8q7ZQZLtWN5bGYOu
         r9nvPUfNwbst7d3khTIQHHEyBLQqNaCnbwYMw1y4ZWNxTorIARnZcVeeo7hckciZMWHl
         Vy032VowqQdF8cfx0UXzwMXiANxEd9l99rGrBdUFEzSPbd2clxoy4594nu0nVGw5cTVR
         Grjw==
X-Forwarded-Encrypted: i=1; AJvYcCXwpnVa1dVZiMgtQ0pGn89YIamm3gIOSBOTHhVdXPIaoF6EqOeOqYlvVR+SYOy3AF5xQzLDQ6uKXPY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7mn4eAEEzdibtRRRX1v7XVZ9KNpZ6TDdbz0GXJpsNP+aBRWjv
	/TdHEWJaybeTLN8kDiTAGYGdCCPGTtCTAX8DGaLn+uHBusCpu7uvWSF3F58ytwaCxjkC73NamgS
	MiOy/seXyOUFqAB91rDhTNbq6sPaQ+ZI=
X-Gm-Gg: ATEYQzyTaKIIbKIhIesAL++Yb2/cKNuyi7s9Kjyn0uZeGNQ+dUYxYQ80BoSipmimwmP
	RcT2fWWb1IFj+MPO6VumwImWylAPqVQIOVSgWFPDckcKYiACZ4H9+hxJ3RuhdVQTP25sEMlX9tX
	b12LowVhNmGD+F47Lzyn+hyDRqBmFUYnSUcoKm6dsop7ljXp9P0ji3o3KPfW5MO03dkM8I9A/66
	IvxsIZai5eOrCacAGwsi0XTBO3vqXA3a3GR328ZPtMr2YPcuOCdIHkMsHYFVI6GVDGV/CheW+P0
	KF1xK7Pr8Gve6skfxB1efjtVV4dM+O8QuCnKE3KVpPnCrgt6Vko=
X-Received: by 2002:a05:6512:230f:b0:59d:dcd9:73ac with SMTP id
 2adb3069b0e04-5a0ed9a798bmr3979014e87.42.1771935602204; Tue, 24 Feb 2026
 04:20:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260224031909.3546487-1-xu.yang_2@nxp.com>
In-Reply-To: <20260224031909.3546487-1-xu.yang_2@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 24 Feb 2026 09:19:51 -0300
X-Gm-Features: AaiRm52IlpDEEvd2-2SNJFOqNqDwt1rexyZirHla9Ws4CPVXDlvxN5dyhmI6YxQ
Message-ID: <CAOMZO5Br6uEJ5ffq4JCary5p3Di+bF4MDmUtOEdDqpU6xs6VJA@mail.gmail.com>
Subject: Re: [PATCH v2] usb: port: add delay after usb_hub_set_port_power()
To: Xu Yang <xu.yang_2@nxp.com>
Cc: gregkh@linuxfoundation.org, m.grzeschik@pengutronix.de, 
	stern@rowland.harvard.edu, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, jun.li@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-33649-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[festevam@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[8];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,nxp.com:email]
X-Rspamd-Queue-Id: 3B8EC186D90
X-Rspamd-Action: no action

Hi Xu Yang,

On Tue, Feb 24, 2026 at 12:17=E2=80=AFAM Xu Yang <xu.yang_2@nxp.com> wrote:
>
> When a port is disabled, an attached device will be disconnected.  This
> causes a port-status-change event, which will race with hub autosuspend
> (if the disabled port was the only connected port on its hub), causing
> an immediate resume and a second autosuspend.  Both of these can be
> avoided by adding a short delay after the call to
> usb_hub_set_port_power().
>
> Below log shows what is happening:
>
> $ echo 1 > usb1-port1/disable
> [   37.958239] usb 1-1: USB disconnect, device number 2
> [   37.964101] usb 1-1: unregistering device
> [   37.970070] hub 1-0:1.0: hub_suspend
> [   37.971305] hub 1-0:1.0: state 7 ports 1 chg 0000 evt 0002
> [   37.974412] usb usb1: bus auto-suspend, wakeup 1
> [   37.988175] usb usb1: suspend raced with wakeup event         <---
> [   37.993947] usb usb1: usb auto-resume
> [   37.998401] hub 1-0:1.0: hub_resume
> [   38.105688] usb usb1-port1: status 0000, change 0000, 12 Mb/s
> [   38.112399] hub 1-0:1.0: state 7 ports 1 chg 0000 evt 0000
> [   38.118645] hub 1-0:1.0: hub_suspend
> [   38.122963] usb usb1: bus auto-suspend, wakeup 1
> [   38.200368] usb usb1: usb wakeup-resume
> [   38.204982] usb usb1: usb auto-resume
> [   38.209376] hub 1-0:1.0: hub_resume
> [   38.213676] usb usb1-port1: status 0101 change 0001
> [   38.321552] hub 1-0:1.0: state 7 ports 1 chg 0002 evt 0000
> [   38.327978] usb usb1-port1: status 0101, change 0000, 12 Mb/s
> [   38.457429] usb 1-1: new high-speed USB device number 3 using ci_hdrc
>
> Then, port change bit will be fixed to the final state and
> usb_clear_port_feature() can correctly clear it after this period. This
> will also avoid usb runtime suspend routine to run because
> usb_autopm_put_interface() not run yet.
>
> Fixes: f061f43d7418 ("usb: hub: port: add sysfs entry to switch port powe=
r")
> Cc: stable@kernel.org
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

On an imx6x-sdb board, I still get the inconsistency below even after
applying your patch:

# echo 1 >  /sys/bus/usb/devices/1-0\:1.0/usb1-port1/disable
[   20.656414] usb 1-1: USB disconnect, device number 2

# echo 1 >  /sys/bus/usb/devices/1-0\:1.0/usb1-port1/disable
[   28.263516] usb 1-1: new high-speed USB device number 3 using ci_hdrc
[   28.466813] usb 1-1: New USB device found, idVendor=3D0457,
idProduct=3D0151, bcdDevice=3D 1.00
[   28.466949] usb 1-1: New USB device strings: Mfr=3D1, Product=3D2, Seria=
lNumber=3D3
[   28.467039] usb 1-1: Product: USB Mass Storage Device
[   28.467086] usb 1-1: Manufacturer: USBest Technology
[   28.467126] usb 1-1: SerialNumber: 000000000003FF
[   28.501826] usb-storage 1-1:1.0: USB Mass Storage device detected
[   28.510452] usb-storage 1-1:1.0: Quirks match for vid 0457 pid 0151: 80
[   28.517597] scsi host0: usb-storage 1-1:1.0
[   28.524066] usb 1-1: USB disconnect, device number 3

# echo 1 >  /sys/bus/usb/devices/1-0\:1.0/usb1-port1/disable
# [   35.323593] usb 1-1: new high-speed USB device number 4 using ci_hdrc
[   35.526916] usb 1-1: New USB device found, idVendor=3D0457,
idProduct=3D0151, bcdDevice=3D 1.00
[   35.527054] usb 1-1: New USB device strings: Mfr=3D1, Product=3D2, Seria=
lNumber=3D3
[   35.527150] usb 1-1: Product: USB Mass Storage Device
[   35.527198] usb 1-1: Manufacturer: USBest Technology
[   35.527239] usb 1-1: SerialNumber: 000000000003FF
[   35.562024] usb-storage 1-1:1.0: USB Mass Storage device detected
[   35.570430] usb-storage 1-1:1.0: Quirks match for vid 0457 pid 0151: 80
[   35.577562] scsi host0: usb-storage 1-1:1.0
[   36.645798] scsi 0:0:0:0: Direct-Access     Ut163
USB2FlashStorage 0.00 PQ: 0 ANSI: 2

# [   36.682705] sd 0:0:0:0: [sda] 248000 512-byte logical blocks:
(127 MB/121 MiB)
[   36.691645] sd 0:0:0:0: [sda] Write Protect is off
[   36.697915] sd 0:0:0:0: [sda] Asking for cache data failed
[   36.697981] sd 0:0:0:0: [sda] Assuming drive cache: write through
[   36.735520]  sda: sda1
[   36.739376] sd 0:0:0:0: [sda] Attached SCSI removable disk

# echo 1 >  /sys/bus/usb/devices/1-0\:1.0/usb1-port1/disable
[   39.423511] usb 1-1: USB disconnect, device number 4

Please try disabling the port several times in a row.

