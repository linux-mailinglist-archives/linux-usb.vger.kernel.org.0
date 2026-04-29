Return-Path: <linux-usb+bounces-36685-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +K3OHFTj8WlZlAEAu9opvQ
	(envelope-from <linux-usb+bounces-36685-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2026 12:54:12 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A82493382
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2026 12:54:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 619C430065E7
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2026 10:54:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 291D53EF0C9;
	Wed, 29 Apr 2026 10:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="sI7XXLGJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="u4OpwZKg";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="sI7XXLGJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="u4OpwZKg"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62AC73EF665
	for <linux-usb@vger.kernel.org>; Wed, 29 Apr 2026 10:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777460042; cv=none; b=LxfzbUmlrrtDW12/Sh71fDYz4Rr0V6mpszgMpZ5boMKJYeTmh6b+wO8PBpjT7/isb8QouqIp9O4C1whrccgIW0zL2Bt/L1STIVEXuTzp65nJRYH/aN3aBL/LQ/ojbnVx9O5+xPZxA23BbEhp5pzntiovkPo3myb98CzBRON1cWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777460042; c=relaxed/simple;
	bh=5TMvnEoim9+s3ZiOWXIGSwHTA49r6xZStL/OQoV84FM=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kB5joFVCQ4UCZKMxdegSHolmhzYkI856EWByDHnMDoo9tM0/hdPBdYwp152v6M52yqIVaOIDu3iv6RVUREplvWklEKeRDB7q3OnAMj55RF8mQ3TJ94tklxUoL5zXHCePle6HkuU6NEWTRF/qi6aRaWQ4noYplqzg1Eozp8Xpaq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=sI7XXLGJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=u4OpwZKg; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=sI7XXLGJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=u4OpwZKg; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6A3B85BD3F;
	Wed, 29 Apr 2026 10:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777460036; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OkYIl0v/kcH/mlL50KDQbgrmwRFRSoZphEzb2yPxpn0=;
	b=sI7XXLGJed0PtD10x0gEVPtXaIAZeKNZAS5dCmeuLnG1fE4Q3Fk5GOU3vYAVpiHqS8a/H5
	O9o2OFQzNgQcf4waBlaiwS52xHVxEETTte5Q0fTLjNqMj0I+YxPweORJgEfIDqwcogJisB
	wwMc0XQTmkqlDQl0HcwpNP23nYM4qBM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777460036;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OkYIl0v/kcH/mlL50KDQbgrmwRFRSoZphEzb2yPxpn0=;
	b=u4OpwZKgLH7wNiWStjGkA/CWaGGkV2cgUWkH5K5oydTUxscv2OK+OR6UHOhJu7RpDqqMHT
	aQzS9LkwZybqD1Dg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=sI7XXLGJ;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=u4OpwZKg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777460036; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OkYIl0v/kcH/mlL50KDQbgrmwRFRSoZphEzb2yPxpn0=;
	b=sI7XXLGJed0PtD10x0gEVPtXaIAZeKNZAS5dCmeuLnG1fE4Q3Fk5GOU3vYAVpiHqS8a/H5
	O9o2OFQzNgQcf4waBlaiwS52xHVxEETTte5Q0fTLjNqMj0I+YxPweORJgEfIDqwcogJisB
	wwMc0XQTmkqlDQl0HcwpNP23nYM4qBM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777460036;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OkYIl0v/kcH/mlL50KDQbgrmwRFRSoZphEzb2yPxpn0=;
	b=u4OpwZKgLH7wNiWStjGkA/CWaGGkV2cgUWkH5K5oydTUxscv2OK+OR6UHOhJu7RpDqqMHT
	aQzS9LkwZybqD1Dg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 54C5D593B0;
	Wed, 29 Apr 2026 10:53:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id NT4NFETj8WlMDAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 29 Apr 2026 10:53:56 +0000
Date: Wed, 29 Apr 2026 12:53:56 +0200
Message-ID: <87se8eox4r.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Oliver Neukum <oneukum@suse.com>
Cc: syzbot+2afd7e71155c7e241560@syzkaller.appspotmail.com,
	linux-usb@vger.kernel.org,
	tiwai@suse.com
Subject: Re: [PATCH] sound: usb: caiaq: fix reference leak in probe error
In-Reply-To: <20260429104527.19927-1-oneukum@suse.com>
References: <69ec231a.a00a0220.7773.000c.GAE@google.com>
	<20260429104527.19927-1-oneukum@suse.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Queue-Id: 21A82493382
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[suse.de:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36685-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tiwai@suse.de,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-usb,2afd7e71155c7e241560];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,suse.com:email]

On Wed, 29 Apr 2026 12:45:24 +0200,
Oliver Neukum wrote:
> 
> If probing a device fails early a reference to a device
> is leaked.
> 
> Signed-off-by: Oliver Neukum <oneukum@suse.com>

Thanks, but I believe it's been already fixed in my tree for 7.1-rc2:
7a5f1cd22d47f8ca4b760b6334378ae42c1bd24b
    ALSA: caiaq: fix usb_dev refcount leak on probe failure

Also, there are a couple of fixes for caiaq queued for 7.1-rc2, too.


Takashi

> ---
>  sound/usb/caiaq/device.c | 21 +++++++++++++++++----
>  1 file changed, 17 insertions(+), 4 deletions(-)
> 
> diff --git a/sound/usb/caiaq/device.c b/sound/usb/caiaq/device.c
> index 8af0c04041ee..1a9ddbdc2cd1 100644
> --- a/sound/usb/caiaq/device.c
> +++ b/sound/usb/caiaq/device.c
> @@ -442,7 +442,8 @@ static int init_card(struct snd_usb_caiaqdev *cdev)
>  
>  	if (usb_set_interface(usb_dev, 0, 1) != 0) {
>  		dev_err(dev, "can't set alt interface.\n");
> -		return -EIO;
> +		err = -EIO;
> +		goto dev_err_put;
>  	}
>  
>  	usb_init_urb(&cdev->ep1_in_urb);
> @@ -462,14 +463,18 @@ static int init_card(struct snd_usb_caiaqdev *cdev)
>  	if (usb_urb_ep_type_check(&cdev->ep1_in_urb) ||
>  	    usb_urb_ep_type_check(&cdev->midi_out_urb)) {
>  		dev_err(dev, "invalid EPs\n");
> -		return -EINVAL;
> +		err = -EINVAL;
> +		goto dev_err_put;
>  	}
>  
>  	init_waitqueue_head(&cdev->ep1_wait_queue);
>  	init_waitqueue_head(&cdev->prepare_wait_queue);
>  
> -	if (usb_submit_urb(&cdev->ep1_in_urb, GFP_KERNEL) != 0)
> -		return -EIO;
> +	if (usb_submit_urb(&cdev->ep1_in_urb, GFP_KERNEL) != 0) {
> +		err = -EIO;
> +		goto dev_err_put;
> +	}
> +
>  
>  	err = snd_usb_caiaq_send_command(cdev, EP1_CMD_GET_DEVICE_INFO, NULL, 0);
>  	if (err)
> @@ -520,6 +525,14 @@ static int init_card(struct snd_usb_caiaqdev *cdev)
>  
>   err_kill_urb:
>  	usb_kill_urb(&cdev->ep1_in_urb);
> +
> +	/*
> + 	 * private_free has not been set.
> +	 * Undoing the usb_get_dev() from
> +	 * create_card()
> +	 */
> + err_dev_put:
> +	usb_put_dev(usb_dev);
>  	return err;
>  }
>  
> -- 
> 2.54.0
> 

