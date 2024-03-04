Return-Path: <linux-usb+bounces-7476-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 468E88702D3
	for <lists+linux-usb@lfdr.de>; Mon,  4 Mar 2024 14:35:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DB77C1F2296A
	for <lists+linux-usb@lfdr.de>; Mon,  4 Mar 2024 13:35:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40E99405F8;
	Mon,  4 Mar 2024 13:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jTK2SMG4"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF50D3FB07
	for <linux-usb@vger.kernel.org>; Mon,  4 Mar 2024 13:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709559238; cv=none; b=l342IUFpDPN53yeFiyAFhA6XmwJyiCTr3QSuDwM8Axdd6UpXUFIqxnxWQXFIskLIsQf/mSWSqDIUuiSYCPB4v++ge7dGwFFoMkPlOz6/p7VJPRZx7PBIUddhBGnIc2jpqceV+2CI7MD5Qj4qh/atdFJVYC9G18vEygTzzAZ886Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709559238; c=relaxed/simple;
	bh=fU1bNRZBZvtJHfdcIOtfcitOUg9u3vxfT8Pws0HqK58=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=thicQX8pBk7HkquTYhvghlK1L5Vbfh/vnHFIkyLAUMXu0aimUW79VTBxs90MlCJeE96xTJJ/OpS58HqW2j+Arl5BKocxnwnTC1qgIFFiw3BjXh6I1z4fzYpj8CQetSlb4HP9ndXRq2ff635TU46UXnEBJAJjY/qZMDJ8WHkW7vY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jTK2SMG4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B769C433F1;
	Mon,  4 Mar 2024 13:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709559238;
	bh=fU1bNRZBZvtJHfdcIOtfcitOUg9u3vxfT8Pws0HqK58=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jTK2SMG4fWJm2O6qhZop3DWlwJFquO1DYFPJkBWkYrPQmsauNwtjbtV+nD5W389Rw
	 UgvE5rTnOQcn6trp4JSpbwTyzx1m7Rgr5JTMrNIS5qYfrJ55PCGobva8sH6yfaPoqv
	 MS+1Hkh2r3ubUoDMd3Phs44p25i6btqNQR3uC9mMI5AVb+AxfqdGR9uWM5zfVJIyDI
	 KbV9PIieoqhBA+l0Ph7YVvSItZoTPbCXGa/+EZCF1RJMBRWFnTwIvUsBgsjCbfk15P
	 zraGK3H7uv4iuSX33onIxCZsFa/MHcxPPAQCdOMK3e/efgMsJxcTv2P29bYoq2sOA5
	 7X2PpI2+50sdQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1rh8SF-000000000Nb-0UE7;
	Mon, 04 Mar 2024 14:34:07 +0100
Date: Mon, 4 Mar 2024 14:34:07 +0100
From: Johan Hovold <johan@kernel.org>
To: =?utf-8?B?QXVyw6lsaWVu?= Jacobs <aurel@gnuage.org>
Cc: linux-usb@vger.kernel.org
Subject: Re: [PATCH] USB: serial: option: add MeiG Smart SLM320 product
Message-ID: <ZeXNz0eucmrzwfIF@hovoldconsulting.com>
References: <D0XE7S.X6XGW1CB307A2@gnuage.org>
 <20240131174921.2097403-1-aurel@gnuage.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240131174921.2097403-1-aurel@gnuage.org>

On Wed, Jan 31, 2024 at 06:49:17PM +0100, Aurélien Jacobs wrote:
> Update the USB serial option driver to support MeiG Smart SLM320.
> 
> ID 2dee:4d41 UNISOC UNISOC-8910

> Tested successfully a PPP LTE connection using If#= 0.
> Not sure of the purpose of every other serial interfaces.
> 
> Signed-off-by: Aurélien Jacobs <aurel@gnuage.org>

Now applied, thanks.

Johan

