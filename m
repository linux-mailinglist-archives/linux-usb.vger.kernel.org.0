Return-Path: <linux-usb+bounces-36109-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SHAJAtnL12k/TAgAu9opvQ
	(envelope-from <linux-usb+bounces-36109-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 09 Apr 2026 17:55:05 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C11263CD2B5
	for <lists+linux-usb@lfdr.de>; Thu, 09 Apr 2026 17:55:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5796930498CA
	for <lists+linux-usb@lfdr.de>; Thu,  9 Apr 2026 15:49:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80B673396EE;
	Thu,  9 Apr 2026 15:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vMhoJ7uJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CE262E8B83;
	Thu,  9 Apr 2026 15:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775749706; cv=none; b=SHtDVkC0BaUlVtr+a4WUnzZEUfvRLeJm3rBntTXY5DdAvjlcJC1VJbGqJjFBzjXCkjfRofcMhjKmkFCHe0NU3Qd4CatNxuwjCaWOE6IWHWRm0NWRsrSyxL0T7YpAAGDjBhYASSwrKGEFO6nBZkn6jiF2UESO6NZhsNbBogu6BFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775749706; c=relaxed/simple;
	bh=1uH6OyOsw32MyEmT3kQyj9XcSuezy/f3r6d9sRwMEHo=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=E1M8Oa/c1janEvVyKX/hDcvohpJTv4ZvBhxmB+nyCUSJ5ciFI5Y6E+DhG/ZWY3RFeynTTWMenGJ8SbTjbknd+Rg33V4ws4fkvmlTmmRmiCkACwrh1/os8wfa1BHj2K3sHeLsbXtW9pXtSDUd6iUhEhPsS9Ba9mh+arqg/MrrNDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vMhoJ7uJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53838C116C6;
	Thu,  9 Apr 2026 15:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775749705;
	bh=1uH6OyOsw32MyEmT3kQyj9XcSuezy/f3r6d9sRwMEHo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=vMhoJ7uJkTkHoUHEYngLe7WoNhxMDmoBdsXXcgzyU9Kclkv2uAlD/WIzEvEDdKdpA
	 zz3ThHTLeONgWXrtQ2osJcOHh/+uNZqevbs3nCUSEqUNAAdcQL3wQK8tiHaQ0X/XaV
	 OJV7/vWqOalrdUufJfHFDkT4fT2SlHVrXQsxw/3jbYSrolB1cIzzbYbIXKeVZFfDYC
	 nF0/iP+cQqeE6VL2xdyO+W6lrDUa+Ckbq6cxMtgLRRGUDXb+dhCc/WIMJVeoUDNd8R
	 w5FcK0kWWz1AW+tp4BrHezmBZwTn5rn3wNCkpKZJzeZTHOsIcmWzlAMcQd39kgm0eS
	 G5sE/zTtB54AA==
Date: Thu, 9 Apr 2026 17:48:23 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Oliver Neukum <oneukum@suse.com>
cc: bentiss@kernel.org, linux-input@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] hid: usbhid: fix deadlock in hid_post_reset()
In-Reply-To: <036cb81b-ae6e-4dcd-8f97-593e754279d1@suse.com>
Message-ID: <57ps39r7-1sqr-1s50-rpsn-731on7s2q023@xreary.bet>
References: <20260324142507.74873-1-oneukum@suse.com> <8q66o2o4-7844-6p76-9964-7pr205p190pr@xreary.bet> <036cb81b-ae6e-4dcd-8f97-593e754279d1@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36109-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jikos@kernel.org,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xreary.bet:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C11263CD2B5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 30 Mar 2026, Oliver Neukum wrote:

> > Did you find this just by code inspection, or was this reported with a
> > real device?
> 
> Pure inspection. We are looking at USB error handling
> in general right now.

OK, thanks. Now queued in hid.git.

-- 
Jiri Kosina
SUSE Labs


