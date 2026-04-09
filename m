Return-Path: <linux-usb+bounces-36110-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OK1tND7P12mrTAgAu9opvQ
	(envelope-from <linux-usb+bounces-36110-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 09 Apr 2026 18:09:34 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3B33CD6CB
	for <lists+linux-usb@lfdr.de>; Thu, 09 Apr 2026 18:09:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A8A803060A01
	for <lists+linux-usb@lfdr.de>; Thu,  9 Apr 2026 15:58:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 031393321DC;
	Thu,  9 Apr 2026 15:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qWxXiIgl"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD093624DE;
	Thu,  9 Apr 2026 15:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775750316; cv=none; b=ikHEY9Ur+D7oUG1OTHQTijEONs9XDwWl4sfZ5xZhfM7q1Rco3SfxW5eajhJngj3DN6E5tXbUFnMFpLTFTL70m30oV4MJFxd2PCsSu66XSeHY5S+Z5oH+uGCBXmvPQ6G0pyb68lCwoEK4tl58ZsCnllR5x37LajtYENIuZmt/9RE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775750316; c=relaxed/simple;
	bh=jQj/r7Jxg9dGziOOR621+A4MxvmiTARyzSLpXkG90lE=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=jEM6Bcg8wrjQYo67SZkRYV8/diXrJCHZsLjnofbT4XMw69Z9vxuIo95xbWfuSh+5lRNndqTTHkqGDsmynF2l0JbUOYxi5CFqTRlWefaVMp/lLMLH5Bp1k+q7Z/SljGa9mZQjIGcMlVTM/S1hCvT0QB9u4+awqGirYge3jGcAPUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qWxXiIgl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF2A6C4CEF7;
	Thu,  9 Apr 2026 15:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775750316;
	bh=jQj/r7Jxg9dGziOOR621+A4MxvmiTARyzSLpXkG90lE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=qWxXiIglznV3vgH6ptP3vR7rCZOZKS2L5rQadTw4/R/iwTCNaXuA5qGbL/LkBCwpS
	 EsjL5azIx6M+QL6tbs+LEEVNlxqmCuwrhF/0p+EtKyEtlG15jWwNRnq9UGJ9PPfK1M
	 oyO3mhJ5VnBXwjqxudsIhtErcPfEXuI1aW49KJTbqFpLPXwyQhz3yJcPqCJWXzr+k/
	 XsQP6u/7ZU3P/V1ck38VwnglHvjgniglWUyesfAhI//U2hEszyjH5wIZZk4WpaVuEK
	 7fdc0JYaiwoAHVgKaVhDxtW4H6XsBc/Wtb+LN/Kci3ywASQdaunaQyPDlbx+E41TZh
	 qLnK0YFuAzwyw==
Date: Thu, 9 Apr 2026 17:58:33 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Johan Hovold <johan@kernel.org>
cc: Benjamin Tissoires <bentiss@kernel.org>, linux-usb@vger.kernel.org, 
    linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: usbhid: refactor endpoint lookup
In-Reply-To: <20260330095034.1662231-1-johan@kernel.org>
Message-ID: <487p6rr1-r913-8s90-n6nr-rp4n464q7sqr@xreary.bet>
References: <20260330095034.1662231-1-johan@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36110-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jikos@kernel.org,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xreary.bet:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5D3B33CD6CB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 30 Mar 2026, Johan Hovold wrote:

> Use the common USB helper for looking up interrupt-in endpoints instead
> of open coding.

Good catch, thanks Johan. Now applied to hid.git#for-7.1/core-v2.

-- 
Jiri Kosina
SUSE Labs


