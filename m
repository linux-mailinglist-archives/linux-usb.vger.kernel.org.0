Return-Path: <linux-usb+bounces-14656-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 568A496C438
	for <lists+linux-usb@lfdr.de>; Wed,  4 Sep 2024 18:37:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AADEFB20B22
	for <lists+linux-usb@lfdr.de>; Wed,  4 Sep 2024 16:37:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4FF91E00B7;
	Wed,  4 Sep 2024 16:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alphanet.ch header.i=@alphanet.ch header.b="GkMOOT0b"
X-Original-To: linux-usb@vger.kernel.org
Received: from shakotay.alphanet.ch (shakotay.alphanet.ch [46.140.72.222])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 276E96E619
	for <linux-usb@vger.kernel.org>; Wed,  4 Sep 2024 16:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.140.72.222
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725467846; cv=none; b=EhCtfaXZSk6Ok0YTMJ45M1G8ckT0KHXKRTzPoEtVxp1BoAjEjOF6noJZWxwk/Sn3CgD/hHK1ujJPw26qkRH4K6GGD/pxOCx4vYL6dQZD/7cFB9JPnMrVDge9FI1+zeflinCCixJPXNrhiEcbhHQdZb1bwixT2K0R6MTDJLUWTB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725467846; c=relaxed/simple;
	bh=ajxndDyCdq3qNMIjRRdB+06kUIwh5OjGOM1kZDRRE9A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EzhJpEYOD4fc05NaiBfloF6SPcUOJwEKTYLNXiu5vtcsLpd9UWCuw30myQ0SNwDIlIkVYnHxrCHxin5+M/077yaNIXr9t8OuQ6qKGNwdCS/2a+5rMVRiII/BqcoK79QwkFELpEeUd+fxr/SA+C2dA+4WTMitBguEMtvas6kK6t8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alphanet.ch; spf=pass smtp.mailfrom=alphanet.ch; dkim=pass (2048-bit key) header.d=alphanet.ch header.i=@alphanet.ch header.b=GkMOOT0b; arc=none smtp.client-ip=46.140.72.222
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alphanet.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alphanet.ch
Received: by shakotay.alphanet.ch (Postfix, from userid 1022)
	id 05C391243CAE; Wed,  4 Sep 2024 18:37:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alphanet.ch; s=mail;
	t=1725467835; bh=ajxndDyCdq3qNMIjRRdB+06kUIwh5OjGOM1kZDRRE9A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GkMOOT0b6D3SLXGlpEC3zCZ6JREdPevEHx02hltusd2OG4rasdUxadx5RejM3lbbu
	 hEEHvr3Bb0M3PKCa3qmLKWhbPgOw+JbHmfpoFPiLNTzXm/Oa+IMrH3J79NhR9YkiKg
	 w1nsJqYKCBFSMJf9BDJ0RTzmG3anbCYVE4e3ibQI6Xi8/Hb8LDAacjon/A/3fAsv23
	 ARFU8k+Qal+Uxi4IkyNDpFzKkRDGxKD7J0li1OLuNE+cLBaJWIBAlp6WMupvng/iTM
	 yFwO8MeYy5cocNbPHu+R1vVE6cAPLl+yM4/Lo99H+Qys0i43Ww2vj/nInR+5aNjY/d
	 fcpHFh3xYtLzQ==
Received: from reliant.alphanet.ch (reliant.alphanet.ch [192.168.1.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by shakotay.alphanet.ch (Postfix) with ESMTPS id 0F7111241C43;
	Wed,  4 Sep 2024 18:36:55 +0200 (CEST)
Received: by reliant.alphanet.ch (Postfix, from userid 1000)
	id 081DF76CDBE; Wed,  4 Sep 2024 18:36:55 +0200 (CEST)
Date: Wed, 4 Sep 2024 18:36:55 +0200
From: Marc SCHAEFER <schaefer@alphanet.ch>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Micha?? Pecio <michal.pecio@gmail.com>, linux-usb@vger.kernel.org
Subject: Re: Strange issues with UAS URB cancellation
Message-ID: <ZtiMp39CWrI0e+GB@alphanet.ch>
References: <ZswP0+cLIqkTF0D/@alphanet.ch>
 <20240903094822.3ae297cb@foxbook>
 <ZtcHOlqlQMMD4LzY@alphanet.ch>
 <20240903152218.74393a9e@foxbook>
 <ZtcUGe0FWxpO6058@alphanet.ch>
 <ZtcUq37F6gqgzifm@alphanet.ch>
 <ZtcVXoI6jNM9Lqbl@alphanet.ch>
 <20240903174535.6e5e581b@foxbook>
 <ZtdmOiKN6hb2Y82I@alphanet.ch>
 <71c073de-8af5-4457-88eb-91a709c2d941@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <71c073de-8af5-4457-88eb-91a709c2d941@linux.intel.com>

Hello,

On Wed, Sep 04, 2024 at 05:26:28PM +0300, Mathias Nyman wrote:
> I can start working on some debugging patches as well if you have the time to try

Yes, with pleasure.  I often have time to recompile stuff, and I can leave the test
system running.

Have a nice evening.

