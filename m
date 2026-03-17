Return-Path: <linux-usb+bounces-34940-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iETQFy1nuWmZDwIAu9opvQ
	(envelope-from <linux-usb+bounces-34940-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 15:37:33 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 572772AC1B0
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 15:37:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7DC22302146C
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 14:37:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDB982EB87D;
	Tue, 17 Mar 2026 14:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fafc59M5"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B3C3E715E;
	Tue, 17 Mar 2026 14:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773758247; cv=none; b=W8K04lZaTGyNo7KHCqBtGczPbXU5bI/vl14iDAxI4ErtC/YDixy03qIy5YNHjpOsYgKTXVYkRrV84pat9ZuC6U8418IJDap0J2jiCSmUS8KPqyzla9H0RGG7vv2xjAsukYrMagIdz7I9actw8OJG6F/3NSqhwC5Jbn/4DZfZNiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773758247; c=relaxed/simple;
	bh=J+S1H0ApNmZBpP1WtzH5F+Jy5KRLea78YlSI3v7DBDI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FN0fGs2BZX8635nqOmjCZ1vVnGhOj0jcPrhaDAWL3OAbrIXIsRKXTNb4EpThj4jAbdOGnBkZvhmxNKsqnGphTcslLmUc2V6xvumyIQP2cWWB+gPmnQ6pZM6AFPgzfNDXH5tmiDzYUx8UohrGh460dNCG8Sf7hrl/yuXs7Xd5JeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fafc59M5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D26A5C4CEF7;
	Tue, 17 Mar 2026 14:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773758246;
	bh=J+S1H0ApNmZBpP1WtzH5F+Jy5KRLea78YlSI3v7DBDI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fafc59M58Je45M2LOv40LzKztzspdJzVUG0h9ghO5R63/cNo3FZDAfDfoH0/6z2oF
	 H9caeMIpb2yA1lh0usaoHTE6wWnCdtNkqPnnkZYln5bi+8IxlhcWmhTV8FaW3TgWjA
	 eF0MzZnQeXoCjmJ3HFwJPRBEw8Rc5koX6tN8UQYXweznUiwLmKXOH+MQpWGEzJ1ZWS
	 t+R1/KyZv7U7G2rv01XfJYqPvo7fbNq5rGfaSMd8O4amghH9ZFr6yPc8NDHgkKTl3C
	 cYr96i7VUXNvPm+YCTre6jiE1EtknYJJAexqa9OeNiHRV22hAw6t0e1+ETCqyK3TbW
	 jTBjrtqhZlQKw==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1w2VXw-000000006a9-1FEq;
	Tue, 17 Mar 2026 15:37:24 +0100
Date: Tue, 17 Mar 2026 15:37:24 +0100
From: Johan Hovold <johan@kernel.org>
To: Ai Chao <aichao@kylinos.cn>
Cc: gregkh@linuxfoundation.org, b-liu@ti.com, badhri@google.com,
	heikki.krogerus@linux.intel.com, valentina.manea.m@gmail.com,
	shuah@kernel.org, i@zenithal.me, tiwai@suse.de, kees@kernel.org,
	christophe.jaillet@wanadoo.fr, prashanth.k@oss.qualcomm.com,
	khtsai@google.com, dan.carpenter@linaro.org, tglx@kernel.org,
	mingo@kernel.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] USB: serial: ti_usb_3410_5052: Use safer strscpy()
 instead of strcpy()
Message-ID: <ablnJJIlFnlNhofA@hovoldconsulting.com>
References: <20260310094434.3639602-1-aichao@kylinos.cn>
 <20260310094434.3639602-2-aichao@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310094434.3639602-2-aichao@kylinos.cn>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34940-lists,linux-usb=lfdr.de];
	FREEMAIL_CC(0.00)[linuxfoundation.org,ti.com,google.com,linux.intel.com,gmail.com,kernel.org,zenithal.me,suse.de,wanadoo.fr,oss.qualcomm.com,linaro.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johan@kernel.org,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[hovoldconsulting.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,kylinos.cn:email]
X-Rspamd-Queue-Id: 572772AC1B0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 10, 2026 at 05:44:29PM +0800, Ai Chao wrote:
> Use a safer function strscpy() instead of strcpy() for copying to
> arrays.
> 
> Only idiomatic code replacement, and no functional changes.
> 
> Signed-off-by: Ai Chao <aichao@kylinos.cn>
> ---

I've applied this one (1/6) for 7.1. Thanks.

Johan

