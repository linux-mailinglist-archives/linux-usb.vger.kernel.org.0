Return-Path: <linux-usb+bounces-29580-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C99C0103D
	for <lists+linux-usb@lfdr.de>; Thu, 23 Oct 2025 14:12:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ECE2B19C3CAD
	for <lists+linux-usb@lfdr.de>; Thu, 23 Oct 2025 12:12:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D32A30F92A;
	Thu, 23 Oct 2025 12:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JOOMXamO"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA9130FF36;
	Thu, 23 Oct 2025 12:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761221548; cv=none; b=l0rSUi2KftWmX5xX9rGdLuWoSPqzixX87CpBpiHqdUs0kclLm0mk2OOVfQn+d/zBm1T0ymb/6vir3tzJu410Vt7vNzJngtxAEgChwzQLfWMGPf+OkgKVv7dIKTAhepzOwrYmH9W6ItlYnu6WIehOFWkf+0hQMHzPsLOi2AIMWbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761221548; c=relaxed/simple;
	bh=f9VC3x2MwRv+Ew7I3A16lu8Dfa7Pd0chWsOhmqPGvfM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=br36FBUIJJchinXPWr4XGUdJxVR7nuFZBiMRowm1Uj9/9guLDRE7hjz9QEabtt0MHe1Ydze27YQm8DgGtknwLKUWk3RH/vyxZke3SWKt7kn3+hzne/McqO35Sz4QOP1HBx3tSR3OJWrSqIPyUbTizSM54MraTazZlSxPv0sPvxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JOOMXamO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5C16C4CEE7;
	Thu, 23 Oct 2025 12:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761221547;
	bh=f9VC3x2MwRv+Ew7I3A16lu8Dfa7Pd0chWsOhmqPGvfM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JOOMXamOVv3OCT1icQTPhyQo0U5GodFuhDQViJ99UCfCFLrczouCpc1gWy0nBZQXw
	 24H4ZA0MT6jBMLphMspVM8LFsIzizK1yHEgpva9f22AqQcFUQTwk0KcVUbTN0W87kO
	 jP2QQ8DB/mq/OtBsxP3v7jqprKBV6/Nu8i/zF9AXgWKKNNMR28uZa0FC6MxZwk2dXJ
	 Wp+dvobZdMjiu83JsPuXg/xWl4Tvw43OPlgMTqLsKmS9soV7TnEkgiqbdWq9CSRSEe
	 fAKFnCPbsPUrBptBpGSRQ4xaTBhccolGerGEoQhezG9+ea7mjHHPnYp/My9nb7eYDG
	 6Mp3f3gJ4b82A==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vBuBG-000000002c0-1uB1;
	Thu, 23 Oct 2025 14:12:34 +0200
Date: Thu, 23 Oct 2025 14:12:34 +0200
From: Johan Hovold <johan@kernel.org>
To: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: serial: option: add Telit FN920C04 ECM compositions
Message-ID: <aPobspmPHDtV3ddJ@hovoldconsulting.com>
References: <20251023034423.3421068-1-Qing-wu.Li@leica-geosystems.com.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251023034423.3421068-1-Qing-wu.Li@leica-geosystems.com.cn>

On Thu, Oct 23, 2025 at 03:44:22AM +0000, LI Qingwu wrote:
> Add support for the Telit Cinterion FN920C04 module when operating in
> ECM (Ethernet Control Model) mode. The following USB product IDs are
> used by the module when AT#USBCFG is set to 3 or 7.

Applied, thanks.

Johan

