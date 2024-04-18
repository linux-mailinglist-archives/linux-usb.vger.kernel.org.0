Return-Path: <linux-usb+bounces-9458-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F08D98A9E19
	for <lists+linux-usb@lfdr.de>; Thu, 18 Apr 2024 17:15:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2CD271C21CC9
	for <lists+linux-usb@lfdr.de>; Thu, 18 Apr 2024 15:15:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0236716C453;
	Thu, 18 Apr 2024 15:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MoOIP3z3"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF6715F321
	for <linux-usb@vger.kernel.org>; Thu, 18 Apr 2024 15:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713453354; cv=none; b=owSkHYuKyLWRh1lHoErDNm1Zfz4Gvndwy4DeEYedp33s/A0hMThZljb6QHF/ls+kI6uQBJ2dHE0w9AD+FUcmpwmZZnJR8LgyF4TsfsU89Txvi+tJjVXdQdlFZLzu3XmFPKakTx1VIbYSCfu/fngkZde+7LLxvWDjfsCGyuamAwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713453354; c=relaxed/simple;
	bh=90mWMLrsC55n2/mzXx6T7dBxQW+Ea8EuUOYXXSdtC6o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BJrGxzo3qs29IancQhucgVlo7vFHTFo3horzvnRc3yrla9ep4Sk2ip3m5FR2XqYrva+2lbc+tA37r0Cd57ae7FONv39MSfdM33MY/G6sG+0rMx7pKtT0i+3eeHUW0h9Ywm0TmzNKOimviGmNFQw7n1mb1YsxeGF+lqk60Ybpupg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MoOIP3z3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B03AC113CC;
	Thu, 18 Apr 2024 15:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713453354;
	bh=90mWMLrsC55n2/mzXx6T7dBxQW+Ea8EuUOYXXSdtC6o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MoOIP3z3X6PnKeb7Ts8f5g6BCmVMpjXdfGcfldlu3M4RjIca9NB9Gr3OFL6TKDiaj
	 UZioSiCb98BL0ToNTDqkmKyEdXLTjRynYHcZv3D3IMWxeXFAOuByvtnhZnbQbHKUp1
	 gR9iEORn14bgHF25Eu9MzScNSb+K/DX0xVYuFE3vQdSpp8Quqgryf8+kgpf0f6eoqb
	 qpIjVG3jAoIdze2Csw8dd8s0hGAM7DyOZ3GwJdgPnv6xPqGHnVvjAfDjiRYPda6LdL
	 /3M81xUICIrZ+pz7cJMiybp15MoN2vJTjHL8cb4wZcgLx9cQc35p7kM+YjGKYayii2
	 Pm6yuJBhP1Wsw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1rxTUT-000000001o9-0e5z;
	Thu, 18 Apr 2024 17:15:57 +0200
Date: Thu, 18 Apr 2024 17:15:57 +0200
From: Johan Hovold <johan@kernel.org>
To: Daniele Palmas <dnlplm@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/1] USB: serial: option: add Telit FN920C04 rmnet
 compositions
Message-ID: <ZiE5Le7NtW_J2Dy9@hovoldconsulting.com>
References: <20240418113430.4138714-1-dnlplm@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240418113430.4138714-1-dnlplm@gmail.com>

On Thu, Apr 18, 2024 at 01:34:30PM +0200, Daniele Palmas wrote:
> Add the following Telit FN920C04 compositions:

Thanks, Daniele. Now applied.

Johan

