Return-Path: <linux-usb+bounces-33296-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wJ5jBnGpjGkusAAAu9opvQ
	(envelope-from <linux-usb+bounces-33296-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 11 Feb 2026 17:08:17 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C6E125F57
	for <lists+linux-usb@lfdr.de>; Wed, 11 Feb 2026 17:08:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3499C3023DE7
	for <lists+linux-usb@lfdr.de>; Wed, 11 Feb 2026 16:08:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 238F833A029;
	Wed, 11 Feb 2026 16:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="BcEQYGUj"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A2BC331235
	for <linux-usb@vger.kernel.org>; Wed, 11 Feb 2026 16:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770826084; cv=none; b=ZsHTr1ec4AY4To802iJRm7bYC8GtUB5Am3WuwYW+xRrwTpEhKtuYZtk0cY8WKv8OmF4J7PSUOumo7fl8VqVnq4LbQoQQ1ezx7BIISI7hZFUQlocsIhFGylvMnyIlud5D/+eAYKY73RoQ4emOX0/OUFtEJ0SWAeB6xpg8WnObvmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770826084; c=relaxed/simple;
	bh=s04o5hTyrMpNFBENViq5Qgrk2QRSzV1Z2DuGYu8iosI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VM4bD3IkTlD22a5VvkccbrXTPIh4iRMiV75n+7aWodgVoAqoqXeg8pqnF9NIsnqQXF1DSO25CLuJ9uTTVcxwcWMwY6umZlaiq44jQj/SSOQ+ZyQAN+RYX/fVTQKV5d5i1QuiuSQLrzaZuL5xbNCDusVVO1CZ25VKgOMDms5Z0Jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=BcEQYGUj; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-503347dea84so64479911cf.3
        for <linux-usb@vger.kernel.org>; Wed, 11 Feb 2026 08:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1770826082; x=1771430882; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=i6MYvX1gR68dNM+fhSBJT97Ks8m4rTWUudCKuKAg+KA=;
        b=BcEQYGUj10AqwjQhVkuNjdRaCKPRRAYHJ6FmykxMcU8433xtaDnJbp6874cId++lQy
         g4Aq6LogDJLMRzapsdt7Qtd7A1qwKQ9N/Q/q7awDZpEI3E/Agep09nu+iJpouill2qpV
         QsigpQvovKi/mOh2Jj3UeR3w+N6+c3Q6/mrRWazjhFiefKzVxAZ5UzF+Ja7sMxhsp20O
         2p2P0sagp6G8djDpUIYhqKO3FZoGCBn5NFijuErGB/b9SBEYWH3o7X4KdEI7oZKdKu1H
         QjnF+in91jLfbbWWqHoODNbJapbiU+kTIBupWyJiVz0n+ow239Rnmvh/Z5i0CM65x0p/
         IxGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770826082; x=1771430882;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i6MYvX1gR68dNM+fhSBJT97Ks8m4rTWUudCKuKAg+KA=;
        b=ohXafxxtjfUzc2zDwoLHTLqj/u7O7ntJxYhpDgYvt9JgIuLbdYWc9GcEH4Tj5iegDT
         vbY4KtIwGs6z3QP1NnwbTlXF7J9SS69Ovv3LQPBUE+l0Rg2Imn4K6HtFgSXpfmfaxQZ+
         a6QWWE8ED5AiWM27Dqiw9uISbMKIdoOV4wdZCJMFE6D2bgo4+DzZnZx9SMtocgsPle+6
         RJm6aaotDemAr9bWBXSo1HnfeBq2PJNzZep+nWOIBGjLcUpA/TczVtmX8G5KQtA/hl/8
         aRVLbg8eqT94JOTzo8fF181NaJDP/V6lzHmbpgPv9b+iirXVB+lniAtwIdNSPqiQ7omx
         H8LA==
X-Forwarded-Encrypted: i=1; AJvYcCX6b25YkQp8YRAn5i8HSR7ezOIR7zYv9+DMioglAo3qx0YTIGKrEWezyaGqGQi7PE1n5aziF3yBFx0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyzvb9b6HHLaLCbUlMtKucBrIGvwdYaUJv1/V02BuKO31qi8kWf
	5BDaCzv/nCCYyQf/9uzmo4bMBKw+sO7OLIm2SiH0XKcq4Jjk1ExHt/gZxhQCa8IedA==
X-Gm-Gg: AZuq6aIDMrBHtA9y2WP9uEr0vjWDSBe7lXCo8ZxQi0WOaNqCrfYqTpb9s/pv/HBqpDQ
	f8MgCU+Q7VGhrJnlbry5K2gY3pWS9jSMRXmNsVD8XpxoL6MA6nTphLx9LRmgCrdt5E/9EamNnSv
	xi6Ba6uvaijXSLqSXiT2FqfIhHS0mOgDJJtGCL+xTIdo+p+iZz8TuBEV++x6vUqMrMNWHHqyRq/
	kiMVx4HvoUa3W5UGKbM1jSHGrnQcsZxEbksV1Cluv/6hVf9q2UMKH2b7WysxKFP1xq6ZR0pJBVU
	AF3SQTH631wKWPkEtZNZgoOBpUDVjI6yaT7wUBtM9RpGeF+cUYeGegrSPeEwVwJXAdO/UeAV4Ri
	oVWL08IYyH5d5IBwyVt6LDvmhsqwcDQyjDHw5LsQ96bpARL7cPiPGKHK3bY0KhTsRjT4s0Tkogj
	mviu4phNHQ9C1HF1cRXI2Ft7tBSK06dHqiphPjk6b0Zw==
X-Received: by 2002:a05:622a:4ce:b0:501:b1be:c31b with SMTP id d75a77b69052e-5068102b8c5mr43217181cf.14.1770826082356;
        Wed, 11 Feb 2026 08:08:02 -0800 (PST)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cb2b0bc8f5sm143497785a.6.2026.02.11.08.08.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 08:08:01 -0800 (PST)
Date: Wed, 11 Feb 2026 11:07:57 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Xu Yang <xu.yang_2@nxp.com>, m.grzeschik@pengutronix.de,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH] usb: port: add delay after usb_hub_set_port_power()
Message-ID: <5639afb1-217e-47f3-906d-e2b7b87bbe7f@rowland.harvard.edu>
References: <20260211103628.3265850-1-xu.yang_2@nxp.com>
 <1be3ca8a-032d-487e-92f4-67b2070be213@rowland.harvard.edu>
 <2026021153-tactful-steadily-5eae@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026021153-tactful-steadily-5eae@gregkh>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33296-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 86C6E125F57
X-Rspamd-Action: no action

On Wed, Feb 11, 2026 at 04:47:42PM +0100, Greg KH wrote:
> On Wed, Feb 11, 2026 at 10:04:32AM -0500, Alan Stern wrote:
> > On Wed, Feb 11, 2026 at 06:36:28PM +0800, Xu Yang wrote:
> > > When disable the root hub port, somehow the device is disconnected and
> > > re-connected again. This happens because usb_clear_port_feature() does not
> > > clear a truly happened port change. That says, in fact, port change event
> > > may happen after usb_clear_port_feature() is called. Then the subsequent
> > > port change event will have impact on usb device suspend routine.
> > 
> > This is not a very good description of the problem.  Here's a better 
> > one:
> > 
> > When a port is disabled, an attached device will be disconnected.  This 
> > causes a port-status-change event, which will race with hub autosuspend 
> > (if the disabled port was the only connected port on its hub), causing 
> > an immediate resume and a second autosuspend.  Both of these can be 
> > avoided by adding a short delay after the call to 
> > usb_hub_set_port_power().
> 
> What guarantees that a "short delay" will solve this?  And how long of a
> delay?  What guarantees that sleeping will not just reduce the race
> window?

There is no guarantee, but the probability is high.  The delay merely 
needs to be long enough for the hub driver's kernel thread to handle the 
port-status-change event.  For root hubs, this is interrupt-driven so it 
should happen pretty quickly (unless the thread is busy handling another 
device or root hub).  For external hubs, the delay won't be long enough.

And even if the delay doesn't work, we're no worse off than we are now 
-- you end up with an autosuspend-autoresume-autosuspend sequence in 
quick succession, where the first two aren't necessary but do no real 
harm.

Another way to avoid the problem would be to set the root hub's 
autosuspend delay to a few milliseconds.  But we set the delay to 0 in 
commit 596d789a211d ("USB: set hub's default autosuspend delay as 0") 
for what seemed to be good reasons.

Alan Stern

