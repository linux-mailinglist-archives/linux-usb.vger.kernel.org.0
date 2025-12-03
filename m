Return-Path: <linux-usb+bounces-31125-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 02DE6C9ECC6
	for <lists+linux-usb@lfdr.de>; Wed, 03 Dec 2025 12:04:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 696573A1D14
	for <lists+linux-usb@lfdr.de>; Wed,  3 Dec 2025 11:04:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 043EA2F0688;
	Wed,  3 Dec 2025 11:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dz36wuYI"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75EEC28B3E2;
	Wed,  3 Dec 2025 11:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764759867; cv=none; b=bHtfWUU/mRhCDXSN70k9RJDaESqnqojL7Hmfrkk5Q7DyxuqZpF451YdgeRTDlzBWU44pFmmtQJzGuBOHQ1VldmNlp9uw4e1Qp8AxNUlnsJyAq28FyGhKQyEnRVIjlLyQzFBZm1Yg8I5YvOIi6N4CVvlS8EZlcvKsLU6hLVx9T84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764759867; c=relaxed/simple;
	bh=fEiHoE8rCXCQbcUWFC3JKbtYUMh1FdKN3RCiOgPsPYs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ln/vH7u80ao2CjyyaoaSs8Id1LcAagHvXZjNt4/Jze6AKvBFt2XxZekGxS6WCwEFFAFuePT+zFNAoFFnYoWFsfUNvYcn2bn2w4OdA22wogAYOickvXivj3L1hx9d8B+XbdUGLfJCpMcGAEA4FsvytoKqvuQxbiTv782H87/ZkSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dz36wuYI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01A2EC4CEFB;
	Wed,  3 Dec 2025 11:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764759867;
	bh=fEiHoE8rCXCQbcUWFC3JKbtYUMh1FdKN3RCiOgPsPYs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Dz36wuYI5ceIIVU/NbuPRcdG1JJzhzGqraOC4nnpNIA4an8nj2m6SA9SLCmhu5tVS
	 A8nrvOcvmzDU0SGirJRK5lCC/LEUSqCrS8/2YuZeAzlQhAjSKuasG9hQcd7+2K9q3j
	 IW2561nKsdn5ZuLbNG2O1XajXZHiuWaNoC/j9+m4JyKas2ariNyYZGXWL+TVJLgG87
	 zpV7fsvIYfUoJ1pIo41ws8s3oLB6lWf18QmE9afBzxbd4AYRbjJZJ/CuX4vNchNl+R
	 ocF5YwX+dA2cv7lWyEtntHPxeCPHi6vT+iAulMp4+xWCVY4t51SxS+8TO9K8PrN924
	 LPFks5B9v785g==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vQkex-000000006eP-0FLj;
	Wed, 03 Dec 2025 12:04:35 +0100
Date: Wed, 3 Dec 2025 12:04:35 +0100
From: Johan Hovold <johan@kernel.org>
To: Peter Hong <peter_hong@fintek.com.tw>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, tom_tsai@fintek.com.tw,
	yu_chen@fintek.com.tw
Subject: Re: [PATCH V2 1/1] USB: serial: f81232: fix incomplete serial port
 generation
Message-ID: <aTAZQ2fks4CHtDw1@hovoldconsulting.com>
References: <20251128085244.14044-1-peter_hong@fintek.com.tw>
 <aS2aQF_6ljhFtLI_@hovoldconsulting.com>
 <fd3e97cf-6f92-4921-9482-e0d6863a46b2@fintek.com.tw>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fd3e97cf-6f92-4921-9482-e0d6863a46b2@fintek.com.tw>

On Tue, Dec 02, 2025 at 01:40:28PM +0800, Peter Hong wrote:
> Hi,
> 
> Johan Hovold 於 2025/12/1 下午 09:38 寫道:
> > On Fri, Nov 28, 2025 at 04:52:44PM +0800, Ji-Ze Hong (Peter Hong) wrote:
> >> The Fintek F81532A/534A/535/536 family relies on the
> >> F81534A_CTRL_CMD_ENABLE_PORT (116h) register during initialization to
> >> both determine serial port status and control port creation. If the
> >> driver experiences fast load/unload cycles, the device state may becomes
> >> unstable, resulting in the incomplete generation of serial ports.
> >>
> >> Performing a dummy read operation on the register prior to the initial
> >> write command resolves the issue. This clears the device's stale internal
> >> state. Subsequent write operations will correctly generate all serial
> >> ports.

> > Did you try removing the retry loop also in the set_register() helper?
> > Perhaps that's no longer needed after the dummy read.
> 
> I will try removing the retry loop in set_register() helper.
> If that worked, could I use the same patch file or series of patches?

I think you can do it in one patch since I assume the existing retry
loop is there to work around the same underlying issue.

Johan

