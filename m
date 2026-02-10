Return-Path: <linux-usb+bounces-33262-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AFipEiQ6i2neRgAAu9opvQ
	(envelope-from <linux-usb+bounces-33262-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 10 Feb 2026 15:01:08 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DC53811BA87
	for <lists+linux-usb@lfdr.de>; Tue, 10 Feb 2026 15:01:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DF904304C958
	for <lists+linux-usb@lfdr.de>; Tue, 10 Feb 2026 14:00:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 323B1364E89;
	Tue, 10 Feb 2026 14:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oeSTjS2a"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D00963624C9
	for <linux-usb@vger.kernel.org>; Tue, 10 Feb 2026 14:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770732019; cv=none; b=PNPMo932/7VokCFXSoE2/I7zh2hJYgvAQ06/ZDYZqYZPoeRjWdgCPndlv5L69nl482p3vuOejK/LqgJK91MPZpyYEaA9IMIUs/LLhflYPERtFNpPuYIlz5mhcsT8LT6aSAKBMODEVrZDsaLKcNjbLuyeUmdCaE8hIxq7e/jM+mU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770732019; c=relaxed/simple;
	bh=9YVnIyIWorlkLNmu3if4AqK1cGIDJD0hTwMmr/tPHYI=;
	h=From:Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:
	 References:In-Reply-To; b=rzKZigKnXfoyHbxrlZNetN/VVxCfbxdnW7bFU//UkNpiX/LenuHS9BTbwIZhsJWOj2a0qS4SoxFBky+RDUxoAAaOwhB50gGQ9y1M77JxNYdpnfM8L8h4VYM70SXJ35Unn9mtgKD9ykqpW7F7knh8uAMlmkTHJvn56zjGXItVvr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oeSTjS2a; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-43590777e22so2563312f8f.3
        for <linux-usb@vger.kernel.org>; Tue, 10 Feb 2026 06:00:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770732016; x=1771336816; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i0sgEyOu249wzRAgKIdHovRcnXREE7u8QYuPNkclj6s=;
        b=oeSTjS2a6bwkshkHzpvX3vYEjVg1ti041j/CoUajFczUbjGT3F36GPOeSUey2aQhGf
         5dN7Z4FTE7sylUhnGquq8+gSrJSHdeWsZzV0MLkWTq8VF68LWiBQMxFZGhhs1NQYUsfu
         KecqGxud5jClIi3RKyRNQzFG/cDko9zW6V87M3JqMWYa31lvHPgna36fApC8hrgVUmEU
         buZsd4zVHbi/CpCp9/cLXiK+pDtAD2RiersOc+YmBdqagjbkI91raXiwK+KfV415npgc
         9pWyPuqJyFQkWcaO12LuG5eqWE/U8JHMKhvTPb1I76poJvydAaA9v6pOViSNplF6XCLo
         CdUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770732016; x=1771336816;
        h=in-reply-to:references:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i0sgEyOu249wzRAgKIdHovRcnXREE7u8QYuPNkclj6s=;
        b=Us+JaE8c+ZXWdU7969O1whoDGaODV9p3boQVAZDIqNtGKA55izA4zZ1C/E/6iIh7Bh
         tOkOuyLZxzfR7YrJTDZ+1lpFIIQzrTxatK2+4Vp6zvFcEdjzlVIybVQwAz3WNihJEQ7d
         gHg9ZRc0U+c/T1cmocpDU6RAYu2buLGtKriwaKhVqEKSHFQXdY6M2pbkTHQ1Ky0rvwPr
         ivcmisqx1A+niTqdY9hNY99NmjjYupDRhPzUWFRqNKKIbg2kD1KzV0s+tQcOBTBb42Ld
         LCUUqfhDOWd4TFbs0Xugk7VVp08sPH+4V/qtQr2+WJx0QKab6T1dwSFxGQGkJNOUFEPt
         3+Pg==
X-Gm-Message-State: AOJu0Ywkz5/AxD6HxMrjafTpRlgePRzf/3PPwUPHRVpFSADPXd22CzLF
	iKh4jCl9tO1se7E1jpWVecuWTwm0j6mtMxwbmgK0So9K7nOicnFFJPyml4kSiUOurRc=
X-Gm-Gg: AZuq6aI2QRK2sFp/mRwP6fWp7liIskvjNe5Sb7tayD1fvKfWFEAEt5Hl0SQeg63jJMV
	qVZIygcjmlAZJasrIK11uL/PZlP6UQsqgm3pnYcXNPx72Ns64bGsn4/+/vxgaynRhSSCrkHz6jM
	gfqohOQJlZJfQP6CgRZb1pgq7K//9uErjDdfOPOVFW2xTmO3k/DsCczLKLrYwWF4fuv5YzysirB
	Ax81rORMh/gOuK8wy/k5vsE905xceAJ/oLBHHI9GcPlPPpUO0bE0HfBN9MtlngL6jnGmIfyyGRS
	8+PipE+gilz6Vzse7CYq1mjrlBJl4Vx+l1/litW8jUs7HmUjS+SprbNaL5CbFGPCWhOCnBX9ONV
	q74e12URVW2x5RacGW8PBNv3B37QMkCYrWXuFrtFx9Fo3uCUmtQKbuQ1y/eDMJscLXAVGdJfeph
	PpckN+vVmdOwPPx4tDEgXfVHtTPaQ42UtcSEvXwv19jKMVBtqQSbE3tlYJNJVS3Q==
X-Received: by 2002:a05:6000:24c8:b0:435:e448:2ce5 with SMTP id ffacd0b85a97d-436293bac76mr23981062f8f.48.1770732015914;
        Tue, 10 Feb 2026 06:00:15 -0800 (PST)
Received: from localhost (a109-49-32-132.cpe.netcabo.pt. [109.49.32.132])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43629754c62sm31766664f8f.38.2026.02.10.06.00.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 06:00:15 -0800 (PST)
From: Rui Miguel Silva <rui.silva@linaro.org>
X-Google-Original-From: "Rui Miguel Silva" <rui.silva@linaro.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Feb 2026 14:00:09 +0000
Message-Id: <DGBC3ZA7383J.2TB8U10NOWDLC@linaro.com>
To: "Sergey Shtylyov" <sergei.shtylyov@gmail.com>, "Chen Ni"
 <nichen@iscas.ac.cn>, <rui.silva@linaro.org>, <gregkh@linuxfoundation.org>,
 <laurent.pinchart@ideasonboard.com>, <balbi@ti.com>
Cc: <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] usb: isp1760: Add missing error check for
 platform_get_resource()
References: <20260210090202.2332349-1-nichen@iscas.ac.cn>
 <3de6c9bd-35c5-45c5-874b-75c6623bd4ad@gmail.com>
In-Reply-To: <3de6c9bd-35c5-45c5-874b-75c6623bd4ad@gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-33262-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,iscas.ac.cn,linaro.org,linuxfoundation.org,ideasonboard.com,ti.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rui.silva@linaro.org,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.com:mid,linaro.org:dkim,iscas.ac.cn:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DC53811BA87
X-Rspamd-Action: no action

Hi,
On Tue Feb 10, 2026 at 1:45 PM WET, Sergey Shtylyov wrote:

> On 2/10/26 12:02 PM, Chen Ni wrote:
>
>> Check the return value of platform_get_resource() to prevent potential
>> NULL pointer dereference when the memory resource is unavailable.
>>=20
>> Fixes: 7ef077a8ad35 ("usb: isp1760: Move driver from drivers/usb/host/ t=
o drivers/usb/isp1760/")
>> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
>> ---
>>  drivers/usb/isp1760/isp1760-if.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>=20
>> diff --git a/drivers/usb/isp1760/isp1760-if.c b/drivers/usb/isp1760/isp1=
760-if.c
>> index a64190addba6..60f81ec81373 100644
>> --- a/drivers/usb/isp1760/isp1760-if.c
>> +++ b/drivers/usb/isp1760/isp1760-if.c
>> @@ -196,6 +196,8 @@ static int isp1760_plat_probe(struct platform_device=
 *pdev)
>>  	int ret;
>> =20
>>  	mem_res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +	if (!mem_res)
>> +		return -EINVAL;
>
>    Isn't it already checked in __devm_ioremap_resource(), called later on=
?

Yes, agree, I do not see where the pointer could be NULL dereferenced.
It is validated in devm_ioremap_resource, and the same error propagated.

Cheers,
    Rui

>
> [...]
>
> MBR, Sergey




