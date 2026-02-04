Return-Path: <linux-usb+bounces-33068-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oBJlOE7DgmlbaQMAu9opvQ
	(envelope-from <linux-usb+bounces-33068-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 04 Feb 2026 04:55:58 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4569EE16D8
	for <lists+linux-usb@lfdr.de>; Wed, 04 Feb 2026 04:55:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 82DF230EC056
	for <lists+linux-usb@lfdr.de>; Wed,  4 Feb 2026 03:55:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 527FC2E62C6;
	Wed,  4 Feb 2026 03:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fj9cbkjJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com [209.85.219.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80632C21EB
	for <linux-usb@vger.kernel.org>; Wed,  4 Feb 2026 03:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770177302; cv=pass; b=nzEHHdO1WYFnaprhaOs8gOhPmX2PFhxiK0hjedqoOZ7TsSqguXzO3ql5L2N/U27YXT4EsLFpUe4VTRhwSvDqHkhrGBFuIKYqV+brfNQIE2Y4h27NljVF/jdvRd6rEXBsVwoqbm9yiUeVbmfWZuD9W8nxjTLCTW9JmnwpngoAPj8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770177302; c=relaxed/simple;
	bh=kS0Oli6V6cUzrhctF1oQaBfXCSq/fvWfEyah3MHaBPw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WVRfXpArJaHmkUmfc7esERx2h2inCYpNDOhMHIpKOCWuJp00IwmY1uKercgy3KsDtbQqxlfu7M8227Yf0obJ8AtJbfggMR+bgvuboDk/YXBdEhw8mtOg6pIWUVcNqGqrH5oDRbenqwIggtBUkb+6RVRKPIwQOHdOlc14c1pHcnE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fj9cbkjJ; arc=pass smtp.client-ip=209.85.219.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f67.google.com with SMTP id 6a1803df08f44-89505dd3e24so43933006d6.1
        for <linux-usb@vger.kernel.org>; Tue, 03 Feb 2026 19:55:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770177301; cv=none;
        d=google.com; s=arc-20240605;
        b=KKaYmaib69aKGysDK5ShOrQs7uzBBP1vtEDhNBN3EsBnW8BP9JC2VBYeJJT45kuuCO
         0rqASXZINPu6JV1xUkfy0B7MOTHMOdR2/4tNYcGlE2GAm+jK4KzN4GaLQ3L9kcdqZDSn
         pWKYbIEnk3flrFMUQNXemipK6q3xaZ4v9XkwsS0k/i6FHBINqsVB0f5mFwm3NOkBYWXa
         v1VD3WZJQ/BqJ0duglC61xwYCWGYEbaEhlc4M4OSL2DsBYF2LakqUn36u+aWBSGNvnr+
         AdX+6aOJEs1uMNFzTy2HiEK3G6hmv5+gzLy9yzCGXdhUUvIlHu70oUEEbBumMDJzCP/R
         aHpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=kS0Oli6V6cUzrhctF1oQaBfXCSq/fvWfEyah3MHaBPw=;
        fh=65PHb0nD7dl9Z6MWAtojt2ypKBNvvI85mDLKSNgEhFo=;
        b=W5tyWWojGqnx2b0vwmqo/AjxVVJ7DtiEZQ47RyJJOrLLHLWjCvGrLNtGDX/laKsfHw
         AqCkXYDp9Twvl5uUBnFjV2ij0a54HIhHqqYDSVp2poFm8f5zyZkYjGHH1t2Fc/CbRgVF
         W3Zqj0XA60S+h6VG4Rvfye15Lia1uiovEMcEVwk6/8Ur5afQUYDlwA+jY26sYSQMGU/7
         jL0hS8p+Qfzk+2tWxU/RO8bKK8TWL3qNNE0YiLLXvfeCEjixepM24spovQkHVvUX4z/j
         HbCbj84cUINA8z1w5mynmiPoYQiPaL6Bv/1I8Pvm1eVut0WNIIAFcxx97j6xreva9Kj7
         9YKg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770177301; x=1770782101; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kS0Oli6V6cUzrhctF1oQaBfXCSq/fvWfEyah3MHaBPw=;
        b=fj9cbkjJGuRJHrkHUYB2JXOEN7CKtD3kQS5u0lIZU3jOE5CnA5Q64gsMfKGADxLoVr
         c72GqEhkBxzAmOb9GmBvQhazwXjLZoaVGRdVj6EtH6uJ31nQra4Xp3I1Wy2KTc5dYCdL
         9l2I0o+49ExcxdUBKLeC5nvbh8SP449k+PdYdc3Baknvlt7tbg02WssiVbbyeGlwfsD8
         yHFLZk714DnFSoTWbfWMmL8y7L7V2f2ayUYDhAj36MRYrduViZSzCH24vXTeWkLTuzFM
         oIqA2lXhHHZ/sKflQ7qzHcljL8U2X3oBSEFeMIswLihlaLjABrXfIGekO1NbMR7RD7ee
         7NiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770177301; x=1770782101;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kS0Oli6V6cUzrhctF1oQaBfXCSq/fvWfEyah3MHaBPw=;
        b=o7+Vg3BnEgVgyeAlPkYPBmbMSA3ox7fOdKAoDF+DJJKksRvpKdcG9awe3N5MNT6Sgr
         34mkxn/iYmZhADU/ic3TUBcviNu3+w+cf+gYeUQV8jUp8BYqzwwSJWrFuHqDvJiLqV3w
         jkj2au+Hbw1rTSM4iTGJFB39lfow2vOiPykpArW0tqk3aJis2hAcSLNffK4GoWLMtBJA
         3DoTvi6nwIhzMDG804uxUgASK6xZGZeSqwkyxRCqYCPtMQgbUrvvuUR/J4ojP+PsyMH4
         OoODzNk3HLGJq6xgSnIACZjCh6z+QkfpZrSKzRjUkHj9Mt5O7p/qTuBHBpiA4IDVB33Z
         jvbQ==
X-Gm-Message-State: AOJu0YyD82Rnu6o/0zLycCPnu02ROahH9Oi+JeEzJa1tTKu5MebDOxlG
	Ty3RLGlMKlbJXYi5oKAplGjNAxndOKbaSj3nEIsvculglvIZ4ixIgY7UZUEh+tdIDVhcccvY4Vv
	+xd9vsnZlTkZRVazh9Bor2aS9pcdcZ9uMMeXx
X-Gm-Gg: AZuq6aLmhIN+mMZ+rstJuc3AxqMo4bKJRmCLGq0z5oSje2RwwiJmBS/SlLP3DSKARmL
	xEi2bXI3TMQ09BinpCDjfiNq+8ySN73TFLMcnUJNdVsCfT8dwbtVS1xDTwVGL60wBxxJh/7Sg0b
	8zD8iT3njJtXZgtS9/7YjvuF34Dumq2YJCqtnxOsXkNpTu+ujmcscJQ8UFs3b66NyYU3tm45q45
	J35rXMb8+XvZOhNiwMXxV8oIYojXGAwQ7BurYiE9PDfa1KA6ZYBpTg2uGs5PpKj2o2cEiQffn39
	3Buh/217XN2XpsKEcQZuJ/1dZ+geIqSduAwgng4p0jKjhPxzAGndIvxh
X-Received: by 2002:a05:6214:29c2:b0:895:479:b3ca with SMTP id
 6a1803df08f44-895220ff3d7mr28476556d6.15.1770177300786; Tue, 03 Feb 2026
 19:55:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203013924.28582-1-enelsonmoore@gmail.com>
 <20260203194317.07432b29@kernel.org> <20260203194447.0ce4ffd7@kernel.org>
 <CADkSEUgoOyeUqGHXqimczdo1M0S6C20GOpKH5OuEeaRhFnSTDA@mail.gmail.com> <20260203195415.7e462c91@kernel.org>
In-Reply-To: <20260203195415.7e462c91@kernel.org>
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Date: Tue, 3 Feb 2026 19:54:50 -0800
X-Gm-Features: AZwV_Qgeck6aZFFNgYLuZOdGhs5NISn3xSogSNFre2bhhidkcKkgC32ijOyXh5Q
Message-ID: <CADkSEUj3QCjdGRXue7v+TO27cyKSsHXse8TJ5egc0BPiPwr_Cw@mail.gmail.com>
Subject: Re: [PATCH net-next v3] net: usb: sr9700: remove code to drive
 nonexistent multicast filter
To: Jakub Kicinski <kuba@kernel.org>
Cc: linux-usb@vger.kernel.org, netdev@vger.kernel.org, 
	Simon Horman <horms@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Oleksij Rempel <o.rempel@pengutronix.de>, 
	Eric Biggers <ebiggers@google.com>, "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
	Peter Korsgaard <peter@korsgaard.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33068-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[enelsonmoore@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-usb,netdev,kernel];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 4569EE16D8
X-Rspamd-Action: no action

> It's not a big deal, applied thanks!
You're welcome!

Ethan

