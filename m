Return-Path: <linux-usb+bounces-36123-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CD+yEE9w2Gk5dQgAu9opvQ
	(envelope-from <linux-usb+bounces-36123-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 10 Apr 2026 05:36:47 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BB26F3D1DC2
	for <lists+linux-usb@lfdr.de>; Fri, 10 Apr 2026 05:36:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 419573017790
	for <lists+linux-usb@lfdr.de>; Fri, 10 Apr 2026 03:36:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6323131AF2D;
	Fri, 10 Apr 2026 03:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gz8Zs3Lx"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E187C30AACB
	for <linux-usb@vger.kernel.org>; Fri, 10 Apr 2026 03:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775792174; cv=none; b=jW+j+pADJNm9IFJG04jvWPfH4vvYc/7Wri7+uFYDIPGv7PqgoYe4xcH2yG97GLGg3buBgaquO/lklr3W13YqC6PUhclgxXTciRROoM4Fjy74/7isq0p4B3IIfWqijbkX3/gAjVse3vPlZpQapWPFzwMArVX4YerE2pxrmr39Qc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775792174; c=relaxed/simple;
	bh=AXi7AqNVJp114sJDKP1yyOQJDThQelX6MtTIlrXo0eY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mbWHNmn/9gpL1p4Bj1MrwWeuA444wNsYumQXykIXtJsfh27NFocVahh62W/obzhRkBhpjpklrnNsRTa6zTaKV5TI+qdC6Rz4JNhvmhX8gAQzm5ucJbLXp5QJpHimyavv889anfsvnwtGLKIE/u2yNVF0k4E3ri/M4UAIeU1elOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gz8Zs3Lx; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c76c067bc51so625237a12.0
        for <linux-usb@vger.kernel.org>; Thu, 09 Apr 2026 20:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775792172; x=1776396972; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AXi7AqNVJp114sJDKP1yyOQJDThQelX6MtTIlrXo0eY=;
        b=gz8Zs3LxF4YfbZ/FdARNRoChs52D8t8bQ8dcevqgN5N8AREB5mqq4miXZ1bRwK6kRo
         rKWGSLtoYqz9jQECMLmm9zxqHvncmTBSF14QzMCBdwbK/ESqoVVwtOHcwDlO55P76KPk
         iQezvpHRg/fm4CLP4zrBJSRrGuXsnB3KCP4xsHpKpuHgYxFRBTMqDDc7S9G2hUoD0pRd
         8FYvP3lKk2RFPXTlaLfH2v74EhOG5YmPn5BSCERR6c4xSqeRXwTW15YLKm3r/16hI1Jq
         SGlMJiY5P+2y1RgX67BOF6dgZCMc0anS7tGD5r6G/0ilWx4oct1TsI98cSuGzN9f5fbC
         9Bfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775792172; x=1776396972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AXi7AqNVJp114sJDKP1yyOQJDThQelX6MtTIlrXo0eY=;
        b=q1caNMSTUUxiBvGmCERsoMSi8kVP6dqzqiDWgd1PMv4zmfwdE+hOQyZCZGIPCVQJT6
         ijW0ne4yYPmLpUBm/ha/iSr3dV7hhtiNghlvUX5v+vO6BdeQQyIydidwSJZ6MDCijBGm
         Y8gooapwe2J5+qHaDBARfKlp0iWbe71iYOB/6aepWZo2KZoVP75yoyx+uJ5q6JpteUPG
         pjJW37ALg5c0/Jc3sEbZBtwRjOMzMAkxftQNTasaHpIvadSw0SA5bfpVX7/9YAu44/Hb
         GG0ySaDa/5Xi/e68EYm6fZMlJ4H5HkNKgdC91N4UZwgbyq0lArqFloFfHFKUUQDtkPoj
         FryA==
X-Forwarded-Encrypted: i=1; AJvYcCXnaPQaOGYTIngjP2NB3EmCfxB13EQ73OZ0gaSYbHFHDjuj80RjjBU7SO0bT+AXG8e4akpEmWMaZ2M=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvW2YVLmwMGPnLNaS5tNYMBVHBNBMX6PmugcwBXS8zDbaaWmJH
	6jk1mGP2mypDwL5U8d2gD3tbc2EvCkq42JxKZOF4FkUCqdmmiB/S0DDE
X-Gm-Gg: AeBDiesXDcbnJInISN/1qy69wXLtvKfjsls4g5n773LIPezwXnGa+HOKTifQW6SuyAW
	NGdL23Py+3ZYhHWgUiFipmyU1VFWN/6XsRv+giTN+ESS/6YW2v9qxtK+OKORoXJyo/YyLMg56J+
	33mJylpzRcg/BOBCLHBglwkCS4aGeIyCJu2ScEAuroiRhhazxhzl0dm57+9iXPRl1wZSuGcRSSw
	9abR2UptzVdIoVcZaKSiQZY9WJOnzDQ0PnRyCKYTxMr1H7NNMakljgWpBIMKEtS+5NOZ1A19lg2
	YwkmdlSMflgwYVYMB/M+sePaQixoL7/2Pi0qQY7cjs/q1d4Ckb2bIKyT05UOnupfZj02zRQQQlM
	enpZEIJ0WIdBzW4W9I0YBArV7QGAqb0BohFrzK4OdRlPKdHqSe7UCx6KgF9V8ng6ROUo2Jjg9Nm
	n3/PXl6GnPg+MM13PCbPDDGM8yInUQt7iaCFyMLzqPEmWOjHg=
X-Received: by 2002:a05:6a20:2588:b0:398:a5c7:3dc9 with SMTP id adf61e73a8af0-39fe405dd2amr1706280637.49.1775792172292;
        Thu, 09 Apr 2026 20:36:12 -0700 (PDT)
Received: from mm2dtv06 (61-216-20-61.hinet-ip.hinet.net. [61.216.20.61])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7921a1ef00sm793446a12.28.2026.04.09.20.36.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 20:36:11 -0700 (PDT)
From: xiaoxiao_li <lxxstone@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hminas@synopsys.com,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	lxxstone@gmail.com
Subject: Re: [PATCH] usb: dwc2: exit clock_gating when stopping udc caused deadlock
Date: Fri, 10 Apr 2026 11:36:07 +0800
Message-ID: <20260410033607.3846202-1-lxxstone@gmail.com>
X-Mailer: git-send-email @GIT_VERSION@
In-Reply-To: <2026031116-canine-blimp-94ae@gregkh>
References: <2026031116-canine-blimp-94ae@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.65 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[synopsys.com,vger.kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36123-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lxxstone@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BB26F3D1DC2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Sorry for the unclear explanation.
This is caused by the patch modification ba78c2b3254c usb: dwc2: also exit clock_gating when stopping udc while suspended.

before this patch, the dwc2_gadget_exit_clock_gating was used in the IRQ handler,
and the handler would immediately acquire the lock with a spin_lock upon entering the function.
However, dwc2_gadget_exit_clock_gating do unlocks first and then relocks after done.
This modification is used in a normal flow, causing a deadlock to occur whenever this function is called.

