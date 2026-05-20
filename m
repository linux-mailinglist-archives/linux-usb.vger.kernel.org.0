Return-Path: <linux-usb+bounces-37812-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8C7lD5g8Dmqr9AUAu9opvQ
	(envelope-from <linux-usb+bounces-37812-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2026 00:58:32 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4832F59C71A
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2026 00:58:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E06EB300BC92
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2026 22:35:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 066CA3B9DA2;
	Wed, 20 May 2026 22:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="VUbAZoKF"
X-Original-To: linux-usb@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A54C83921DD;
	Wed, 20 May 2026 22:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779316523; cv=none; b=OfMhKO4We/BQi+piwrv/R6XUmEimY0GRCvPBfKS3gxS+JNcjjRUGVbl9xqsn990p99hi8U+g2d/DVEmiDHTchDtec/Znpxg4DY4stiYdp4WtDz0L2jTzRySFx+m3SZ0cM8gal6gdIdrd6maP0oXGlcLkxTA9NI8mYEY/pwO4xw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779316523; c=relaxed/simple;
	bh=VZkIB4QmtIkXbLN/2/deiLrv28Mf+8LRBm9Br8yisbQ=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=aUSKI6UPTJk4AXto6e/8xtL3RR7UE2zskjF/KRuzoX141SJhCcr45h/v6k1WealGdxGaNpsPwJ5jCEVoeRyhEAyP6PkSVlAfm89ag7e3WeobByg/reXRGfPwzxKwsozVhF2fzbrMXKcl2FLIadRlRsYT5reBgt/VzyqKKz13ySY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=VUbAZoKF; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:Message-ID:References:
	In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=Is9JWJIrflZ+JbOQ6kKdg36tv+tNHIMaN2ql/AcdQps=; b=VUbAZoKFimQSsmfnrErtZW86/c
	K7pOrWvzaz6BbAaSAUHxweqbGPMxRmLWFyOsftJFUdR7vxImvjXB6qBb8AitIenYvtui9NjMAErOV
	N+IY75mtJsKI9w1k4g848Pp4PqlA51JP0iaPwvVDqLSHRgV/bNzVY+erCAfkTLKDQw29RZxZjIsCq
	oo6mMHgyAMITtDjL/YBIcHUPqFFaarYlxHoDk6e45aReJurmkxU+zEbD2riLB2TShU/4AF0GjSQhn
	k5sFcLGiKycK92vAXqFmn4rDrpEuGdz6+NoNfRJZ8FYifC/fHEz65EoYYI0zs9vYSd0ztVFil0qgL
	ONapzrtw==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine2.igalia.com with esmtps 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wPpVW-0043Db-FY; Thu, 21 May 2026 00:35:18 +0200
Received: from webmail.service.igalia.com ([192.168.21.45])
	by mail.igalia.com with esmtp (Exim)
	id 1wPpVU-008Ubi-3j; Thu, 21 May 2026 00:35:18 +0200
Received: from localhost ([127.0.0.1] helo=webmail.igalia.com)
	by webmail.service.igalia.com with esmtp (Exim 4.98.2)
	(envelope-from <mfo@igalia.com>)
	id 1wPpVT-00000002rI6-1p1Y;
	Thu, 21 May 2026 00:35:15 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 20 May 2026 19:35:15 -0300
From: Mauricio Faria de Oliveira <mfo@igalia.com>
To: Matthieu CASTET <castet.matthieu@free.fr>, Stanislaw Gruszka
 <stf_xl@wp.pl>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel-dev@igalia.com, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] usb: atm: ueagle-atm: cosmetic changes to .probe()
In-Reply-To: <20260515-ueagle-atm_cosmetic-v1-0-9a15e5e45bd7@igalia.com>
References: <20260515-ueagle-atm_cosmetic-v1-0-9a15e5e45bd7@igalia.com>
Message-ID: <4630c807c0b383105a7661de4287a240@igalia.com>
X-Sender: mfo@igalia.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Report: NO, Score=-4.8, Tests=ALL_TRUSTED=-3,AWL=-2.587,BAYES_50=0.8
X-Spam-Score: -47
X-Spam-Bar: ----
X-Spamd-Result: default: False [-0.36 / 15.00];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TAGGED_FROM(0.00)[bounces-37812-lists,linux-usb=lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[free.fr,wp.pl,linuxfoundation.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[mfo@igalia.com,linux-usb@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[igalia.com:-];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[igalia.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 4832F59C71A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-05-15 20:54, Mauricio Faria de Oliveira wrote:
> This series does a couple of cosmetic changes to ueagle-atm's .probe().

Different approach as per Greg's suggestions:
https://lore.kernel.org/all/20260520-ueagle-atm-cleanup-v1-0-010c8bc7b214@igalia.com/

-- 
Mauricio

