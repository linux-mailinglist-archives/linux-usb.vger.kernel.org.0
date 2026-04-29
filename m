Return-Path: <linux-usb+bounces-36677-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CI+RNrrR8Wm3kgEAu9opvQ
	(envelope-from <linux-usb+bounces-36677-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2026 11:39:06 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F5F49219E
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2026 11:39:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 63547301648D
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2026 09:37:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE4713BADAA;
	Wed, 29 Apr 2026 09:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l/gBTsVw"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF2B3AA50A
	for <linux-usb@vger.kernel.org>; Wed, 29 Apr 2026 09:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777455374; cv=none; b=tNHTZrz+xrUykJZ/5iowo33MZUsx5eCd3Jj/59QFdUk4IC+/DvP/sXJDIUI6XD2mPKP/oGYErhhdedEQcShfKIpjVwBb9zqTvWzNxT6cFrPqdLEs/m9NBDXnu5bhjFb/l+eYaRXtR6H3bFt7xCUe+c91+IRnumDL0IjFovIj9Jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777455374; c=relaxed/simple;
	bh=emYmKD9RQnj+q6nW+3fbPsPEOZSUAwk57IaX/SglBj8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jo46wLvKgiKjAgyS0Aihxqrf9wEQJL2mHThYrOqptA6PSsojbCfXcqm219Cxrfc+BRvnlW5NcELrqJVZ0yQWzDVlhMR9OwoY9+ndqSuYjhs2C/6wqLaAFj1aL91u6l9UewHhBATDLISvMcy1CrJfb/haN/l7QmTzbiM4GLV11ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l/gBTsVw; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5a3be187ffbso661495e87.0
        for <linux-usb@vger.kernel.org>; Wed, 29 Apr 2026 02:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777455370; x=1778060170; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UnHZIZrnHC+OUGFFaCPlglhMEU1W/URNbUNgpGUhUH0=;
        b=l/gBTsVwcrrAnfZFd3MiAG9pZoAUyiVKB7FJmI0TnDf7GhD8v3egCYLP3exayKUlxF
         T7zd2DY4aZ/G7mCfLn7mKximDgMWjfAqvezJ0DmzcHoj2lGLdocAulA7naNVf3237UR9
         q3m/KSPIXM5CEeOlazdUKFqrQl8VGQBtKL2x6sd2J2r+ea2Lqy1XMxpfUytBvgcNofQg
         1p0wIj/xIaK69B5eoeZN9Y8ZdFGzGQYDJJd1oHhR50aMTFOt7A1/HODbJLQdxfWdh+Lx
         HYeBh6WGBYuRa3j5Lw6KY6ck6T0GxCTbxKYozzVePQPAphSDAk9bkVo1+Pu1wtpfTw+y
         smTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777455370; x=1778060170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UnHZIZrnHC+OUGFFaCPlglhMEU1W/URNbUNgpGUhUH0=;
        b=YgHPv11I9JoaR9gJiGkipmSe8ytH17d1K0JgfLK8TGlvjKwi+uCDOjApkXMPVVlI0T
         MIAQJTp4nyMedQ5d3DoSXpohhlVseZREbiUZJ3lcJQG72Adjp1jgh1H3pNIVy0NF8MXz
         PUosWUDYJaYOJeuwGSU5KFP/kfknABSywDJaRyzAt1qUi69nTCfUDJJIMt2zXURBDkYy
         uXyW2noS22tOVTsNOX18w4hRX/8r4uhYN/geLhIoJiq3eEvijSk2sBqLfDGOInJ3+m2y
         ujNlwr4xemp6izTnBzU0c1MTCkdlFUKkHdxlbnukDPBBWKJSn+bXaylgspW85JV+ya4Z
         AfRw==
X-Forwarded-Encrypted: i=1; AFNElJ/TARDCjMqNOsYluqnh9dkyV1t8tpfrUW7YvRHzb9/hFyN/DE8Q3TwGs9R/lKDqpiI3Cvda4NwGTaM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWNssRzx6kjN+CEKG579c5cko7D2BZaqFZXLUlHrnR2Y93DesB
	DgOnA/WaQ53qZPSB4bRnifzzucLmc77K8Elz1a/UVThcRqggdaZ7myP+
X-Gm-Gg: AeBDieulz7IUnViNIP/tNDUE4qjN7Vh9q9XsgbcJcqy8F2+V/9j0049mDPZuHIMT4sI
	oU0+6EEKdBoRq5vTLhK/RgicdazDs5RJM1/r5Iho7KDxFF4Q8M9uWHTryXKwhMER945rjTX8ebu
	8nMNX3zKJ4XCaJso7YOxTf4F8mEc3RheJSu5oZdAP9IZyB4xKXBCzDmaq3vOga+DtZnEVHfa90I
	6TOyJ9Y5WCY028rOQyj6c/r9O7y2hFwHfEDNUCqnRYrXK7s9f3ZO2s/HDAWblZ4MDGK7/jTDw3b
	0WdPkZjtdhUzGOhjnug8jZv7D4ZbJqCa9mbpDPUZfCzbby+hujRYFOuFceH/lwTAV6FXj0rO/v7
	syMYQl06xqZ2vrjVmgIZqvrK3mMd52Yc3+5AzK9zyx/B6pa0Oj8E37vIDhpd9hfvfHcuOmixBe2
	3Nc9GClxE9WsviMux5sPyX90lZ1vc+fnThvUN6q7wAiCI=
X-Received: by 2002:ac2:5299:0:b0:5a3:f0a7:2f72 with SMTP id 2adb3069b0e04-5a74a0049d6mr535135e87.0.1777455370339;
        Wed, 29 Apr 2026 02:36:10 -0700 (PDT)
Received: from foxbook (bfh75.neoplus.adsl.tpnet.pl. [83.28.45.75])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a74a773599sm392473e87.77.2026.04.29.02.36.07
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 29 Apr 2026 02:36:09 -0700 (PDT)
Date: Wed, 29 Apr 2026 11:36:04 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Brent Page <brentfpage@gmail.com>, linux-usb@vger.kernel.org
Subject: Re: TT budgeting for EHCI; accommodate 1023-byte full-speed
 =?UTF-8?B?aXNvY2hyb25vdXPigJNpbg==?= endpoints
Message-ID: <20260429113604.2204b646.michal.pecio@gmail.com>
In-Reply-To: <32291bf6-0c9d-4fd9-9dd7-489f7e1c9f02@rowland.harvard.edu>
References: <B66AE752-B09C-49B3-A829-F7ABB36FB250@gmail.com>
	<32291bf6-0c9d-4fd9-9dd7-489f7e1c9f02@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 71F5F49219E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36677-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

> On Mon, Apr 27, 2026 at 06:24:58PM -0700, Brent Page wrote:
> > I recently encountered the ENOSPC error mentioned here
> > (https://lkml.org/lkml/2013/2/19/482) when trying to communicate
> > with a full-speed peripheral with one isochronous=E2=80=93in endpoint w=
ith
> > a wMaxPacketSize of 1023.  N.b., that patch was reverted
> > (https://lkml.org/lkml/2013/6/18/458).  I think it should be tried
> > again with a different approach.

Out of curiosity, what sort of device? This bug used to annoy me too at
one point, but my device was a DSL modem, not easy to experiment with.

On Tue, 28 Apr 2026 17:19:01 -0400, Alan Stern wrote:
> Section 11.18.1 is a marvel of inconsistency.  The text and the
> figure caption say that the estimate assumes no bit-stuffing, but the
> formula clearly includes a 6/7 bit-stuffing factor.

I don't think it's inconsistent, it makes sense the way you explain.

> I think what it means is that the maximum number of periodic data
> bytes that can be scheduled for one frame on a full-speed bus is
> 1157, since transaction scheduling does have to take bit-stuffing
> into account.  See the formulas in section 5.11.3.  Even that value
> is an overestimate, because it does not reserve time for packet
> headers and other forms of overhead.  Figure 11-60 shows the
> budgeting estimate for those 1157 bytes, under the assumption that
> they do not need to be bit-stuffed.

The host must schedule SSPLITs assuming no bit-stuffing to prevent TT
buffer underrun on long OUT packets. Assuming minimum/no packet headers
further minimizes downstream idle. TTs are required to buffer this.

(BTW, periodic transfers should occur before async. Could the TT run
out of periodic, do async, then get an unexpected periodic transaction
in the next uframe? What happens?)

Including packet headers for SSPLIT scheduling seems harmless unless
overestimated, but apparently it's not required. TTs must cope.

Separately, for go/no-go (ENOSPC) decisions, the host should consider
all overhead in order to guarantee >10% downstream time for async.
Max payload is still close to 1157 because it may be just two packets.

That's how I see it.

> Since the value of stream->ps.tt_usecs calculated in
> iso_stream_init() does include the 7/6 bit-stuffing factor, it makes
> sense to adjust the us-per-uframe values to reverse that effect for
> purposes of budgeting. It would be more in the spirit of the spec to
> do the budgeting in terms of bytes rather than microseconds, but
> since it's all estimates anyway this shouldn't matter.

Not entirely sure about it, *if* these computations are later used to
schedule SSPLIT or CSPLIT transactions. That needs to be exact IMO.

Does anyone understand why the previous attempt at enabling 1023 byte
isoc IN resulted in isoc OUT corruption?

BTW, does ehci-hcd support scheduling CSPLITs to Y0 of the next frame?
It's an edge case which likely won't occur with one 1023 byte endpoint,
but it may occur with more periodic endpoints and unlucky bit stuffing
or with periodic BW limit carefully increased for testing purposes.

Regards,
Michal

