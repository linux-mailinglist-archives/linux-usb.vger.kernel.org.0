Return-Path: <linux-usb+bounces-32274-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0352ED194D0
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 15:08:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7586C30286A3
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 14:06:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C217392B83;
	Tue, 13 Jan 2026 14:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vMzN+VXU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1o0pGioy";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vMzN+VXU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1o0pGioy"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7745392B79
	for <linux-usb@vger.kernel.org>; Tue, 13 Jan 2026 14:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768313175; cv=none; b=oxIHLmSwfN0lni0CIn+CRJLUzAVCYEPz1hneoGZnyNC7Sy/MYfZpqKMRBZRkAbTxMidZXojH4pQ/jLl0NlN4vfKZ0InXNyM0xf0qM2d/KBgpnnXZkFAqKsSiZ4VGckcjT2Klbls7Nz893l6F9FOYGlKgrPS29WSlaAuRXG3ezUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768313175; c=relaxed/simple;
	bh=1KOTHRI1sXtRFumrhMgxfaVLzSzMTp9okkoEbYM5Cy8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SDqPALcbV0rHnxMuP50kmLl3QayQ67PAwjmJ93/u4VmqBmSfBGZUNEoT2Lz2HtUSVnKv3le6/Ao6F0APtrd/bCQJpY/AqbS1l4Z9wxMQal1/pfZG3OoB/y8tCfOOav5B1teQ6y7gg2YebCYle1evDgvMs/ZVsr9/vmFr4WfAp20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vMzN+VXU; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1o0pGioy; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vMzN+VXU; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1o0pGioy; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 257323368C;
	Tue, 13 Jan 2026 14:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1768313172; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=js2STrJwnbaXkULoqXxYqYMpOFLR7hYMJMtWaBHHPu4=;
	b=vMzN+VXUpjIsbOgsVn/uWlLuphu5n+shXazOgxPzrY/VK9CW5hfNTay9empWMnD58Z60jA
	6Kmx2wnG25IgjPAV85LRem+cFl7ZkuDXQJSmppwuqtS4Z91Hr3g3coV36HtKsmUSxlv0xJ
	w/4LhXOd5y8PVuYIpxcMWzw9s9yPh9g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1768313172;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=js2STrJwnbaXkULoqXxYqYMpOFLR7hYMJMtWaBHHPu4=;
	b=1o0pGioyuKTT0k2V18aCU3tI5HdSt2PQzraoi8Od+1mLzx8oTueIYOfZ76KEfJGLpjlOBD
	Re+tJCAAFcyGrJCw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1768313172; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=js2STrJwnbaXkULoqXxYqYMpOFLR7hYMJMtWaBHHPu4=;
	b=vMzN+VXUpjIsbOgsVn/uWlLuphu5n+shXazOgxPzrY/VK9CW5hfNTay9empWMnD58Z60jA
	6Kmx2wnG25IgjPAV85LRem+cFl7ZkuDXQJSmppwuqtS4Z91Hr3g3coV36HtKsmUSxlv0xJ
	w/4LhXOd5y8PVuYIpxcMWzw9s9yPh9g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1768313172;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=js2STrJwnbaXkULoqXxYqYMpOFLR7hYMJMtWaBHHPu4=;
	b=1o0pGioyuKTT0k2V18aCU3tI5HdSt2PQzraoi8Od+1mLzx8oTueIYOfZ76KEfJGLpjlOBD
	Re+tJCAAFcyGrJCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AF2753EA63;
	Tue, 13 Jan 2026 14:06:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id t+AkKlNRZmnVNwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 13 Jan 2026 14:06:11 +0000
Date: Tue, 13 Jan 2026 15:06:11 +0100
Message-ID: <87ldi1ppyk.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Edward Adam Davis <eadavis@qq.com>
Cc: syzbot+6db0415d6d5c635f72cb@syzkaller.appspotmail.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-usb@vger.kernel.org,
	perex@perex.cz,
	syzkaller-bugs@googlegroups.com,
	tiwai@suse.com
Subject: Re: [PATCH] ALSA: usb-audio: Prevent excessive number of frames
In-Reply-To: <tencent_9AECE6CD2C7A826D902D696C289724E8120A@qq.com>
References: <6965a06e.050a0220.38aacd.0004.GAE@google.com>
	<tencent_9AECE6CD2C7A826D902D696C289724E8120A@qq.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -1.80
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[6db0415d6d5c635f72cb];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_TO(0.00)[qq.com];
	FREEMAIL_ENVRCPT(0.00)[qq.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Level: 
X-Spam-Flag: NO

On Tue, 13 Jan 2026 09:29:23 +0100,
Edward Adam Davis wrote:
> 
> In this case, the user constructed the parameters with maxpacksize 40
> for rate 22050 / pps 1000, and packsize[0] 22 packsize[1] 23. The buffer
> size for each data URB is maxpacksize * packets, which in this example
> is 40 * 6 = 240; When the user performs a write operation to send audio
> data into the ALSA PCM playback stream, the calculated number of frames
> is packsize[0] * packets = 264, which exceeds the allocated URB buffer
> size, triggering the out-of-bounds (OOB) issue reported by syzbot [1].
> 
> Added a check for the number of single data URB frames when calculating
> the number of frames to prevent [1].
> 
> [1]
> BUG: KASAN: slab-out-of-bounds in copy_to_urb+0x261/0x460 sound/usb/pcm.c:1487
> Write of size 264 at addr ffff88804337e800 by task syz.0.17/5506
> Call Trace:
>  copy_to_urb+0x261/0x460 sound/usb/pcm.c:1487
>  prepare_playback_urb+0x953/0x13d0 sound/usb/pcm.c:1611
>  prepare_outbound_urb+0x377/0xc50 sound/usb/endpoint.c:333
> 
> Reported-by: syzbot+6db0415d6d5c635f72cb@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=6db0415d6d5c635f72cb
> Tested-by: syzbot+6db0415d6d5c635f72cb@syzkaller.appspotmail.com
> Signed-off-by: Edward Adam Davis <eadavis@qq.com>

Applied now.  Thanks.


Takashi

