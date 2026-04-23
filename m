Return-Path: <linux-usb+bounces-36443-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MHprMOUM6mn4sgIAu9opvQ
	(envelope-from <linux-usb+bounces-36443-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 23 Apr 2026 14:13:25 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B201451CF6
	for <lists+linux-usb@lfdr.de>; Thu, 23 Apr 2026 14:13:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 180C43038F5E
	for <lists+linux-usb@lfdr.de>; Thu, 23 Apr 2026 12:07:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E49C33EBF18;
	Thu, 23 Apr 2026 12:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iDUXJYNi"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 709AA3EB7F1;
	Thu, 23 Apr 2026 12:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776946069; cv=none; b=R2SGuXrwGOg50UC5S+aWstOyP6Q6Y15IY4g1x6QwZdC6OLjXO1CdJs7A/qVsZJNsD7rsoYhuXoieWEFL0CrmYPYDt9zcJc35rVxkEtE4cRFpf73UUW4L0xjlT1lBrkg+FhULhwZdRLwqyysnvZ2SfvUgmkBaW53Xj3BGonRV6YQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776946069; c=relaxed/simple;
	bh=MtiLWXTOCYgu6C9U1kT+hxN75UrZT1aHLwvcyfhjNlM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KIokQ4mkC8APmhl/XKdn1B8Si2X32z+JjoH/Tfic9ebylQiClgQeYFWAbSmmJdSFAiL7nAbZDBHbZIj47vTTcFmLEkqbmQnEKiCX7l9OALq3t4qbGkKNuAYs0R35JMDz3XYvgTR3d+ym+u0w/iiKe836SR5UmvvuzhgGMMauVA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iDUXJYNi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6E33C2BCAF;
	Thu, 23 Apr 2026 12:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776946069;
	bh=MtiLWXTOCYgu6C9U1kT+hxN75UrZT1aHLwvcyfhjNlM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iDUXJYNioac59qp+9G6yKPC24XEWuCy2USHTFQUFzIHiuBh8nKmLy3CuitaoHAb8e
	 Uj1/3hwrLvptMK3qiE7OwKvxbpEQkNi8J1KKUpSpsLXSEMjkyTB+k+IZ1EuQpSZeL8
	 L6X4KBtGIeOfK1V3dLU3HBEaaZBJZVi3oNJNS6v5wyQ4SqudIsChNVsZGm/WTHirBp
	 ZHBLHTX/Kp9GjDAWwdCoBwCEnSFLraDsttdkaFkwA5e9hDcsSCPyrduHFhrHHu9Ywb
	 m85fqLRHdhWcjATyteeG0BAt+1K0Ttcs0NKNDOzw5yzR12Ea25miDVArlWG8w4KUKc
	 OiRhTIp9NVsFg==
Date: Thu, 23 Apr 2026 13:07:44 +0100
From: Lee Jones <lee@kernel.org>
To: amitsd@google.com
Cc: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	Badhri Jagan Sridharan <badhri@google.com>
Subject: Re: [PATCH] mfd: max77759: fix comment style for enums
Message-ID: <20260423120744.GB170138@google.com>
References: <20260401-fix-mfd-max77759-usb-next-v1-1-174ec23ad824@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260401-fix-mfd-max77759-usb-next-v1-1-174ec23ad824@google.com>
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_RHS_MATCH_TO(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-36443-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	MAILSPIKE_FAIL(0.00)[172.234.253.10:server fail];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9B201451CF6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 01 Apr 2026, Amit Sunil Dhamne via B4 Relay wrote:

> From: Amit Sunil Dhamne <amitsd@google.com>
> 
> Fix comment style for enums so they're kernel-doc compliant.
> 
> Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
> ---
> This patch is a follow-up to the series [1]. [1] has been accepted in
> the USB subsystem tree (usb-next). However, since Lee has additional
> feedback [2], I am sending this patch to fix it. Please note that this
> patch is based out of usb-next branch on usb tree. This patch should be
> applied on top of b422f7c072ac ("mfd: max77759: add register bitmasks
> and modify irq configs for charger").
> 
> [1] https://lore.kernel.org/all/20260325-max77759-charger-v9-0-4486dd297adc@google.com/
> [2] https://lore.kernel.org/all/20260331123138.GE3795166@google.com/
> ---
> Output of kernel-doc script (none format)
> $ scripts/kernel-doc -v -none -Wall include/linux/mfd/max77759.h
> Info: include/linux/mfd/max77759.h:134 Scanning doc for enum max77759_chgr_chgin_dtls_status
> Info: include/linux/mfd/max77759.h:152 Scanning doc for enum max77759_chgr_bat_dtls_states
> Info: include/linux/mfd/max77759.h:174 Scanning doc for enum max77759_chgr_chg_dtls_states
> Info: include/linux/mfd/max77759.h:212 Scanning doc for struct max77759
> Info: include/linux/mfd/max77759.h:235 Scanning doc for struct max77759_maxq_command
> Info: include/linux/mfd/max77759.h:247 Scanning doc for struct max77759_maxq_response
> Info: include/linux/mfd/max77759.h:258 Scanning doc for function max77759_maxq_command
> ---
>  include/linux/mfd/max77759.h | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

Commit doesn't apply.  Please rebase.

-- 
Lee Jones [李琼斯]

