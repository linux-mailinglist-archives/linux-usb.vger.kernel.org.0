Return-Path: <linux-usb+bounces-596-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0617AF000
	for <lists+linux-usb@lfdr.de>; Tue, 26 Sep 2023 17:52:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 1E060281858
	for <lists+linux-usb@lfdr.de>; Tue, 26 Sep 2023 15:52:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F7A030D0E;
	Tue, 26 Sep 2023 15:52:31 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A19D326E2A
	for <linux-usb@vger.kernel.org>; Tue, 26 Sep 2023 15:52:29 +0000 (UTC)
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 276F1FB;
	Tue, 26 Sep 2023 08:52:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695743539; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=QSB/k4SM+ZPC+rXVe8CqUuiCVzZuzDRIKnTi3eSZ/uTyUPg9nJzHzHchvW+q1kANOdLsfY1S2QOSYptz65rMEs5bl6N/WvG1yCzBM/5oVgA472Z+HNQ+A4AJJwP4R8R8Edu6WSt9bwZHVSF2IsepOWwKOeFRQQ+JzGfOqBaLQG4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1695743539; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=WO8SVjTncRLx7HMaK60oW6mYfhlwoa7SM53KjXm8HCo=; 
	b=hU/RDj/+fgfHUeP1Pq7Zb3LwxsGBAnHeuqDgHwh/sBldeKs9G7BKeaO3twyofda9fNVawIG2gl8lIQA4dW15rcUN4LgOyOp+++nUqyjPFSwEUFrBVe5ZASrY/NCPgG3E0JKXq3RWJ3LuvjC84qb6ypoB0r2AlOfBMA0ClnM0Z7w=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=marliere.net;
	spf=pass  smtp.mailfrom=ricardo@marliere.net;
	dmarc=pass header.from=<ricardo@marliere.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1695743539;
	s=zmail; d=marliere.net; i=ricardo@marliere.net;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=WO8SVjTncRLx7HMaK60oW6mYfhlwoa7SM53KjXm8HCo=;
	b=ghw8B2NlgiuuWqDfewUpsnPIzhQySmAs5Cs2y+PzPKTdmAXkyNv5ye3EhiRdGWnE
	kHVCKEtqXIkKSob1Hk0Pt+VbsHr2Nes2LMz24VGIWaSs497jKLiunOHNJs7UTlVZgEk
	o6oFDvMr8bTmCdVyuwhp0Jte1Kl1YUQPxP8/PkVU=
Received: from localhost (177.104.93.54 [177.104.93.54]) by mx.zohomail.com
	with SMTPS id 1695743536583822.5407712159156; Tue, 26 Sep 2023 08:52:16 -0700 (PDT)
Date: Tue, 26 Sep 2023 12:52:19 -0300
From: "Ricardo B. Marliere" <ricardo@marliere.net>
To: syzbot <syzbot+1c41b2e045dc086f58be@syzkaller.appspotmail.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-usb@vger.kernel.org, mchehab@kernel.org, sean@mess.org, 
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [media?] [usb?] WARNING in imon_probe
Message-ID: <kwwrx7p4nfr4qkv5xxpo5nidyyjdbytsulpu7lj6yujmzrnxb6@q63vtmlo3dqa>
References: <00000000000019b2b105fe424f00@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <00000000000019b2b105fe424f00@google.com>
X-ZohoMailClient: External
X-Spam-Status: No, score=0.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_MSPIKE_H2,SORTED_RECIPS,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

> If you want syzbot to run the reproducer, reply with:
> #syz test: git://repo/address.git branch-or-commit-hash
#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git a48fa7efaf1161c1c898931fe4c7f0070964233a

diff --git a/drivers/media/rc/imon.c b/drivers/media/rc/imon.c
index 74546f7e3469..5719dda6e0f0 100644
--- a/drivers/media/rc/imon.c
+++ b/drivers/media/rc/imon.c
@@ -2427,6 +2427,12 @@ static int imon_probe(struct usb_interface *interface,
 		goto fail;
 	}

+	if (first_if->dev.driver != interface->dev.driver) {
+		dev_err(&interface->dev, "inconsistent driver matching\n");
+		ret = -EINVAL;
+		goto fail;
+	}
+
 	if (ifnum == 0) {
 		ictx = imon_init_intf0(interface, id);
 		if (!ictx) {

