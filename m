Return-Path: <linux-usb+bounces-2009-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8924B7D17C0
	for <lists+linux-usb@lfdr.de>; Fri, 20 Oct 2023 23:08:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8A0D01C21067
	for <lists+linux-usb@lfdr.de>; Fri, 20 Oct 2023 21:08:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7860249FC;
	Fri, 20 Oct 2023 21:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JQpI4Xq9"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7532B753
	for <linux-usb@vger.kernel.org>; Fri, 20 Oct 2023 21:08:19 +0000 (UTC)
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D837F10C3
	for <linux-usb@vger.kernel.org>; Fri, 20 Oct 2023 14:08:17 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-5859a7d6556so980222a12.0
        for <linux-usb@vger.kernel.org>; Fri, 20 Oct 2023 14:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1697836097; x=1698440897; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Zu77mdO6sktTxTIEryyom1thHcuDOj/hZWn2X42FV4=;
        b=JQpI4Xq9/jEHrkcm4kJXBDeVRXV60Kerc9XYCSkWFo/LCREekDsJ3DWHm+24nd8KvB
         Lek83Q1Ofp5psUDEumOfu0j+LhCgvU3+DRgrLO/GPOholqm38o1ALoJWgeBIL6Adptcr
         TqLqCMKSbvugU36vN0YCUdzt9neldBO19oHTU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697836097; x=1698440897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Zu77mdO6sktTxTIEryyom1thHcuDOj/hZWn2X42FV4=;
        b=MxU7UqeX6IMBwBcZJG5wiJcI6xd6/XyxvyO9mpMdDhgUm9Z/Pnhk9fyJx3IQyAjHT1
         OxdwOKzVpjtbtM/cUVjFYRaCvTzBRv4RFNsretuViUKswvZLzIoSgz7UDFz8z3paEetd
         nuQ8r9/Y3gbjF9KJg3HiWIiSkYhqlgiPEOZ8Wqj8baEgkhtr96/PPopC5JyoNuHJoc43
         HJJFyxsqlhuRKSzWbK7bvbX/YZr8VOULepQfIu3ktIASm/qy/EWptr8BgwtAmzVferJs
         u2tH0jdlKAta1gsRVw9UNt/2vY6KPEzYt26gqaLt0plyU2NgBJClrZ2jgTd7DPi1Vart
         ltTw==
X-Gm-Message-State: AOJu0YyFLTpYi+z5KqYFXsKONb5FWcBZRacBnDGjkAUpd76LXgciH/4L
	XZc3P1aDsSO+Rvyaly5WAmHz0w==
X-Google-Smtp-Source: AGHT+IFmPo0a3BDvOdl9WUSCn87DM1UjGRco3v8oKH5WLNOwecmjVvp8jXBxPaM4fCiQi2q65KUipg==
X-Received: by 2002:a05:6a20:7288:b0:13a:6bca:7a84 with SMTP id o8-20020a056a20728800b0013a6bca7a84mr3339806pzk.44.1697836097385;
        Fri, 20 Oct 2023 14:08:17 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:c078:ee4f:479f:8486])
        by smtp.gmail.com with ESMTPSA id w14-20020aa7954e000000b00686b649cdd0sm1969278pfq.86.2023.10.20.14.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 14:08:16 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Jakub Kicinski <kuba@kernel.org>,
	Hayes Wang <hayeswang@realtek.com>,
	"David S . Miller" <davem@davemloft.net>
Cc: Edward Hill <ecgh@chromium.org>,
	Laura Nao <laura.nao@collabora.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Simon Horman <horms@kernel.org>,
	linux-usb@vger.kernel.org,
	Grant Grundler <grundler@chromium.org>,
	Douglas Anderson <dianders@chromium.org>,
	=?UTF-8?q?Bj=C3=B8rn=20Mork?= <bjorn@mork.no>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Prashant Malani <pmalani@chromium.org>,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH v5 4/8] r8152: Release firmware if we have an error in probe
Date: Fri, 20 Oct 2023 14:06:55 -0700
Message-ID: <20231020140655.v5.4.I5cd5dd190df0826e38444df217f63918a8b4ad39@changeid>
X-Mailer: git-send-email 2.42.0.758.gaed0368e0e-goog
In-Reply-To: <20231020210751.3415723-1-dianders@chromium.org>
References: <20231020210751.3415723-1-dianders@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The error handling in rtl8152_probe() is missing a call to release
firmware. Add it in to match what's in the cleanup code in
rtl8152_disconnect().

Fixes: 9370f2d05a2a ("r8152: support request_firmware for RTL8153")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v5:
- ("Release firmware if we have an error in probe") new for v5.

 drivers/net/usb/r8152.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
index d10b0886b652..656fe90734fc 100644
--- a/drivers/net/usb/r8152.c
+++ b/drivers/net/usb/r8152.c
@@ -9786,6 +9786,7 @@ static int rtl8152_probe(struct usb_interface *intf,
 	cancel_delayed_work_sync(&tp->hw_phy_work);
 	if (tp->rtl_ops.unload)
 		tp->rtl_ops.unload(tp);
+	rtl8152_release_firmware(tp);
 	usb_set_intfdata(intf, NULL);
 out:
 	free_netdev(netdev);
-- 
2.42.0.758.gaed0368e0e-goog


