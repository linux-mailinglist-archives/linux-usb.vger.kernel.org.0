Return-Path: <linux-usb+bounces-1316-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7217BEE11
	for <lists+linux-usb@lfdr.de>; Tue, 10 Oct 2023 00:06:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E114A1C20AF8
	for <lists+linux-usb@lfdr.de>; Mon,  9 Oct 2023 22:06:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52B07450CC;
	Mon,  9 Oct 2023 22:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sensoray.com header.i=@sensoray.com header.b="PuDp+cKL"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E6D41239
	for <linux-usb@vger.kernel.org>; Mon,  9 Oct 2023 22:06:32 +0000 (UTC)
Received: from omta38.uswest2.a.cloudfilter.net (omta38.uswest2.a.cloudfilter.net [35.89.44.37])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BC1A99
	for <linux-usb@vger.kernel.org>; Mon,  9 Oct 2023 15:06:31 -0700 (PDT)
Received: from eig-obgw-6009a.ext.cloudfilter.net ([10.0.30.184])
	by cmsmtp with ESMTP
	id pwkpqGMLeytxcpyOUq5AnS; Mon, 09 Oct 2023 22:06:30 +0000
Received: from gator3086.hostgator.com ([50.87.144.121])
	by cmsmtp with ESMTPS
	id pyOUqLuZ8En2cpyOUqjaqW; Mon, 09 Oct 2023 22:06:30 +0000
X-Authority-Analysis: v=2.4 cv=P6MpOwMu c=1 sm=1 tr=0 ts=65247966
 a=qMXOcmIMY6YlrKEg1GzxDg==:117 a=QsTHvn2EeHXCImuSLmd++Q==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=bhdUkHdE2iEA:10 a=6kiSLZGAxYIA:10 a=wXneSEFuAAAA:8 a=cx3T9TuRWzljh2io5AcA:9
 a=YVKGGmaMxpnpCiYzuRtG:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sensoray.com; s=default; h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=I2zUCITexx1BRQQFop4L/T/2Or2BfRe/YRTO6jbwTDo=; b=PuDp+cKLdzvkjk/FjaxqC0qhG1
	DaigeiEwikBcrNAUeZ6gMzpHVYX3Y2RKkLUSm6CslwHbYJcbvOiLi+G1uPfMgb/Ny8ClQzkoGVo0n
	bY0lcL4Rzc27EPLAivE6dR79RXCb9YbsZyDh8IEFYJwmpw2ZSw1lssg7bH/UNF2Y61QA=;
Received: from [50.126.89.90] (port=41400 helo=localhost.localdomain)
	by gator3086.hostgator.com with esmtpa (Exim 4.95)
	(envelope-from <linux-dev@sensoray.com>)
	id 1qpyOT-002v5u-GX;
	Mon, 09 Oct 2023 17:06:29 -0500
From: linux-dev@sensoray.com
To: balbi@kernel.org,
	linux-usb@vger.kernel.org
Cc: dean@sensoray.com,
	linux-dev@sensoray.com
Subject: [PATCH] usb: gadget: function fs req_match endpoint address fix
Date: Mon,  9 Oct 2023 15:06:56 -0700
Message-Id: <20231009220656.2990612-1-linux-dev@sensoray.com>
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
X-Exim-ID: 1qpyOT-002v5u-GX
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (localhost.localdomain) [50.126.89.90]:41400
X-Source-Auth: dean@sensoray.com
X-Email-Count: 1
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: c2Vuc29yYXk7c2Vuc29yYXk7Z2F0b3IzMDg2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfMkxlyxIe8XrrQwuHz7lcxazK8+/kA/gzM+cChXL4ffbBzY3NNT9NojpTt00GVpwWh1Z3uE4W9vxdM6pSkKXs7lCzFL53A1sBkpmN4mulNefTyebGDmi
 TAsr9Wd48pV+uWrhDpJGUlCvoWSkYxrUrikYk0l+AtVKOGItKk+b8ecWx5rFRH55UUYYcjFyXyVOmBXBpkyut+8iJb+dib2GLk0=
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
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
 drivers/usb/gadget/function/f_fs.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index 6e9ef35a43a7..61b4abd6a9df 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -71,7 +71,8 @@ struct ffs_function {
 	struct ffs_data			*ffs;
 
 	struct ffs_ep			*eps;
-	u8				eps_revmap[16];
+	u8				eps_revmap_in[16];
+	u8				eps_revmap_out[16];
 	short				*interfaces_nums;
 
 	struct usb_function		function;
@@ -2843,8 +2844,12 @@ static int __ffs_func_bind_do_descs(enum ffs_entity_type type, u8 *valuep,
 
 		ffs_ep->ep  = ep;
 		ffs_ep->req = req;
-		func->eps_revmap[ds->bEndpointAddress &
-				 USB_ENDPOINT_NUMBER_MASK] = idx + 1;
+		if (ds->bEndpointAddress & USB_ENDPOINT_DIR_MASK)
+			func->eps_revmap_in[ds->bEndpointAddress &
+					USB_ENDPOINT_NUMBER_MASK] = idx + 1;
+		else
+			func->eps_revmap_out[ds->bEndpointAddress &
+					USB_ENDPOINT_NUMBER_MASK] = idx + 1;
 		/*
 		 * If we use virtual address mapping, we restore
 		 * original bEndpointAddress value.
@@ -3371,7 +3376,8 @@ static void ffs_func_resume(struct usb_function *f)
 
 static int ffs_func_revmap_ep(struct ffs_function *func, u8 num)
 {
-	num = func->eps_revmap[num & USB_ENDPOINT_NUMBER_MASK];
+	num = num & USB_ENDPOINT_DIR_MASK ? func->eps_revmap_in[num & USB_ENDPOINT_NUMBER_MASK]
+		: func->eps_revmap_out[num & USB_ENDPOINT_NUMBER_MASK];
 	return num ? num : -EDOM;
 }
 
-- 
2.30.2


