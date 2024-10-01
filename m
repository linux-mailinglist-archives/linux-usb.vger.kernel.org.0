Return-Path: <linux-usb+bounces-15620-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C4C98C483
	for <lists+linux-usb@lfdr.de>; Tue,  1 Oct 2024 19:32:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F0DF51C235EA
	for <lists+linux-usb@lfdr.de>; Tue,  1 Oct 2024 17:32:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC41E1CCB4B;
	Tue,  1 Oct 2024 17:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hp.com header.i=@hp.com header.b="CjlJY1up"
X-Original-To: linux-usb@vger.kernel.org
Received: from us-smtp-delivery-162.mimecast.com (us-smtp-delivery-162.mimecast.com [170.10.133.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D16E1CC8AD
	for <linux-usb@vger.kernel.org>; Tue,  1 Oct 2024 17:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727803932; cv=none; b=tSN6RGArjiE74l533WRPZqApppQc/K2FWKghJcV2sKNWL4+UHTBpbbkz8+LYiKWIZ7WT+ELBmBZk0bMZNPynkZG0JVU3NdResQjZzTatR1DYDsiLAeOTfWP96brkJcPiDIRwT5EGEkdxfwp6oZxAqD5p64RM23k+KXnyvVUTuLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727803932; c=relaxed/simple;
	bh=FAPTaMdSV48f1tF+9Jpob0UOmt1PtaSVTqw0KNCZCAA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sE0lM6S4CeIPDR3qv3tWsk6X+0f6I1F2loKuoYKjDos/RYY3eXk3HZjDPGGm3LrTo3PfWvnEKmk8jBkHLixhH6jH/GZhPzDhjU+vEMH/KKp2h1yttZRKWRZU53//AOa0S4g8m0sgLusT9KsfTv2PdMGHs8TKMp5lr3Ts/I1cnKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hp.com; spf=pass smtp.mailfrom=hp.com; dkim=pass (1024-bit key) header.d=hp.com header.i=@hp.com header.b=CjlJY1up; arc=none smtp.client-ip=170.10.133.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hp.com; s=mimecast20180716;
	t=1727803928;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n5a6zSq0OG6cvfAemvQqxd1Yqrh9eX3QmCO9Ky3kiRs=;
	b=CjlJY1upt7DsZ49Kdd/KrJZBc1Dsk0swqnSzssa6o5VD0xAzAxX49wCEXeblma4TnWGsUG
	z0pxEn050f91Z2Hj+4t0f0b502iJhDlKRRfnKWybNsOrRuhKunrnBxigrZeYx+pMPlCNNj
	leDbUY0/SujYxwlpHHQVWhaQWBj/GF4=
Received: from g8t13016g.inc.hp.com (hpi-bastion.austin2.mail.core.hp.com
 [15.72.64.134]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-342-UF3Wt5jKM9ucahjbHwHoqg-1; Tue, 01 Oct 2024 13:32:07 -0400
X-MC-Unique: UF3Wt5jKM9ucahjbHwHoqg-1
Received: from g7t14407g.inc.hpicorp.net (g7t14407g.inc.hpicorp.net [15.63.19.131])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by g8t13016g.inc.hp.com (Postfix) with ESMTPS id 9C7DF6000FE9;
	Tue,  1 Oct 2024 17:32:06 +0000 (UTC)
Received: from localhost.localdomain (unknown [15.53.255.151])
	by g7t14407g.inc.hpicorp.net (Postfix) with ESMTP id 236061E;
	Tue,  1 Oct 2024 17:32:04 +0000 (UTC)
From: Alexandru Gagniuc <alexandru.gagniuc@hp.com>
To: gregkh@linuxfoundation.org,
	stable@vger.kernel.org
Cc: qin.wan@hp.com,
	andreas.noever@gmail.com,
	michael.jamet@intel.com,
	mika.westerberg@linux.intel.com,
	YehezkelShB@gmail.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alexandru Gagniuc <alexandru.gagniuc@hp.com>
Subject: [PATCH 6.6 03/14] thunderbolt: Expose tb_tunnel_xxx() log macros to the rest of the driver
Date: Tue,  1 Oct 2024 17:30:58 +0000
Message-Id: <20241001173109.1513-4-alexandru.gagniuc@hp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241001173109.1513-1-alexandru.gagniuc@hp.com>
References: <20241001173109.1513-1-alexandru.gagniuc@hp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: hp.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=WINDOWS-1252; x-default=true

From: Mika Westerberg <mika.westerberg@linux.intel.com>

[ Upstream commit d27bd2c37d4666bce25ec4d9ac8c6b169992f0f0 ]

In order to allow more consistent logging of tunnel related information
make these logging macros available to the rest of the driver.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Signed-off-by: Qin Wan <qin.wan@hp.com>
Signed-off-by: Alexandru Gagniuc <alexandru.gagniuc@hp.com>
---
 drivers/thunderbolt/tunnel.c | 26 +++++---------------------
 drivers/thunderbolt/tunnel.h | 24 +++++++++++++++++++++++-
 2 files changed, 28 insertions(+), 22 deletions(-)

diff --git a/drivers/thunderbolt/tunnel.c b/drivers/thunderbolt/tunnel.c
index c0a8142f73f4..389b8dfc2447 100644
--- a/drivers/thunderbolt/tunnel.c
+++ b/drivers/thunderbolt/tunnel.c
@@ -58,27 +58,6 @@ MODULE_PARM_DESC(bw_alloc_mode,
=20
 static const char * const tb_tunnel_names[] =3D { "PCI", "DP", "DMA", "USB=
3" };
=20
-#define __TB_TUNNEL_PRINT(level, tunnel, fmt, arg...)                   \
-=09do {                                                            \
-=09=09struct tb_tunnel *__tunnel =3D (tunnel);                  \
-=09=09level(__tunnel->tb, "%llx:%u <-> %llx:%u (%s): " fmt,   \
-=09=09      tb_route(__tunnel->src_port->sw),                 \
-=09=09      __tunnel->src_port->port,                         \
-=09=09      tb_route(__tunnel->dst_port->sw),                 \
-=09=09      __tunnel->dst_port->port,                         \
-=09=09      tb_tunnel_names[__tunnel->type],=09=09=09\
-=09=09      ## arg);                                          \
-=09} while (0)
-
-#define tb_tunnel_WARN(tunnel, fmt, arg...) \
-=09__TB_TUNNEL_PRINT(tb_WARN, tunnel, fmt, ##arg)
-#define tb_tunnel_warn(tunnel, fmt, arg...) \
-=09__TB_TUNNEL_PRINT(tb_warn, tunnel, fmt, ##arg)
-#define tb_tunnel_info(tunnel, fmt, arg...) \
-=09__TB_TUNNEL_PRINT(tb_info, tunnel, fmt, ##arg)
-#define tb_tunnel_dbg(tunnel, fmt, arg...) \
-=09__TB_TUNNEL_PRINT(tb_dbg, tunnel, fmt, ##arg)
-
 static inline unsigned int tb_usable_credits(const struct tb_port *port)
 {
 =09return port->total_credits - port->ctl_credits;
@@ -2382,3 +2361,8 @@ void tb_tunnel_reclaim_available_bandwidth(struct tb_=
tunnel *tunnel,
 =09=09tunnel->reclaim_available_bandwidth(tunnel, available_up,
 =09=09=09=09=09=09    available_down);
 }
+
+const char *tb_tunnel_type_name(const struct tb_tunnel *tunnel)
+{
+=09return tb_tunnel_names[tunnel->type];
+}
diff --git a/drivers/thunderbolt/tunnel.h b/drivers/thunderbolt/tunnel.h
index bf690f7beeee..750ebb570d99 100644
--- a/drivers/thunderbolt/tunnel.h
+++ b/drivers/thunderbolt/tunnel.h
@@ -137,5 +137,27 @@ static inline bool tb_tunnel_is_usb3(const struct tb_t=
unnel *tunnel)
 =09return tunnel->type =3D=3D TB_TUNNEL_USB3;
 }
=20
-#endif
+const char *tb_tunnel_type_name(const struct tb_tunnel *tunnel);
+
+#define __TB_TUNNEL_PRINT(level, tunnel, fmt, arg...)                   \
+=09do {                                                            \
+=09=09struct tb_tunnel *__tunnel =3D (tunnel);                  \
+=09=09level(__tunnel->tb, "%llx:%u <-> %llx:%u (%s): " fmt,   \
+=09=09      tb_route(__tunnel->src_port->sw),                 \
+=09=09      __tunnel->src_port->port,                         \
+=09=09      tb_route(__tunnel->dst_port->sw),                 \
+=09=09      __tunnel->dst_port->port,                         \
+=09=09      tb_tunnel_type_name(__tunnel),=09=09=09\
+=09=09      ## arg);                                          \
+=09} while (0)
=20
+#define tb_tunnel_WARN(tunnel, fmt, arg...) \
+=09__TB_TUNNEL_PRINT(tb_WARN, tunnel, fmt, ##arg)
+#define tb_tunnel_warn(tunnel, fmt, arg...) \
+=09__TB_TUNNEL_PRINT(tb_warn, tunnel, fmt, ##arg)
+#define tb_tunnel_info(tunnel, fmt, arg...) \
+=09__TB_TUNNEL_PRINT(tb_info, tunnel, fmt, ##arg)
+#define tb_tunnel_dbg(tunnel, fmt, arg...) \
+=09__TB_TUNNEL_PRINT(tb_dbg, tunnel, fmt, ##arg)
+
+#endif
--=20
2.45.1


