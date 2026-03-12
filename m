Return-Path: <linux-usb+bounces-34715-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GDxlHokzs2ntSwAAu9opvQ
	(envelope-from <linux-usb+bounces-34715-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 22:43:37 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DF83B27A1FD
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 22:43:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2FE51318725B
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 21:42:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 205403F0ABC;
	Thu, 12 Mar 2026 21:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E+Gt6j6v"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E8D03F0768
	for <linux-usb@vger.kernel.org>; Thu, 12 Mar 2026 21:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773351770; cv=pass; b=Pew537xZ+8pRqTjO5vY8oZk5DOl3gGHZJG3v5EFA0/8wlCrjZCdF3lCir0WBFyq9VK6YvvFReMA6/eAMC/JojwXmEwHbWJrLcYNOO5JOkDRmrDwjbbxuFtdrOCHyou03FfSw65uBWOaybSYO24C2GYr2STViw4RcbsL8AEz1qrc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773351770; c=relaxed/simple;
	bh=RcARsbD3X5Ve8NxMdSBCwo9hyEgFWZ8HNihyXfTRSkA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=owCtbrWBCaCfv+622zngSeKpoVEJ9Npux8sCENeR/Mz/qWgUK/0PE3pURyO82hlwvJEuzwFdwpG91lMfVUAyQGQvkXXu9XtA0NEvdLrb7aKwHMp+ixT4XAm9sxQdHyFjDmn2PICVDdS6LEZYPBgB7pgmaQLASC3gr3BjBFHLbVI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E+Gt6j6v; arc=pass smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-67bb17938d5so1113045eaf.1
        for <linux-usb@vger.kernel.org>; Thu, 12 Mar 2026 14:42:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773351768; cv=none;
        d=google.com; s=arc-20240605;
        b=kr02aD1UTs19GOuErmXgWxBmak0exKEAlmrISPbMV63JxMongkVkdajkIPzfjEcx+M
         1+fXhlyGJKv1MB0JM+IuwQt36ob/iwZNK7lFF3V63UcBBN7ao+N3bxtdjUNVpSmiblcl
         83sRTNeb60pvO4adcLdBYB4Hoq/xLlSmpBrqGLmb1Bxbl+R+Q/JOKeF3J+FV8xYMGN9Y
         g9yflrp8KWFpY1AvFDtukc+4Kr9JqBMlrpnHMBEfmU/FRa/1sDSpkmbeyckSrEOV3uAG
         JjTXFam5+O+pBIUWXW60QS/NLg+KM1m/fPZa8H190bWOEo8v0Cf4XECgY5uvzzq2jOHa
         Z/Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=P7q9V/f3Yk57FFVndjsG5cSBKz/deygCR5HNCS5o+ks=;
        fh=hNQ6fdDUCMJqXvPWEyN8HMRDMwg76/LnkBrPgOb3dmM=;
        b=GknN5O/QNsJimoAD7HEjYMipuB1kk/4CJaLX12pWdv5Js8KXbJiU9cbAOq7IDZ8NLf
         JDSo5cbSlksHdBX9VfEt2hptt5WlqJcJftM5xtFuaPTYRTIzsj9PutwlJib70jeECpuG
         yZYwLQFpD8H+wxnszCfrsneVbNe3h1o4GI6HO/m/PgV39g/SOQS0cvDbWcIvUyjmjPgV
         hT/a3blf4Mdrws0uo1YXBd/fwiXlWP0riP11dtkP8XJ9d4J282tyboJgpdmA5b0UyCQK
         1/LuX9YUpvEh/inZ6IB4xFhaDZSJwqiFse5wBzqmboZffR5s7gFj9C2Y2DRXuB4Csr8V
         kNCg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773351768; x=1773956568; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=P7q9V/f3Yk57FFVndjsG5cSBKz/deygCR5HNCS5o+ks=;
        b=E+Gt6j6vynb2g69OtFHrHy6LM3UM9D0vOovYY4ASXGIivxpsMT+gq4sKZlHs9AIu77
         ukmH39QbIt74go4VNy/vjfKgzKOZdFBlSkvoRJVHv9TQoagOLV/tXZosBAt7mHWhiIkR
         wWqcb8TrUAi2tUYwh5QUPHpXLpycxY/jhlwChBobnxBtXDmiqtVw/FH67UCKHgiCj/0H
         KVhP/7MOmoOnRa4vxgDNfNRSVgMFvV+yJ6FTHJUirfPld+4bwEU7BvUtpxazGygIyNKb
         JlIjnN4pXY3J1LGDMgMCgYAJf2DVcTi6rxygQHV5lnqw/aLcx0kkPqC8xUmOiseUUdCU
         SuPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773351768; x=1773956568;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P7q9V/f3Yk57FFVndjsG5cSBKz/deygCR5HNCS5o+ks=;
        b=AcZYSz+bSdfhGweu29sqNvWoLWHDS8IF6xA0oPklslXRf7u4wqjvCCru8Ok+yj7e/o
         OBTSmRANptjqmG1OwcA7gt7KWXGMsXvTJVKS1P7ml868hrcfsu5Op+AJfjJcwcjD9c8k
         reKC6FDZNs8BMmfkipuQIIIOK8dVh32pqbgrYnAKQoLvFWPS+otZzPjVcQvTK6U1iADK
         eogwu58vEFhc2+uOdvYfm8Iyt9K82jVTtk7Ch9Ui0o1qoKxJ/wmOq4ScTyXT5TGbCF5z
         /Qtx7LmmvAFEvPp0Lv5XdAEvTbG4sUq4QyhkNwZL7UhR8AngvSt/dm7YMQawPUFly4/c
         XrMQ==
X-Gm-Message-State: AOJu0YzMWfBlI887bZCZB79ZAoD5bYEVOKxRL5WIMSt5zHvCfVy3kzW5
	Mic3b/3Kx+/b3u2Pxva/HjmztzF1xmvcTCi+B8TRfZHDXw/YjN6FrD2O7caUzmhkPcy5FiOEv9D
	BuItC1Wy8VBMwduRfnlz2UYZPkCZCbkHrijEn
X-Gm-Gg: ATEYQzySwgPB+UQpfl4mI6gr4dXO+gEbV2PuJFoklLra0ZhaKV87cZQLvSXFByB5PJL
	sd/7wqFe+/UbIw5IL/bvi4W9KlZGBgQw62cMpUb0RGiXMMYVQG4ujbuOVrcCf3Byqxabm8ICdpI
	gssGJFxKJKCn7zHFiXh5IUdhlzFQWtxJ8Z7zpfLuyT5+NOLxo8zs0GnoLqd8MTrXyvpKoBV9PsW
	dmi2BxzWRzOBbcWIdNkNQnBFghPBGP79clokC/vlHctcv5gYVUQzoDSUq79lrCmZ++xWBxhZC+6
	DZYaAsuMTw0TdkHg2dOXUT4KXAuo5YQddfV4Nx7gc6IyRRncjk/FJ1bb85Itb2RNf390eg==
X-Received: by 2002:a05:6820:821:b0:674:4a89:d824 with SMTP id
 006d021491bc7-67bda98c883mr685118eaf.2.1773351768400; Thu, 12 Mar 2026
 14:42:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: John S <xaum.io@gmail.com>
Date: Thu, 12 Mar 2026 22:42:35 +0100
X-Gm-Features: AaiRm53wep7_NMeuuJJuJv8YuZc1Bd-Bij4KHBUI9UbQ7vVR0UrQBWcWQOVj5Zo
Message-ID: <CAAZVx98RyzO+Pdqt+w-4QWyefbgmAKzzSYkVHZV9x=GiTW-GfQ@mail.gmail.com>
Subject: [PATCH] usb: typec: add kernel-doc for priority and mode_selection members
To: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-34715-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xaumio@gmail.com,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	FREEMAIL_FROM(0.00)[gmail.com]
X-Rspamd-Queue-Id: DF83B27A1FD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document the priority and mode_selection members of struct
typec_altmode that were added without kernel-doc descriptions.

This fixes the following warnings when building with W=1:

  include/linux/usb/typec_altmode.h: struct member 'priority' not
described in 'typec_altmode'
  include/linux/usb/typec_altmode.h: struct member 'mode_selection'
not described in 'typec_altmode'

Signed-off-by: Kit Dallege <xaum.io@gmail.com>
---
 include/linux/usb/typec_altmode.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/usb/typec_altmode.h
b/include/linux/usb/typec_altmode.h
index 0513d333b797..c7cfc4629484 100644
--- a/include/linux/usb/typec_altmode.h
+++ b/include/linux/usb/typec_altmode.h
@@ -26,6 +26,8 @@ struct typec_altmode_ops;
  * @mode: Index of the Mode
  * @vdo: VDO returned by Discover Modes USB PD command
  * @active: Tells has the mode been entered or not
+ * @priority: Numeric priority for alternate mode selection ordering
+ * @mode_selection: Indicates support for the mode selection feature
  * @desc: Optional human readable description of the mode
  * @ops: Operations vector from the driver
  * @cable_ops: Cable operations vector from the driver.
--
2.53.0

