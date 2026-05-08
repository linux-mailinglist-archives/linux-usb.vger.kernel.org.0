Return-Path: <linux-usb+bounces-37126-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SJsUOjHe/WmqkAAAu9opvQ
	(envelope-from <linux-usb+bounces-37126-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 08 May 2026 14:59:29 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D8E4F6A92
	for <lists+linux-usb@lfdr.de>; Fri, 08 May 2026 14:59:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 544C03028351
	for <lists+linux-usb@lfdr.de>; Fri,  8 May 2026 12:59:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 827723E1226;
	Fri,  8 May 2026 12:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="lI7hjVHf"
X-Original-To: linux-usb@vger.kernel.org
Received: from canpmsgout09.his.huawei.com (canpmsgout09.his.huawei.com [113.46.200.224])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE61F3E122E;
	Fri,  8 May 2026 12:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.224
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778245154; cv=none; b=Ehiq3nXLqb4WjgnwPjcRcDyEwvGInHteC5Ag9+8qSKV2KzHHXD5bA0FzBGw3g5FxOHVUPWW8rTUzSuRWOXnHKX6TO/jWcIUeBkofwqnE5ALvK19V7rIi9f5XBNAahRSV6nWeO5V70KvUiuUrmzPF7zQvlBekZdAE2rQh4HfQ648=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778245154; c=relaxed/simple;
	bh=Z4QVziMW2zfbi4OOJBElFuezAzABKP8OuKkYve4nDUQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=juv3+Ukz5t9zqD2qwGBWv6PR5dc/uKNriBzHsetw7Uogvx9hI+1E2K234rISO7b+h/cWI55WT7W73r1773+x4hAxBKiox3JsoMo8L+/s8ANmlmy6uJBgCEceJpkBYpxaJV1Pefla3oMF69dev/+FyBOyoFDBMb5YRCff3kRyBKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=lI7hjVHf; arc=none smtp.client-ip=113.46.200.224
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=BRUCPEr2AUN4TJQVDxqJVgm4z1kYj7WQwSKGQ+zFEnA=;
	b=lI7hjVHf7CyZVCA3baj2zwwCwhpMyB+9npPUzNEyjhyAufyQAj1+NOHMpa/Wy2zTrpI+l7z29
	LSZJ5mG6qWPmAur+NovaTpCHC4v7wlTty+RyDJhBEliz1ZaMBBql9NX06g3DWjF4a1vYSKc3icF
	ulQg+u4yN2quzx7XAsg7Nvk=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4gBpsL2T2Mz1cyST;
	Fri,  8 May 2026 20:51:34 +0800 (CST)
Received: from kwepemr500015.china.huawei.com (unknown [7.202.195.162])
	by mail.maildlp.com (Postfix) with ESMTPS id 321934056E;
	Fri,  8 May 2026 20:59:07 +0800 (CST)
Received: from [10.67.111.104] (10.67.111.104) by
 kwepemr500015.china.huawei.com (7.202.195.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 8 May 2026 20:59:06 +0800
Message-ID: <1886be01-2dcf-4aa7-9aac-067634db4ce7@huawei.com>
Date: Fri, 8 May 2026 20:59:06 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.6 & 5.10] usb: typec: ucsi: validate connector number in
 ucsi_connector_change
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>
CC: <heikki.krogerus@linux.intel.com>, <nathan.c.rebello@gmail.com>,
	<kyungtae.kim@dartmouth.edu>, <linux-usb@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20260508092026.1364820-1-lihongbo22@huawei.com>
 <2026050843-denatured-bonfire-6337@gregkh>
From: Hongbo Li <lihongbo22@huawei.com>
In-Reply-To: <2026050843-denatured-bonfire-6337@gregkh>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemr500015.china.huawei.com (7.202.195.162)
X-Rspamd-Queue-Id: 91D8E4F6A92
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[huawei.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[huawei.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37126-lists,linux-usb=lfdr.de];
	FREEMAIL_CC(0.00)[linux.intel.com,gmail.com,dartmouth.edu,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lihongbo22@huawei.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[huawei.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Hi Greg,

On 2026/5/8 19:03, Greg KH wrote:
> On Fri, May 08, 2026 at 05:20:26PM +0800, Hongbo Li wrote:
>> Commit d2d8c17ac01a ("usb: typec: ucsi: validate connector
>> number in ucsi_notify_common()") and commit 5a1140404cbf ("usb:
>> typec: ucsi: skip connector validation before init") add the bounds
>> check when do the connector change both in pre-init notification and
>> the forward notifications. But they are difficult to backport to
>> early stable branch such as LTS 6.6, LTS 5.10 due to many dependencies.
>> Instead, we choose to validate connector number in ucsi_connector_change
>> directly to avoid out-of-range issue.
> 
> Why just these 2 branches?

I only noticed these two branches, but in fact, there are more.

> 
> And what specific commits are needed exactly?  Why not just backport
> them all?  that will make future changes apply properly as well, making

Commit d2d8c17ac01a ("usb: typec: ucsi: validate connector number in 
ucsi_notify_common()") use the ucsi_notify_common helper which is 
introduced in 584e8df58942 ("usb: typec: ucsi: extract common code for 
command handling"). This commit refactored part of the code and involves 
many modifications to USB ucsi controllers (such as stm32g0...), which 
were introduced after 6.6.

I think there are two possible modifications:
One is to adapt the modification for different branches, and the other 
is to modify the code in ucsi_connector_change (as in my commit).

Thanks,
Hongbo

> the overall work much less over time.
> 
> thanks,
> 
> greg k-h
> 

