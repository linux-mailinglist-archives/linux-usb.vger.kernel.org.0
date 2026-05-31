Return-Path: <linux-usb+bounces-38199-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id G7JsMuM1HGpQLgkAu9opvQ
	(envelope-from <linux-usb+bounces-38199-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 31 May 2026 15:21:39 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 521FA616587
	for <lists+linux-usb@lfdr.de>; Sun, 31 May 2026 15:21:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BB69E3090A00
	for <lists+linux-usb@lfdr.de>; Sun, 31 May 2026 13:15:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A342360EF8;
	Sun, 31 May 2026 13:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CArwT4Pj"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52ED638C429
	for <linux-usb@vger.kernel.org>; Sun, 31 May 2026 13:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780233352; cv=none; b=B5HM23dMGczjikNshnI9tk7ie6sLOjTB2CBqzBMN3EWzywv0kDm9W7oihmF9KcP3xpAl0tq9+ZRRT6kGDNzk9+rtMfSt3s4pZ4oZVN1lkn4dnbnQYBlcGLexoyLJpsqYgZSk4fQMt9Qry3AhqyQp+hrJSc+MhhYF9czWHoJQSzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780233352; c=relaxed/simple;
	bh=Efi8Cb02D1M0/qFAUfTEEnBtc64bQ4zoiY7Fp2Fxs5g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mOvJTo6P26zyQz3uT8NPCBT9b/IW0H7fm87qAjSmsk9wUAkF7C17Mf5PJ8nsTVOJryJM+zsOYvsO23co+FPpyNDSQten+GbkKYYKM4pBdsK2gqKGELBck0Qd/MitgzI2B6dDUdHE8klt2mPvKCKTW+6Tkib5T1Boe6U28SPAGiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CArwT4Pj; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A38951F00893;
	Sun, 31 May 2026 13:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780233348;
	bh=nfSm5H7aJeXp2y34jy2arYafR+yGi63Sc5O0krEaYeo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=CArwT4PjyDWOjGFdnhkCX/b6eb6/NGcat0/rF9uzXJzB58EtydFzxN7SCnYqr931w
	 usTJ3yPRlqoS+lQOzQkR69pv+Afxa7O2QcsOt128Zol3qvrWDMIzuAXG0N2EOCNKZY
	 0YCGTaQmvHmjb3XllEmrCzzVPscCsN0o26+bm1COf+UeNo8+Jjj6tmBy0ABV2d7jgH
	 V87yAAiSlF8L1sJd/wyDwBSMgRu0eNUIX9zq3qb3Z/h7DlNsnAZnJGR8xuOa+zTEcG
	 urdpm0bBJZWkw/FBa6Qb9Nq//GO94ZFVCcI+Y0lG47MRgfApw+ickdmOYhyOSFI0EA
	 WT91TsB4LzqfQ==
Message-ID: <00be7b91-5c8e-490e-a415-a0f9d57ef794@kernel.org>
Date: Sun, 31 May 2026 15:15:45 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] thunderbolt: USB4 v2 TBGAA tunnel creation crash in TMU
 enhanced uni-directional mode
Content-Language: en-US
To: Sebastian Loscher <krang@krang.de>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-usb@vger.kernel.org, andreas.noever@gmail.com
References: <13787e02-75d9-8000-65d5-41434a0e817c@krang.de>
 <20260525044421.GI8580@black.igk.intel.com>
 <8c753210-e399-4ddf-8ca4-d250fd4af369@kernel.org>
 <20260526040732.GO8580@black.igk.intel.com>
 <523ddc3e-2047-c202-482a-02d76de17cd4@krang.de>
 <20260527122624.GC3102@black.igk.intel.com>
 <536cc913-8ae8-9000-69f9-02f604b7edfe@krang.de>
 <20260529063422.GJ3102@black.igk.intel.com>
 <d8147af2-41da-ad0d-4e67-d910cccbf32f@krang.de>
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <d8147af2-41da-ad0d-4e67-d910cccbf32f@krang.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38199-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[superm1@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 521FA616587
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/29/26 22:05, Sebastian Loscher wrote:
> Hej Mika, Mario and team,
> 
> Another tbtrace and dmesg from me after enabling thunderbolt.dyndbg=+p 
> (and removing pci_port_pm). Not a whole progress here but more info.
> A comment on dmesg/tbtrace: 95s-117s plugged in once and let it settle. 
> Didn't touch it until 277s where I tried three replugs, middle one in 
> the bottom (rear) usb4v2 port. I recognized not change in fan speed like 
> I described before. dmesg seems different and does net seem to start 
> recognizing the other devides on the dock?
> 
> Hope this helps again. Thanks for your engagement
> 
maybe it's a NULL pointer deref?

Can you see if this helps avoid the crash?

╰─❯ git diff
diff --git a/drivers/thunderbolt/tmu.c b/drivers/thunderbolt/tmu.c
index cf779874c6756..ee239225ac417 100644
--- a/drivers/thunderbolt/tmu.c
+++ b/drivers/thunderbolt/tmu.c
@@ -736,6 +736,9 @@ static int 
tb_switch_tmu_enable_unidirectional(struct tb_switch *sw)

         up = tb_upstream_port(sw);
         down = tb_switch_downstream_port(sw);
+       if (!down)
+               return -ENODEV;
+
         ret = tb_switch_tmu_rate_write(tb_switch_parent(sw),
                                        tmu_rates[sw->tmu.mode_request]);
         if (ret)
@@ -785,6 +788,8 @@ static int tb_switch_tmu_enable_enhanced(struct 
tb_switch *sw)

         up = tb_upstream_port(sw);
         down = tb_switch_downstream_port(sw);
+       if (!down)
+               return -ENODEV;

         ret = tb_port_set_tmu_mode_params(up, sw->tmu.mode_request);
         if (ret)


