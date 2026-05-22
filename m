Return-Path: <linux-usb+bounces-37943-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6DFQIs2MEGrEZQYAu9opvQ
	(envelope-from <linux-usb+bounces-37943-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 22 May 2026 19:05:17 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8D05B7E3A
	for <lists+linux-usb@lfdr.de>; Fri, 22 May 2026 19:05:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 28941303A91C
	for <lists+linux-usb@lfdr.de>; Fri, 22 May 2026 16:56:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C32B425CEE;
	Fri, 22 May 2026 16:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="n1rngZBL"
X-Original-To: linux-usb@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADA86372675;
	Fri, 22 May 2026 16:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779469007; cv=none; b=aijxgrQwaxBUjl7vEOUKf9WjVWUUlI2HVWGAYjlU0qJWLDfRfr54pmFejf+zeUsZiHYeErs28JHHRAfgA6Jx1LCG1NVioTPHwpBChZVV3lH62QoT4mOpzL+GINNybOLjySAGQLgk4nPpgu+kTbBhfK+5EeZDw1S9Omzbat7Wer4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779469007; c=relaxed/simple;
	bh=n++FdIosPeNT07ztJBf5RtzdN3AQ1F1g3yRALNjox3E=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=NI6WXZP15AeqW9p5VhVweGjgb/ngD5DvgcBVInrMdofrAjnUp7VSUKYKaBuxkUdiLYFVHtKAOl5JppoQVJZO76m8oewpMOlcX590pXzoOyYPZ0uK6ReMQjOzknYamXoPtaSVQm/MZ3Bua5D84oWJbOpRy1Yr1FI2tY39rvQ/W2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=n1rngZBL; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:Message-ID:References:
	In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=UFPJLpxl1NsU0WDhn51qLwVFCoecrXlibx4at6QgBUg=; b=n1rngZBL26Fftst0RSc6jiQL/u
	fdTuBUI2q0vGGw9Dh4fHdFDdR1WP/60T7z934HvxPZ8/cvbJlFz35LEZuMqSLnxIEetuSPg5RKjMR
	V1pbRPyU0yms0qTblCgjGkFtm7Cgl5CdvAlT9DMqSKSEWkJl4UCwmRUgwdzqT8Kl/4wdBixhgfKuz
	qSQQgVEGoxeFSzilGGnoAIFgXXtFUGX0pY+JRrXS3S3cW8DW8PfeqtS74ns2w/v1AlriycEi5jlL5
	VyZakLgwtZdflfImia70RJH/7BymJyLJKPb5wIDvDOBwUTpuXwqJ8cCEgqaBeDtlMlNDdRL584YPH
	13dMmHWw==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine2.igalia.com with esmtps 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wQTAu-004yLa-EK; Fri, 22 May 2026 18:56:40 +0200
Received: from webmail.service.igalia.com ([192.168.21.45])
	by mail.igalia.com with esmtp (Exim)
	id 1wQTAs-00B7mT-31; Fri, 22 May 2026 18:56:40 +0200
Received: from localhost ([127.0.0.1] helo=webmail.igalia.com)
	by webmail.service.igalia.com with esmtp (Exim 4.98.2)
	(envelope-from <mfo@igalia.com>)
	id 1wQTAr-00000003LBs-1gvy;
	Fri, 22 May 2026 18:56:37 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 22 May 2026 13:56:37 -0300
From: Mauricio Faria de Oliveira <mfo@igalia.com>
To: Stanislaw Gruszka <stf_xl@wp.pl>
Cc: Matthieu CASTET <castet.matthieu@free.fr>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, kernel-dev@igalia.com,
 linux-atm-general@lists.sourceforge.net, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 syzbot+ce1e5a1b4e086b43e56d@syzkaller.appspotmail.com,
 syzbot+306212936b13e520679d@syzkaller.appspotmail.com
Subject: Re: [PATCH] usb: atm: ueagle-atm: use synchronous request_firmware()
In-Reply-To: <553f402beef6864520d0789f506fa4e2@igalia.com>
References: <20260515-ueagle-atm_req-fw-sync-v1-1-406ca3939e2a@igalia.com>
 <20260516091920.GA9154@wp.pl> <553f402beef6864520d0789f506fa4e2@igalia.com>
Message-ID: <b540c25bcc62b0ed6f3dfa674c1c82d2@igalia.com>
X-Sender: mfo@igalia.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Report: NO, Score=-4.9, Tests=ALL_TRUSTED=-3,AWL=-2.677,BAYES_50=0.8
X-Spam-Score: -48
X-Spam-Bar: ----
X-Spamd-Result: default: False [1.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-37943-lists,linux-usb=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_CC(0.00)[free.fr,linuxfoundation.org,igalia.com,lists.sourceforge.net,vger.kernel.org,syzkaller.appspotmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[wp.pl];
	DKIM_TRACE(0.00)[igalia.com:-];
	MISSING_XM_UA(0.00)[];
	NEURAL_SPAM(0.00)[0.317];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mfo@igalia.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,ce1e5a1b4e086b43e56d,306212936b13e520679d];
	RCPT_COUNT_SEVEN(0.00)[9];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: DC8D05B7E3A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-05-18 12:54, Mauricio Faria de Oliveira wrote:
> On 2026-05-16 06:19, Stanislaw Gruszka wrote:
>> I prefer not to change this. If synchronization with disconnect
>> is required, I would rather keep request_firmware_nowait() and add 
>> explicit completion handling. Andrey some time ago posted a patch 
>> for this:
>> https://lore.kernel.org/lkml/20250410093146.3776801-1-aitsygunka@yandex.ru/
>> 
>> I refused the patch because it appears to only avoid pr_debug, but if
>> it fixes actual problem, we can take it.
> 
> Ok, I found it earlier, but opted otherwise as I missed the rationale.
> 
> I'll be happy to check it for resending; I had a slightly different
> implementation in mind when I considered a similar approach (using a
> struct completion in the existing data structure), but I'll double check
> it whether it's doable, and get back to you.

v2:
https://lore.kernel.org/all/20260522-ueagle-atm_req-fw-sync-v2-1-eee7f6b823a7@igalia.com/

This uses just struct usb_interface instead of a new structure, with
intfdata for struct completion and interface_to_usbdev() for struct
usb_device.

Also, use a condition check for pre-firmware devices in .disconnect(),
as IIUIC just 'else' could match interfaces != 0 on non pre-firmware
devices (i.e., bNumInterfaces != 1 && ifnum != 0).

Kind regards,
-- 
Mauricio

