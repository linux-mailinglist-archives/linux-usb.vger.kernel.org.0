Return-Path: <linux-usb+bounces-9529-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 359048ABEF2
	for <lists+linux-usb@lfdr.de>; Sun, 21 Apr 2024 12:27:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A5EB0B20B2F
	for <lists+linux-usb@lfdr.de>; Sun, 21 Apr 2024 10:27:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4849810A1E;
	Sun, 21 Apr 2024 10:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="rBzbDuLc"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E8011185
	for <linux-usb@vger.kernel.org>; Sun, 21 Apr 2024 10:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713695248; cv=none; b=qCOITNG06czLekHjgqcpX81s559vNqFCFfaHnid5rL1W5l0Qu5JoTdkgatSpAVXq6amIBYA2pHa/9VaeJy/1ASA2X7Xy9PDYEpAdK+HXqnviaZ72L3qQ2O8x/Xmf4nG54anVrTgFfKqJqCs306orR5SwBKZkg2S2NnGIIYL5d3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713695248; c=relaxed/simple;
	bh=oHlmXx2QbntVnooWeWD4hBHP7wUybAGAuSlpSI3q2zs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=clGCf+EXU3A7JAYnSk22euiMyW5ci5s/8XHjOUvnzP0iGc9iWHCZqQLBN25kF7uEcmvANIT7UlvM2nBXBzQjSejXehacDmDBwGACWfWfJ2hyu+lXUu3RZX9oAv3S38uJU8eoKXvdVYQXpMp9JzudMAZBtDd73J5e7HWD8cHIIdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=rBzbDuLc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECA9AC113CE;
	Sun, 21 Apr 2024 10:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1713695248;
	bh=oHlmXx2QbntVnooWeWD4hBHP7wUybAGAuSlpSI3q2zs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rBzbDuLccofL1DM/buRjmpMWjzZuh3/Xd81wLr6gUcXsZEHQYVQjUemyqpnzKp8wB
	 UtDEpwjC++UsE1lIyESWrL7q0xW8N7vnMTbaWCPIVMsUPqftZcuXhOR0dixk09JYV7
	 Ehny098IDsmTbrqbkUel3O3t1ElEsf5QNNP4GYg8=
Date: Sun, 21 Apr 2024 12:27:25 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-usb@vger.kernel.org, Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Sanath S <Sanath.S@amd.com>
Subject: Re: [ANNOUNCE] Thunderbolt/USB4 debugging tools
Message-ID: <2024042110-oat-juicy-e599@gregkh>
References: <20240402101020.GP112498@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240402101020.GP112498@black.fi.intel.com>

On Tue, Apr 02, 2024 at 01:10:20PM +0300, Mika Westerberg wrote:
> Hi all,
> 
> This is mostly for the folks developing and testing Thunderbolt/USB4
> driver side of things but may be useful for others too. Not intented to
> replace anything we already have for the regular user stack.
> 
> In summary this is a collection of small tools that provide bit more
> user friendly access to the sysfs/debugfs/tracefs interfaces made
> available by the driver. Mainly useful for debugging issues around the
> software connection manager parts of the driver (although some of these
> work with the firmware connection manager too). We have been using this
> internally for a while.
> 
> The repository can be found here:
> 
>   https://github.com/intel/tbtools
> 


Very cool, thanks for the link!

greg k-h

