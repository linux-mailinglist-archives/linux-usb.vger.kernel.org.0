Return-Path: <linux-usb+bounces-36459-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WI3HL7Od6mnF1QIAu9opvQ
	(envelope-from <linux-usb+bounces-36459-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 24 Apr 2026 00:31:15 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2549D458247
	for <lists+linux-usb@lfdr.de>; Fri, 24 Apr 2026 00:31:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D7B593036632
	for <lists+linux-usb@lfdr.de>; Thu, 23 Apr 2026 22:28:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F29A43B27CE;
	Thu, 23 Apr 2026 22:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SrhjClDl"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 378C73264FE
	for <linux-usb@vger.kernel.org>; Thu, 23 Apr 2026 22:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776983328; cv=none; b=OZcBFK3fO42CB+GF8P9I/ILIqwULH1BWE5gcHFY/386spQev3koZSaLCtgiPHkccC5oLrFtSMaYu8gb17z22LyjsLrQVzkU1EBIkLicuaP72QPR0ZMXjWMHsyEMKT2cUdkD9eKlL2WdBYERpUbMvOjmUhXltOoD7KgyUQuE2aDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776983328; c=relaxed/simple;
	bh=l67yrJ/UZzx+pXWqRiRNcT9T9iO6K+b2juS+2KALSQw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qQgSUHjvpw7pCxGR6NadbmZ/Bn7pE3lteP5pGYMpQcBdr8oGLMyxVd06ehHoZGf+Qz/6gYOBdhcnRJcQMlRg70QHLLpOgWrUcVCTRRafhvCZ+/+NCdAb1atScR47bWMVvmRIulLv/a8JN9m6MTuG+84XO2HKtp3rqnXJO+wsczc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SrhjClDl; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-38e12c67a6fso71920681fa.1
        for <linux-usb@vger.kernel.org>; Thu, 23 Apr 2026 15:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776983325; x=1777588125; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YfoWb8W4UVEmeLvxChwZ84X+xyL4SxpAJaIS+MUYhoc=;
        b=SrhjClDlVnWQpXl0T4trYyeSAJjn0D2Dj24vydeOMnn1S6HsgkJA+DmBvvV6YeUkPJ
         ovNIRMEFoCdJ3VHWPjoRvgu5hIkrI7SfNxOuasjxOuK60xbjGc02lVtt5cv+TlDwkRm7
         kCLRcTNdJ3CAuwGXEDAhtGXxqkH5mq38oFWcQP8y724khtyasLrnkfI+0woWKL6Edi5f
         kdM8JCurRZnUsN/W7XQZ+MglBpeG8EhfPBH5rQbgCDKNZVcdVtTWgN1xM0gfIBg8CUIu
         qZLYWKxRkPZwpvC6oqdiEHJXLgoBxMH0bCumgICDlK6BUeGPwXQWbl1R2S55OEO8VqHo
         KUfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776983325; x=1777588125;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YfoWb8W4UVEmeLvxChwZ84X+xyL4SxpAJaIS+MUYhoc=;
        b=TRc1J3w4OwbNCEmLHZ4q53D4N0qgWKkq12YswfJiP22/iksgcELrXMnOhDUcdHE4l/
         BPet5JlCoB0+O2Lgs68vLgz7uNG3ZIRW3aUffdcWTKdKWnhX9Dbi4AjVRCog9MuF+ZMA
         jAB+2Z8xs5W3d/6Qrjw+ynvP2kGEydW667uqVMfZqX1vTNE8yhXe/huqaw2vEcJ3IaJZ
         TRWc4+Ng+pDQIfTv48MD9zmLcbrCBtHClx7eZU+1NlHpcopYj4rYPEyx/r/Zd+TA99zt
         U1mcfPtMaV0tNNOQgyyPccUSWcnOs3VsPtb/Uc46aGbCY1JXvPPHnQKXsGjaDMIGQRWE
         IT5w==
X-Forwarded-Encrypted: i=1; AFNElJ+ty/XnbRAYOrFGht9a+I/+MYgoj6fO9eklrzU3dHnuD2wXu6wv330qTA6UfpxeV6KXQbRvdW4Zeg0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwK+/PqiUoMbs5YgcpLE/vmTSTkv1pX5F/jmGIxkF6wUdiaZq0k
	JYkFlW3TAJJW+Hb92KGuTrtFMZ/OdIkROijHaivVo5eg6FzazEhSr1jQtgOHXQ==
X-Gm-Gg: AeBDievJGO1QHvtgN5M/9bKpQtFftkN0ycDJVEcfyD+ja//0vdcOZaV9K6gwHamtPqK
	TBPO9oOCKXIaw/Cx7zaE4aPkLdy/WiGiRq87iJiTlCVgtxP+WXSyZEfA7WpLPW8Bgh4xydB7p8c
	V45OAPf5g93LAI+ADtBXDJgSeZ++t3h5ZeeAwefnWIoXCqe+syhk5b1lNRu8HFlm4rc4oKzdzRH
	0k+5jVNlRxAxl3IfvI7+GLyeLuo1XNTIjRQK3VO4B5uP2YgP/HfksBUF1I1M5W3fYoQPGvRqDmA
	Z4qcSYwQv0mX5W59nNHNN88+wW5d04OCuxPw4Y3amlIK5YUCxDTg4E/LGsz0ItKcnVblrA0/AR/
	WUjbos8GwZe1aGPs4lpzML0hDKYWIRRBoFOvCL1zOKs3llwYiFjt0ML3qAUqlBSQqBV0OobqQRW
	Mo+7DYvkhDv9RZULYTqBrjuJ/IsbNVE+5rBTsvInErLy4=
X-Received: by 2002:a2e:9a0e:0:b0:38f:20cc:2bb0 with SMTP id 38308e7fff4ca-38f20cc3732mr67753571fa.23.1776983325138;
        Thu, 23 Apr 2026 15:28:45 -0700 (PDT)
Received: from foxbook (bfh75.neoplus.adsl.tpnet.pl. [83.28.45.75])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb4f5119sm41915471fa.2.2026.04.23.15.28.42
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 23 Apr 2026 15:28:44 -0700 (PDT)
Date: Fri, 24 Apr 2026 00:28:39 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Heitor Alves de Siqueira <halves@igalia.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com,
 syzbot+abbfd103085885cf16a2@syzkaller.appspotmail.com, stable@kernel.org
Subject: Re: [PATCH v2] usb: usbtmc: reject invalid interrupt endpoints
Message-ID: <20260424002839.5ad25517.michal.pecio@gmail.com>
In-Reply-To: <20260423-usbtmc-iin-size-v2-1-31afa4874f71@igalia.com>
References: <20260423-usbtmc-iin-size-v2-1-31afa4874f71@igalia.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36459-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,abbfd103085885cf16a2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,igalia.com:email,syzkaller.appspot.com:url]
X-Rspamd-Queue-Id: 2549D458247
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 23 Apr 2026 15:04:38 -0300, Heitor Alves de Siqueira wrote:
> The USBTMC driver allocates the Interrupt-IN buffer according to the
> wMaxPacketSize value obtained from the USB endpoint. If a USB device
> advertises a small enough wMaxPacketSize (e.g. a malfunctioning device
> or an endpoint constructed by syzbot), the buffer will not have enough
> space for the mandatory headers and will trigger an out-of-bounds read.
> 
> Fix by rejecting devices advertising interrupt endpoints that don't fit
> at least the mandatory headers (bNotify1 and bNotify2).
> 
> Fixes: dbf3e7f654c0 ("Implement an ioctl to support the USMTMC-USB488 READ_STATUS_BYTE operation.")
> Reported-by: syzbot+abbfd103085885cf16a2@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=abbfd103085885cf16a2
> Cc: stable@kernel.org
> Suggested-by: Michal Pecio <michal.pecio@gmail.com>
> Signed-off-by: Heitor Alves de Siqueira <halves@igalia.com>
> ---
> Changes in v2:
> - Instead of ensuring buffer size, reject devices that advertise illegal/invalid interrupt endpoints
> - Link to v1: https://patch.msgid.link/20260422-usbtmc-iin-size-v1-1-5dc44b4389aa@igalia.com

On second thought, this may be not enough. A wMaxPacketSize == 2 device
can still send only 1 byte (or even 0) and cause unititialized read.
Better check if the URB completed with expected actual_length before
trying to parse the message.

And by the way, an interrupt transfer may span multiple intervals and
exceed wMaxPacketSize, USBTMC spec alludes to it. Theoretically, even
wMaxPacketSize == 1 seems possible, though it would be crazy and likely
no such HW exists because nobody complains that it doesn't work.

Regards,
Michal

