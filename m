Return-Path: <linux-usb+bounces-33163-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qMt8GeOHiGmGqgQAu9opvQ
	(envelope-from <linux-usb+bounces-33163-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 08 Feb 2026 13:56:03 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C6A108A6D
	for <lists+linux-usb@lfdr.de>; Sun, 08 Feb 2026 13:56:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CE9D23011BF7
	for <lists+linux-usb@lfdr.de>; Sun,  8 Feb 2026 12:55:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A08721B9C0;
	Sun,  8 Feb 2026 12:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=investurk.com.tr header.i=@investurk.com.tr header.b="vVatcZON"
X-Original-To: linux-usb@vger.kernel.org
Received: from hosting4.idealhosting.org (hosting4.idealhosting.org [185.87.26.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D51331ACEDF
	for <linux-usb@vger.kernel.org>; Sun,  8 Feb 2026 12:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.87.26.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770555348; cv=none; b=f7gealHrI3oyTS1bOuEAUxxkMur1n+URF6ZX3cHBjK9wHiA6B651Vd/UWvOa1QjGYuUruyB9pB0NgZfw+hGyKUcglzB1Y6cVs/EqP/3N/gOpnfUsbRJOiyjOhzfKLUoXgimwj71pC8lrzLB+Wml8zdQfgo7KeZYv5C61pSxt7MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770555348; c=relaxed/simple;
	bh=JExkBDb+FhnDhbnHIRgecQ7xFnq9d0/tC0z32LDSHDY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=si6EQFv3hhBDTrx60rp7oVuvmX/9++cegQEb8e9K5RGmSUKbIx7j5D3PYMyMyVfS6lir1xioQS59allbYHqhg4NWKQsP18Gfg9S7/v088DGk/mUok6JsMDqBYxzmfrZNoG/6HBL/EzdJWttqQ208NpmPOkoLaeMBBEoHG4220rE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=investurk.com.tr; spf=fail smtp.mailfrom=investurk.com.tr; dkim=pass (2048-bit key) header.d=investurk.com.tr header.i=@investurk.com.tr header.b=vVatcZON; arc=none smtp.client-ip=185.87.26.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=investurk.com.tr
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=investurk.com.tr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=investurk.com.tr; s=default; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Sender:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=JExkBDb+FhnDhbnHIRgecQ7xFnq9d0/tC0z32LDSHDY=; b=vVatcZONNnqvFESMF1vCws2XOE
	/r56tFJHlRYYNDh+R/HxgAWhF3kJv6OyIYyqkUPv32OaWbCRjda+jvCmeIcHu0iCm1efVWvzTRrn3
	CmVwkz54JivDtA5zOGLULuL/PdSHRPfj7CPzRRggPYP00/m6Ck67+X3qbweg/Vu39aoLq9G9YLYwo
	b6s2T6+rSHyKSrm9ih+SO8N+WTXpXDBar145ktxVSnFklH8/3YmH7dvD/qodR4CmlMco4MtpwUCIA
	aC/LJHqSbNp9oWZvNyL2ME+ozPp33p5mu2UK7Z7CwOFCkU1qX/+oXCzsBymLJUtpmgSb10uHP0he+
	MJKs076A==;
Received: from [130.131.125.197] (port=53707)
	by hosting4.idealhosting.org with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <emreaydin@investurk.com.tr>)
	id 1vp4KF-00Ct46-0L
	for linux-usb@vger.kernel.org;
	Sun, 08 Feb 2026 15:55:43 +0300
Reply-To: mrdhakergnaba@centfinancialslt.com
From: emreaydin@investurk.com.tr
To: linux-usb@vger.kernel.org
Subject: 2.5% Interest Rate financing
Date: 8 Feb 2026 12:55:43 +0000
Message-ID: <20260208125543.EB18B13843B1094C@investurk.com.tr>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - hosting4.idealhosting.org
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - investurk.com.tr
X-Get-Message-Sender-Via: hosting4.idealhosting.org: authenticated_id: emreaydin@investurk.com.tr
X-Authenticated-Sender: hosting4.idealhosting.org: emreaydin@investurk.com.tr
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [12.93 / 15.00];
	FUZZY_DENIED(11.99)[1:b99a8ca5ca:1.00:bin];
	R_DKIM_REJECT(1.00)[investurk.com.tr:s=default];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[investurk.com.tr : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33163-lists,linux-usb=lfdr.de];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[emreaydin@investurk.com.tr,linux-usb@vger.kernel.org];
	HAS_X_AS(0.00)[emreaydin@investurk.com.tr];
	HAS_X_GMSV(0.00)[emreaydin@investurk.com.tr];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	GREYLIST(0.00)[pass,body];
	RCPT_COUNT_ONE(0.00)[1];
	HAS_X_SOURCE(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	DKIM_TRACE(0.00)[investurk.com.tr:-];
	TAGGED_RCPT(0.00)[linux-usb];
	R_SPF_ALLOW(0.00)[+ip4:172.234.253.10:c];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TO_DN_NONE(0.00)[];
	HAS_REPLYTO(0.00)[mrdhakergnaba@centfinancialslt.com];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	FROM_NO_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	HAS_X_ANTIABUSE(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_SPAM(0.00)[0.999];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,centfinancialslt.com:replyto,investurk.com.tr:mid]
X-Rspamd-Queue-Id: C6C6A108A6D
X-Rspamd-Action: add header
X-Spam: Yes

Dear Sir/Madam,

Warm greetings from Cent Financial Solution LLC.

We would be pleased to hear from you should you or your client
have a viable project requiring funding. Please feel free to
contact us to discuss potential opportunities for collaboration.

Yours sincerely,

Mr. Dhaker Gnaba
Director
Cent Financial Solution LLC

