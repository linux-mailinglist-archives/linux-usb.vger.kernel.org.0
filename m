Return-Path: <linux-usb+bounces-7855-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C6BEC878F1E
	for <lists+linux-usb@lfdr.de>; Tue, 12 Mar 2024 08:39:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CE8031C21003
	for <lists+linux-usb@lfdr.de>; Tue, 12 Mar 2024 07:39:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23E0E6995C;
	Tue, 12 Mar 2024 07:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j89f2lc1"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 960D5B657
	for <linux-usb@vger.kernel.org>; Tue, 12 Mar 2024 07:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710229152; cv=none; b=ecjY44yKDDM1uyegms2mQabPCN6Qdh6gUb3aeu9Cx1laW+yihy45m1i+aF9GgjV1QQ+qdvA/wO+L1NZ30DCzpBOcQCBN5yGINf5p5WCJAeT29YiOWvl4ufD8aOJtr6tbjT+yMlJg+s+RUEe2ZXRdaVhRTKsIyUlRJLimBTwIrOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710229152; c=relaxed/simple;
	bh=GqAX6L/CKRHNKNLzn0anrp4onHgQt3vtVPtDil41/P4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hy6OfdFhjxYU+7FPKkpKMpiD95NcY0a+jpkGRrH1IOgJLh81/76l8Jo5zqpXh4d4ijsIJGxEW8hG8OJjRSt+YUJePWIsb88qLkHZ2K3B5TPJ/IX589KePQM2Pm31NJGYmTkUCZDi3vvDBpCR11/vz2aSoJmIMP50JhSx5MuOiic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j89f2lc1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BE69C433C7;
	Tue, 12 Mar 2024 07:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710229152;
	bh=GqAX6L/CKRHNKNLzn0anrp4onHgQt3vtVPtDil41/P4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j89f2lc18x0Ov9550uNKmqicM3Kwudm2cwXpPM42JN3m52G3wN788A58hzt8TUoCj
	 GTNWO9iNDXMJCgw1XmbJVnKhYJwT69sBr0WsznvIGVjk3XUKRGKKNhw832PsOLX0hy
	 rYp8MXFUAZ8KZxxCzbJ5NY4JLsOcbpXF3NuBSvjzTAd4SMX+9KW1lIKQzolChb9Cfo
	 jpqbWLDU+Njd9ZNU0pFl1TX8uJDNd29czoJ6TZnOeaVPE0bGVoJb9CgryEjKfzpExZ
	 IUsB2S1368OWRA8kdpRRfx/LhrnRfTDlet8aS3nCFXgaT2ZRS5r1o53vplXSQ41R3H
	 D/pDySDSWU1ag==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1rjwjG-0000000070W-28qh;
	Tue, 12 Mar 2024 08:39:18 +0100
Date: Tue, 12 Mar 2024 08:39:18 +0100
From: Johan Hovold <johan@kernel.org>
To: Alex Henrie <alexhenrie24@gmail.com>
Cc: linux-parport@lists.infradead.org, linux-usb@vger.kernel.org,
	sudipm.mukherjee@gmail.com, daniel@gimpelevich.san-francisco.ca.us,
	hkzlabnet@gmail.com, reboots@g-cipher.net, mike@trausch.us
Subject: Re: [PATCH 2/7] usb: serial: mos7720: don't advertise
 PARPORT_MODE_PCSPP
Message-ID: <ZfAGpkMT-jaZGXmF@hovoldconsulting.com>
References: <20240312055350.205878-1-alexhenrie24@gmail.com>
 <20240312055350.205878-2-alexhenrie24@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240312055350.205878-2-alexhenrie24@gmail.com>

On Mon, Mar 11, 2024 at 11:50:27PM -0600, Alex Henrie wrote:

This one and at least one of the later ones are also missing commit
messages. Please fix in a v2.

> Signed-off-by: Alex Henrie <alexhenrie24@gmail.com>

Johan

