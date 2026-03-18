Return-Path: <linux-usb+bounces-35067-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OPU9OhLTummfcAIAu9opvQ
	(envelope-from <linux-usb+bounces-35067-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 17:30:10 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE012BF4F9
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 17:30:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A26843007BA9
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 16:30:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A98913C661E;
	Wed, 18 Mar 2026 16:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mxWUf6Ds";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3WgXJH+i";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MN4ZyP3D";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hcbgHJ6s"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 381313DC4C5
	for <linux-usb@vger.kernel.org>; Wed, 18 Mar 2026 16:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773849794; cv=none; b=ZRBTBiciprl7aTP4yC/dqlcu4Ek1xDLjvVjYEF6VQkXmyN/GB0Cbs2ZjbWVDpt1G9p12CA/PDx1oZI0RMkyNF/uJYN+FfbXlnR+ix2si1Z/ESDQPka0wfQi4DAEUUeCcLDdHDWq9nWg+UUpJ2I7YOxK+fe9qX8p78owGmjMObgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773849794; c=relaxed/simple;
	bh=wN5cUZ0zdT/TEHWDN+VcdHqBYQAS/OXnrrsWGfJoBvI=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CUU021rrdu602pLCA8QZZKPKMt8ELo0WKSWnjMrNQEVLA9ofDMBgqzV8TBTCYlQ6aliJPxWALKO6VtriPPaYzk0rc75FvsNSBhgacmm2ui2IBUImGEd8OPil0esvbwbJxZUPwt8IR+8jpesW0nJuuUisT1Jv4nqutlq8/syhnM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mxWUf6Ds; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3WgXJH+i; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=MN4ZyP3D; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=hcbgHJ6s; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 06D994D3ED;
	Wed, 18 Mar 2026 16:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773849787; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lr/iSpFEtsFlvM7WU2EXJDEzTpLLAxsMUDdX2+LISb4=;
	b=mxWUf6DsIJx8JGLXtStpAvkupaCUrccGeP0yLQNCDkV4qUABh0+g/68xHwMl8H9fZIlZ4X
	L0hrfDspQ4SpJEkSChvwpeZf7GzCibji7C/ohFxEXSaHqMrmH4570sBezAku46b8UrmONm
	+rE30ohvX+WoMbcdxgX/KnKb+2JD05E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773849787;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lr/iSpFEtsFlvM7WU2EXJDEzTpLLAxsMUDdX2+LISb4=;
	b=3WgXJH+i/W2VhI/OoEqstpeBhNlQBCfhbuaejfmnZhW8WSCSUKIzzekbobgY2vItM6rfdE
	vK44Na7AE+8zwqCA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773849785; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lr/iSpFEtsFlvM7WU2EXJDEzTpLLAxsMUDdX2+LISb4=;
	b=MN4ZyP3Djl9z16weZaFKFs6UKMQ/gJ7eEwCxwSTxJPwKz2XW/a8NVtlFIC+o540P0cRRrd
	+AwrLqfZqCHFPly1zuCLvDBwfOvYIraz8jNz9A/10nYp3kCgkglEajmTq6TivU1THDmMbf
	jYCvDuTOGS78AdsOxfxfRLqFBP25tos=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773849785;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lr/iSpFEtsFlvM7WU2EXJDEzTpLLAxsMUDdX2+LISb4=;
	b=hcbgHJ6s/LwKCT41IE7KEnBS4ecphnDTF0FRpq9zpCD3eIQ8LOBPkLeJf+J4dh30LZBWcK
	xaXzT9m2rACSzXCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BD1094273B;
	Wed, 18 Mar 2026 16:03:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id iJv4LLjMummiRwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 18 Mar 2026 16:03:04 +0000
Date: Wed, 18 Mar 2026 17:03:04 +0100
Message-ID: <871phhceh3.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?C=E1ssio?= Gabriel <cassiogabrielcontato@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-sound@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH v3] ALSA: usb-audio: validate full match when resolving quirk aliases
In-Reply-To: <20260318-alsa-usb-fix-quirk-alias-v3-1-bd3b17a32939@gmail.com>
References: <20260318-alsa-usb-fix-quirk-alias-v3-1-bd3b17a32939@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-35067-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tiwai@suse.de,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6FE012BF4F9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 18 Mar 2026 15:08:46 +0100,
Cássio Gabriel wrote:
> 
> get_alias_quirk() resolves a quirk for an aliased USB ID by scanning
> usb_audio_ids[], but it currently checks only the vendor/product pair.
> 
> This is weak for quirk table entries that also depend on additional
> USB_DEVICE_ID match fields, such as device or interface class,
> subclass, protocol, interface number, or bcdDevice range.
> 
> Keep the aliased vid:pid as the lookup key, then validate only the
> remaining match criteria of each candidate entry against the real
> device/interface descriptors by clearing USB_DEVICE_ID_MATCH_DEVICE
> from a temporary copy and passing it to usb_match_one_id().
> 
> Suggested-by: Takashi Iwai <tiwai@suse.de>
> Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
> ---
> Changes in v3:
> - rework alias quirk matching as suggested by Takashi Iwai
> - drop the explicit per-field helper
> - keep the aliased vid:pid check first
> - clear USB_DEVICE_ID_MATCH_DEVICE from a temporary id copy
> - Link to v2: https://lore.kernel.org/r/20260317-alsa-usb-fix-quirk-alias-v2-1-6e531c67f0c8@gmail.com
> 
> Changes in v2:
> - drop the temporary usb_device_id reconstruction approach
> - validate only the remaining match_flags explicitly
> - pass struct usb_interface * to get_alias_quirk()
> - Link to v1: https://lore.kernel.org/r/20260314-alsa-usb-fix-quirk-alias-v1-1-3269998f7ada@gmail.com

Applied to for-next branch now.  Thanks.


Takashi

