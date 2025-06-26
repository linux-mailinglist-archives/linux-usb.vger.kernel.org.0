Return-Path: <linux-usb+bounces-25120-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F2EAE9CE7
	for <lists+linux-usb@lfdr.de>; Thu, 26 Jun 2025 13:55:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F1F687B0443
	for <lists+linux-usb@lfdr.de>; Thu, 26 Jun 2025 11:54:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D04F4BE4A;
	Thu, 26 Jun 2025 11:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (3072-bit key) header.d=posteo.net header.i=@posteo.net header.b="bpZCAQ0S"
X-Original-To: linux-usb@vger.kernel.org
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2CBD7483
	for <linux-usb@vger.kernel.org>; Thu, 26 Jun 2025 11:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750938919; cv=none; b=mx6jATQb06D/M+GR37S0kv9cRlPGB0nSStyCEaXip21VnMRhMVqG2BC1+afrUAsfHnlWE/g+3XF7W7n9DmlVjdWdO0jXq+luGywnSLRbUZ4gWbykmTlpj/HFA5Wxcih+1BaQiDLqrzkdJmysmbChZcEiW3g8g0liKqBUXxj16ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750938919; c=relaxed/simple;
	bh=OepCRvmZSgZ21THaAIKKkjUXXt+rOFHQEY0XAoO+8s8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=iyQORg4gUsZlYg1P3KCF5TSbhTn8bXO1UIJYfPJPJSt0M8SyxGS/+pXrrddrIaJVLj9gVVyVymwPxqH2YJpXvnX0R0GV32TfE283GTnzApb7vWsD12/B7k0I10AhTuvJGlJbGJIjBFfzr0J4Uv5kU1K7RoOs8pCFouR543VeTkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (3072-bit key) header.d=posteo.net header.i=@posteo.net header.b=bpZCAQ0S; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 498C0240104
	for <linux-usb@vger.kernel.org>; Thu, 26 Jun 2025 13:50:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net;
	s=1984.ea087b; t=1750938604;
	bh=++tZDl1VMrYPukj14Hp1L5Dy277OIIyCwylm3lluCpM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 From;
	b=bpZCAQ0SFWyrOEgQR8lWRXpyVFjdlq4OD0lyL6ukNXotR0ZioDFdBz6kvASn7pwWd
	 p53T7WuxaCtSQpe+I/epYfYl9lg9cCV61iq1KM141KGfsQ8C2HG5qYzmCn5q7BLqgr
	 vJyZu4AN7cnUclY28jEx0pxThQpHvKPF10i6rfUBhqAyjgKpYXU2vOMxKQg7IhWLHc
	 SmcDMba6nUmNrgjHiXpVuRe8WBsrwdKsi98A2Jjp1rT0/gRSqPmOblPLOJ8e3+y2/r
	 bGTHBGelE2kBEhCPVG/QsYnDIk5vCeH24vHVUfWwZDIbr/YwR9z6sBDJDYm59/581M
	 o4PJaBMncsrZ2V8w1luMAia7QY0LcUe5GrFJQ16Zj0LhwE8FDah5FGWfmgfNEazv0k
	 BoJ4MD4uulvNux9CzhoKTCRoTxzZgYkAq70l2Fl/uuoWvwLCoQjkB4NTnNoIZjSoru
	 vKxyczvAs3WbtJbDTKG5AlCVK2cF/qay5uhsNUWTXWbi5PIOnhV
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4bScS94sRFz9rxN;
	Thu, 26 Jun 2025 13:50:01 +0200 (CEST)
From: Charalampos Mitrodimas <charmitro@posteo.net>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: zhangjianrong <zhangjianrong5@huawei.com>,  andreas.noever@gmail.com,
  michael.jamet@intel.com,  YehezkelShB@gmail.com,
  linux-usb@vger.kernel.org,  linux-kernel@vger.kernel.org,
  guhengsheng@hisilicon.com,  caiyadong@huawei.com,  xuetao09@huawei.com,
  lixinghang1@huawei.com
Subject: Re: [PATCH] thunderbolt: Confirm the necessity to configure asym
 link first
In-Reply-To: <20250626093026.GJ2824380@black.fi.intel.com>
References: <20250626084107.2710306-1-zhangjianrong5@huawei.com>
	<20250626093026.GJ2824380@black.fi.intel.com>
Date: Thu, 26 Jun 2025 11:50:00 +0000
Message-ID: <877c0ylo2f.fsf@posteo.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Mika Westerberg <mika.westerberg@linux.intel.com> writes:

> Hi,
>
> On Thu, Jun 26, 2025 at 04:41:07PM +0800, zhangjianrong wrote:
>> Current implementation can cause allocation failures in
>> tb_alloc_dp_bandwidth() in some cases. For example:
>> allocated_down(30Gbps), allocated_up(50Gbps),
>> requested_down(10Gbps).
>
> I'm not sure I understand the above.
>
> Can you describe in which real life situation this can happen?

I suppose this can happen when reducing bandwidth while total upstream
bandwidth usage on the link exceeds TB_ASYM_MIN (36 Gbps). The
allocation fails at the asymmetric limit check before checking whether
the downstream request actually needs asymmetric mode.

>
>> 
>> Signed-off-by: zhangjianrong <zhangjianrong5@huawei.com>
>> ---
>>  drivers/thunderbolt/tb.c | 10 +++++-----
>>  1 file changed, 5 insertions(+), 5 deletions(-)
>> 
>> diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
>> index a7c6919fbf97..558455d9716b 100644
>> --- a/drivers/thunderbolt/tb.c
>> +++ b/drivers/thunderbolt/tb.c
>> @@ -1039,6 +1039,9 @@ static int tb_configure_asym(struct tb *tb, struct tb_port *src_port,
>>  			break;
>>  
>>  		if (downstream) {
>> +			/* Does consumed + requested exceed the threshold */
>> +			if (consumed_down + requested_down < asym_threshold)
>> +				continue;
>>  			/*
>>  			 * Downstream so make sure upstream is within the 36G
>>  			 * (40G - guard band 10%), and the requested is above
>> @@ -1048,20 +1051,17 @@ static int tb_configure_asym(struct tb *tb, struct tb_port *src_port,
>>  				ret = -ENOBUFS;
>>  				break;
>>  			}
>> -			/* Does consumed + requested exceed the threshold */
>> -			if (consumed_down + requested_down < asym_threshold)
>> -				continue;
>>  
>>  			width_up = TB_LINK_WIDTH_ASYM_RX;
>>  			width_down = TB_LINK_WIDTH_ASYM_TX;
>>  		} else {
>>  			/* Upstream, the opposite of above */
>> +			if (consumed_up + requested_up < asym_threshold)
>> +				continue;
>>  			if (consumed_down + requested_down >= TB_ASYM_MIN) {
>>  				ret = -ENOBUFS;
>>  				break;
>>  			}
>> -			if (consumed_up + requested_up < asym_threshold)
>> -				continue;
>>  
>>  			width_up = TB_LINK_WIDTH_ASYM_TX;
>>  			width_down = TB_LINK_WIDTH_ASYM_RX;
>> -- 
>> 2.34.1

