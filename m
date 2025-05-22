Return-Path: <linux-usb+bounces-24218-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E79A5AC078D
	for <lists+linux-usb@lfdr.de>; Thu, 22 May 2025 10:46:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6DF7E3BC91E
	for <lists+linux-usb@lfdr.de>; Thu, 22 May 2025 08:43:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EEF8279902;
	Thu, 22 May 2025 08:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R8nw+Uuv"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC0CA221DB3
	for <linux-usb@vger.kernel.org>; Thu, 22 May 2025 08:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747903374; cv=none; b=oMe8ogCUhkWuYulK8gfczg1hQjcdnbjz+948I2vEydYuC42mpZCEHaBOIoxDhy+PJdp3Cs2MmlT5X5m0mwJSVZQZbxijkonVEEwjEg5L1AfxNlLxzdjV1mPdO4H5qn+zbAOuGhMZIcgIHIpLmcDtBZ7Z4EaPtN3ZpOxtsMSd+hI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747903374; c=relaxed/simple;
	bh=3gpbrJRJbs5ryGeUbZw1iJhN2z0wgdgXRADDQmKl8l0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YXE1ghv6bj9dxzvBgIKOUGFS5Ddrq+q0JFtFYJPqKeSj4iikqpF7O/YKYlFrbS9jj6XumMI89VMXTb+/SIMdetTZdJ3QaqKtVHF8O7eoYNBMBzzV+ZB0MMT0kLDb611HmDI7t7fvcQY7kHMWrLtaCPGZEBYBRw4lm/6d60SCJNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R8nw+Uuv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A067C4CEEA;
	Thu, 22 May 2025 08:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747903374;
	bh=3gpbrJRJbs5ryGeUbZw1iJhN2z0wgdgXRADDQmKl8l0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R8nw+UuvkxNGuaVby9pwCEtbsaOxyxUZIK11MACMywV+YrctKPJuMyxm4DUBrnE3P
	 4nMYQPJVG3Fxw5X+c3fFwiVQBZ4vfMJn3Bc0ceMjI7FwnoRVR0qv7EPDjNnVGhbOLY
	 ADB54MA8jaNBicf1k/VUBkWclz1lf6tucxk2SvmM+KdOZMS08TC+RdJqzjE//7uMf6
	 PPCe0YamMU350EtzaP6xGEDf7y50fPcFq+lapiCspzVzcoWtuYZUWHrJ97cMCzr49h
	 vo5r1MPEb1Od364UjTwlGwMQAbDivYN1VODiIIIiN01OuY1f6sF2/cNBdl244Q8wCK
	 efUueiFp1i+zQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1uI1Vr-000000006lJ-0gmJ;
	Thu, 22 May 2025 10:42:51 +0200
Date: Thu, 22 May 2025 10:42:51 +0200
From: Johan Hovold <johan@kernel.org>
To: Charles Yeh <charlesyeh522@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	charles-yeh@prolific.com.tw, joy-yeh@prolific.com.tw
Subject: Re: [PATCH] Add Proliic new chip: PL2303GC-Q20 & PL2303GT-2AB
Message-ID: <aC7ji_pJtOGXlnBN@hovoldconsulting.com>
References: <20250521132354.1104-1-charlesyeh522@gmail.com>
 <aC3u6uCMin_0SXWQ@hovoldconsulting.com>
 <aC3vf5l4WacJcykH@hovoldconsulting.com>
 <CAAZvQQ7=UueHS_jbJVsiKMm+kf2cTW8gqHXvr44dbOdYLMgqqA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAZvQQ7=UueHS_jbJVsiKMm+kf2cTW8gqHXvr44dbOdYLMgqqA@mail.gmail.com>

On Thu, May 22, 2025 at 03:54:44PM +0800, Charles Yeh wrote:

> > That was supposed to say:
> >
> >         USB: serial: pl2303: add new chip PL2303GC-Q20 and PL2303GT-2AB

> Thank you for the suggestion.
> I will send a new patch file later.

There's no need to send a new version of this patch as I fixed up the
summary when applying. It was just a reminder for future patches.

Johan

