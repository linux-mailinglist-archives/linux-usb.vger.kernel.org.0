Return-Path: <linux-usb+bounces-1055-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0A77B73F5
	for <lists+linux-usb@lfdr.de>; Wed,  4 Oct 2023 00:10:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 5132228144E
	for <lists+linux-usb@lfdr.de>; Tue,  3 Oct 2023 22:10:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 155EE3E469;
	Tue,  3 Oct 2023 22:10:15 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BBC53CD13
	for <linux-usb@vger.kernel.org>; Tue,  3 Oct 2023 22:10:12 +0000 (UTC)
Received: from omta36.uswest2.a.cloudfilter.net (omta36.uswest2.a.cloudfilter.net [35.89.44.35])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AFB7CE
	for <linux-usb@vger.kernel.org>; Tue,  3 Oct 2023 15:10:10 -0700 (PDT)
Received: from eig-obgw-5007a.ext.cloudfilter.net ([10.0.29.141])
	by cmsmtp with ESMTP
	id nkHpqToCWMZBknnajqTZe7; Tue, 03 Oct 2023 22:10:09 +0000
Received: from gator3086.hostgator.com ([50.87.144.121])
	by cmsmtp with ESMTPS
	id nnaiqtByjoD58nnaiq6dVk; Tue, 03 Oct 2023 22:10:09 +0000
X-Authority-Analysis: v=2.4 cv=Ou1cdgzt c=1 sm=1 tr=0 ts=651c9141
 a=qMXOcmIMY6YlrKEg1GzxDg==:117 a=QsTHvn2EeHXCImuSLmd++Q==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=bhdUkHdE2iEA:10 a=6kiSLZGAxYIA:10 a=wXneSEFuAAAA:8 a=YQ69X6_B-ZYpiyKuOXwA:9
 a=YVKGGmaMxpnpCiYzuRtG:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sensoray.com; s=default; h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=bZm05ESLdUKPh8jfwUmy/T/TMMoWRQfCEsosd2uflZo=; b=MbriL0DollEhA55/9EQSEz4X56
	1ItO61cOrEtbtHHaK4DHHfjvxLBdC6Tc9uR7CO7/u3JDX9sj+X5CTwDS6ay9wl2zD1meXK8Xsqfai
	Vnq46ojxdPWgjrGFThyzWfvuUHBCSORlJV2Rlfclk6NQ0ZRo3NO/9PhUekvWcTN/6ShA=;
Received: from [50.126.89.90] (port=59016 helo=localhost.localdomain)
	by gator3086.hostgator.com with esmtpa (Exim 4.95)
	(envelope-from <linux-dev@sensoray.com>)
	id 1qnnai-002WZu-5n;
	Tue, 03 Oct 2023 17:10:08 -0500
From: linux-dev@sensoray.com
To: balbi@kernel.org,
	linux-usb@vger.kernel.org
Cc: dean@sensoray.com,
	linux-dev@sensoray.com
Subject: [PATCH] usb/gadget: function fs req_match endpoint address fix
Date: Tue,  3 Oct 2023 15:11:03 -0700
Message-Id: <20231003221103.1607964-1-linux-dev@sensoray.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator3086.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - sensoray.com
X-BWhitelist: no
X-Source-IP: 50.126.89.90
X-Source-L: No
X-Exim-ID: 1qnnai-002WZu-5n
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (localhost.localdomain) [50.126.89.90]:59016
X-Source-Auth: dean@sensoray.com
X-Email-Count: 4
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: c2Vuc29yYXk7c2Vuc29yYXk7Z2F0b3IzMDg2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfP1AlT397t5r4dldxQVhXsyhcivBpO+7G9vo4Ltl8hy25qAm0UB4KUz8ocTs986fENUA3RcQL3HoweqoCJ9nJRkOpWrlKO8a6O3fgCmtBb1Q1RUSj8bf
 ZOU77lMgsKtj5kyMjOxgtbhlzY5Fkx3Y7UKMHDyo2xw9hmL1OvDK5rga5NEvPY/wipcr/xX3mACh2Q9c3rbl2SfY5lGI6Z5T0A8=
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

From: Dean Anderson <linux-dev@sensoray.com>

Fixes f_fs.c handling USB_RECIP_ENDPOINT request types incorrectly for
endpoints not belonging to it. f_fs.c needs to distinguish between IN
and OUT endpoints, not just the endpoint number. Otherwise, f_fs may
handle endpoints belonging to other functions. This occurs in the
gadget/composite.c composite_setup function in the req_match callback.

Signed-off-by: Dean Anderson <linux-dev@sensoray.com>
---
 drivers/usb/gadget/function/f_fs.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index c727cb5de871..fb95ca4aa025 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -71,7 +71,7 @@ struct ffs_function {
 	struct ffs_data			*ffs;
 
 	struct ffs_ep			*eps;
-	u8				eps_revmap[16];
+	u8				eps_revmap[32]; /* 16 in endpoints, 16 out endpoints*/
 	short				*interfaces_nums;
 
 	struct usb_function		function;
@@ -2847,6 +2847,7 @@ static int __ffs_func_bind_do_descs(enum ffs_entity_type type, u8 *valuep,
 		struct usb_ep *ep;
 		u8 bEndpointAddress;
 		u16 wMaxPacketSize;
+		u8 addr;
 
 		/*
 		 * We back up bEndpointAddress because autoconfig overwrites
@@ -2870,8 +2871,9 @@ static int __ffs_func_bind_do_descs(enum ffs_entity_type type, u8 *valuep,
 
 		ffs_ep->ep  = ep;
 		ffs_ep->req = req;
-		func->eps_revmap[ds->bEndpointAddress &
-				 USB_ENDPOINT_NUMBER_MASK] = idx + 1;
+		addr = ((ds->bEndpointAddress & USB_ENDPOINT_DIR_MASK) >> 3)
+			| (ds->bEndpointAddress & USB_ENDPOINT_NUMBER_MASK);
+		func->eps_revmap[addr] = idx + 1;
 		/*
 		 * If we use virtual address mapping, we restore
 		 * original bEndpointAddress value.
@@ -3403,7 +3405,9 @@ static void ffs_func_resume(struct usb_function *f)
 
 static int ffs_func_revmap_ep(struct ffs_function *func, u8 num)
 {
-	num = func->eps_revmap[num & USB_ENDPOINT_NUMBER_MASK];
+	u8 addr = ((num & USB_ENDPOINT_DIR_MASK) >> 3)
+		| (num & USB_ENDPOINT_NUMBER_MASK);
+	num = func->eps_revmap[addr];
 	return num ? num : -EDOM;
 }
 
-- 
2.30.2


