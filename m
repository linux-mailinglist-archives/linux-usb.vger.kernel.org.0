Return-Path: <linux-usb+bounces-30962-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id AE366C89944
	for <lists+linux-usb@lfdr.de>; Wed, 26 Nov 2025 12:44:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A06974E3F9A
	for <lists+linux-usb@lfdr.de>; Wed, 26 Nov 2025 11:44:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90FA1313E13;
	Wed, 26 Nov 2025 11:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Xs+rgOZW"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1593A2DD60E
	for <linux-usb@vger.kernel.org>; Wed, 26 Nov 2025 11:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764157471; cv=none; b=mrq8AoeNntI5VGIaIm0ZFw6S/Tfucjm/LqIwwyhd7LW+OVOa+eIAWvgRfbDrNrCWiPyZzf2q+o3BqwKB8zvXalUmxo9nbhvw5QKele5vi8D6J4XFf1lKgZa1vRZuryCkHo6vRxvDoOR864+AoEormkiZx4nkA4v1dUen6LBtlFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764157471; c=relaxed/simple;
	bh=xmIAd3jQAo8h4Kwcy3I76eZaIaL+OccslqnCqEFc07k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g6PUxRliTczkj/DytMAZNLiFA2d+CLDGni+Xt0IKcd3vcYFDrk0KTRF/gg+k5XaO8SJSgaePXfFtocVhNtmEytrbPRxYXjapHn+RJl+IAikyIu+Kyk36mFeZIXEic+7QXs3ghfr1sYkdLzMe7XFUQEhbQdq47URINo0Czpd8sa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Xs+rgOZW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CCB3C113D0;
	Wed, 26 Nov 2025 11:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1764157470;
	bh=xmIAd3jQAo8h4Kwcy3I76eZaIaL+OccslqnCqEFc07k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xs+rgOZW0oCRQM2VJSe+tUBM5WpVWdEq/sytpSK3wmHYPkdW92MYt5PbaKbr3oo/6
	 cg0gJyJC8qiGFwpZYCI/CzeU96Bi+HB6Rh9VZ6RQQmrhQn1TH/tIi6U+jyIYG75k4O
	 jTspBtj6RkTo0JW701XtigSTpgamuQQp/poLA9XQ=
Date: Wed, 26 Nov 2025 12:43:38 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>, Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] USB4/Thunderbolt changes for v6.19 merge window
Message-ID: <2025112632-credit-exhale-2d8e@gregkh>
References: <20251126091242.GD323117@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126091242.GD323117@black.igk.intel.com>

On Wed, Nov 26, 2025 at 10:12:42AM +0100, Mika Westerberg wrote:
> Hi Greg,
> 
> The following changes since commit 211ddde0823f1442e4ad052a2f30f050145ccada:
> 
>   Linux 6.18-rc2 (2025-10-19 15:19:16 -1000)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v6.19-rc1

Pulled and pushed out, thanks.

greg k-h

