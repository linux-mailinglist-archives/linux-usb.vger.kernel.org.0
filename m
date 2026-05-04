Return-Path: <linux-usb+bounces-36899-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2IGlFEHA+Gnh0AIAu9opvQ
	(envelope-from <linux-usb+bounces-36899-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 04 May 2026 17:50:25 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B754C0E2D
	for <lists+linux-usb@lfdr.de>; Mon, 04 May 2026 17:50:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6A6CF301A53B
	for <lists+linux-usb@lfdr.de>; Mon,  4 May 2026 15:50:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50C9B3E1201;
	Mon,  4 May 2026 15:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HlVa+ZzV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5Jvve5FM";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HlVa+ZzV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5Jvve5FM"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D4CD3DA7ED
	for <linux-usb@vger.kernel.org>; Mon,  4 May 2026 15:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777909818; cv=none; b=cdOAplwJV+7Up9Sg4AAD0VzBFrV1wRxf5Am88TZ4Nb2savxyzgPy94lElMg2aMaRojLnXjnbJdShmtiwz+NcpS7y4rGanABsaEDS9W1H8oYk0+DeP8GFS+wjagPtL717tb9MJ+b9Wg8c7R1S3iJMa5is/gwY6Jk2t0Wc+Ez1eho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777909818; c=relaxed/simple;
	bh=ylOdWfhfpaJ2VGqqy0PM1N0832dGS/Wh2CT9DG1n9H4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WAG7omgbrPXQ7K6cOOLwGBP0L75KBp+2SudH087bmUa4cstEAqybxuU0k6ftw+bklsbelvg67Iee/PCiDT+1w0NExunsSp4JQDpNk6qJRNcns5+mcsGX37UW/px2cJJrve7xrZHo32m6jId7kUG0kSFY9z8Oqcr8q+vp1dJ+kgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HlVa+ZzV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=5Jvve5FM; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HlVa+ZzV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=5Jvve5FM; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E10E95C490;
	Mon,  4 May 2026 15:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777909815; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LIZnKMykq0sn/fDSvnDnyO+7w7uPFcm3y1UZ0uWk+mg=;
	b=HlVa+ZzVXjuERgB6p4UzU8Beg/Y5c/Z235LamB5wLwFcDm5dTCUlTFtZfRVNA1h0J8ZNDd
	wrYQMLO2hJk2Ge+x0z0XIQ+IPGaJBNxzoEkKXy4SXJhd7D0VV66xQDJYfxtMAKr7DpkINu
	kUKxX9bBxQHxMPwLUAL5jxt2zStB+zg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777909815;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LIZnKMykq0sn/fDSvnDnyO+7w7uPFcm3y1UZ0uWk+mg=;
	b=5Jvve5FMLh4EoBp6QAfd/Fmk4SkuVw1ezRTP8yOaIhN5SLaPIn9HfxAUVKXTMn6SMUpvlt
	pLyDIsYriu8PsNAQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777909815; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LIZnKMykq0sn/fDSvnDnyO+7w7uPFcm3y1UZ0uWk+mg=;
	b=HlVa+ZzVXjuERgB6p4UzU8Beg/Y5c/Z235LamB5wLwFcDm5dTCUlTFtZfRVNA1h0J8ZNDd
	wrYQMLO2hJk2Ge+x0z0XIQ+IPGaJBNxzoEkKXy4SXJhd7D0VV66xQDJYfxtMAKr7DpkINu
	kUKxX9bBxQHxMPwLUAL5jxt2zStB+zg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777909815;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LIZnKMykq0sn/fDSvnDnyO+7w7uPFcm3y1UZ0uWk+mg=;
	b=5Jvve5FMLh4EoBp6QAfd/Fmk4SkuVw1ezRTP8yOaIhN5SLaPIn9HfxAUVKXTMn6SMUpvlt
	pLyDIsYriu8PsNAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AFCA7593A3;
	Mon,  4 May 2026 15:50:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Z6elKTfA+GkdLAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 04 May 2026 15:50:15 +0000
Date: Mon, 04 May 2026 17:50:15 +0200
Message-ID: <87se87w4w8.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Nicola Lunghi <nick83ola@gmail.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: add clock quirk for Motu 1248
In-Reply-To: <20260504144520.699522-2-nick83ola@gmail.com>
References: <20260504144520.699522-2-nick83ola@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -2.30
X-Rspamd-Queue-Id: B3B754C0E2D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36899-lists,linux-usb=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tiwai@suse.de,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[suse.de:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

On Mon, 04 May 2026 16:45:20 +0200,
Nicola Lunghi wrote:
> 
> The Motu 1248 (and probably other older Motu AVB interfaces) take more
> than 2 seconds to switch clock. During the clock switching process the
> device return that the clock is not valid. This is similar to what
> already implemented for the Microbook II interface. Add the Motu
> 1248 usb id to the existing Motu quirk.
> 
> Signed-off-by: Nicola Lunghi <nick83ola@gmail.com>

Applied now.  Thanks.


Takashi

