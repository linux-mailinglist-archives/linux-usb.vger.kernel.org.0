Return-Path: <linux-usb+bounces-17468-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B549C529B
	for <lists+linux-usb@lfdr.de>; Tue, 12 Nov 2024 11:01:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 09FC32853C8
	for <lists+linux-usb@lfdr.de>; Tue, 12 Nov 2024 10:01:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2642D20E337;
	Tue, 12 Nov 2024 10:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="nYo3rI9L"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D2E91EABC2
	for <linux-usb@vger.kernel.org>; Tue, 12 Nov 2024 10:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731405683; cv=none; b=t2pl2lzSO7pwFaa8N5G2Uk3lzb9vZ7s317oDYLkjTcY2OpOhNxQWIBakCsXDd4NxW5kOJC2FQTU+ZMP4DyqKQGXRhxV1mzEcygboJjT//ihzQX2exPzHxpPmVbkNfbq9zEVNXisPfMe0DWoWOp8FAsAfQGRAAEJntpYJrCVKOj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731405683; c=relaxed/simple;
	bh=iyHcdd9lFHKQEpH2RN2Z6IFcuWUdzvfSSSvG/WWUA44=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aAioexWnUD0RZqdtw6ytepi//VTtJIMVf1WaXAfDeuxJbw8JXYaowH3IuRvsLUJ9mYE6fEMo4FP4hVmjrjxe+SCNCzwSX/nrvFOR3DKIE6Z7MYQYbPknSrcNjkgm7I/5AR/fRg/efS4uyM7Q6aFH24RlBC+LCSC4WsL9Unvk3o4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=nYo3rI9L; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF0C7C4CECD;
	Tue, 12 Nov 2024 10:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1731405683;
	bh=iyHcdd9lFHKQEpH2RN2Z6IFcuWUdzvfSSSvG/WWUA44=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nYo3rI9LGOpJaKTftwuq28pzAHbvTMZHptZJGBF9qs17ZFR7pu6AwixWRhQvZVkrE
	 dL+/7IEI52kTpLFznvsfwxdFnDdrUdpM0vq+vVjx4CnjTNwAqiEBFG2dIVpsIsjstQ
	 VO72+xHjiTODrXfdLJqoLfUaRrRpvOxQB44n9tJE=
Date: Tue, 12 Nov 2024 11:00:58 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] USB4/Thunderbolt changes for v6.13 merge window
Message-ID: <2024111251-cosponsor-overfeed-106f@gregkh>
References: <20241112090428.GR275077@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241112090428.GR275077@black.fi.intel.com>

On Tue, Nov 12, 2024 at 11:04:28AM +0200, Mika Westerberg wrote:
> Hi Greg,
> 
> The following changes since commit 81983758430957d9a5cb3333fe324fd70cf63e7e:
> 
>   Linux 6.12-rc5 (2024-10-27 12:52:02 -1000)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v6.13-rc1

Pulled and pushed out, thanks.

greg k-h

