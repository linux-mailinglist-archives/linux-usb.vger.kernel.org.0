Return-Path: <linux-usb+bounces-386-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D817A69B3
	for <lists+linux-usb@lfdr.de>; Tue, 19 Sep 2023 19:39:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1D9E9281AEE
	for <lists+linux-usb@lfdr.de>; Tue, 19 Sep 2023 17:39:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19F9F38BAF;
	Tue, 19 Sep 2023 17:39:20 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8287747C
	for <linux-usb@vger.kernel.org>; Tue, 19 Sep 2023 17:39:18 +0000 (UTC)
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C64FAD;
	Tue, 19 Sep 2023 10:39:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695145152; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=QdHbBLLn+tiPHsQULmPbOn6OBooc6H5vxiZWz4W+fqWZbICjaF7DpzJ3/fwYKcTpg/WvJGOKQEcx84b4nWHSbdu1Ep2gM386gMibr6oGLVOUjntgHWffvD/DY22aiHv5kulMIjrlgrIQWI2G65/41XwKrcFc32uQESDDobNSmMk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1695145152; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=0IAP0s+RT7GZFRPLNdV3G0ElvDn5rBd3toR6u/oZ7UE=; 
	b=M9/PhhM9I7hqsewz3/VPoYPdvlGQ62QHkA/jZMBHm4d2ProZzQz47XwB93NQFGvxtnaFUvaQzyQabelHtz7TLZStDuuIp+PGrdVy6o+ha1yvZOFX9wcRxePJUUjKCSbA8O4r70PP43bXVlmbH0jWcFbVDuHb8F63f0Bkbz0rLtY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=marliere.net;
	spf=pass  smtp.mailfrom=ricardo@marliere.net;
	dmarc=pass header.from=<ricardo@marliere.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1695145152;
	s=zmail; d=marliere.net; i=ricardo@marliere.net;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=0IAP0s+RT7GZFRPLNdV3G0ElvDn5rBd3toR6u/oZ7UE=;
	b=F9+wr7Fc3a7fOb1iB0k4UxWASWuxg4D6d8suw5fFRNKcoRFt58ufFSOjDeGPaifO
	qkMjVzB4r0AV09tIYz5e/d2D8xrUPDKL/rFL5dPjT0vMYqfpieJWPwjaimvsKBDgyqH
	fofwXfdkWQ/LkSXCybkyjnq2lVspOjv66aliatNI=
Received: from localhost (177.104.93.54 [177.104.93.54]) by mx.zohomail.com
	with SMTPS id 1695145150671314.9472263153632; Tue, 19 Sep 2023 10:39:10 -0700 (PDT)
Date: Tue, 19 Sep 2023 14:39:20 -0300
From: "Ricardo B. Marliere" <ricardo@marliere.net>
To: syzbot <syzbot+59875ffef5cb9c9b29e9@syzkaller.appspotmail.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-usb@vger.kernel.org, mchehab@kernel.org, sean@mess.org, 
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [media?] [usb?] KASAN: slab-out-of-bounds Read in
 imon_probe
Message-ID: <albu6mqbrom746yngcfgtuhn6ydpf4ewapqj6wk6etlkw7qda4@tzlqwq6u5s54>
References: <000000000000a838aa0603cc74d6@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <000000000000a838aa0603cc74d6@google.com>
X-ZohoMailClient: External
X-Spam-Status: No, score=0.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_MSPIKE_H2,SORTED_RECIPS,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git next-20230919

