Return-Path: <linux-usb+bounces-10193-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 97BE08C20E3
	for <lists+linux-usb@lfdr.de>; Fri, 10 May 2024 11:26:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4AD881F2258D
	for <lists+linux-usb@lfdr.de>; Fri, 10 May 2024 09:26:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EE92160877;
	Fri, 10 May 2024 09:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="J8EUypkr"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618C310A3E
	for <linux-usb@vger.kernel.org>; Fri, 10 May 2024 09:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715333207; cv=none; b=H3rulD+1cjeSQWFbzAHwARdrzBDWDm581H84HoUpfWlpOIZTWnZYSmKwP/M9hVnYLH+qGr5djYmwvqJ2pjIK85g6Dc4MlqS3rTFeUTnMd8u28c1LWIsBPBX/cTsbqOB/j7FL3F/hGVULZWhfT5QvK4TI2DBwQbW7UhSdhSfyNB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715333207; c=relaxed/simple;
	bh=6NkCg7hpvWEUrsGIL4WYFJuRuaG7v2fpsPzQedT827c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pWubmbIzXtS4Vy72dK293t8Y80/xzfbuOmZxNy2Chg6DhUCuAefsvSvq7/H0TVEoggRwE1gyV+uhfrhLoxgKVgw+f8KjiFlFnz70u77zjKd1OGc7v5SmS4gywI2gNGYjeeIQ5mXjvd7f8c+QGcaBiufTflkzCCAhf306C5dj55E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=J8EUypkr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA1ACC113CC;
	Fri, 10 May 2024 09:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1715333206;
	bh=6NkCg7hpvWEUrsGIL4WYFJuRuaG7v2fpsPzQedT827c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J8EUypkrEi/lLVyiyLIGYu5BzOCH0p9//zKa98fWmP5SUu6A3vXpwRYmy2yqb/Omr
	 xbedhNxENtLOqfuaCWXDv4wez3e9p9J1zCQI3URIIk7SpqKjl1SdreKRuNYfrnoJpV
	 rJRYvmIekvLGH5Sd4zo0viIPs7Jwvb3xmoY66A8A=
Date: Fri, 10 May 2024 10:25:52 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-usb@vger.kernel.org, Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>
Subject: Re: [GIT PULL] USB4/Thunderbolt changes for v6.10 merge window
Message-ID: <2024051045-steadily-nutlike-dea4@gregkh>
References: <20240510050524.GB4162345@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240510050524.GB4162345@black.fi.intel.com>

On Fri, May 10, 2024 at 08:05:24AM +0300, Mika Westerberg wrote:
> Hi Greg,
> 
> The following changes since commit fec50db7033ea478773b159e0e2efb135270e3b7:
> 
>   Linux 6.9-rc3 (2024-04-07 13:22:46 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v6.10-rc1

Pulled and pushed out, thanks.

greg k-h

