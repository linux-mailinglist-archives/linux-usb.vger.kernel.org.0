Return-Path: <linux-usb+bounces-14163-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC24D960237
	for <lists+linux-usb@lfdr.de>; Tue, 27 Aug 2024 08:48:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8078E285611
	for <lists+linux-usb@lfdr.de>; Tue, 27 Aug 2024 06:48:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9630913E028;
	Tue, 27 Aug 2024 06:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vx+LTSfF"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EDD810A3E
	for <linux-usb@vger.kernel.org>; Tue, 27 Aug 2024 06:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724741328; cv=none; b=CLM/tme0T6q12hJrunjFeMGiNiOY4WgXvZej+xacMXcuepnqIiFTmaTQs7wtm6DEC+vujsgqvoPyLX43+r/rEjwzlm/j793Ws2nxp3WIQTcwHyoSY5ALmve5vq90m18atCkhX/DvTwgf97nGZSuezHU5x+o6MgS2lHBzKB5dAvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724741328; c=relaxed/simple;
	bh=uAAW9AhLCdpmq4WGQQ7UOBRrye7D8ETMmog2J7NeiEA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HHAj0wNcUlsliaOXOfLvn9mGKH1oOF05WM9ETkZUCgttT7p387u30BrQIH0usYErAhlC6d2xkAEFRirTkQbwb/HzIgH8HMb9NTlm/4JEU8tSIQ5nvOVxYyWESJRQzXfQ663A8TYEBnnakOpgX5VfbpkjzFPtNu8EMDuo/ijc4zQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vx+LTSfF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A648FC8B7AB;
	Tue, 27 Aug 2024 06:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724741327;
	bh=uAAW9AhLCdpmq4WGQQ7UOBRrye7D8ETMmog2J7NeiEA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vx+LTSfFBp/dusQNUtw5FtoIdtec0cVSybkSlXMhFm+iCvWz1OWaHjWldXoagCQ8t
	 QveDYXtCQCblEkqbr3Fh3sDiIv2BfmPE0ctgotNmwwD+NnQnRnfnV2qeHD2j9RU9BK
	 yFaGHIRQb91kcofreINCeuw9jCMXZsrh+VpApW+Z7Gm0e1pMlzzceKXWrnuy6mIW4O
	 409WwSzQ4cNLIzAnjXQ5jVhhv2u1udzqp6yjsE6ia1cOK+0iSDOFcAuzl5nRQK1KmH
	 xI8ow1q2JcGdnSC+IGe2eIKrcE7i4malNMUSds3AeLDRz3gHVhcPk32zbiMML4BsSE
	 qoewurmkQuElg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1siq0g-000000001yp-04jj;
	Tue, 27 Aug 2024 08:48:58 +0200
Date: Tue, 27 Aug 2024 08:48:58 +0200
From: Johan Hovold <johan@kernel.org>
To: ZHANG Yuntian <yt@radxa.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: [PATCH] USB: serial: option: add MeiG Smart SRM825L
Message-ID: <Zs122n6GtNNK5IuC@hovoldconsulting.com>
References: <0041DFA5200EFB1B+20240803074619.563116-1-yt@radxa.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0041DFA5200EFB1B+20240803074619.563116-1-yt@radxa.com>

On Sat, Aug 03, 2024 at 03:46:07PM +0800, ZHANG Yuntian wrote:
> Add support for MeiG Smart SRM825L which is based on Qualcomm 315 chip.

> Signed-off-by: ZHANG Yuntian <yt@radxa.com>

Now applied, thanks.

Johan

