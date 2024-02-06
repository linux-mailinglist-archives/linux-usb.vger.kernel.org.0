Return-Path: <linux-usb+bounces-5955-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 748EC84B87C
	for <lists+linux-usb@lfdr.de>; Tue,  6 Feb 2024 15:54:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9E0D4B2E09A
	for <lists+linux-usb@lfdr.de>; Tue,  6 Feb 2024 14:52:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8A43133292;
	Tue,  6 Feb 2024 14:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="1Q4a1P0U"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 735A3131E53
	for <linux-usb@vger.kernel.org>; Tue,  6 Feb 2024 14:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707231156; cv=none; b=BIY+rRG300FmEhoCd5oMyTihpy9Iy/iJmPVFzmOJDdR6wfoqs5izxtDVHAUalErFyKhTcozJ7xiHr4g5GBm/DGrZOL3ZbJByGEPaDuEHOXcX7ebie2WxpNR0sY0wb/Ym/9Z95lMl5ufdi7QBBmKZDOSnbr71/PwrpZkIRzawhA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707231156; c=relaxed/simple;
	bh=l/XbzfGHEDgjQ6D63f0ezy2OHEowcS3+zTV3xbF+bvA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RXGp3TTTwxjbRk4dX9m/mqVEwMccdFhbrIunpXN/JoBrTvc+UpbHGH4WZMcCWctOIhzju9Vf0cdUPr/cEmwlOu6ZSYWqFqH7k7VEdUEh4c4VcYWT66hhMMKGl2lPxPBSGdeCItVpJ8g0jEr951Qh19w/9pjJf/TLKfvVdFrbqZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=1Q4a1P0U; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F885C433C7;
	Tue,  6 Feb 2024 14:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1707231155;
	bh=l/XbzfGHEDgjQ6D63f0ezy2OHEowcS3+zTV3xbF+bvA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=1Q4a1P0UH1ZIMidypFhsiigPP9jQVwNQctvDbyjB/fjeNd5IXKZscAiD8DKTRUajm
	 SydPDZPvKx74pgBBj2dN1w0FEnfaIphbC32+YEptpVOw7VLzPTAmPU0ZVeGj8nwWn+
	 NwP93UoLM8LA/+dw4XwQhyDphXER4suvaQIgKWmE=
Date: Tue, 6 Feb 2024 14:52:33 +0000
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] USB4/Thunderbolt fix for v6.8-rc4
Message-ID: <2024020624-borough-monogram-7bcb@gregkh>
References: <20240206095028.GK8454@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240206095028.GK8454@black.fi.intel.com>

On Tue, Feb 06, 2024 at 11:50:28AM +0200, Mika Westerberg wrote:
> Hi Greg,
> 
> The following changes since commit 41bccc98fb7931d63d03f326a746ac4d429c1dd3:
> 
>   Linux 6.8-rc2 (2024-01-28 17:01:12 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v6.8-rc4

Pulled and pushed out, thanks.

greg k-h

