Return-Path: <linux-usb+bounces-19231-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 22492A0B064
	for <lists+linux-usb@lfdr.de>; Mon, 13 Jan 2025 08:55:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3A1B0166235
	for <lists+linux-usb@lfdr.de>; Mon, 13 Jan 2025 07:55:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59A1C232386;
	Mon, 13 Jan 2025 07:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="R98vN3FF"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C752722615;
	Mon, 13 Jan 2025 07:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736754912; cv=none; b=c+FCz+gu4gtzNJJnqOEWW17GRFsfK3sgRvuVYHx1CXdcC1a32TCzTgE+iViVFWfEiLs4AN37jW9wKTQvh0gLY/ZJd+MioPxYsUAyaIYAgQ85tL2Oky/7ZyEJsbX2w2IQ+ikQrGBZx0A0FbRO/ViHYnEF073iLDiYxDJJUQ8D6KM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736754912; c=relaxed/simple;
	bh=YrX2CesNE3eaYycK1LcaZAMZh/ciqH7X+WDa6Ua7F8g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CHgMZS7DHp67oVsh8pOljd4OpUGFLvICH4TBTHzPRbZv6525amAfpzkuLZg/XOQID/O0I9MpKPIXGx6Frg6LsjGwxu/YVybjWPLqYS5n8Yo7uljAIscKlkW88Q0fpnSqJgWkEGLd191mB6mz+b6IewvqTmUs/e9+ohJDeab2/Yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=R98vN3FF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFDEAC4CED6;
	Mon, 13 Jan 2025 07:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1736754912;
	bh=YrX2CesNE3eaYycK1LcaZAMZh/ciqH7X+WDa6Ua7F8g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R98vN3FF6TxYfDSd7fjWdJ35zW9gBJdlCf6HZvy5s5UI5ScJORaZ0MIWo4MiPdNvt
	 a+kzc5jQXkdZPTOAYnGc+7aw1DXr6B8+N6LLZJ/MXuebGfHMIgNw/SUAf7K9TCt+rW
	 LQqtwz7fI8QSV+2/sCI+Qe2Hg5qrUnm9n52SRA2s=
Date: Mon, 13 Jan 2025 08:55:08 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: limiao <limiao870622@163.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	limiao <limiao@kylinos.cn>
Subject: Re: [PATCH] usb: quirks: Add NO_LPM quirk for TOSHIBA TransMemory-Mx
 device
Message-ID: <2025011334-fable-arrogance-b04b@gregkh>
References: <20250113075118.30007-1-limiao870622@163.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250113075118.30007-1-limiao870622@163.com>

On Mon, Jan 13, 2025 at 03:51:18PM +0800, limiao wrote:
> From: limiao <limiao@kylinos.cn>
> 
> TOSHIBA TransMemory-Mx is a good performence flash device, but it
> doesn't work well with LPM on Huawei hisi platform, so let's disable
> LPM to resolve the issue.
> 
> Signed-off-by: limiao <limiao@kylinos.cn>

Can we get a "full name" here?  If you want to use your native
characters instead of ascii ones, that too will work quite well.

thanks,

greg k-h

