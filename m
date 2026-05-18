Return-Path: <linux-usb+bounces-37618-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aJX0F94mC2pAEAUAu9opvQ
	(envelope-from <linux-usb+bounces-37618-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 16:49:02 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0987656F38D
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 16:49:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 780F23028EDB
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 14:47:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCEBD26ED59;
	Mon, 18 May 2026 14:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="AEungQbb"
X-Original-To: linux-usb@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B39631A3157;
	Mon, 18 May 2026 14:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779115622; cv=none; b=t/MrvZ+93FpatY2Y6iH6i5Js2OStfOlqvsiZlIDaB3hNx3etjo5bPDjIGprD1m8JAiJWZfd1DQA3uOzTLN2RiYDsinyh1TAZyP/nTZjCc+KNjWzqMsqu+5wjZJh3pmPwpjLHImNo5Eo2iVyKebylrChW0M/m+CLwnQVbcv5/OVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779115622; c=relaxed/simple;
	bh=krJyfzj5VdtS7Bxh0J2mCUhD6MzkZE/FcTmwSDHUg2M=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=YeotD6CQWQYmQL66bPKwucsrrprcfKoz+CH8v/yjyDaOEROOs/F6z+5HNo6WVoe0ozjOJgOB+3L8Hte4QZOcZM23Yq3d5KPCN4O4YHhhpLO3CQI7AT9p5dJWqSlFFB47Ts6JruXogDkO1ttGK5qxozk8GDIST++yppjQ4E/moFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=AEungQbb; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:Message-ID:References:
	In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=NbSMa48m70Oo2KhjQcOdBtQf0n81su0vOE/YeOaWNNA=; b=AEungQbbT72Qf4G1ZGJcH/jAF6
	tVjUOm9pnwPfpSKClhMzLTU2Jo0F4WcgLna1iLsck31mEh1ok3mAmJnw5oenICSnKMLbvL6cw32jm
	SOQSK40jI8GeZcRjHXp2Al0MbmMx6rUr2qd3yE8x0cH3jkC5XAc2u7dBLMK/at1+sSVDeAbM/1j80
	LWgCbMHPUQQX+jhWTjQEd532DOBilimRobZ29TarShcznnQtVoBVUSOj2/fCT+5IyRYH9hNsedgeR
	k/YNJ2J2T0TilrAWhrZ3/z24TVXDtYtE1+8IIxl7R0aSdknzZxssUbc7oHiKDgeG5DcK2ngp4BNSv
	6w23NXUQ==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine2.igalia.com with esmtps 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wOzF7-002g9Z-Lh; Mon, 18 May 2026 16:46:53 +0200
Received: from webmail.service.igalia.com ([192.168.21.45])
	by mail.igalia.com with esmtp (Exim)
	id 1wOzF5-004xYy-K0; Mon, 18 May 2026 16:46:53 +0200
Received: from localhost ([127.0.0.1] helo=webmail.igalia.com)
	by webmail.service.igalia.com with esmtp (Exim 4.98.2)
	(envelope-from <mfo@igalia.com>)
	id 1wOzF4-00000002Azo-3uJJ;
	Mon, 18 May 2026 16:46:51 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 18 May 2026 11:46:51 -0300
From: Mauricio Faria de Oliveira <mfo@igalia.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Matthieu CASTET <castet.matthieu@free.fr>, Stanislaw Gruszka
 <stf_xl@wp.pl>, kernel-dev@igalia.com,
 linux-atm-general@lists.sourceforge.net, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] usb: atm: ueagle-atm: add missing uea_leaves() in
 uea_probe()
In-Reply-To: <2026051657-scruffy-embark-45ea@gregkh>
References: <20260515-ueagle-atm_cosmetic-v1-0-9a15e5e45bd7@igalia.com>
 <20260515-ueagle-atm_cosmetic-v1-2-9a15e5e45bd7@igalia.com>
 <2026051657-scruffy-embark-45ea@gregkh>
Message-ID: <8d7b08e6931e570a984d086f06f07ccb@igalia.com>
X-Sender: mfo@igalia.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Report: NO, Score=-2.2, Tests=ALL_TRUSTED=-3,BAYES_50=0.8
X-Spam-Score: -21
X-Spam-Bar: --
X-Spamd-Result: default: False [-0.36 / 15.00];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-37618-lists,linux-usb=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_CC(0.00)[free.fr,wp.pl,igalia.com,lists.sourceforge.net,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[igalia.com:-];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[mfo@igalia.com,linux-usb@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,igalia.com:mid]
X-Rspamd-Queue-Id: 0987656F38D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-05-16 04:19, Greg Kroah-Hartman wrote:
> On Fri, May 15, 2026 at 08:54:13PM -0300, Mauricio Faria de Oliveira wrote:
>> Pair the existing uea_enters() (function entry debug message) with
>> a missing uea_leaves() (function exit debug message) in uea_probe().
> 
> All of those should also be removed, we have function tracing if people
> really need/want to see this info.

Agreed. I'll send an updated series based on your feedback. Thanks.

> 
> thanks,
> 
> greg k-h

-- 
Mauricio

