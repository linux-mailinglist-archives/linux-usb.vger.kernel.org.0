Return-Path: <linux-usb+bounces-34072-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YNoBI7ZqqWnH7AAAu9opvQ
	(envelope-from <linux-usb+bounces-34072-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 12:36:22 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B43210A43
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 12:36:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ADE743041D4B
	for <lists+linux-usb@lfdr.de>; Thu,  5 Mar 2026 11:36:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73FA618DB26;
	Thu,  5 Mar 2026 11:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="KropPouS"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C950938E137
	for <linux-usb@vger.kernel.org>; Thu,  5 Mar 2026 11:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772710558; cv=none; b=cvJ1jT09el8lNrJlImXzXy+iXCMsFJhFaLd9laHwVepsa/Y58b2vd/GvyNpXuoyMceSl2TBCoRIM4SAkyq6Lnt11EnEbmW+/wVz5blilW5dPUWoHT/iBZLdmhpnMfh4XpITH60SfBhExf/z4tIu7YZUtpiX6108I5yxPdNnsMMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772710558; c=relaxed/simple;
	bh=SUNuXZEpVqcqVDtCShUO58rZJUiJF3OIxFPd0QSnkTw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ch3xpns+mzATlirNq4+MRJbBvBGIvwCgAH45tfVgpzVxq+PDOqDwApjIBCaNFIfMW0P9qIQhqTg3hj75WZbdLgcAr9h83Wf40u1zai4LmoYIvcw/NVoyqR6Mz4xg9HSbaq3nfLhC/6vxkxKf7ne0Zm/O6nV0KUimds5wSOfpnFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=KropPouS; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-483a233819aso78123785e9.3
        for <linux-usb@vger.kernel.org>; Thu, 05 Mar 2026 03:35:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772710555; x=1773315355; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8p5Rgp/dBX+nd9RSWXnx5Nf8wLWcN1gvPdv6yAlGWHc=;
        b=KropPouSndROntIv/pSTbjo8AkAn9DebixCtmJWzYCw28xGmbiJynb/OZ+BaHqLWAq
         FYDi5hvt9611nVYiVZaZXAB5A2nTx2xn3zWRjFUBbj0PLuiFJYfns7dR5tMeUD+PRgkC
         or4b/+4f9zb2Wx2ki8ZlyNI1EkIHnt0YMN2cUwIGPGDxzAzmYOoop+UFCSpiHSFK42NZ
         801kDLXO78darVRjbaK3wEoQ6loIIxm7Pnp6RwFPRf+y+nrBuQlXRLj3wnzoO4NVXElY
         uRnQPvDL61wEr/FReIQLluFnHCuKp5KZ9YlFaQNbl0jARu+zwPjB6YGKVp61wSsPwBbA
         B57Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772710555; x=1773315355;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8p5Rgp/dBX+nd9RSWXnx5Nf8wLWcN1gvPdv6yAlGWHc=;
        b=PJL4uRhNZ81yPFY1RAsycjFfGXtqNOYMyLDS49UfT/QtvQDtEUPaBwVQ4iJV8wyPfp
         GnZTntb26cmk/ox+2KAiEg/6SrLr3SJZVOxOnOcapEgxisdjs4j6y7MrR1KG+SqidtjQ
         M5kq7t2vhcRNUmO4azhOCzKpDwCKlwrjLSWXEX1uqJhPeOAUSvRCGJ6tnIQvavAQJIm/
         QlF671J0f+7CNxUiz7WrtwVf06d5UiPV++7V4mVyJb9eVjAqDyBPZiG7I2tWXLT98YBE
         vb2Om70tuuSGEzzcKgZGoghEn5mgm2du06SprawvbpxpIoejTha5OrD1durAABpUAfRq
         mbzg==
X-Forwarded-Encrypted: i=1; AJvYcCWq0JtehwsvdVgDCYd9YviYFrETlcT32P2kBG8ShzvfSTc4l6+RnouGsJkr6L3zDtSqiCqFFdbHJps=@vger.kernel.org
X-Gm-Message-State: AOJu0YwH1smFwr6+bAHTNvfd/LSN7BRn8YNXLMNeot8ob13KD4gAVGca
	y8v9U4ywQ2qCL5jLBDtbOXUPIfwiCWy/ZgRT1j4t9BzXXljT+aR+RgOlQalYIPihk9c=
X-Gm-Gg: ATEYQzy4OPVqawq3T7mQuVfU+ao2Vc/pQjNeTHJCYHfFgJluvCAkSnd+w3ZZ49Y9Gsr
	qDaeTMQwbb5lkmVKutegpJqBlnsbXAUDhbCJVcE6fZAzGV+mjMnJtkeBEUqGhVhP+XcfEH5/fBD
	gwFm0sgtK23xwiPxRJN1DgIMXN0/zOIaXv9QcI4QAJmpHVTIvPJ+9dKoUATM0wndn/T9mBpHIVd
	uQ4Rq1mqSVXbTpCoggMk57ffQf8QdMstPEzbmOQMisoMP33iqeRyTZN0BVNTjOh/fakz0Xda3cS
	A9IKq5Cx8OriGeCaZW8DWkVTQRI3ttwdtZHN5l1/OfjwODgi1vCsspS1h9938Zqt8IjBv02U8bo
	Mr7gPjCNbJeHKIyEa+/SU4Z+0noKKiZCPk2ZCDgxk4+llqdA2zHai3PuE1OTo0x0sd+PbP75E/K
	Do8sA//lxX+mLturJxg2x72PY1FpVGEHyM6hGIq06ksynEM+SCt+oMMc+jk3cyRjs5M2c=
X-Received: by 2002:a05:600c:4f4c:b0:477:5c58:3d42 with SMTP id 5b1f17b1804b1-48519849bd4mr100264715e9.10.1772710555188;
        Thu, 05 Mar 2026 03:35:55 -0800 (PST)
Received: from ?IPV6:2001:a61:1363:9e01:43f1:e533:276c:e9a1? ([2001:a61:1363:9e01:43f1:e533:276c:e9a1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851fad27dbsm31071765e9.2.2026.03.05.03.35.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 03:35:54 -0800 (PST)
Message-ID: <f8c304be-c061-4656-b7ba-83150c2b8746@suse.com>
Date: Thu, 5 Mar 2026 12:35:53 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] usb: cdc-wdm: Missing barriers in ad-hoc lockless buffer
To: Gui-Dong Han <hanguidong02@gmail.com>,
 Greg KH <gregkh@linuxfoundation.org>, oneukum@suse.com
Cc: robert.hodaszi@digi.com, kees@kernel.org, linux-usb@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, Jia-Ju Bai <baijiaju1990@gmail.com>
References: <CALbr=LbrUZn_cfp7CfR-7Z5wDTHF96qeuM=3fO2m-q4cDrnC4A@mail.gmail.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <CALbr=LbrUZn_cfp7CfR-7Z5wDTHF96qeuM=3fO2m-q4cDrnC4A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 04B43210A43
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[digi.com,kernel.org,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-34072-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linuxfoundation.org,suse.com];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oneukum@suse.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

On 04.03.26 09:41, Gui-Dong Han wrote:
> Additionally, the driver relies heavily on set_bit() and test_bit() on
> desc->flags for synchronization. These bit operations do not provide
> implicit barriers, which might lead to similar ordering issues.

Hi,

going through the driver it seems to me like all relevant cases
are covered by the iuspin spinlock. Do you have any concrete suspicions
or do you generally distrust this style?

	Regards
		Oliver


