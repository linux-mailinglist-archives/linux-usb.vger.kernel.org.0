Return-Path: <linux-usb+bounces-19477-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B1BA14B04
	for <lists+linux-usb@lfdr.de>; Fri, 17 Jan 2025 09:20:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 73EC3163949
	for <lists+linux-usb@lfdr.de>; Fri, 17 Jan 2025 08:20:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C340A1F892A;
	Fri, 17 Jan 2025 08:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="VlPiJ8Om"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47CB71F7066;
	Fri, 17 Jan 2025 08:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737102023; cv=none; b=g9rhvXv+XPRrsyuFwaRlanw45czq4iTZ3zpBeSMrUIP1mdouBQ7ZkOmGb1obUwK/T3LliGIo/M0pUCiA07k8YB/rCxeE3oMioh3C8J0d+J6Kgb2yjQZ0Kcj3cJOkMwncuDEy1qJu66YoSSS5bpcZFCLLW9glpne85VUTzwZkFo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737102023; c=relaxed/simple;
	bh=uTdIeIvkNuD3q3ZlZdfW1mCyTpAJUgg0tGidSf8pW7E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G+xaUuO4h/+2LBH9styK6PsBZKMFllfyhKrfSe5463CFTLvBisHZ3HmlXmurdQLylEprfBPcPKDKsXZRQs6y2HM++1nBvEsYW0mCBMy8K08T35yTVyUOZHtxygN1C/GLoHnJAdah99jOJJI9vZDzY5XbELiTAjIlmaMsULT11N4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=VlPiJ8Om; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D9FBC4CEDD;
	Fri, 17 Jan 2025 08:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1737102022;
	bh=uTdIeIvkNuD3q3ZlZdfW1mCyTpAJUgg0tGidSf8pW7E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VlPiJ8OmkhcurcON7ywRhObpgaGpxvMEtVeJwLtuuKEqnfUSMSF7kpdAFyikrVpbK
	 UlnK5WPf/b8N6qwDcitUGnKXv/HdY75HSjIRG+pewju6CfKktYjFHsFpizgIOAYMmB
	 5yRtsDSnibPoYC8DbOnSpbj4Gv308FwhA91N9B8s=
Date: Fri, 17 Jan 2025 09:20:13 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Johan Hovold <johan@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] USB-serial updates for 6.14-rc1
Message-ID: <2025011707-fax-extenuate-53f5@gregkh>
References: <Z4oQgYrBReMU7foh@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z4oQgYrBReMU7foh@hovoldconsulting.com>

On Fri, Jan 17, 2025 at 09:10:41AM +0100, Johan Hovold wrote:
> The following changes since commit 4bbf9020becbfd8fc2c3da790855b7042fad455b:
> 
>   Linux 6.13-rc4 (2024-12-22 13:22:21 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-6.14-rc1

Pulled and pushed out, thanks.

greg k-h

