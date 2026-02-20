Return-Path: <linux-usb+bounces-33533-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +OFfNPGwmGnbKwMAu9opvQ
	(envelope-from <linux-usb+bounces-33533-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 20 Feb 2026 20:07:29 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6426616A406
	for <lists+linux-usb@lfdr.de>; Fri, 20 Feb 2026 20:07:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2D291301F782
	for <lists+linux-usb@lfdr.de>; Fri, 20 Feb 2026 19:07:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EF66366567;
	Fri, 20 Feb 2026 19:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ha18F6+E"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE51936683A
	for <linux-usb@vger.kernel.org>; Fri, 20 Feb 2026 19:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771614446; cv=none; b=Fxjn+Hfdg/cFahmiAzNG4mHeW96vHSrwENvJ2HIoZuhz+ZmU9gYaQuvSD1Brxr5aTFgmEAku1UG5LW1kuaC6yLyxpPHH1HeqIR2a4eAIVgO+I2ecQLRhrQu7C47lEH9yv9RuUyrk7vDw/3iJdsb40oqlUABibScjq3wPQdvnBPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771614446; c=relaxed/simple;
	bh=jR5mkU/Mplyt6BcphocKhqTbwA/7skAQk4w2kG3c7P4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cXHwbieazAoFPFNZUlkdcauSYA1wlMtk1+UAlwVDJQO9L/MqfVA3ZJEin0Di4TYNilirOMXf78PZ3r8P38j6NvaRG7rhp3XfZuiupw1r7XgW0DCNncw1tJhVeQN4iP3SGfzL8K2BUtrwhAGJG+GtpoGoobRBpwWzHzj+24USg+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ha18F6+E; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-436e8758b91so1829242f8f.0
        for <linux-usb@vger.kernel.org>; Fri, 20 Feb 2026 11:07:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771614443; x=1772219243; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aIYysQO98VqTcpcnjxQ9HD3CfclEuBh0khiFG9kEwR8=;
        b=Ha18F6+ECkFfjKIXUfBwC+MmYlKjLP9q1+O9mLl82G3MPsaFzMKDJreZYEmMhezlnp
         LmJVOpvVjU49a72abmZX1zRQLm3voWw3Xk8907L4o6Zc/8VblCFO7HkeAl7OI7oIiDV+
         d748/FK5r+sBjSPQpbOEETJvAW1g82/2tvlYP2ADNesnMWF8yS9of7hCQV0CDwlItGDy
         u0IfoLbDrrfS696kbMwIMrWK9qEc077VE+xjCjfWH6Pk6Vv5FS7RAETaScRyy48JGQRB
         InhWT9NSNNaIeejIpVt5aoAorOB72dkYkWoqkoHGNuHsWF8nob/6GCAkffGSYPj6oV2O
         G0GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771614443; x=1772219243;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aIYysQO98VqTcpcnjxQ9HD3CfclEuBh0khiFG9kEwR8=;
        b=at1usokV2ToUtdSh8WGYZhVR+RVZszWdOJd5IY9sEmPtp6vCByiqBh8QskzJxDuXTE
         4b98fNhvLKY/Y/U6lmJfrIgEnrLiz2Xu07GmLz+Xrif2ZUp4fR5Ln5NAmqxnb/qrPSR7
         CNCqeHZetRac21xcHSOg4bnhMaTLKQ+CBzGsXbftPE8S0+DqVVxwm49O7z7kaDj94mp9
         8X6Eb5JA7XzWcB/+HT83CJooDKK8JZCf6XduAmpmNVD6R7WkTMhZbvZPsGZqiMddXbLF
         TZbUKGtKjB4ePp8zx5SjDKEbbOyuGAbjc8UBiDF6oCz+YXagBNwPRpnfU5u0ULqH3FuF
         NSIg==
X-Forwarded-Encrypted: i=1; AJvYcCUSpqV8HOY4HG+lFvb+ilwIG91gFEH2D5l4rE9NxCYRPxvDm6PDyngyzVuQ2gULOSblLw9iZ3hYtLk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1BdUlV2J290O9IcXB+Vn69FXV7WogpA+1fMlW4y5yzSaq+ZLZ
	1ZAV5NPYLv2U50pZHj7KOUcYjowPqnAiNC7DaB7sDuQdL6IcM2+btbTdpSUJFQ==
X-Gm-Gg: AZuq6aJw1Kz8HHphc1ZIzRiMBTH9fYyKTEHxHvLZqfBfjd7tIYUKlvrOAaUbfYbBdHJ
	YMau+/oP5qy4GXsYiYaAwOoF2P1IBFKomdfLjEZ1UEdfh2TOhy+cdy37L6V4oDYw0PPO0VyvPHE
	QHuIAN7WJlKCTXYAUBsmWtQTBp8Kn7MWZTwnRh9k8g/PozUG7ohMOu7Vot2gQCh6B7hZLothwLA
	1dhr2B2mRqwjhs5IbAakOjAwxL2VaOObiz5wSXU2ksz85vleNimoNW76IjQ/2mDTxH3BGiVY3il
	n3PCg5f1Us3SGhkvT6GroxG0x4VhXV5IQxwPfdNZeVcEUUPgg9/lX/X+d/HkH2zUsNOieECcMUE
	PtQjlv/ag7R/ZN3oU6/SI+m4Tz8+On2wRSG5ajB/mddvexBcKwOgWOLxsSedZ4ptqfNdsjPMcsy
	jw+By6/EK7X60bidUX+5uQCEpU5NJQgLEfc4coXZLNUemzFEjvFuyGGpks+ikt5D0=
X-Received: by 2002:a05:6000:2f83:b0:431:a0:7dea with SMTP id ffacd0b85a97d-4396f181aa5mr1830793f8f.40.1771614442895;
        Fri, 20 Feb 2026 11:07:22 -0800 (PST)
Received: from [192.168.20.170] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970c00485sm83600f8f.9.2026.02.20.11.07.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Feb 2026 11:07:22 -0800 (PST)
Message-ID: <39d36f25-abf6-41e1-8762-d9de38891a2b@gmail.com>
Date: Fri, 20 Feb 2026 20:07:20 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: ehci-orion: remove optional PHY handling code
 remnants
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Alan Stern <stern@rowland.harvard.edu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Gregory CLEMENT <gregory.clement@bootlin.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260220-ehci-orion-drop-phy-handling-v1-1-01abd9f168cc@gmail.com>
 <875x7rsf03.fsf@bootlin.com>
Content-Language: hu
From: Gabor Juhos <j4g8y7@gmail.com>
In-Reply-To: <875x7rsf03.fsf@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-33533-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[j4g8y7@gmail.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6426616A406
X-Rspamd-Action: no action

Hi Miquel,

2026. 02. 20. 14:47 keltezéssel, Miquel Raynal írta:
> Hi Gabor,
> 
> On 20/02/2026 at 14:27:02 +01, Gabor Juhos <j4g8y7@gmail.com> wrote:
> 
>> Since the USB core code handles the generic USB PHYs automatically, the
>> optional PHY handling code has been removed from the 'ehci-orion' driver
>> entirely by commit e04585184dcf ("usb: ehci-orion: avoid double PHY
>> initialization"). However, the devm_phy_optional_get() call has been kept
>> so the driver still gets the PHY even though it is not used for anything
>> in the driver.
>>
>> Drop the remaining code, and also remove the 'phy' member of the
>> 'orion_ehci_hcd' structure to simplify the code.
>>
>> Fixes: e04585184dcf ("usb: ehci-orion: avoid double PHY initialization")
> 
> The fixes tag makes no sense here, this is pure cleanup. I do not
> remember if this was needed or not, it is probably safe to drop today.

I have checked the code in v5.1, and the phy is not used there either.
Nevertheless, you are right, this is a cleanup rather than a fix. I will send a
v2 without the Fixes tag.

Thanks,
Gabor

