Return-Path: <linux-usb+bounces-344-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB247A5382
	for <lists+linux-usb@lfdr.de>; Mon, 18 Sep 2023 22:13:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 08CA6281FA2
	for <lists+linux-usb@lfdr.de>; Mon, 18 Sep 2023 20:13:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E36E27EF8;
	Mon, 18 Sep 2023 20:13:01 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F16133DF
	for <linux-usb@vger.kernel.org>; Mon, 18 Sep 2023 20:12:59 +0000 (UTC)
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2AF88F;
	Mon, 18 Sep 2023 13:12:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695067968; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=kKjbHKnW2w+hQPoRNc6/11wD5kGl9LtkCOCPYwQu2qhw2rx3Vm9Q6F8vbWHvwCI0iznpXUT9iScGr4irVFQmokhXA79djNknG7120395HMwu43/3JWgdFOEkUR/Al7b3AubUNrCqDN1oL6+U6GPoyXf//rsgtmSiJ2lPrRPGXs4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1695067968; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=c34LfTD4Bd953uuL/g8KVV6tQoIkw277Z9Q4voBdLQc=; 
	b=Jj/v6h8k21r9+9B5LDYyTGCuiN1CM4fMq8nwRA7vsShhnwo/BcKhODEgOywjt+ZXt1b3c2rYp9P+TQxVFYchyz89V7E0YRb350U3DyTfkPNSOLIhvQ1Q+EX1a2IN7bwqBLRDs1OfISmJkjavzDalPzqnMJZDkYgKjey33Vul9C4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=marliere.net;
	spf=pass  smtp.mailfrom=ricardo@marliere.net;
	dmarc=pass header.from=<ricardo@marliere.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1695067968;
	s=zmail; d=marliere.net; i=ricardo@marliere.net;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=c34LfTD4Bd953uuL/g8KVV6tQoIkw277Z9Q4voBdLQc=;
	b=XVBpncCIX/Xxn2s+8xq38S/ievDN3mbswwuYEYywKoLznc9PO8F6e3W7VxRSsJpp
	cpj+dv6Vhm0+FuEzEDV5oB7dyJFRzT+A7wNa+sD3pv/WSyZnt/bwGKFwZLnyHDY/2rv
	6R9SHnFvwKp4keVfTkMlYhNoNJ67yPvuzbefXHVE=
Received: from localhost (177.104.93.54 [177.104.93.54]) by mx.zohomail.com
	with SMTPS id 169506796659287.90637275620168; Mon, 18 Sep 2023 13:12:46 -0700 (PDT)
Date: Mon, 18 Sep 2023 17:12:56 -0300
From: "Ricardo B. Marliere" <ricardo@marliere.net>
To: syzbot <syzbot+78e2288f58b881ed3c45@syzkaller.appspotmail.com>
Cc: dmitry.torokhov@gmail.com, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, rydberg@bitmath.org, 
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [input?] INFO: task hung in __input_unregister_device
 (5)
Message-ID: <xjg3ozpednanoykpepnnnhvxlqwiwice3qrgrokmrhdutk426q@qxyryc3tygbl>
References: <0000000000003d63410605a18363@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0000000000003d63410605a18363@google.com>
X-ZohoMailClient: External
X-Spam-Status: No, score=0.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_MSPIKE_H2,SORTED_RECIPS,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git next-20230918

