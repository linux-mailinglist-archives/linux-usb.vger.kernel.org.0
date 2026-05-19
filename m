Return-Path: <linux-usb+bounces-37661-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KOnFLXsSDGoZVQUAu9opvQ
	(envelope-from <linux-usb+bounces-37661-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 09:34:19 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 209B15792A7
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 09:34:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8E81F3088465
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 07:28:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED3CA3D5652;
	Tue, 19 May 2026 07:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ENwAfkcN"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yx1-f65.google.com (mail-yx1-f65.google.com [74.125.224.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CFFA3D47AA
	for <linux-usb@vger.kernel.org>; Tue, 19 May 2026 07:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779175707; cv=pass; b=OTM+sEE3BSYj4cah/Sqn0C5M+DDytGR5z33U9luSXUjM4ZuN8UGPgd86ZlTAPXg51Kv/txNgNJ+dIn68Lgr0bjVsf+MvzELZspluTc6PwA5vc+Of/01S8gnK8lf+Z7FlrKkE55HXmWSziPy6sXdmipAO2eSqUYgCQwuRhu2tDjU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779175707; c=relaxed/simple;
	bh=bu8+8++W0thPa+EvMJjVRJPXFzR/ng7fO3IX1U0JNOg=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=E+fF1Np1Nt/c2YxOKApLNKLLP0m06mygnFe2hJwTtLPa/HPASgak0RWhk8HCbmcpJBL+IYMgUTL8ZcfhNndAGz70R7h3Giv7lUyKzm94M+zPOQVeJO7yi8WOm+97dNLHMjUDTJwYud68Hzj/8VukFoFlgO24izzG4nMbgaInCdM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ENwAfkcN; arc=pass smtp.client-ip=74.125.224.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f65.google.com with SMTP id 956f58d0204a3-65c7492a2ceso2682628d50.3
        for <linux-usb@vger.kernel.org>; Tue, 19 May 2026 00:28:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779175705; cv=none;
        d=google.com; s=arc-20240605;
        b=UT7yBSCw/OCn2bA4990jbDE3F+PdG6m8UkBJ68XD7EsPozccDdF0xe0fcJHG3Znr1X
         kJg5L3rK5cwIDuXixh768SEo1eLQmFC6m1OMPONFqAAjkThpFCh9/4tG5LN8KcSed/iE
         IpWAnb89WzfmEPTOcJNiQ0SpiajQkaSy/5nDPhaOx5Lv285fyXVdHL3802prIRDSpDpT
         ma5rSbpgCbMYDm1HqXLfL6Hn+ChRrGXBe4Iecwgxcx8EJRFU4KTq8Pd3PpA1Pxb1kTGm
         3puj7Hpy93ttyKl2n1OoW4Q4XBv7IHBI5XLkJZ/VeCg+kYxX2Z0zqHbiOGPHvCEpYEhv
         6JTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=bu8+8++W0thPa+EvMJjVRJPXFzR/ng7fO3IX1U0JNOg=;
        fh=YxTAajf7j7ouvzr0Ytf74j3/Ww006UV8NeAIf1BhVLw=;
        b=PiIM/18HFO0Q7hZN7EJ79n2As1Q8IfwdUJWzrFowEoguJKOtRrayT+2veoU7CRszUN
         gfCQJDsT7Vc+fKt/4FAWKCUD57c1tYlnKq2UFZ+03rx4qa72ylNjEqDllmFo3b4kCNAc
         iCHnLuqC65mlNCGOmLRqC4Wtp2jgFhFdUmt+6WzLSpOGFSa4D7jvbG0O+kbSXGAQppmN
         mm1ZF0RhwTab1EozUKO/s2w5VxM4vI9d6oVBdrEebuqSUnOf50u0ocGSC57LiMXMPr/2
         WSGpMAI41xh79g6udIZ+lsHRWgBf6fWClXmD0FwEDyd52+1NMGY1G1ZiUGmQXnRTGjbq
         mWtw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779175705; x=1779780505; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bu8+8++W0thPa+EvMJjVRJPXFzR/ng7fO3IX1U0JNOg=;
        b=ENwAfkcN4OtlquDJoYgfeOHCAYKCkJ5zgHSdd7L/sIjB2OVOJK3zr/aSBuqED+54u2
         XMeQn7iwlZ/Q627BxERXfieQfYcgYUnHdFz/DxiFP/GdumhJGjIwP7pTpoiKqLjvZZ2P
         GKSUDFi76N8NxwhsoURx9POrsRQ1LBjoLPrc4wOtP/B4KWWzGd+jX3EtdGl1vxs5IxGX
         pe/TJZihnMztRjGX0b6Mx54eLehtaaS6TnssKyyHXNrSg0tqqXD4dJuH+3L1vG58SEUZ
         lsokb4J1Q/BQ2WXxmP8YKcFRAmap+UNTB3MEEngIVSVM6uj9Rg7lWkDXDrvngq1iAIpJ
         mthw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779175705; x=1779780505;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bu8+8++W0thPa+EvMJjVRJPXFzR/ng7fO3IX1U0JNOg=;
        b=LHffQF8z7SGyxv8Bd2DQk7t/15GCFcctupzCOuO1BBJ2qgZa3wcJx9u9BMAk5dKW9r
         9z8Q6UpUcAF+0w6cv5xfz4d5bhyBoiuh+kHTBIsP6lSEtMhdkWgMpm2TTdTr31ZpbkXm
         Af4tfkSXMrT3oq9zEC0PjefimHohAGo3afQUrGbVxNiqss2jnIX3tO1VlWzH2jRLweTd
         xN72LvuMmsIDR4O2P9NPIBgHUr+11FHU3wJEYRC0o5XvsejunZdMkH320gBYG1vnaMTv
         8Sdzw1i84tPbIwzGaJetl5pr2/aV4OHDct+CxXex7YTxx2L3X1gxMSav2w7uvXfBJxkW
         QmVg==
X-Forwarded-Encrypted: i=1; AFNElJ9suofXWM2f8nizYXWrJBuXjMGdXHk7kykDvfFHZQgLkj1cx7HmKVHUR8GgWGtXwCFlVgPFxCLotG4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyE2c6TyW0mU3Vvd9Nsava5eiAc60k3pE3S0Qe8pH77anBgllm7
	WO57bDPgJJLM19uwZ2hDfwZpeI0ZOuYg+immpc6xlV4yW7fn9wz/nTnphe2qQwx+iLrrt2ll4fg
	c8RWYaoleG2dqOF+TkdrYSr/7VviGVSc=
X-Gm-Gg: Acq92OFK6KOqF1PHOeMNcijlmy0pQ1b9OJRZR03/gwyzwiJ2Y3H36MOBIRKy94BwI1s
	rGor4kniCRCv5U+R0b68BJVmaWnSzALaY3fXBF3XUtyKuewQjbEkF+PzpdX12akRopFJjKeJOzz
	7eOqCybV4mRqsxE1pJ0mhNukuSk2obuPdjGU9MogS/5EkS5rFyQVMW2vpRQG/H5ti2yxYzZr0ux
	YMIScz4BFSlVO8wKYvVWuVc1Cb9M0jSlLBApi/Rt/Q+icnRYE5kNT5Yyv88bt4NDvnuXauLBLAE
	BFyFlECCM37O54GXN/4=
X-Received: by 2002:a05:690e:12c7:b0:65e:55bb:d5e8 with SMTP id
 956f58d0204a3-65e55bbff6cmr7067567d50.64.1779175705266; Tue, 19 May 2026
 00:28:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Ivanl S <shaoxul@gmail.com>
Date: Tue, 19 May 2026 15:28:14 +0800
X-Gm-Features: AVHnY4IMoy0BWe_phiQP8JauzMmWHHN0vkroO6OQSlOs3l8UCBvV4zvpwcRc3sc
Message-ID: <CANwjiYaL1WLBoPxy6QrhpXOUef_P6q-RHwE5EvFHU0AdPUs+cA@mail.gmail.com>
Subject: [PATCH] Add power management op for RNDIS host
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: "GitAuthor: Shaoxu Liu" <shaoxul@gmail.com>, linux-usb@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37661-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shaoxul@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-usb,netdev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 209B15792A7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From bf417c9c1c22f8d335ec361d6fb5759fd167733a Mon Sep 17 00:00:00 2001
From bf417c9c1c22f8d335ec361d6fb5759fd167733a Mon Sep 17 00:00:00 2001
From: Shaoxu Liu <shaoxu.liu@telit.com> Date: Tue, 19 May 2026
13:49:06 +0800 Subject: [PATCH] Add power management op for RNDIS host
RNDIS host does not manage the USB power, and it will cause more power
consumption even when no data transferring. Adding the power
management operator will make the USB enter suspend mode when no data
transferring. --- drivers/net/usb/rndis_host.c | 16 ++++++++++++++++ 1
file changed, 16 insertions(+) diff --git
a/drivers/net/usb/rndis_host.c b/drivers/net/usb/rndis_host.c index
7b3739b29..76eb65fd5 100644 --- a/drivers/net/usb/rndis_host.c +++
b/drivers/net/usb/rndis_host.c @@ -630,6 +630,17 @@ static const
struct driver_info zte_rndis_info = { .tx_fixup = rndis_tx_fixup, };
+static const struct driver_info rndis_info_lowpower = { +
.description = "RNDIS device", + .flags = FLAG_ETHER |
FLAG_POINTTOPOINT | FLAG_FRAMING_RN | FLAG_NO_SETINT, + .bind =
rndis_bind, + .unbind = rndis_unbind, + .status = rndis_status, +
.rx_fixup = rndis_rx_fixup, + .tx_fixup = rndis_tx_fixup, +
.manage_power = usbnet_manage_power, +}; +
/*-------------------------------------------------------------------------*/
static const struct usb_device_id products [] = { @@ -657,6 +668,11 @@
static const struct usb_device_id products [] = { /* RNDIS is MSFT's
un-official variant of CDC ACM */ USB_INTERFACE_INFO(USB_CLASS_COMM, 2
/* ACM */, 0x0ff), .driver_info = (unsigned long) &rndis_info, +}, { +
/* RNDIS for Telit Cinterion low power LTE cat1biz modules LE310X1*/ +
USB_DEVICE_AND_INTERFACE_INFO(0x1bc7, 0x7030, +
USB_CLASS_WIRELESS_CONTROLLER, 1, 3), + .driver_info = (unsigned
long)&rndis_info_lowpower, }, { /* "ActiveSync" is an undocumented
variant of RNDIS, used in WM5 */ USB_INTERFACE_INFO(USB_CLASS_MISC, 1,
1), -- 2.25.1 Signed-off-by: Shaoxu Liu <shaoxul@gmail.com>

