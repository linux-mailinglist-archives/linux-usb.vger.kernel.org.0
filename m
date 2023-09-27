Return-Path: <linux-usb+bounces-647-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E5F7B0716
	for <lists+linux-usb@lfdr.de>; Wed, 27 Sep 2023 16:37:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 9AA072827F6
	for <lists+linux-usb@lfdr.de>; Wed, 27 Sep 2023 14:37:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94F7014292;
	Wed, 27 Sep 2023 14:37:44 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEAFE1854
	for <linux-usb@vger.kernel.org>; Wed, 27 Sep 2023 14:37:42 +0000 (UTC)
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6739E139;
	Wed, 27 Sep 2023 07:37:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695825448; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=aAN5wK8mJcjRahrM9xpdrkrWJEK2xbuAfUOeXKDvIocLvYMrkqV1wrk2Cnu6BrAL6jR/MdFgWxNe5lCcUcUnkMvAtaOg/HP2Y9JZ1tC97F9gQkFDpWzJpwkNMXpIFGNA/ZEPXyFFGH2qmZ1SAgNDqQSbDEc+wdBhily4TwYChPU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1695825448; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ymOqUCZg1zNUB8SXIxzMtO2Mq3I3I9p64qCNhj72OWk=; 
	b=MStKIM26lk1ocKnWXLx6e32UnrryizN3EyMaFuFCuVBySsyCasK8TGb0EjO2BlGCZbVg0p2fD/K47QR+rLAUnqf8LX+skexLklztCjrZyi6VRqF4qNAFGKIYKIA59pf/dC6mAGI12I8kI8fvpK6MbejCXix1zau1KGiVpwYAPhs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=marliere.net;
	spf=pass  smtp.mailfrom=ricardo@marliere.net;
	dmarc=pass header.from=<ricardo@marliere.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1695825448;
	s=zmail; d=marliere.net; i=ricardo@marliere.net;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=ymOqUCZg1zNUB8SXIxzMtO2Mq3I3I9p64qCNhj72OWk=;
	b=uGpirVJpVIlKrNgA2Olrh9QR6VuMjJfMyo2gbKBMREz70KgEpLDF3XTyu0r9BX7t
	nNpIgldgENqlMsOSxFkegICUPRtx97ZaWu8KYcjMlNfIqeRxhIOVvYfdFhmGiTavBCt
	BuPpLJsddzw/4X76+J8JYFAow1TIhdCHY+2bDLXk=
Received: from localhost (177.104.93.54 [177.104.93.54]) by mx.zohomail.com
	with SMTPS id 1695825447125886.5405244262054; Wed, 27 Sep 2023 07:37:27 -0700 (PDT)
Date: Wed, 27 Sep 2023 11:37:20 -0300
From: "Ricardo B. Marliere" <ricardo@marliere.net>
To: syzbot <syzbot+621409285c4156a009b3@syzkaller.appspotmail.com>
Cc: isely@pobox.com, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-usb@vger.kernel.org, mchehab@kernel.org, pvrusb2@isely.net, 
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [pvrusb2?] [usb?] KASAN: slab-use-after-free Read in
 pvr2_context_set_notify
Message-ID: <gugiuvjgpoogf3k5cm4px4jwevg5torsu3d7afbbhvnrxho4zu@wkcxeb5sr5ez>
References: <000000000000a02a4205fff8eb92@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="exir5lirupkd3ozp"
Content-Disposition: inline
In-Reply-To: <000000000000a02a4205fff8eb92@google.com>
X-Zoho-Virus-Status: 1
X-ZohoMailClient: External
X-Spam-Status: No, score=0.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SORTED_RECIPS,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net


--exir5lirupkd3ozp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

#syz test: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git ce9ecca0238b140b88f43859b211c9fdfd8e5b70

--exir5lirupkd3ozp
Content-Type: text/x-patch; charset=us-ascii
Content-Disposition: attachment; filename=patch

diff --git a/drivers/media/usb/pvrusb2/pvrusb2-context.c b/drivers/media/usb/pvrusb2/pvrusb2-context.c
index 14170a5d72b3..e3356f94e50e 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-context.c
+++ b/drivers/media/usb/pvrusb2/pvrusb2-context.c
@@ -27,9 +27,16 @@ static int pvr2_context_cleaned_flag;
 static struct task_struct *pvr2_context_thread_ptr;
 
 
+static int pvr2_context_shutok(void)
+{
+	return pvr2_context_cleanup_flag && (pvr2_context_exist_first == NULL);
+}
+
+
 static void pvr2_context_set_notify(struct pvr2_context *mp, int fl)
 {
 	int signal_flag = 0;
+	if (pvr2_context_shutok()) return;
 	mutex_lock(&pvr2_context_mutex);
 	if (fl) {
 		if (!mp->notify_flag) {
@@ -140,12 +147,6 @@ static void pvr2_context_check(struct pvr2_context *mp)
 }
 
 
-static int pvr2_context_shutok(void)
-{
-	return pvr2_context_cleanup_flag && (pvr2_context_exist_first == NULL);
-}
-
-
 static int pvr2_context_thread_func(void *foo)
 {
 	struct pvr2_context *mp;

--exir5lirupkd3ozp--

