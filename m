Return-Path: <linux-usb+bounces-9970-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A658B98A8
	for <lists+linux-usb@lfdr.de>; Thu,  2 May 2024 12:18:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D765FB24AB3
	for <lists+linux-usb@lfdr.de>; Thu,  2 May 2024 10:18:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 687315820A;
	Thu,  2 May 2024 10:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kZ0ZGgge"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E839157333
	for <linux-usb@vger.kernel.org>; Thu,  2 May 2024 10:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714645081; cv=none; b=qbanUWAxkPDU4yCGP4X7NbuLsElodr54/vlgN1klDzchVosjD4QgQhu0k+zbv5WJLjeof4EZJX3x4+VdCsQkAb0i8zEL8VsoXOzEVjWXs1e+Z4igAp+Tf4//VNgdzF8BroI9OjHjHCW34kl9QfGF2dmvTmZY8OiLh5cVuJ090GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714645081; c=relaxed/simple;
	bh=1Gd23BdA3RdIjmLEjz8DyCeYANR+YdiuH/txi69SYtU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EjW1G6DqBkGsJP3xi+IZN7eNvupZ8yTonFaw1saklzM2bJCPLz7JK4PJR26Ek8NnNY6cGGajMtLwKEqjgaqb1RiXXFzYQTxONJTY78XNTRKIb6g2ii7VV7lcFDksamq/DBxx6fDzjSvB5jAE/6Tn/O/odGvm7s8tA72j4tyELAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kZ0ZGgge; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EDAFC113CC;
	Thu,  2 May 2024 10:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714645080;
	bh=1Gd23BdA3RdIjmLEjz8DyCeYANR+YdiuH/txi69SYtU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kZ0ZGgge7jI4Em+swL7frNimNxclxNx1U/WOJJdBldtalci+Cw08ZOYFEorcLfI/l
	 ovlstcXVFwoJn8BRoU4NPyaQ6V79pGDlMCY0A6dPTulP/LqdxPS0U+n7syBf1WVDH2
	 o1WWjCsojylvvYe49xg7IgwuvaMp9/WOkaNXkmKmHqN2ALA9mrtGAt/AZVh3DT4v/q
	 JIOM8tgz09of4bPzAWhHuD+VcM6HILrh7f4AMZ2ziycv7zYDWEuqg00Nx+KjkxzRWd
	 mH2sT9gp9DpTSyAwJi2GXq85luFaryDUqiG1YxShD62crc5Sp5i7dU/a9zjwJwbYsV
	 /uSkNQDvXhORw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1s2TVq-0000000032Q-2wiN;
	Thu, 02 May 2024 12:18:03 +0200
Date: Thu, 2 May 2024 12:18:02 +0200
From: Johan Hovold <johan@kernel.org>
To: Mans Rullgard <mans@mansr.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH] USB: serial: use tty_port_register_device_serdev
Message-ID: <ZjNoWq0r7CJJptRk@hovoldconsulting.com>
References: <20240502100728.7914-1-mans@mansr.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240502100728.7914-1-mans@mansr.com>

On Thu, May 02, 2024 at 11:07:28AM +0100, Mans Rullgard wrote:
> Use tty_port_register_device_serdev() so that usb-serial devices
> can be used as serdev controllers.

I'm afraid it's not that easy. The reason serdev is not enabled for
usb-serial is that there's currently no support for handling hotplug in
serdev. The device can go away from under you at any time and then you'd
crash the kernel.

Johan

