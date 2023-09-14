Return-Path: <linux-usb+bounces-49-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E16C7A019A
	for <lists+linux-usb@lfdr.de>; Thu, 14 Sep 2023 12:24:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 20498B20BC9
	for <lists+linux-usb@lfdr.de>; Thu, 14 Sep 2023 10:24:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1F7420B35;
	Thu, 14 Sep 2023 10:23:16 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C40F01D524
	for <linux-usb@vger.kernel.org>; Thu, 14 Sep 2023 10:23:16 +0000 (UTC)
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2E9B1BFE;
	Thu, 14 Sep 2023 03:23:15 -0700 (PDT)
Received: from [192.168.1.103] (178.176.78.252) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.986.14; Thu, 14 Sep
 2023 13:23:00 +0300
Subject: Re: [PATCH 10/19] USB: gadget/legacy: remove sb_mutex
To: Christoph Hellwig <hch@lst.de>, Christian Brauner <brauner@kernel.org>, Al
 Viro <viro@zeniv.linux.org.uk>
CC: Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>, Fenghua Yu
	<fenghua.yu@intel.com>, Reinette Chatre <reinette.chatre@intel.com>, Miquel
 Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, Dennis Dalessandro
	<dennis.dalessandro@cornelisnetworks.com>, Tejun Heo <tj@kernel.org>, Trond
 Myklebust <trond.myklebust@hammerspace.com>, Anna Schumaker
	<anna@kernel.org>, Kees Cook <keescook@chromium.org>, Damien Le Moal
	<dlemoal@kernel.org>, Naohiro Aota <naohiro.aota@wdc.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-s390@vger.kernel.org>,
	<linux-rdma@vger.kernel.org>, <linux-nfs@vger.kernel.org>,
	<linux-hardening@vger.kernel.org>, <cgroups@vger.kernel.org>
References: <20230913111013.77623-1-hch@lst.de>
 <20230913111013.77623-11-hch@lst.de>
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <d3935129-2ab9-0341-c606-fabac4a49010@omp.ru>
Date: Thu, 14 Sep 2023 13:22:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230913111013.77623-11-hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [178.176.78.252]
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 5.9.59, Database issued on: 09/14/2023 10:01:12
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 59
X-KSE-AntiSpam-Info: Lua profiles 179856 [Sep 14 2023]
X-KSE-AntiSpam-Info: Version: 5.9.59.0
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 530 530 ecb1547b3f72d1df4c71c0b60e67ba6b4aea5432
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {relay has no DNS name}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: {Found in DNSBL: 178.176.78.252 in (user)
 b.barracudacentral.org}
X-KSE-AntiSpam-Info: {Found in DNSBL: 178.176.78.252 in (user)
 dbl.spamhaus.org}
X-KSE-AntiSpam-Info:
	d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;omp.ru:7.1.1
X-KSE-AntiSpam-Info: FromAlignment: s
X-KSE-AntiSpam-Info: {rdns complete}
X-KSE-AntiSpam-Info: {fromrtbl complete}
X-KSE-AntiSpam-Info: ApMailHostAddress: 178.176.78.252
X-KSE-AntiSpam-Info: Rate: 59
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=none header.from=omp.ru;spf=none
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 09/14/2023 10:07:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 9/14/2023 9:01:00 AM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit

On 9/13/23 2:10 PM, Christoph Hellwig wrote:

> Creating new a new super_block vs freeing the old one for single instance
           ^^^^^^^^^
   I can't parse that. :-)

> file systems is serialized by the wait for SB_DEAD.
> 
> Remove the superfluous sb_mutex.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
[...]

MBR, Sergey

