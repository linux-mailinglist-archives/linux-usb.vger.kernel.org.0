Return-Path: <linux-usb+bounces-604-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF7E7AF42A
	for <lists+linux-usb@lfdr.de>; Tue, 26 Sep 2023 21:30:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by ny.mirrors.kernel.org (Postfix) with ESMTP id 9904C1C20803
	for <lists+linux-usb@lfdr.de>; Tue, 26 Sep 2023 19:30:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDDD748EB7;
	Tue, 26 Sep 2023 19:30:36 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9326F48843
	for <linux-usb@vger.kernel.org>; Tue, 26 Sep 2023 19:30:32 +0000 (UTC)
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA8261A8;
	Tue, 26 Sep 2023 12:30:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695756622; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=lwoL+BJ63ZMJqJTTpGJQvmfAHO1C6bL2bi5NVVqrCgBuxuJebziZHTIBecPUPuEXDlSzpLqSRqlVuRnP6MZ4CT871d9obbravnkfWhF4+QwiJx72cQqzgiX43r5fJz7PgygHIOr8Db7c3OX3maLahyVEqk+fKsHIzjb4mvIVi/U=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1695756622; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=IHp47SZZhOVX7RgfWbEW1pr9ONVR0CNEitbtqrTGu0w=; 
	b=dRUf/FCAUBrR4Y11/sV64SIGLvUcBSSkJ9rRfdJCQenVTyJS+jqvdEzFrWke4MSRPpg83qVaAE0heOHExI23KWXJx4bLcJkaAR5qq/67pesZhJJuxpd7scV6b1K5+K26vwYV/XiOywdKSxtDie0epgG4nyVlWySXCO7q8vS1erU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=marliere.net;
	spf=pass  smtp.mailfrom=ricardo@marliere.net;
	dmarc=pass header.from=<ricardo@marliere.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1695756622;
	s=zmail; d=marliere.net; i=ricardo@marliere.net;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=IHp47SZZhOVX7RgfWbEW1pr9ONVR0CNEitbtqrTGu0w=;
	b=uXhg1rBJVWZBy5qVy54merY5FPGGGEEES0FAt12BXv1BOhqnwFkedZNmERzs3Z0F
	HgYTo3ztImPrfy2Vy7lxYj5UpbpFlbB4w9j9M34VQmJO+1u8s0gGosT+i8WofzVJfYG
	3DpqwWS4GTC/UlUA1LYqwy2/9a2Btq5epSTm1og4=
Received: from localhost (177.104.93.54 [177.104.93.54]) by mx.zohomail.com
	with SMTPS id 1695756620946934.3928532457957; Tue, 26 Sep 2023 12:30:20 -0700 (PDT)
Date: Tue, 26 Sep 2023 16:30:24 -0300
From: "Ricardo B. Marliere" <ricardo@marliere.net>
To: syzbot <syzbot+1c41b2e045dc086f58be@syzkaller.appspotmail.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-usb@vger.kernel.org, mchehab@kernel.org, sean@mess.org, 
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [usb?] [media?] WARNING in imon_probe
Message-ID: <frvhx2mz7zjozlpcrtk3u4e4xarm4mpzqpq6ldrizrw5a4bywb@vqxbfi4ebvul>
References: <mrce6emi7jvmoe4fgxt7lgrgkswkinc5u3hpl57gr5oaxau55o@fdvuaqxcsgu6>
 <000000000000bedf08060647e102@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <000000000000bedf08060647e102@google.com>
X-ZohoMailClient: External
X-Spam-Status: No, score=0.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SORTED_RECIPS,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

#syz dup: KASAN: slab-out-of-bounds Read in imon_probe

