Return-Path: <linux-usb+bounces-9347-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 037558A49AB
	for <lists+linux-usb@lfdr.de>; Mon, 15 Apr 2024 10:02:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1AEF81C208A8
	for <lists+linux-usb@lfdr.de>; Mon, 15 Apr 2024 08:02:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A05D7364BE;
	Mon, 15 Apr 2024 08:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bEXfP3OX"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D74736120
	for <linux-usb@vger.kernel.org>; Mon, 15 Apr 2024 08:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713168120; cv=none; b=EkWcmkuSI/Q2Zr+yrkgVy2atUzidwDC0CcaOP5CJYntr+JecbTdn0X9g0InsZ1MUiRJ9C7E48IDF3sUIp0CZB50mEmC+ylTODCqlj9c7FLXfmQzJuMGm3Vg+Y4FEgiyBsMe955IrHWlyUU0Rw+VH9dO/eTtCO+jo+W1vSHzgtlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713168120; c=relaxed/simple;
	bh=GOsGrDeG0V9cbohOqiwWX3A9W5OyEzCB/mUHsYic2GI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ugpnikQI/jq3eeTik7n2M4bCzZ5GNpLWEFWQTB1jx2+7Rr6FKk0P7fwWZP52/pMqo5f/abK9EdnmZuUnRAv90loMKNh2dBrLdHypB+lwMVIB8HHr+8ZX7vyh/IjXX06mTqKc5r89BC9L1s9MvGpzI/p4C1+4wCbuqcNX836Jez4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bEXfP3OX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB9B7C113CC;
	Mon, 15 Apr 2024 08:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713168119;
	bh=GOsGrDeG0V9cbohOqiwWX3A9W5OyEzCB/mUHsYic2GI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bEXfP3OXB/gIkhwearo8d2micO5vH+Q4nyqiye07DzEoSCY34CiaX83c+BAst2645
	 JpUuS0L9Q2g7mRrxHVmsjX5s+/BG4FWc9e5XF+Q/7uFQtr8HznBvZL4btq1i54xAlu
	 QgWQjDPqE2RwlOTnjpg3zkikS8vah7dwLmqoSKX9/89eXcV96gjllr3mzO6/1ueKv3
	 jlR58V0CjR72nqadZ6yZu4SBT2bevGLNbGfxfA52CUNKfIOTTcV23nK6gP1tHZM3SY
	 WgNmpjn4+fOm+Wen8d1DxzlypJYIG4rhaG1DS/GEaVcJJui7v7cPWU4uhsh//qTxjv
	 nSjF6WbOGRh5A==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1rwHHp-0000000066n-1Wv9;
	Mon, 15 Apr 2024 10:01:57 +0200
Date: Mon, 15 Apr 2024 10:01:57 +0200
From: Johan Hovold <johan@kernel.org>
To: Jerry Meng <jerry-meng@foxmail.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH V2] USB: serial: option: support Quectel EM060K sub-models
Message-ID: <Zhze9bnDqRp3XM4O@hovoldconsulting.com>
References: <tencent_D5A28A22C0345D2A4B1EE89E1FD5E0C0B007@qq.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_D5A28A22C0345D2A4B1EE89E1FD5E0C0B007@qq.com>

On Mon, Apr 15, 2024 at 03:04:29PM +0800, Jerry Meng wrote:
> EM060K_129, EM060K_12a, EM060K_12b and EM0060K_12c are EM060K's sub-models,
> having the same name "Quectel EM060K-GL" and the same interface layout.
> 
> MBIM + GNSS + DIAG + NMEA + AT + QDSS + DPL

> Signed-off-by: Jerry Meng <jerry-meng@foxmail.com>
> ---
> V1 -> V2: no changes. resend this patch to cc linux-usb@vger.kernel.org

Applied, thanks.

Johan

