Return-Path: <linux-usb+bounces-18244-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ADB09E8FA9
	for <lists+linux-usb@lfdr.de>; Mon,  9 Dec 2024 11:06:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4AF0F1624EA
	for <lists+linux-usb@lfdr.de>; Mon,  9 Dec 2024 10:06:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65AD721660C;
	Mon,  9 Dec 2024 10:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HOBzPojp"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5EF2163A1
	for <linux-usb@vger.kernel.org>; Mon,  9 Dec 2024 10:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733738769; cv=none; b=c+4YFdOdj+AkFaTxHq/nMlIbmkX3w9wdSshLgqZCEInAU0etQaiLW/XPLbKDM1nCa/FiNPaIg3pG+X/s/JuvCmrN2RBhBjzBDfJQt37eaVIz3KaxdnOSXjMfpNHMccsk/WA0qUtOcNiGMJ2GnDBLb7EQISdAZoIozdQXBLGPrp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733738769; c=relaxed/simple;
	bh=/LJlxxkuxafc63Wd1bi4UU+iQoIDb9QxMs9b6JJz8hQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GvZckCpVnnJlG9KXD45ekWcliwuix/RgdU9jWZkblL62nm1K/YdrXZSH2X+d41lFnMZPIQIGEuxIrru93GuOUoPHI9TyhaeLguZoAFfKrZEjxV8N39f1At2Jrdq9BtnxBaKa0Zzxm8Xwpo2nYtnkU6yDF8JhkoRTNAko/FMwZfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HOBzPojp; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-434f094c636so8348845e9.2
        for <linux-usb@vger.kernel.org>; Mon, 09 Dec 2024 02:06:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733738766; x=1734343566; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/LJlxxkuxafc63Wd1bi4UU+iQoIDb9QxMs9b6JJz8hQ=;
        b=HOBzPojp3ZD1huZ3EJKekpDzGQk8HG8IJGKVWHcRE6AidUjTcFcENE07Xd7VjLorn8
         5B90C6lseTDnpadr8+Vuy/kXY/GkJAz8SCsAIXod6PAKc2NnfxbNcln/keqohgPNrAhc
         TxixAlQ9X/m8gOyKZGnmnHgUzk2Va1J12TmBtcYEViVznNjv+Glt8WcP5ceJUwb7PTSK
         kD7hWG7Lb4eeYpsDI+g6PK5i9+z6O8c8JAEMsjJf0uBX014I2XMfcIhv272LFDjs5U1N
         nRMJzoHo6I9gIxLhbhMAwWPDiWnrGGsnceM+OdIx2MZnkGB3DAH9HRdQWuYISSozOrGF
         PpYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733738766; x=1734343566;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/LJlxxkuxafc63Wd1bi4UU+iQoIDb9QxMs9b6JJz8hQ=;
        b=kc8yycNbDyUwPZX1v1P/vq9uzRMPSPuTpNuKSvAEWcg90Bbx/Nz/JrsbYYAwI+BynJ
         LoKOLU2PfHAbOafvVUdsLJhU80YriNi4J9sx5Gk7TVG9+hBaEV4KgZ4TnGU5HmWUCBjM
         xeYpEHeqIiHVwyUMQoZbqbIBKzSEDBJBLOcJG3AMeH28EEGvjtp6ToD0X3eGvjbDI+L6
         adukhDtaHD5Bm5iWir/rBni3MYaFJI7j9/VMIC9UbB8E1eEW4sC7MPLDiSGrDviDlFz4
         u3/dzFtaT/RaRoggzhu2/5TKDfQeYQOySbeikNxYmBSv6Js1L9iiaDInwQhbKFrFXXRk
         tfGg==
X-Forwarded-Encrypted: i=1; AJvYcCUqNg7mzW/UqOkY3fZxtm3FjAHxmHJecNlrXKjaZHtdCMixujJ/vUWNI+kv1rTSQw6obbYmaUBqSW0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGRlN9YLOZ2wLhmOvNlPVDvg/w9PtK9notdCQwxrdr0VRHlh+k
	NgR2bFMeyxo24xGGQKOqMCEdNfoWR+KeWCEHqWAcsrCW5XD/NAu18D32fuRmAgg=
X-Gm-Gg: ASbGncsBgQJMyRpC7QHnIeMW0BvdaeefclzkVLlHx4u1cdEeYM0YquZp/uhdabZhk1E
	MIzYw+xKzo3ZylvrAnfQcouCUl8QUDp3MgYkGLMZ+oTYDKkWGYmNbNiuRFnaTk7oMj5Ut/gDY6o
	9lUurJK4j8JWMWqs3TlZQKyzN7wEhaKX5/ZTO6hKwYkCKwEfbNeESBeGO8urVVVkGEOesbOTbY+
	qRuP6dEpMgfuam8I+M641GzXAxmKSGZWTfmy0z3hgnBWwf6o43mFg==
X-Google-Smtp-Source: AGHT+IGJPbrzOuK2a05dvm0F4dtdPq0Y/T2pAGQw1YzQ1ka2ok+Y6aOk+x+gp+whelzTQDnBCo2xjA==
X-Received: by 2002:a05:600c:4fc9:b0:434:a529:3b87 with SMTP id 5b1f17b1804b1-434ddeb53b9mr109539965e9.10.1733738766502;
        Mon, 09 Dec 2024 02:06:06 -0800 (PST)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434f19023d1sm64250965e9.20.2024.12.09.02.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 02:06:06 -0800 (PST)
Message-ID: <cac8862fff16a9f1d4ba59371a226759ad9b71cb.camel@linaro.org>
Subject: Re: [PATCH] usb: typec: tcpm/tcpci_maxim: fix error code in
 max_contaminant_read_resistance_kohm()
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Dan Carpenter <dan.carpenter@linaro.org>, Badhri Jagan Sridharan
	 <badhri@google.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman
	 <gregkh@linuxfoundation.org>, Guenter Roeck <linux@roeck-us.net>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Date: Mon, 09 Dec 2024 10:06:05 +0000
In-Reply-To: <f1bf3768-419e-40dd-989c-f7f455d6c824@stanley.mountain>
References: <f1bf3768-419e-40dd-989c-f7f455d6c824@stanley.mountain>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1-4 
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2024-12-06 at 16:09 +0300, Dan Carpenter wrote:
> If max_contaminant_read_adc_mv() fails, then return the error code.=C2=A0=
 Don't
> return zero.
>=20
> Fixes: 02b332a06397 ("usb: typec: maxim_contaminant: Implement check_cont=
aminant callback")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>


