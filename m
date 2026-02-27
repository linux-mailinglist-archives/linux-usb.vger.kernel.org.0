Return-Path: <linux-usb+bounces-33788-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GGJmAWm9oWnCwAQAu9opvQ
	(envelope-from <linux-usb+bounces-33788-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 27 Feb 2026 16:51:05 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A39FC1BA4A9
	for <lists+linux-usb@lfdr.de>; Fri, 27 Feb 2026 16:51:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 974B8304DE5A
	for <lists+linux-usb@lfdr.de>; Fri, 27 Feb 2026 15:45:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 808EC441034;
	Fri, 27 Feb 2026 15:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="PIDUtrah"
X-Original-To: linux-usb@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 757C143E4B4;
	Fri, 27 Feb 2026 15:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772207136; cv=none; b=OvkyjDHu3a0PH96C2SgjCyQq9jfufpY+myOhx2P3o+3pSCbz1iRzMh+CsWFhR6x6c3jbVhQ9w6I4ODMQexOPLBS7dnMTsZje06A+Xx99m/+jzSawEMp1jSd20qz1HjWXKhD4ZZmn6WYArGtnEVW5SVn0Zh3yTKGDuZigj7gwQ3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772207136; c=relaxed/simple;
	bh=s4fL6BemrOkQhgBVFMKclB63U/HSNTX4nIyb1wZr6Ss=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S+rVoRdPZP00oNtKDZJk4R+lF3fCilCzJBun3RqmNpSpFzO7tyTrpOr4Szo5EVV99M/rfYlxWGGrM6cxn3xiYZaPNcFc5pcO8Q1HEx1DAnvR07YMCMzkeihcQAAp+3tAdtaDZbf/1rE2rvqNLSTkAi8nKd/TIJu2tLx+N5yH2As=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=PIDUtrah; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1772207131;
	bh=s4fL6BemrOkQhgBVFMKclB63U/HSNTX4nIyb1wZr6Ss=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PIDUtrahR+x1pvSzrQQvKkE+nh9iA5yYQjDQ6GpPl6LsxWoQ9ZleIf92pGu4RzqGV
	 I7Fs6ept6Vyiuju1cBpVjpmxXrSRf9QtVFQnrADrqbOU0+8XMCEjeLQj83xEjRfhWm
	 sh7hfReXk2aeGZm5yTvUeSFDiENNDJIOjN9yxHb7GEP0+Ud6sltzMGwbT+0W4W0e0k
	 s4euNJpz0OcokrLIi8zY0+X6wyXdUHiA8Z7UN4kKoHs261q3g2IpEHhpCjjTi8rGdf
	 MsZHY4AjLLmLzAcq6FO3jtpk0wqGgX0TwcsCxc2ZvTAX64O+Zqqv2J1M9B+o0/ZLQC
	 EL7hAzpsHpiQg==
Received: from [IPV6:2a01:e0a:212:79f0:be92:a52a:153f:7a60] (unknown [IPv6:2a01:e0a:212:79f0:be92:a52a:153f:7a60])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: aferraris)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2494017E0D04;
	Fri, 27 Feb 2026 16:45:31 +0100 (CET)
Message-ID: <073cbeb3-04a8-4b26-a7b6-ef0b7654c34c@collabora.com>
Date: Fri, 27 Feb 2026 16:45:30 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "tcpm: allow looking for role_sw device in the
 main node"
To: Xu Yang <xu.yang_2@nxp.com>
Cc: badhri@google.com, heikki.krogerus@linux.intel.com,
 gregkh@linuxfoundation.org, dsimic@manjaro.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, jun.li@nxp.com
References: <20260224110139.3812757-1-xu.yang_2@nxp.com>
 <30bc5aeb-382b-49e0-824a-303230110313@collabora.com>
 <im3nnajzv2hdu3kv2hknxi3jaz3oam5pujdoapva4hs5rzguky@t45ryche6n5k>
From: Arnaud Ferraris <arnaud.ferraris@collabora.com>
Content-Language: en-US, fr
Autocrypt: addr=arnaud.ferraris@collabora.com; keydata=
 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
 L9jD4jU=
In-Reply-To: <im3nnajzv2hdu3kv2hknxi3jaz3oam5pujdoapva4hs5rzguky@t45ryche6n5k>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33788-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnaud.ferraris@collabora.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,nxp.com:email,collabora.com:mid,collabora.com:dkim]
X-Rspamd-Queue-Id: A39FC1BA4A9
X-Rspamd-Action: no action

Hi Xu,

Le 25/02/2026 à 03:57, Xu Yang a écrit :
> Hi Arnaud,
> 
> On Tue, Feb 24, 2026 at 12:33:33PM +0100, Arnaud Ferraris wrote:
>> Hi,
>>
>> Le 24/02/2026 à 12:01, Xu Yang a écrit :
>>> This reverts commit 1366cd228b0c67b60a2c0c26ef37fe9f7cfedb7f.
>>
>> I believe a plain revert isn't the right solution here, as we'll get to the
>> same point as we were before 1366cd228b0c, where some devices stopped
>> working properly with newer kernels.
> 
> I don't think 1366cd228b0c fix the real root problem because the description
> should be wrong in the commit message. If -EPROBE_DEFER is returned by
> fwnode_usb_role_switch_get(), the ports node should be in connector node
> instead of tcpc node. However, you get the error when ports in tcpc node.
> 
> Could you double check the issue, so we can find a proper solution and avoid
> the further regression?

Sure, I'll come up with more details asap, either tomorrow or early next 
week.

Best regards,
Arnaud

> 
>>
>>>
>>> The fwnode_usb_role_switch_get() returns NULL only if no connection is
>>> found, returns ERR_PTR(-EPROBE_DEFER) if connection is found but deferred
>>> probe is needed, or a valid pointer of usb_role_switch.
>>>
>>> When switching from NULL check to IS_ERR_OR_NULL(), usb_role_switch_get()
>>> will return NULL pointer which will override ERR_PTR(-EPROBE_DEFER) which
>>> is returned by fwnode_usb_role_switch_get(). Then usb role switch can't be
>>> obtained because the defer probe info is lost. So the unique error should
>>> not be regarded the same as NULL.
>>>
>>> Fixes: 1366cd228b0c ("tcpm: allow looking for role_sw device in the main node")
>>> Cc: stable@vger.kernel.org
>>> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
>>>
>>> ---
>>> Also correct a description in 1366cd228b0c ("tcpm: allow looking for
>>> role_sw device in the main node"), if the ports are defined in the tcpc
>>> main node, NULL pointer is returned by fwnode_usb_role_switch_get()
>>> instead of an error.
>>> ---
>>>    drivers/usb/typec/tcpm/tcpm.c | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
>>> index 1d2f3af034c5..8e0e14a2704e 100644
>>> --- a/drivers/usb/typec/tcpm/tcpm.c
>>> +++ b/drivers/usb/typec/tcpm/tcpm.c
>>> @@ -7890,7 +7890,7 @@ struct tcpm_port *tcpm_register_port(struct device *dev, struct tcpc_dev *tcpc)
>>>    	port->partner_desc.identity = &port->partner_ident;
>>>    	port->role_sw = fwnode_usb_role_switch_get(tcpc->fwnode);
>>> -	if (IS_ERR_OR_NULL(port->role_sw))
>>> +	if (!port->role_sw)
>>
>> It might be worth saving the error and restoring it after the call to
>> usb_role_switch_get() instead, something like:
>>
>> 	if (IS_ERR_OR_NULL(port->role_sw)) {
>> 		err = PTR_ERR(port->role_sw);
>> 		port->role_sw = usb_role_switch_get(port->dev);
>> 		if (!port->role_sw)
>> 			port->role_sw = ERR_PTR(err);
>> 	}
> 
> It works but we'd better to get the thing clear firstly.
> 
> Thanks,
> Xu Yang


