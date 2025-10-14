Return-Path: <linux-usb+bounces-29306-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 660BDBDBEF0
	for <lists+linux-usb@lfdr.de>; Wed, 15 Oct 2025 02:51:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E64DF3531EF
	for <lists+linux-usb@lfdr.de>; Wed, 15 Oct 2025 00:51:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2130C1D5160;
	Wed, 15 Oct 2025 00:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ik.me header.i=@ik.me header.b="hGq8jPqD"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-bc09.mail.infomaniak.ch (smtp-bc09.mail.infomaniak.ch [45.157.188.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B76E1C701F
	for <linux-usb@vger.kernel.org>; Wed, 15 Oct 2025 00:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.157.188.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760489459; cv=none; b=KFWLCGpIj4OXCB1LyNAF3odVTs2+zdvop38/QKc5KgOCd0OlkkJ7O3gEk8iszaTVLzt6zqgd6UJhm/XFK/ilFWEABjKT2oQFgVsNGAad6JBfqihkEr3TPRNeIyredpgyDfHHPsiuUyR9I9n6Eb7LSyhifYIqTyq9EuosdJBBXKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760489459; c=relaxed/simple;
	bh=Kd6sDoGDSw2np95tKvC4Km8/Lhh6eFUFQd9d6qjWCco=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Message-Id; b=X9+mb6F9TPiJmmt9+M8+tYKnsnX/kTZdF8j9trS1pwKxUenXZX9HwZsr5J745dZZAW7qUmQwsN7SEbp1RolvQTsRPIaTsu4562WfSz5pYAt/b+RoACJfYn/Zb+faxRJEPrKDHiXUAeseqUBYUJuOiJcD7d7RkJhjzMec7osKYb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ik.me; spf=pass smtp.mailfrom=ik.me; dkim=pass (1024-bit key) header.d=ik.me header.i=@ik.me header.b=hGq8jPqD; arc=none smtp.client-ip=45.157.188.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ik.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ik.me
Received: from smtp-4-0000.mail.infomaniak.ch (smtp-4-0000.mail.infomaniak.ch [10.7.10.107])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4cmQKG5N14zMRb;
	Tue, 14 Oct 2025 22:09:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ik.me; s=20200325;
	t=1760472546; bh=Kd6sDoGDSw2np95tKvC4Km8/Lhh6eFUFQd9d6qjWCco=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=hGq8jPqD+q6ih5lARP21Ui0dR639iF389j9mhQZnfYdZ/y2V7XsJT+Ak42R7uReA2
	 pmXPmtuEgcEJitLiOyUuZ9OLlhKshwcn/7BVVosAaU6a/3nTueS+pTHt5EBS9lOEdi
	 jBhjtK4AqE+tCkLLOwtkMIgGyQmXpmI/n5fuzh58=
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4cmQKG1DjhzRBw;
	Tue, 14 Oct 2025 22:09:06 +0200 (CEST)
Date: Tue, 14 Oct 2025 20:09:05 -0000
From: Pierre Tomon <pierretom+12@ik.me>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Subject: Re: USB disconnection after mounting file system
In-Reply-To: <20251013104621.29418939.michal.pecio@gmail.com>
References: <4chgTL1WjjzCqn@smtp-3-0000.mail.infomaniak.ch>
 <2025100905-gestation-founder-3e70@gregkh>
 <20251009160731.58dd47bb.michal.pecio@gmail.com>
 <4cjC4c3F8BzrTr@smtp-3-0000.mail.infomaniak.ch>
 <20251013104621.29418939.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Message-Id: <4cmQKG1DjhzRBw@smtp-4-0000.mail.infomaniak.ch>
Feedback-ID: :d3dee46c33acd70:ham:d4c4a9452bf4d5d
X-Infomaniak-Routing: alpha


Some progress:
Permanent (or long) activity LED flashing is certainly due to
ext4lazyinit.
Disable USB autosuspend solved USB disconnections when there is one HDD
connected.
It still disconnect when there are two at the time of power-up (it's a
dual bay docking station).

Pierre T.

