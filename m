Return-Path: <linux-usb+bounces-33016-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SGXjGWYOgWnfDwMAu9opvQ
	(envelope-from <linux-usb+bounces-33016-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 02 Feb 2026 21:51:50 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D47D9D14F5
	for <lists+linux-usb@lfdr.de>; Mon, 02 Feb 2026 21:51:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 88653305D6FA
	for <lists+linux-usb@lfdr.de>; Mon,  2 Feb 2026 20:47:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC35830F52B;
	Mon,  2 Feb 2026 20:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gmaGvzlS"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3983C2C11E1;
	Mon,  2 Feb 2026 20:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770065273; cv=none; b=tJA1WY7kSrdQalmc+Mp78FQk9dIShbuMdwEclbBdkclsQrdQauIn9nG1qCsqSofkdf9Qq8gCFV3jBGwDqtncgUrSDMmwtZYbsfV7VfoZYGevU+QP6D9HCMn6y6zOt5B2sCkUhsGiooQM3vPK2c2ONQMFU408UM3VnhPGBFWAgA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770065273; c=relaxed/simple;
	bh=7fhj6dhDnfO79d7PexLTnWBsJHy4cluYjgF47LWj/PU=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Mlk8WvNKBJdgN9Ur5RlOvbbOPQoW8kWcDnBY1yUOrqUcRp7xgmlb+9ZrEexYA6Rk6+f9iZaRRuCUNFjrFgBGQM9quKqukbyl1NTiUimvPUd4dtiwyXTrVWf3JqQ8vTLQQNQ07ZIPKgXOSgNj0cmywsOb/pIeE9XYpnQPnH+vOEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gmaGvzlS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CDDBC116C6;
	Mon,  2 Feb 2026 20:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770065272;
	bh=7fhj6dhDnfO79d7PexLTnWBsJHy4cluYjgF47LWj/PU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=gmaGvzlShAlgDNtKV8JaGtgYHPUcZH12/MrXoOzuMeaWEgeqV9wSfjkA64u/MBESI
	 rn1N3IFdWH9JN5Pq8PyRpuiJaWa9VNxtSEruEae7AZYnyvOkVusuYAGI5c0l8aJoJN
	 pPhPy4BcQxgX5xVJ8RgUK2s7WHvR8LcMfFYJTWH8PGLEqr9GfU4hKsh2g/fB+v4r5R
	 sd1G4gk9JReM9uDWLVQU1bMcP/fMJihZgm+KLXUulYwuOzFJ+/A07GmlaO3rVcBZHU
	 rlzprVm5F+/mhRWvCBewPnlRcHmwa7xF2rxKcrk0wHqfBbjBdKlz3wAjDKlo9X/cj4
	 wzLYP1sfHPYsA==
Date: Mon, 2 Feb 2026 21:47:50 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Sahil Chandna <chandna.sahil@gmail.com>
cc: syzbot <syzbot+13f8286fa2de04a7cd48@syzkaller.appspotmail.com>, 
    bentiss@kernel.org, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
    syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [input?] [usb?] WARNING in asus_remove
In-Reply-To: <r7845ps7-3qqp-o377-73r9-410s541452qo@xreary.bet>
Message-ID: <961601ss-s3s6-n5no-9sp2-q73121121893@xreary.bet>
References: <697baa8f.a70a0220.9914.001f.GAE@google.com> <aXxOhV79TnuYaw0-@chandna.localdomain> <r7845ps7-3qqp-o377-73r9-410s541452qo@xreary.bet>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33016-lists,linux-usb=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,xreary.bet:mid];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jikos@kernel.org,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb,13f8286fa2de04a7cd48];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Queue-Id: D47D9D14F5
X-Rspamd-Action: no action

On Mon, 2 Feb 2026, Jiri Kosina wrote:

> > #syz test
> > --- a/drivers/hid/hid-asus.c
> > +++ b/drivers/hid/hid-asus.c
> > @@ -960,8 +960,8 @@ static int asus_input_configured(struct hid_device *hdev,
> > struct hid_input *hi)
> >  	}
> >  
> >  	if (drvdata->quirks & QUIRK_HID_FN_LOCK) {
> > -		drvdata->fn_lock = true;
> >  		INIT_WORK(&drvdata->fn_lock_sync_work, asus_sync_fn_lock);
> > +		drvdata->fn_lock = true;
> >  		asus_kbd_set_fn_lock(hdev, true);
> >  	}
> >  @@ -1343,7 +1343,7 @@ static void asus_remove(struct hid_device *hdev)
> >  		cancel_work_sync(&drvdata->kbd_backlight->work);
> >  	}
> >  -	if (drvdata->quirks & QUIRK_HID_FN_LOCK)
> > +	if ((drvdata->quirks & QUIRK_HID_FN_LOCK) && drvdata->fn_lock)
> >  		cancel_work_sync(&drvdata->fn_lock_sync_work);
> >  
> >  	hid_hw_stop(hdev);
> 
> Thanks! Could you please submit this with proper changelog, signoff, etc?

Nevermind, it's 20260130155204.96831-1-chandna.sahil@gmail.com, I'll 
followup there.

-- 
Jiri Kosina
SUSE Labs


