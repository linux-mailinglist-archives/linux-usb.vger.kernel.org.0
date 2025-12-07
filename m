Return-Path: <linux-usb+bounces-31231-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D4EB4CAB1FB
	for <lists+linux-usb@lfdr.de>; Sun, 07 Dec 2025 07:19:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D4A73306D8F4
	for <lists+linux-usb@lfdr.de>; Sun,  7 Dec 2025 06:19:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 114B328725C;
	Sun,  7 Dec 2025 06:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G0vii5Qm"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A562EEB3
	for <linux-usb@vger.kernel.org>; Sun,  7 Dec 2025 06:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765088385; cv=none; b=FfwxgXRvSquBOlId6o12pTRM4O8bWmp6dX3cb4x5bGsudtWkw2M7jKIsQr+UZ6Lq4hEsbuJ2Fadd/xBQaEQgyi0aC3SD7rVXGE28nnEv4H3H4NrYP6GD8Gj0K/TpMoHEMDLupFsKwX8VHWU5PWTTlBkzaq520IeA+ttmgpnzhP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765088385; c=relaxed/simple;
	bh=w7Yi2r5XuMmN/ik3xAtrwjNOy+2CYOn3DgQviYeICD4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QIqp/hl8e1Cow2c3PILFX1CXVxJYhJPjfB21FuQckiGBy2TRPzgSFcYerlMCmiuz7xzDSvBT/wnjeti36TaFCOEOFDflNCdST162Jb6MYQtxZoBhPsQI1FpEDyswSG3pszN20BKd4eNMlCB0+PH6+QCcy9BTe+XrxqlHcwQK7HY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G0vii5Qm; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-297e2736308so5154675ad.1
        for <linux-usb@vger.kernel.org>; Sat, 06 Dec 2025 22:19:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765088383; x=1765693183; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VeM9fMgflGwyGzNtQlXtqyQK8jrhrBnJr9RTxh4XksI=;
        b=G0vii5Qmy/Mn65kw9c8GsGmx1Io9CWCNHzbM0vscYtlaYaCUanjF0UGMYpT6qqbUgI
         hdaqeiFC9H9Ru1T23WABa50m1RJtZlymkgspSdjuvJ4j3VqgCIlygvj+wJM80zj/xFul
         TmzZY63XBlidQtX/fAjJuoUV+W2ZV9cKfIQFg8+3IM0gmfAaqyh/qSIryhqD/0ljBp9S
         RSVmfJyVaMfPa9vy0wlbn//fkZDSl65MY4S0lw9AgedX8zEnJqdlm+NCbSBbbOvkG8z2
         lm7VRnf5V0qOnmRrTw0oumE+yF+V5rKuBwCRZVkOpcg0+tFjnqWrmDbKon5xLTSH5BTA
         7GMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765088383; x=1765693183;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VeM9fMgflGwyGzNtQlXtqyQK8jrhrBnJr9RTxh4XksI=;
        b=F78uzdYlIL/yq8TBiHYLmAekK0nfyu3oZlIVLfGOPG896Q71v52or+c6Pc7XXCXUU6
         YFL5quOFnLZA8s77dOTtbS7NcpPkQIMDKl+x0C8rVSgOxFdi0C6IUTnJMRjT2978DedM
         RMpnl3BOvx5udNU1VoqUqe4liCR+j2bSTpUPBhs+lNQSDGLwY0PkiohOtFveQVeWAunL
         3ps4UPx97+JiJwjn9VbNY+Qwja0V+TVPO0m5wE/vAMutgEUML0wDTgWcsYyZ+i0ej+h3
         hLKQGfweFeq9bGWcA6pTSUCPMIi6qXPMaF+4NJcshceOPF2YW1MZjV4FZcR/K8+6iRJz
         d4lQ==
X-Forwarded-Encrypted: i=1; AJvYcCXibhUk6D129sgSZxpbiTIB7IcugM8GOx2b7aX/BRHynk28n+m/I+BXDULZz3LzhOmyWF3+40mtfkw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQALD3ubVljaO5qkxQk7OSVTJczXzFXmf3xSsks4E0AoNHkXOQ
	paZDIhRHVNNXz7nAoP0NMn8fSWRaaJsEp4iwhGXuF5+l0SETCcxBjASC
X-Gm-Gg: ASbGncsHu5fT/YMWYds67ueuToVfQ5t2M0LrcWSfzZWWF70hOuG4uLyEMopRgxcA5lk
	7cU4ctx38WW1+2tpaBSGSWhfr6UqX72M3UqDD8VxIstW0JpmGKbirnH2FGea0FGKqGv/55l1aZ1
	kSklSxSs+19duTWbvamxMebSFC2jynHEs4lqbBA/Nk7Qj1CqwjfiYiiEwAb5MqdZDXmCfdfNqvI
	+CdrM2oJ/0PamCl2txYcaCfW5yeQFogpi6YVvTH/79WrM1j/sK/C1pC/1LO6BJQC9UbZg+03VdX
	A5UQWUsE1qID55Hibd9aoWfJmdSWL6JYNU+fWmjaBI+VKD+RiqK4d7cUCHFcm+jQGnNINYnb2T5
	oDomCPcGSKENNWjrH3O4gZk5WLi/q11VNKuG+8s56nLSXb926j/KSo2G/WiyGTEcOFd+yHkhdbo
	fUdgSEicaHFk0Nt9xArDur
X-Google-Smtp-Source: AGHT+IGgMjKrBUWNwWYVbdMHeCWnrsf3ZjpoAH5IKO6i2CH8jJ4Ni+13SYLqrozBfXwka13BG/8g6Q==
X-Received: by 2002:a17:903:ac3:b0:25a:4437:dbb7 with SMTP id d9443c01a7336-29df5e1615cmr29671075ad.4.1765088383544;
        Sat, 06 Dec 2025 22:19:43 -0800 (PST)
Received: from [192.168.1.7] ([110.78.142.195])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-29dae4d3a2dsm92113525ad.31.2025.12.06.22.19.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Dec 2025 22:19:43 -0800 (PST)
Message-ID: <a9088e84-3800-4a87-a639-9a2a48036873@gmail.com>
Date: Sun, 7 Dec 2025 13:19:39 +0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] usb: core: add USB_QUIRK_NO_BOS for devices that hang
 on BOS descriptor
To: =?UTF-8?Q?Johannes_Br=C3=BCderl?= <johannes.bruederl@gmail.com>,
 linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org
References: <2025120708-header-startling-ffaf@gregkh>
 <20251207012059.7899-1-johannes.bruederl@gmail.com>
Content-Language: en-US
From: Lars Melin <larsm17@gmail.com>
In-Reply-To: <20251207012059.7899-1-johannes.bruederl@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2025-12-07 08:20, Johannes Brüderl wrote:
> Add USB_QUIRK_NO_BOS quirk flag to skip requesting the BOS descriptor
> for devices that cannot handle it.
> 
> Add Elgato 4K X (0fd9:009b) to the quirk table. This device hangs when
> the BOS descriptor is requested at SuperSpeed Plus (10Gbps).

// snip

>   	/* INTEL VALUE SSD */
>   	{ USB_DEVICE(0x8086, 0xf1a5), .driver_info = USB_QUIRK_RESET_RESUME },
> 
> +	/* Elgato 4K X - BOS descriptor fetch hangs at SuperSpeed Plus */
> +	{ USB_DEVICE(0x0fd9, 0x009b), .driver_info = USB_QUIRK_NO_BOS },
> +
>   	{ }  /* terminating entry must be last */

Hi Johannes,
it looks like the list was sorted in vid:pid ascending order before you 
added your entry


Lars

