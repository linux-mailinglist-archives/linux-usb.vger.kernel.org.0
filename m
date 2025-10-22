Return-Path: <linux-usb+bounces-29536-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B46BFD01F
	for <lists+linux-usb@lfdr.de>; Wed, 22 Oct 2025 18:03:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4CC5B347D80
	for <lists+linux-usb@lfdr.de>; Wed, 22 Oct 2025 16:03:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06C5926E703;
	Wed, 22 Oct 2025 16:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TS1Zj3K0"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 810EE26B75B
	for <linux-usb@vger.kernel.org>; Wed, 22 Oct 2025 16:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761149024; cv=none; b=FMunMDffT4zOVZhQSQx0SzfN8uVXdpb0VlEn/pyqM7Kp4cgvwOkdzmFuh7Zc6u/ZPb2/ppnsWj0sxTte1BVsKR7Kk54zmtHhgvG0sHxVAT8AMgO7CgQMoEnL2UhrMtk95KbJ5SqYNOArwdP80b/7w4JgWdjhwqZmdqgRAZ1W/UU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761149024; c=relaxed/simple;
	bh=qeE4lDivDGBibjqpFbfRA7NL/2MWhpuuwZWIMNttxn4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JWc8RfgXxlcCNcmQCDLXstjqKczai9+PxG5iIMnTCJf3ZpGqtIpgiN0sI8vLgXPxOFTZvoCCFUa83FJnodfiUFHFMzJLVVwPzaCd5uysOqHP3O9zS1tJ17mynv/BLhW+kVBtws6Q9RyvSH25qyAFOTOCJ7IRMngh0ZjBbeq+eaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TS1Zj3K0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A5D0C4CEE7;
	Wed, 22 Oct 2025 16:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761149024;
	bh=qeE4lDivDGBibjqpFbfRA7NL/2MWhpuuwZWIMNttxn4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TS1Zj3K0cHxIrR1mM62WlLsUaOcBeYGfoWmDiamdx5QhTblm03z/zDjAtsWg5HXLP
	 s/SzKaqPOE7i2o+/OR5AGnv8I8kcvX123EfWBoVGAyEwKo/AmbgTaplQ6t25Jocb2e
	 NatKPYdrZ/6Qshh3FHoVL98SLINTcYaKloiuuwUMgEdcU0ALvRKu/TNd6TagMeEVeR
	 HwHwpQqnsXcGLz+1v+rC7U9yuawEjqNAyenzfURq46GyEYIN4lTGHDAmKWLgn+8og9
	 6Zs9uKD1VC2vV0AmpjjyuE63nfRkjluQd5uvxACRpy06/ARoakdJPtxTfqjQbB30id
	 beiKOT87Aq0FA==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vBbJW-000000007f4-30Mc;
	Wed, 22 Oct 2025 18:03:50 +0200
Date: Wed, 22 Oct 2025 18:03:50 +0200
From: Johan Hovold <johan@kernel.org>
To: Reinhard Speyerer <rspmn@arcor.de>
Cc: linux-usb@vger.kernel.org, Martin Hou <martin.hou@foxmail.com>
Subject: Re: [PATCH] USB: serial: option: add Quectel RG255C
Message-ID: <aPkAZlOlnrLWJrDv@hovoldconsulting.com>
References: <aPjndlFsHptjejQ3@arcor.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aPjndlFsHptjejQ3@arcor.de>

On Wed, Oct 22, 2025 at 04:17:26PM +0200, Reinhard Speyerer wrote:
> Add support for Quectel RG255C devices to complement commit 5c964c8a97c1
> ("net: usb: qmi_wwan: add Quectel RG255C").

Applied, thanks.

Johan

