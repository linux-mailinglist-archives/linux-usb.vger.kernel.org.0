Return-Path: <linux-usb+bounces-3067-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6887F2632
	for <lists+linux-usb@lfdr.de>; Tue, 21 Nov 2023 08:15:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 95704281B61
	for <lists+linux-usb@lfdr.de>; Tue, 21 Nov 2023 07:15:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97647200DC;
	Tue, 21 Nov 2023 07:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="v3jqIAWp"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F33451DA36
	for <linux-usb@vger.kernel.org>; Tue, 21 Nov 2023 07:15:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B2ACC433C8;
	Tue, 21 Nov 2023 07:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1700550906;
	bh=bxCsjCTedrC/b4X3x+dGnUl5BsLCtxXC3Eim0Tgn33c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=v3jqIAWp7Uz3K3RB+Ot+I/uIJ+udVXjpPbhM5Vsunw+9XYxOF/IMXt722a9iidI+f
	 +2+QGb+Jsj2Gid8beQ6wnXgHWlnK5w6vW9Y/HIbbz4D+4jr4gTwg55RewlmSC63efo
	 zLZ8a9t66QJuYz4OQuT5gEDLeCG0Cee8frzQCwHI=
Date: Tue, 21 Nov 2023 08:15:02 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] USB4/Thunderbolt fixes for v6.7-rc3
Message-ID: <2023112153-yapping-ungodly-fc20@gregkh>
References: <20231121060305.GE1074920@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231121060305.GE1074920@black.fi.intel.com>

On Tue, Nov 21, 2023 at 08:03:05AM +0200, Mika Westerberg wrote:
> Hi Greg,
> 
> The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:
> 
>   Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v6.7-rc3

Pulled and pushed out, thanks.

greg k-h

