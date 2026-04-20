Return-Path: <linux-usb+bounces-36332-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aDovKfLF5WlIoAEAu9opvQ
	(envelope-from <linux-usb+bounces-36332-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 20 Apr 2026 08:21:38 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BACF427288
	for <lists+linux-usb@lfdr.de>; Mon, 20 Apr 2026 08:21:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B0AD43001014
	for <lists+linux-usb@lfdr.de>; Mon, 20 Apr 2026 06:21:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A3833815E2;
	Mon, 20 Apr 2026 06:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=h-partners.com header.i=@h-partners.com header.b="hgYA25Ny"
X-Original-To: linux-usb@vger.kernel.org
Received: from canpmsgout12.his.huawei.com (canpmsgout12.his.huawei.com [113.46.200.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5646173;
	Mon, 20 Apr 2026 06:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776666093; cv=none; b=C3ukhFfukY4xwa1ue1TwBt3C+4wkkws4fKecuuEwUOa5ikmaDG3Jmgh8pkV1UxO+BD7uhOP3VMQbJ8q6swlf69m8KJngy/RMJSW5VdOgSBpWIKKq1HtCDFClmRLYxVatYaDY3fMG/To9WIiXf5qOzHAoVm1kbo4E+5G4JO1LJ90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776666093; c=relaxed/simple;
	bh=16nEeOqs19oHegd0z9MQ0BEzH96gtAat4hnUq0BHlPE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=c06bI63W/F940W7+xM9UAuPekUBY+Nr8Nw8oKFPYDkzrfL+NICn3f3Z+5xoSt/K7pYn30wJtDG7MLlRTXCJSYsjPSqMAuDfM0jxU+JbsAdHN2mGcXnY+l5KvkucfIC78AS+y7ECr21eRjexc/EagjHpNNY7wJk1LhDTpMlONwMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=h-partners.com; dkim=pass (1024-bit key) header.d=h-partners.com header.i=@h-partners.com header.b=hgYA25Ny; arc=none smtp.client-ip=113.46.200.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=h-partners.com
dkim-signature: v=1; a=rsa-sha256; d=h-partners.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=wKJ3jVvOndVyjrom3L3Zfpj1bMs2JcE/7fKbrotj09E=;
	b=hgYA25Nyx6aP1SXqSufZoQAWxBSiKdrLqd5O5WLTZ1hvB5R6v48xk7D/iSFyj+4dAEuO2IRSZ
	Fcle40jN27GZCjW54OXcfFuA1Lp2fw8eM1hEeP+33IIIT+oMutQ4CRi5ADfyxLKGsv8DLWpFJe3
	YXCD+CU4QyAC2DQds4u5hfo=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4fzZwJ2bWVznTWM;
	Mon, 20 Apr 2026 14:15:12 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id 8155040575;
	Mon, 20 Apr 2026 14:21:27 +0800 (CST)
Received: from kwepemn100009.china.huawei.com (7.202.194.112) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 20 Apr 2026 14:21:17 +0800
Received: from [10.67.121.59] (10.67.121.59) by kwepemn100009.china.huawei.com
 (7.202.194.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Mon, 20 Apr
 2026 14:21:17 +0800
Message-ID: <85cc1f7c-9d43-4dfb-8b05-d95ddd86a932@huawei.com>
Date: Mon, 20 Apr 2026 14:21:01 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/2] usb: gadget: udc: simplify lock holding using
 guards
To: Greg KH <gregkh@linuxfoundation.org>
CC: <khtsai@google.com>, <hhhuuu@google.com>, <kees@kernel.org>,
	<kexinsun@smail.nju.edu.cn>, <linux-kernel@vger.kernel.org>,
	<linux-usb@vger.kernel.org>, <linuxarm@huawei.com>, <zhanjie9@hisilicon.com>,
	<lihuisong@huawei.com>
References: <20260420035722.1133418-1-lihuisong@huawei.com>
 <2026042034-grunt-freeware-8ce6@gregkh>
From: "lihuisong (C)" <lihuisong@huawei.com>
In-Reply-To: <2026042034-grunt-freeware-8ce6@gregkh>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemn100009.china.huawei.com (7.202.194.112)
X-Spamd-Result: default: False [-0.16 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[huawei.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),quarantine];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[h-partners.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[h-partners.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lihuisong@huawei.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-36332-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5BACF427288
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 4/20/2026 1:40 PM, Greg KH wrote:
> On Mon, Apr 20, 2026 at 11:57:20AM +0800, Huisong Li wrote:
>> Simplify udc_lock and connect_lock holding using guards in
>> gadget_bind_driver() and gadget_unbind_driver().
>>
>> Huisong Li (2):
>>    usb: gadget: udc: simplify udc_lock holding using guards
>>    usb: gadget: udc: simplify connect_lock holding using guards
>>
>>   drivers/usb/gadget/udc/core.c | 77 ++++++++++++++++-------------------
>>   1 file changed, 35 insertions(+), 42 deletions(-)
> Only do this for new drivers, don't convert existing code that works
> just fine for no valid reason other than wanting to clean stuff up.
>
> Does this fix a bug?
Here not to fix a bug. But prepare for fixing a bug in link[1].
I found that there are many unlock of udc_lock in error path after that 
patch.
So use the guard to simpliy them by the way.

[1]https://patchwork.kernel.org/project/linux-usb/patch/20260420040223.1232745-1-lihuisong@huawei.com/

/Huisong

